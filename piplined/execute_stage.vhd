LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY execut_stage IS
  PORT (
    i_rf_srcA  : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    i_rf_srcB  : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    i_alu_outM : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    i_resultW  : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
  );

END ENTITY execut_stage;

ARCHITECTURE RTL OF execut_stage IS

  COMPONENT alu IS
    PORT (
      i_a, i_b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      i_ctrl : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      o_result : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0)
    );

  END COMPONENT;

  COMPONENT MUX3X1 IS
    PORT (
      i_in0, i_in1, i_in2 : IN STD_LOGIC_VECTOR (width - 1 DOWNTO 0);
      i_sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      o_out : OUT STD_LOGIC_VECTOR (width - 1 DOWNTO 0)
    );

  END COMPONENT;

  COMPONENT MUX2X1 IS
    PORT (
      i_in0, i_in1,: IN STD_LOGIC_VECTOR (width - 1 DOWNTO 0);
      i_sel : IN STD_LOGIC;
      o_out : OUT STD_LOGIC_VECTOR (width - 1 DOWNTO 0)
    );

  END COMPONENT;
BEGIN

END ARCHITECTURE RTL;