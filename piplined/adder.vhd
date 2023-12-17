LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY adder IS
  PORT (
    i_a       : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    i_b       : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    o_sum     : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END ENTITY;

ARCHITECTURE RTL OF adder IS
BEGIN
  o_sum <= STD_LOGIC_VECTOR(unsigned(i_a) + unsigned(i_b));
END ARCHITECTURE RTL;