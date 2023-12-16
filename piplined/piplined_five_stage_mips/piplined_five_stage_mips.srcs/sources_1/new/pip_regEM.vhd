LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY pip_regEM IS PORT (
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

END pip_regEM;

ARCHITECTURE sequential OF pip_regEM IS

BEGIN

  PROCESS (i_clk, i_rst) BEGIN
    IF (i_rst = '1') THEN
      o_reg_writeM <= '0';
      o_mem_2_regM <= '0';
      o_mem_writeM <= '0';
      o_alu_outM <= (OTHERS => '0');
      o_write_dataM <= (OTHERS => '0');
      o_RdM <= (OTHERS => '0');
    ELSE
      IF rising_edge(i_clk) THEN
        IF (i_clr = '1') THEN
          o_reg_writeM <= '0';
          o_mem_2_regM <= '0';
          o_mem_writeM <= '0';
          o_alu_outM <= (OTHERS => '0');
          o_write_dataM <= (OTHERS => '0');
          o_RdM <= (OTHERS => '0');
        ELSE
          o_reg_writeM <= i_reg_writeE;
          o_mem_2_regM <= i_mem_2_regE;
          o_mem_writeM <= i_mem_writeE;
          o_alu_outM <= i_alu_outE;
          o_write_dataM <= i_write_dataE;
          o_RdM <= i_RdE;
        END IF;
      END IF;

    END IF;
  END PROCESS;
END ARCHITECTURE sequential;