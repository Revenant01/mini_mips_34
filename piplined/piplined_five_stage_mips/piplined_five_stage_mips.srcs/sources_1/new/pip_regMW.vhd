LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY pip_regMW IS
  PORT (
    i_clk : IN STD_LOGIC;
    i_rst : IN STD_LOGIC;

    i_reg_writeM : IN STD_LOGIC;
    o_reg_writeW : OUT STD_LOGIC;

    i_mem_2_regM : IN STD_LOGIC;
    o_mem_2_regW : OUT STD_LOGIC;

    i_read_dataM : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    o_read_dataW : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);

    i_alu_outM : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    o_alu_outW : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);

    i_RdM : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    o_RdW : OUT STD_LOGIC_VECTOR (4 DOWNTO 0)
  );
END pip_regMW;

ARCHITECTURE sequential OF pip_regMW IS

BEGIN

  PROCESS (i_clk, i_rst)
  BEGIN
    IF (i_rst = '1') THEN
      o_reg_writeW <= '0';
      o_mem_2_regW <= '0';
      o_read_dataW <= (OTHERS => '0');
      o_alu_outW <= (OTHERS => '0');
      o_RdW <= (OTHERS => '0');
    ELSE
      IF rising_edge(i_clk) THEN
        o_reg_writeW <= i_reg_writeM;
        o_mem_2_regW <= i_mem_2_regM;
        o_read_dataW <= i_read_dataM;
        o_alu_outW <= i_alu_outM;
        o_RdW <= i_RdM;
      END IF;
    END IF;
  END PROCESS;
END ARCHITECTURE sequential;