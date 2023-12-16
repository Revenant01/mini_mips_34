LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

ENTITY flopr IS -- flip-flop with synchronous reset
  GENERIC (width : INTEGER);
  PORT (
    i_clk, i_rst : IN STD_LOGIC;
    i_d : IN STD_LOGIC_VECTOR(width - 1 DOWNTO 0);
    o_q : OUT STD_LOGIC_VECTOR(width - 1 DOWNTO 0)
  );
END;

ARCHITECTURE ASYNC OF flopr IS
BEGIN
  PROCESS (i_clk, i_rst) BEGIN
    IF (i_rst = '1') THEN
      o_q <= (OTHERS => '0');
    ELSIF rising_edge(i_clk) THEN
      o_q <= i_d;
    END IF;
  END PROCESS;
END ARCHITECTURE ASYNC;