LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY dmem IS -- data memory
  PORT (
    i_clk : IN STD_LOGIC;
    i_rst : IN STD_LOGIC;
    i_we : IN STD_LOGIC;
    i_a, i_wd : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    o_rd : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END dmem;

ARCHITECTURE RTL OF dmem IS
  TYPE ramtype IS ARRAY (63 DOWNTO 0) OF STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL mem : ramtype;
BEGIN
  write_process : PROCESS (i_clk, i_rst)
  BEGIN
    IF rising_edge(i_clk) THEN
      IF (i_we = '1') THEN
        mem(to_integer(unsigned(i_a))) <= i_wd;
      END IF;
    END IF;
  END PROCESS;

  o_rd <= mem(to_integer(unsigned(i_a(5 DOWNTO 0))));

END ARCHITECTURE RTL;