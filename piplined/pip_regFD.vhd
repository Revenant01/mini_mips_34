LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY pipe_reg_FD IS
  PORT (
    i_clk : IN STD_LOGIC;
    i_rst : IN STD_LOGIC;
    i_clr : IN STD_LOGIC;

    i_nEN : IN STD_LOGIC;

    i_instF : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    o_instD : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
  );
END pipe_reg_FD;

ARCHITECTURE RTL OF pipe_reg_FD IS

  SIGNAL s_EN : STD_LOGIC := '0';

BEGIN

  s_EN <= NOT i_nEN;

  PROCESS (i_clk, i_rst)
  BEGIN

    IF (i_rst = '1') THEN
      o_instD <= (OTHERS => 'X');
    ELSE
      IF (s_EN = '1') THEN
        IF rising_edge (i_clk) THEN
          o_instD <= i_instF;
          IF (i_clr = '1') THEN
            o_instD <= (OTHERS => '0');
          END IF;
        END IF;
      END IF;
    END IF;

  END PROCESS;

END ARCHITECTURE RTL;