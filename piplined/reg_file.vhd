LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY reg_file IS -- three-port register file
  PORT (
    i_clk : IN STD_LOGIC;
    i_rst : IN STD_LOGIC;
    i_we3 : IN STD_LOGIC;
    i_ra1, i_ra2, i_wa3 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    i_wd3 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    o_rd1 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    o_rd2 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END;

ARCHITECTURE RTL OF reg_file IS
  TYPE ramtype IS ARRAY (31 DOWNTO 0) OF STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL mem : ramtype;
BEGIN
  -- three-ported register file
  -- read two ports combinationally
  -- write third port on rising edge of clock
  -- register 0 hardwired to 0
  -- note: for pipelined processor, write third port
  -- on falling edge of clk
  PROCESS (i_clk, i_rst) BEGIN
    IF (i_rst = '1') THEN
      mem <= (OTHERS => X"00000000");
    ELSE
      IF rising_edge(i_clk) THEN
        IF i_we3 = '1' THEN
          mem(to_integer(unsigned(i_wa3))) <= i_wd3;
        END IF;
      END IF;
    END IF;
  END PROCESS;
  PROCESS (i_ra1, i_ra2, i_rst) BEGIN
    IF (to_integer(unsigned(i_ra1)) = 0) THEN
      o_rd1 <= X"00000000"; -- register 0 holds 0
    ELSE
      o_rd1 <= mem(to_integer(unsigned(i_ra1)));
    END IF;
    IF (to_integer(unsigned(i_ra2)) = 0) THEN
      o_rd2 <= X"00000000";
    ELSE
      o_rd2 <= mem(to_integer(unsigned(i_ra2)));
    END IF;
  END PROCESS;
END;