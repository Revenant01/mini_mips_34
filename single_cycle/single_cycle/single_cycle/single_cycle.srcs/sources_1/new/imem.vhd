LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
use IEEE.numeric_std.all;
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



  o_inst <= s_rom_block(to_integer(unsigned(i_a(6 DOWNTO 2))));
    s_rom_block(0) <= X"00408405"; 
    s_rom_block(1) <= X"00808823";
    s_rom_block(2) <= X"00400C41";
    s_rom_block(3) <= X"10000CE1";
    s_rom_block(4) <= X"00801022";
    s_rom_block(5) <= X"02001483";
    s_rom_block(6) <= X"100004C5";
    s_rom_block(7) <= X"08001925";
    s_rom_block(8) <= X"04001C26";
    s_rom_block(9) <= X"40000467";
    s_rom_block(10) <= X"20001040";
    s_rom_block(11) <= X"00800485";
    s_rom_block(12) <= X"400004E7";

--    process (i_rst)
--        file f : TEXT;
--        constant filename: string := "D:\Semster7\ELCT707 - CA\Project\MIPS\MIPS_V2\single_cycle\single_cycle\program.txt";
--        variable l : line;
--        variable i : integer := 0;
--        variable b : std_logic_vector(31 downto 0);
--    begin
--         if(i_rst = '1') then
--      file_open(f,filename,read_mode);
--      while((i <= 31) and (not endfile(f))) loop
--        readline(f,l);
--        if l(1) /= '#' then
--          read(l,b);
--          s_rom_block(i) <= b;
--          i := i + 1;
--        end if;
--      end loop;
--      file_close(f);
--    end if;
--    end process;
END ARCHITECTURE RTL;