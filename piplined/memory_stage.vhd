LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY meomry_stage IS
  PORT (

    -- clock and reset
    i_clk : IN STD_LOGIC;
    i_rst : IN STD_LOGIC;

    -- inputs from execute stage
    i_alu_outM : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    i_write_dataM : IN STD_LOGIC_VECTOR (31 DOWNTO 0);

    -- internal blocks control signals 
    i_mem_writeM : IN STD_LOGIC;

    -- outputs 
    o_alu_outE : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    o_read_dataM : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
  );

END ENTITY meomry_stage;

ARCHITECTURE STRUCT OF meomry_stage IS
  COMPONENT dmem IS -- data memory
    PORT (
      i_clk : IN STD_LOGIC;
      i_rst : IN STD_LOGIC;
      i_we : IN STD_LOGIC;
      i_a, i_wd : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      o_rd : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
  END COMPONENT;
BEGIN

  -- data memory
  dmem_inst : dmem
  PORT MAP(
    i_clk => i_clk,
    i_rst => i_rst,
    i_we => i_mem_writeM,
    i_a => i_alu_outM,
    i_wd => i_write_dataM,
    o_rd => o_read_dataM);

  -- output
  o_alu_outE <= i_alu_outM;

END ARCHITECTURE STRUCT;