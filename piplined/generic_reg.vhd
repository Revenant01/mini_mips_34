LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY generic_reg IS
  GENERIC (w : INTEGER);
  PORT (
    i_clk : IN STD_LOGIC;
    i_rst : IN STD_LOGIC;
    i_nEN : IN STD_LOGIC;
    i_d : IN STD_LOGIC_VECTOR(w - 1 DOWNTO 0);
    o_q : OUT STD_LOGIC_VECTOR(w - 1 DOWNTO 0));
END generic_reg;

ARCHITECTURE Behavioral OF generic_reg IS

  SIGNAL s_EN : STD_LOGIC := '0';

BEGIN

  s_EN <= NOT i_nEN;

  PROCESS (i_clk, i_rst)
  BEGIN

    IF (i_rst = '1') THEN
      i_q <= (OTHERS => '0');
    ELSE
      IF (s_EN = '1') THEN
        IF (i_clk'event AND i_clk = '1') THEN
          o_q <= i_d;
        END IF;
      END IF;
    END IF;

  END PROCESS;

END Behavioral;