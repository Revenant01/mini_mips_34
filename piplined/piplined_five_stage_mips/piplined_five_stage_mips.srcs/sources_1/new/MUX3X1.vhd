LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY MUX3X1 IS
  GENERIC (width : INTEGER);
  PORT (
    i_in0, i_in1, i_in2 : IN STD_LOGIC_VECTOR (width - 1 DOWNTO 0);
    i_sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    o_out : OUT STD_LOGIC_VECTOR (width - 1 DOWNTO 0)
  );
END MUX3X1;

ARCHITECTURE RTL OF MUX3X1 IS
BEGIN
  PROCESS (i_in0, i_in1, i_in2, i_sel)
  BEGIN
    CASE i_sel IS
      WHEN "00" => 
        o_out <= i_in0;    -- to select the reg_file input
      WHEN "01" =>  
        o_out <= i_in1;    -- to select the ALU_outM input
      WHEN "10" =>
        o_out <= i_in2;    -- to select the ResultW input
      WHEN OTHERS =>
        o_out <= (OTHERS => 'X');
    END CASE;
  END PROCESS;
END ARCHITECTURE RTL;