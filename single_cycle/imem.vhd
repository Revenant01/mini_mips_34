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

  --  o_inst <= s_rom_block(to_integer(unsigned(i_a(7 DOWNTO 2))));

  --  PROCESS (i_rst)
  --    FILE f : TEXT;
  --    CONSTANT filename : STRING := "D:\vivado_proj\mini_mips_32\program.txt";
  --    VARIABLE l : line;
  --    VARIABLE i : INTEGER := 0;
  --    VARIABLE b : STD_LOGIC_VECTOR(31 DOWNTO 0);
  --  BEGIN
  --    IF (i_rst = '1') THEN
  --      file_open(f, filename, read_mode);
  --      WHILE((i <= 31) AND (NOT endfile(f)))LOOP
  --        readline(f, l);
  --        NEXT WHEN l(1) = '#';
  --        read(l, b);
  --        s_rom_block(i) <= b;
  --        i := i + 1;
  --      END LOOP;
  --      file_close(f);
  --    END IF;
  --  END PROCESS;
END ARCHITECTURE RTL;