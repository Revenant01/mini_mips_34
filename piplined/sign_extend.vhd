LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY sign_extend IS
  PORT (
    i_in5 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    o_out32 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END ENTITY sign_extend;

ARCHITECTURE RTL OF sign_extend IS
BEGIN
  PROCESS (i_in5)
  BEGIN
    IF i_in5(4) = '1' THEN
      o_out32 <= (OTHERS => '1');
    ELSE
      o_out32 <= (OTHERS => '0');
    END IF;
    o_out32(4 DOWNTO 0) <= i_in5;
  END PROCESS;
END ARCHITECTURE RTL;