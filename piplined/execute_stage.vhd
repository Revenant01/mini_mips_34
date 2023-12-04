LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY execut_stage IS
  PORT (
    -- alu srcs 
    i_rf_rd1 : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    i_rf_rd2 : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    i_alu_outM : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    i_resultW : IN STD_LOGIC_VECTOR (31 DOWNTO 0);

    -- only for srcB
    i_sign_extE : IN STD_LOGIC_VECTOR (31 DOWNTO 0);

    -- internal blocks control singls
    i_alu_ctrlE : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    i_alu_srcE : IN STD_LOGIC;

    -- hazard unit control sigals 
    i_forwardAE : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    i_forwardBE : IN STD_LOGIC_VECTOR (1 DOWNTO 0);

    -- outputs  
    o_alu_outE : BUFFER STD_LOGIC_VECTOR (31 DOWNTO 0); --type chnaged to be a buffer to be consistant with alu module generic, no diff in the scope of this module
    o_write_dataE : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
  );

END ENTITY execut_stage;

ARCHITECTURE STRUCT OF execut_stage IS

  COMPONENT alu IS
    PORT (
      i_a, i_b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      i_ctrl : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      o_result : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0)
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

  SIGNAL s_alu_srcA : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL s_alu_srcB : STD_LOGIC_VECTOR (31 DOWNTO 0);
  signal s_mux1_srcB_res : STD_LOGIC_VECTOR (31 DOWNTO 0); 
BEGIN

  m_mux_srcA : MUX3X1
  GENERIC MAP (32)
  PORT MAP(
    i_in0 => i_rf_rd1,
    i_in1 => i_alu_outM,
    i_in2 => i_resultW,
    i_sel => i_forwardAE,
    o_out => s_alu_srcA
  );

  m_mux1_srcB : MUX3X1
  GENERIC MAP (32)
  PORT MAP(
    i_in0 => i_rf_rd2,
    i_in1 => i_alu_outM,
    i_in2 => i_resultW,
    i_sel => i_forwardBE,
    o_out => s_mux1_srcB_res
  );

  m_mux_srcB2 : MUX2X1
  GENERIC MAP (32)
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
    o_result => o_alu_outE
  );

END ARCHITECTURE STRUCT;