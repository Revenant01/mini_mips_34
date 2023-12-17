LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY execut_stage IS
  PORT (

    i_clk : STD_LOGIC;
    i_rst : STD_LOGIC;
    i_clr : STD_LOGIC;
    -- alu srcs 
    i_rf_rd1E : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    i_rf_rd2E : IN STD_LOGIC_VECTOR (31 DOWNTO 0);

    -- only for srcB
    i_sign_extE : IN STD_LOGIC_VECTOR (31 DOWNTO 0);

    -- feedback signals for the forwarding 
    i_alu_outM : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    i_resultW : IN STD_LOGIC_VECTOR (31 DOWNTO 0);

    -- internal blocks control singls
    i_alu_ctrlE : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    i_alu_srcE : IN STD_LOGIC;

    -- propagating control signals 
    i_reg_writeE : IN STD_LOGIC;
    o_reg_writeM : OUT STD_LOGIC;

    i_mem_2_regE : IN STD_LOGIC;
    o_mem_2_regM : OUT STD_LOGIC;

    i_mem_writeE : IN STD_LOGIC;
    o_mem_writeM : OUT STD_LOGIC;

    -- hazard unit control sigals 
    i_forwardAE : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    i_forwardBE : IN STD_LOGIC_VECTOR (1 DOWNTO 0);

    -- outputs  
    o_alu_outM : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    o_write_dataM : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);

    -- propagating
    i_RdE : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    o_RdM : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);

    o_RdE : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);

    -- hazard unit registers input--> outputs 
    i_RsE : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    i_RtE : IN STD_LOGIC_VECTOR (4 DOWNTO 0);

    o_RsE : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
    o_RtE : OUT STD_LOGIC_VECTOR (4 DOWNTO 0)
  );

END ENTITY execut_stage;

ARCHITECTURE STRUCT OF execut_stage IS

  COMPONENT alu IS
    PORT (
      i_a, i_b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      i_ctrl : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      o_result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );

  END COMPONENT;

  COMPONENT MUX3X1 IS
    GENERIC (width : INTEGER);
    PORT (
      i_in0, i_in1, i_in2 : IN STD_LOGIC_VECTOR (width - 1 DOWNTO 0);
      i_sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      o_out : OUT STD_LOGIC_VECTOR (width - 1 DOWNTO 0)
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

  COMPONENT pip_regEM IS
    PORT (
      i_clk : IN STD_LOGIC;
      i_rst : IN STD_LOGIC;
      i_clr : IN STD_LOGIC;

      i_reg_writeE : IN STD_LOGIC;
      o_reg_writeM : OUT STD_LOGIC;

      i_mem_2_regE : IN STD_LOGIC;
      o_mem_2_regM : OUT STD_LOGIC;

      i_mem_writeE : IN STD_LOGIC;
      o_mem_writeM : OUT STD_LOGIC;

      i_alu_outE : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      o_alu_outM : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);

      i_write_dataE : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      o_write_dataM : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);

      i_RdE : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
      o_RdM : OUT STD_LOGIC_VECTOR (4 DOWNTO 0)
    );

  END COMPONENT;

  SIGNAL s_alu_srcA : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL s_alu_srcB : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL s_mux1_srcB_res : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL s_alu_out : STD_LOGIC_VECTOR (31 DOWNTO 0);
BEGIN

  -- these signals should only propagate with 
  o_RsE <= i_RsE;
  o_RtE <= i_RtE;
  o_RdE <= i_RdE;

  m_mux_srcA : MUX3X1
  GENERIC MAP(32)
  PORT MAP(
    i_in0 => i_rf_rd1E,
    i_in1 => i_alu_outM,
    i_in2 => i_resultW,
    i_sel => i_forwardAE,
    o_out => s_alu_srcA
  );

  m_mux1_srcB : MUX3X1
  GENERIC MAP(32)
  PORT MAP(
    i_in0 => i_rf_rd2E,
    i_in1 => i_alu_outM,
    i_in2 => i_resultW,
    i_sel => i_forwardBE,
    o_out => s_mux1_srcB_res
  );

  m_mux2_srcB : MUX2X1
  GENERIC MAP(32)
  PORT MAP(
    i_in0 => s_mux1_srcB_res,
    i_in1 => i_sign_extE,
    i_sel => i_alu_srcE,
    o_out => s_alu_srcB
  );

  m_alu : alu
  PORT MAP(
    i_a => s_alu_srcA,
    i_b => s_alu_srcB,
    i_ctrl => i_alu_ctrlE,
    o_result => s_alu_out
  );

  m_pip_reg : pip_regEM
  PORT MAP(
    i_clk => i_clk,
    i_rst => i_rst,
    i_clr => i_clr,

    i_reg_writeE => i_reg_writeE,
    o_reg_writeM => o_reg_writeM,

    i_mem_2_regE => i_mem_2_regE,
    o_mem_2_regM => o_mem_2_regM,

    i_mem_writeE => i_mem_writeE,
    o_mem_writeM => o_mem_writeM,

    i_alu_outE => s_alu_out,
    o_alu_outM => o_alu_outM,

    i_write_dataE => s_mux1_srcB_res,
    o_write_dataM => o_write_dataM,

    i_RdE => i_RdE,
    o_RdM => o_RdM
  );

END ARCHITECTURE STRUCT;