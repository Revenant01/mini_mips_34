LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY top_module IS -- top-level design for testing
  PORT (
    i_clk, i_rst : IN STD_LOGIC;
    i_inst : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    b_pc : BUFFER STD_LOGIC_VECTOR (31 DOWNTO 0);
    b_writedata : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0);
    b_dataadr : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END;

ARCHITECTURE struct OF top_module IS
  COMPONENT mips
    PORT (
      i_clk, i_rst : IN STD_LOGIC;
      i_read_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      b_pc : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0);
      i_inst : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      b_write_data : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0);
      b_alu_out : BUFFER STD_LOGIC_VECTOR (31 DOWNTO 0);
      o_mem_write : OUT STD_LOGIC
    );
  END COMPONENT;

  --  COMPONENT imem
  --    PORT (
  --      i_a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
  --      i_rst : STD_LOGIC;
  --      o_inst : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
  --  END COMPONENT;

  COMPONENT dmem
    PORT (
      i_clk, i_we, i_rst : IN STD_LOGIC;
      i_a, i_wd : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      o_rd : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
  END COMPONENT;

  SIGNAL s_pc : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL s_inst : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL s_readdata : STD_LOGIC_VECTOR(31 DOWNTO 0);
  SIGNAL s_memwrite : STD_LOGIC;
BEGIN
  -- instantiate processor and memories
  mips1 : mips PORT MAP(
    i_clk => i_clk,
    i_rst => i_rst,
    b_pc => b_pc,
    i_inst => i_inst,
    o_mem_write => s_memwrite,
    b_alu_out => b_dataadr,
    b_write_data => b_writedata,
    i_read_data => s_readdata
  );

  --  imem1 : imem
  --  PORT MAP(
  --    i_a => s_pc,
  --    i_rst => i_rst,
  --    o_inst => s_inst
  --  );

  dmem1 : dmem
  PORT MAP(
    i_clk => i_clk,
    i_rst => i_rst,
    i_we => s_memwrite,
    i_a => b_dataadr,
    i_wd => b_writedata,
    o_rd => s_readdata
  );
END;