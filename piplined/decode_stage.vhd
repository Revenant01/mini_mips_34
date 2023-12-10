LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY decode_stage IS
  PORT (
    i_clk : IN STD_LOGIC;
    i_rst : IN STD_LOGIC;

    i_instD : IN STD_LOGIC_VECTOR (31 DOWNTO 0);

    -- control signals 
    o_reg_writeE : OUT STD_LOGIC;
    o_mem_2_regE : OUT STD_LOGIC;
    o_mem_writeE : OUT STD_LOGIC;
    o_alu_srcE : OUT STD_LOGIC;
    o_alu_controlE : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    o_rf_rd1E : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    o_rf_rd2E : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);

    -- control signal delayed to be synchronous with reg written data
    i_reg_writeW : IN STD_LOGIC;
    -- regester addresses 
    o_RsE : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
    o_RtE : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
    o_RdE : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);

    -- sign extend 
    o_sign_extE : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);

    -- feedback signals for writing on register
    i_RdW : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    i_resultW : IN STD_LOGIC_VECTOR (31 DOWNTO 0);

    -- forwarded signal to resolve RAW of branch and jump
    i_alu_outM : IN STD_LOGIC_VECTOR (31 DOWNTO 0);

    -- Hazard unit signals --
    -- used to detect if a branch RAW hazard occured, they'll be compared with RdE to introduce a branch stall, 
    -- also compared with RdM incase of LW instruction 
    o_RsD : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
    o_RtD : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);

    i_forwardAD : IN STD_LOGIC;
    i_forwardBD : IN STD_LOGIC;
    i_flushE : IN STD_LOGIC;

    o_pc_branch : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);

    o_branchD : IN STD_LOGIC;
    o_jumpD : IN STD_LOGIC
  );

END decode_stage;

ARCHITECTURE structural OF decode_stage IS
  COMPONENT adder IS
    PORT (
      i_a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      i_b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      o_sum : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
  END COMPONENT;

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

  COMPONENT MUX2X1 IS
    GENERIC (width : INTEGER);
    PORT (
      i_in0, i_in1 : IN STD_LOGIC_VECTOR (width - 1 DOWNTO 0);
      i_sel : IN STD_LOGIC;
      o_out : OUT STD_LOGIC_VECTOR (width - 1 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT sign_extend IS
    PORT (
      i_in5 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      o_out32 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT reg_file IS -- three-port register file
    PORT (
      i_clk : IN STD_LOGIC;
      i_rst : IN STD_LOGIC;
      i_we3 : IN STD_LOGIC;
      i_ra1, i_ra2, i_wa3 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      i_wd3 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      o_rd1 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      o_rd2 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT pip_regDE IS
    PORT (
      -- clock and global inputs
      i_clk : IN STD_LOGIC;
      i_rst : IN STD_LOGIC;
      i_clr : IN STD_LOGIC;

      -- propgagting controls signals 
      i_reg_writeD : IN STD_LOGIC;
      o_reg_writeE : OUT STD_LOGIC;

      i_mem_2_regD : IN STD_LOGIC;
      o_mem_2_regE : OUT STD_LOGIC;

      i_mem_writeD : IN STD_LOGIC;
      o_mem_writeE : OUT STD_LOGIC;
      -- internal blocks control signals 
      i_alu_srcD : IN STD_LOGIC;
      o_alu_srcE : OUT STD_LOGIC;

      i_alu_controlD : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
      o_alu_controlE : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      -- register files outputs 
      i_rf_rd1D : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      o_rf_rd1E : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);

      i_rf_rd2D : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      o_rf_rd2E : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      -- regester addresses 
      i_RsD : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
      o_RsE : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);

      i_RtD : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
      o_RtE : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);

      i_RdD : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
      o_RdE : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
      -- sign extend 
      i_sign_extD : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      o_sign_extE : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
    );
  END COMPONENT;

  SIGNAL s_reg_writeD : STD_LOGIC := '0';
  SIGNAL s_mem_writeD : STD_LOGIC := '0';
  SIGNAL s_alu_controlD : STD_LOGIC_VECTOR (1 DOWNTO 0) := "00";
  SIGNAL s_mem_2_regD : STD_LOGIC := '0';
  SIGNAL s_alu_srcD : STD_LOGIC := '0';
  SIGNAL s_branch_enD : STD_LOGIC := '0';
  SIGNAL s_jumpD : STD_LOGIC := '0';
  SIGNAL s_sw_enD : STD_LOGIC := '0';
  SIGNAL s_jr_srcD : STD_LOGIC := '0';
  SIGNAL s_lw_vs_immD : STD_LOGIC := '0';

  SIGNAL s_mux1_ra1_res : STD_LOGIC_VECTOR (4 DOWNTO 0) := "00000";

  SIGNAL s_rf_ra1 : STD_LOGIC_VECTOR (4 DOWNTO 0) := "00000";
  SIGNAL s_rf_ra2 : STD_LOGIC_VECTOR (4 DOWNTO 0) := "00000";
  SIGNAL s_rf_rd1 : STD_LOGIC_VECTOR (31 DOWNTO 0) := X"00000000";
  SIGNAL s_rf_rd2 : STD_LOGIC_VECTOR (31 DOWNTO 0) := X"00000000";

  SIGNAL s_rf_rd1D : STD_LOGIC_VECTOR (31 DOWNTO 0) := X"00000000";
  SIGNAL s_rf_rd2D : STD_LOGIC_VECTOR (31 DOWNTO 0) := X"00000000";

  SIGNAL s_sign_ext_in : STD_LOGIC_VECTOR (4 DOWNTO 0) := "00000";
  SIGNAL s_sign_ext_out : STD_LOGIC_VECTOR (31 DOWNTO 0) := X"00000000";

  SIGNAL s_mux_pc_res : STD_LOGIC_VECTOR (31 DOWNTO 0) := X"00000000";

  SIGNAL s_branchD : STD_LOGIC := '0';
BEGIN

  PROCESS (s_rf_rd1D, s_branch_enD) BEGIN
    IF ((s_rf_rd1D = X"00000000") AND (s_branch_enD = '1')) THEN
      s_branchD <= '1';
    ELSE
      s_branchD <= '0';
    END IF;
  END PROCESS;

  o_RsD <= s_rf_ra1;
  o_RtD <= s_rf_ra2;
  o_branchD <= s_branchD;
  o_jumpD <= s_jumpD;

  m_controller : control_unit
  PORT MAP(
    i_rst => i_rst,
    i_opcode => i_instD(31 DOWNTO 22),
    i_ir_indicator => i_instD (21 DOWNTO 15),
    o_reg_write => s_reg_writeD,
    o_mem_write => s_mem_writeD,
    o_alu_control => s_alu_controlD,
    o_mem_2_reg => s_mem_2_regD,
    o_alu_src => s_alu_srcD,
    o_branch_en => s_branch_enD,
    o_jump => s_jumpD,
    o_sw_en => s_sw_enD,
    o_jr_src => s_jr_srcD,
    o_lw_vs_imm => s_lw_vs_immD
  );
  m_mux1_ra1 : MUX2X1
  GENERIC MAP(5)
  PORT MAP(
    i_in0 => i_instD (4 DOWNTO 0),
    i_in1 => i_instD(9 DOWNTO 5),
    i_sel => s_lw_vs_immD,
    o_out => s_mux1_ra1_res
  );

  m_mux2_ra1 : MUX2X1
  GENERIC MAP(5)
  PORT MAP(
    i_in0 => s_mux1_ra1_res,
    i_in1 => i_instD(14 DOWNTO 10),
    i_sel => s_jr_srcD,
    o_out => s_rf_ra1
  );

  m_mux_ra2 : MUX2X1
  GENERIC MAP(5)
  PORT MAP(
    i_in0 => i_instD(4 DOWNTO 0),
    i_in1 => i_instD (14 DOWNTO 10),
    i_sel => s_sw_enD,
    o_out => s_rf_ra2
  );

  m_mux_sign_ext : MUX2X1
  GENERIC MAP(5)
  PORT MAP(
    i_in0 => i_instD(9 DOWNTO 5),
    i_in1 => i_instD (4 DOWNTO 0),
    i_sel => s_lw_vs_immD,
    o_out => s_sign_ext_in
  );

  m_sign_ext : sign_extend
  PORT MAP(
    i_in5 => s_sign_ext_in,
    o_out32 => s_sign_ext_out
  );

  m_rf : reg_file
  PORT MAP(
    i_clk => i_clk,
    i_rst => i_rst,
    i_we3 => i_reg_writeW,
    i_ra1 => s_rf_ra1,
    i_ra2 => s_rf_ra2,
    i_wa3 => i_RdW,
    i_wd3 => i_resultW,
    o_rd1 => s_rf_rd1,
    o_rd2 => s_rf_rd2
  );

  m_mux_rd1 : MUX2X1
  GENERIC MAP(32)
  PORT MAP(
    i_in0 => s_rf_rd1,
    i_in1 => i_alu_outM,
    i_sel => i_forwardAD,
    o_out => s_rf_rd1D
  );

  m_mux_rd2 : MUX2X1
  GENERIC MAP(32)
  PORT MAP(
    i_in0 => s_rf_rd2,
    i_in1 => i_alu_outM,
    i_sel => i_forwardBD,
    o_out => s_rf_rd2D
  );

  m_mux_pc : MUX2X1
  GENERIC MAP(32)
  PORT MAP(
    i_in0 => s_rf_rd1D,
    i_in1 => s_rf_rd2D,
    i_sel => s_branchD,
    o_out => s_mux_pc_res
  );

  m_adder : adder
  PORT MAP(
    i_a => s_mux_pc_res,
    i_b => s_sign_ext_out,
    o_sum => o_pc_branch
  );

  m_pip_reg : pip_regDE
  PORT MAP(
    i_clk => i_clk,
    i_rst => i_rst,
    i_clr => i_flushE,
    i_reg_writeD => s_reg_writeD,
    o_reg_writeE => o_reg_writeE,
    i_mem_2_regD => s_mem_2_regD,
    o_mem_2_regE => o_mem_2_regE,
    i_mem_writeD => s_mem_writeD,
    o_mem_writeE => o_mem_writeE,
    i_alu_srcD => s_alu_srcD,
    o_alu_srcE => o_alu_srcE,
    i_alu_controlD => s_alu_controlD,
    o_alu_controlE => o_alu_controlE,
    i_rf_rd1D => s_rf_rd1D,
    o_rf_rd1E => o_rf_rd1E,
    i_rf_rd2D => s_rf_rd2D,
    o_rf_rd2E => o_rf_rd2E,
    i_RsD => s_rf_ra1,
    o_RsE => o_RsE,
    i_RtD => s_rf_ra2,
    o_RtE => o_RtE,
    i_RdD => i_instD(14 DOWNTO 10),
    o_RdE => o_RdE,
    i_sign_extD => s_sign_ext_out,
    o_sign_extE => o_sign_extE
  );

END ARCHITECTURE structural;