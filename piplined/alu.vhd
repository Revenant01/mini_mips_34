LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY alu IS
  PORT (
    i_a, i_b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    i_ctrl : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    o_result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END ENTITY alu;

ARCHITECTURE RTL OF alu IS
BEGIN
  PROCESS (i_a, i_b, i_ctrl)
  BEGIN
    CASE i_ctrl IS
      WHEN "00" => -- Addition
        o_result <= STD_LOGIC_VECTOR(unsigned(i_a) + unsigned(i_b));
      WHEN "01" => -- Subtraction
        o_result <= STD_LOGIC_VECTOR(unsigned(i_a) - unsigned(i_b));
      WHEN "10" => -- Logical AND
        o_result <= i_a AND i_b;
      WHEN "11" => -- Logical OR
        o_result <= i_a OR i_b;
      WHEN OTHERS =>
        o_result <= (OTHERS => 'X');
    END CASE;

  END PROCESS;
END ARCHITECTURE RTL;