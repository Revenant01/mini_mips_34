LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY mips IS PORT (
  i_clk, i_rst : IN STD_LOGIC;
  i_read_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
  b_pc : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0);
  i_inst : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
  b_write_data : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0);
  b_alu_out : BUFFER STD_LOGIC_VECTOR (31 DOWNTO 0);
  o_mem_write : OUT STD_LOGIC
);
END ENTITY mips;
ARCHITECTURE structural OF mips IS
  COMPONENT control_unit IS
    PORT (
      i_rst : IN STD_LOGIC;
      i_opcode : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
      i_ir_indicator : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
      o_reg_write : OUT STD_LOGIC;
      o_mem_write : OUT STD_LOGIC;
      o_alu_control : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      o_mem_2_reg : OUT STD_LOGIC;
      o_alu_src : OUT STD_LOGIC;
      o_branch_en : OUT STD_LOGIC;
      o_jump : OUT STD_LOGIC;
      o_sw_en : OUT STD_LOGIC;
      o_jr_src : OUT STD_LOGIC;
      o_lw_vs_imm : OUT STD_LOGIC
    );
  END COMPONENT;
  COMPONENT reg_file IS
    PORT (
      i_clk : IN STD_LOGIC;
      i_rst : IN STD_LOGIC;
      i_ra1, i_ra2, i_wa3 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      i_we3 : IN STD_LOGIC;
      i_wd3 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      o_rd1 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      b_rd2 : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT alu IS
    PORT (
      i_a, i_b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      i_ctrl : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      o_result : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT MUX2X1 IS
    GENERIC (width : INTEGER);
    PORT (
      i_in0, i_in1 : IN STD_LOGIC_VECTOR (width - 1 DOWNTO 0);
      i_sel : IN STD_LOGIC;
      o_out : OUT STD_LOGIC_VECTOR (width - 1 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT adder IS
    PORT (
      i_a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      i_b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      o_sum : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT sign_extend IS
    PORT (
      i_in5 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      o_out32 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT flopr IS -- flip-flop with synchronous reset
    GENERIC (width : INTEGER);
    PORT (
      i_clk, i_rst : IN STD_LOGIC;
      i_d : IN STD_LOGIC_VECTOR(width - 1 DOWNTO 0);
      b_q : BUFFER STD_LOGIC_VECTOR(width - 1 DOWNTO 0)
    );
  END COMPONENT;

  SIGNAL s_pc_next : STD_LOGIC_VECTOR (31 DOWNTO 0) := X"00000000";
  SIGNAL s_pc_plus4 : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL s_pc_jump : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL s_pc_mux1_res : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL s_pc_mux3_res : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL s_branch : STD_LOGIC;

  SIGNAL s_alu_control : STD_LOGIC_VECTOR (1 DOWNTO 0);
  SIGNAL s_reg_write : STD_LOGIC;
  SIGNAL s_mem_2_reg : STD_LOGIC;
  SIGNAL s_alu_src : STD_LOGIC;
  SIGNAL s_branch_en : STD_LOGIC;
  SIGNAL s_jump : STD_LOGIC;
  SIGNAL s_sw_en : STD_LOGIC;
  SIGNAL s_jr_src : STD_LOGIC;
  SIGNAL s_lw_vs_imm : STD_LOGIC;

  SIGNAL s_alu_srcA : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL s_alu_srcB : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL s_rf_rd2 : STD_LOGIC_VECTOR (31 DOWNTO 0);

  SIGNAL s_sign_ext_in : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL s_sign_ext_out : STD_LOGIC_VECTOR (31 DOWNTO 0);

  SIGNAL s_lw_vs_imm_mux_out : STD_LOGIC_VECTOR(4 DOWNTO 0);
  SIGNAL s_rf_A1 : STD_LOGIC_VECTOR(4 DOWNTO 0);
  SIGNAL s_rf_A2 : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL s_mem_2_reg_mux_out : STD_LOGIC_VECTOR (31 DOWNTO 0);

BEGIN

  m_controller : control_unit
  PORT MAP(
    i_rst => i_rst,
    i_opcode => i_inst(31 DOWNTO 22),
    i_ir_indicator => i_inst(21 DOWNTO 15),
    o_reg_write => s_reg_write,
    o_mem_write => o_mem_write,
    o_alu_control => s_alu_control,
    o_mem_2_reg => s_mem_2_reg,
    o_alu_src => s_alu_src,
    o_branch_en => s_branch_en,
    o_jump => s_jump,
    o_sw_en => s_sw_en,
    o_jr_src => s_jr_src,
    o_lw_vs_imm => s_lw_vs_imm
  );
  m_pcreg : flopr
  GENERIC MAP(32)
  PORT MAP(
    i_clk => i_clk,
    i_rst => i_rst,
    i_d => s_pc_next,
    b_q => b_pc
  );

  m_lw_vs_imm_mux : MUX2X1
  GENERIC MAP(5)
  PORT MAP(
    i_in0 => i_inst(4 DOWNTO 0),
    i_in1 => i_inst(9 DOWNTO 5),
    i_sel => s_lw_vs_imm,
    o_out => s_lw_vs_imm_mux_out
  );

  m_jr_src_mux : MUX2X1
  GENERIC MAP(5)
  PORT MAP(
    i_in0 => s_lw_vs_imm_mux_out,
    i_in1 => i_inst(14 DOWNTO 10),
    i_sel => s_jr_src,
    o_out => s_rf_A1
  );

  m_sw_en_mux : MUX2X1
  GENERIC MAP(5)
  PORT MAP(
    i_in0 => i_inst(4 DOWNTO 0),
    i_in1 => i_inst(14 DOWNTO 10),
    i_sel => s_sw_en,
    o_out => s_rf_A2
  );

  m_mem_2_reg_mux : MUX2X1
  GENERIC MAP(32)
  PORT MAP(
    i_in0 => i_read_data,
    i_in1 => b_alu_out,
    i_sel => s_mem_2_reg,
    o_out => s_mem_2_reg_mux_out
  );
  m_rf : reg_file
  PORT MAP(
    i_clk => i_clk,
    i_rst => i_rst,
    i_ra1 => s_rf_A1,
    i_ra2 => s_rf_A2,
    i_wa3 => i_inst(14 DOWNTO 10),
    i_we3 => s_reg_write,
    i_wd3 => s_mem_2_reg_mux_out,
    o_rd1 => s_alu_srcA,
    b_rd2 => b_write_data
  );

  --s_branch = ( (s_alu_srcA == X"00000000") and (s_branch_en = '1') );
  m_alu_srcB_mux : MUX2X1
  GENERIC MAP(32)
  PORT MAP(
    i_in0 => b_write_data,
    i_in1 => s_sign_ext_out,
    i_sel => s_alu_src,
    o_out => s_alu_srcB
  );

  m_alu : alu
  PORT MAP(
    i_a => s_alu_srcA,
    i_b => s_alu_srcB,
    i_ctrl => s_alu_control,
    o_result => b_alu_out
  );
  m_pcplus4 : adder
  PORT MAP(
    i_a => b_pc,
    i_b => X"00000004",
    o_sum => s_pc_plus4
  );

  m_sign_ext_mux : MUX2X1
  GENERIC MAP(5)
  PORT MAP(
    i_in0 => i_inst(9 DOWNTO 5),
    i_in1 => i_inst(4 DOWNTO 0),
    i_sel => s_lw_vs_imm,
    o_out => s_sign_ext_in
  );

  m_sign_ext : sign_extend
  PORT MAP(
    i_in5 => s_sign_ext_in,
    o_out32 => s_sign_ext_out
  );

  m_pc_mux1 : MUX2X1
  GENERIC MAP(32)
  PORT MAP(
    i_in0 => s_pc_plus4,
    i_in1 => s_pc_jump,
    i_sel => s_jump,
    o_out => s_pc_mux1_res
  );

  m_pc_mux2 : MUX2X1
  GENERIC MAP(32)
  PORT MAP(
    i_in0 => s_pc_mux1_res,
    i_in1 => s_pc_jump,
    i_sel => s_branch,
    o_out => s_pc_next
  );

  m_pc_mux3 : MUX2X1
  GENERIC MAP(32)
  PORT MAP(
    i_in0 => s_alu_srcA,
    i_in1 => s_rf_rd2,
    i_sel => s_branch,
    o_out => s_pc_mux3_res
  );

  m_pc_jump_adder : adder
  PORT MAP(
    i_a => s_pc_mux3_res,
    i_b => s_sign_ext_out,
    o_sum => s_pc_jump
  );

  PROCESS (s_alu_srcA, s_branch_en)
  BEGIN
    IF (s_alu_srcA = X"00000000" AND s_branch_en = '1') THEN
      s_branch <= '1';
    ELSE
      s_branch <= '0';
    END IF;
  END PROCESS;
END;