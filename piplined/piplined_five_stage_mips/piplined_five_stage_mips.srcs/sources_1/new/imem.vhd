LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE IEEE.numeric_std.ALL;
USE STD.TEXTIO.ALL;

ENTITY imem IS
  PORT (
    i_rst : IN STD_LOGIC;
    i_a : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    o_inst : OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
END imem;

ARCHITECTURE RTL OF imem IS

  TYPE mem IS ARRAY (0 TO 31) OF STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL s_rom_block : mem := (OTHERS => X"00000000");
BEGIN

    -- Typical program instructions to test all insturction supported with no hazard in between
--    s_rom_block (0)  <= X"00408405"; -- ADDI R1, R0, 5
--    s_rom_block (1)  <= X"00408803"; -- ADDI R2, R0, 3
--    s_rom_block (2)  <= X"00408C04"; -- ADDI R3, R0, 4
--    s_rom_block (3)  <= X"00409006"; -- ADDI R4, R0, 6
--    s_rom_block (4)  <= X"00409407"; -- ADDI R5, R0, 7
--    s_rom_block (5)  <= X"00409801"; -- ADDI R6, R0, 1
--    s_rom_block (6)  <= X"20000500"; -- JR R1, 8
--    s_rom_block (7)  <= X"02001C22"; -- AND R7, R1, R2
--    s_rom_block (13) <= X"10000CC0"; -- SW R3, 6, R0
--    s_rom_block (14) <= X"400009C4"; -- BEQZ R2, E, R4
--    s_rom_block (15) <= X"040020A0"; -- OR R8, R5, R0
--    s_rom_block (16) <= X"0080A4C0"; -- SUBI R9, R6, 0
--    s_rom_block (17) <= X"400001E5"; -- BEQZ R0, F, R5
--    s_rom_block (18) <= X"00402441"; -- ADD R9, R2, R1
--    s_rom_block (22) <= X"00402464"; -- ADD R9, R3, R4
--    s_rom_block (23) <= X"080028A6"; -- LW R10, 5, R6
    
    -- Program to address the RAW hazard
--    s_rom_block (0)  <= X"00408405"; -- ADDI R1, R0, 5
--    s_rom_block (1)  <= X"00808823"; -- SUBI R2, R1, 3
--    s_rom_block (2)  <= X"00408C24"; -- ADDI R3, R1, 4

    -- program to address the load stall
    -- firstly, initialize the memory with some constants
    s_rom_block (0)  <= X"00408405"; -- ADDI R1, R0, 5
    s_rom_block (1)  <= X"00408803"; -- ADDI R2, R0, 3
    s_rom_block (2)  <= X"00408C04"; -- ADDI R3, R0, 4
--    s_rom_block (3)  <= X"00409006"; -- ADDI R4, R0, 6
    s_rom_block (3)  <= X"10000420"; -- SW R1, 1, R0
    s_rom_block (4)  <= X"10000860"; -- SW R2, 3, R0
    s_rom_block (5)  <= X"00409407"; -- ADDI R5, R0, 7
    s_rom_block (6)  <= X"00409801"; -- ADDI R6, R0, 1
--    s_rom_block (8)  <= X"08002420"; -- LW R9, 1, R0
    s_rom_block (9)  <= X"00408804"; -- ADDI R2, R0, 3
    s_rom_block (10)  <= X"0040A803"; -- ADDI R10, R9, 3 0000 0000 01.00 0000 1.010 10.00 000.0 0011  -- this instruction causes a stall because the preceeding lw 
    s_rom_block (11) <= X"400009E9"; -- BEQZ R2, F, R9 0010 0000 00.00 0000 0.000 10.01 111.0 1001  -- this branch must stall because lw is in memory stage
    
    
     
   o_inst <= s_rom_block(to_integer(unsigned(i_a)));
   
END ARCHITECTURE RTL;