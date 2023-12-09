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

    -- propagating signals 
    i_reg_writeM : IN STD_LOGIC;
    o_reg_writeW : OUT STD_LOGIC;

    i_mem_2_regM : IN STD_LOGIC;
    o_mem_2_regW : OUT STD_LOGIC;

    -- internal blocks control signals 
    i_mem_writeM : IN STD_LOGIC;

    -- outputs 
    o_alu_outW : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    o_alu_outM : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    o_read_dataW : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);

    -- propagating register destination 
    i_RdM : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    o_RdW : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
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

  COMPONENT pip_regMW IS
    PORT (
      i_clk : IN STD_LOGIC;
      i_rst : IN STD_LOGIC;

      i_reg_writeM : IN STD_LOGIC;
      o_reg_writeW : OUT STD_LOGIC;

      i_mem_2_regM : IN STD_LOGIC;
      o_mem_2_regW : OUT STD_LOGIC;

      i_read_dataM : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      o_read_dataW : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);

      i_alu_outM : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      o_alu_outW : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);

      i_RdM : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
      o_RdW : OUT STD_LOGIC_VECTOR (4 DOWNTO 0)
    );

  END COMPONENT;

  SIGNAL s_read_dataM : STD_LOGIC_VECTOR (31 DOWNTO 0) := (OTHERS => '0');
BEGIN

  -- output
  o_alu_outM <= i_alu_outM;

  -- data memory
  dmem_inst : dmem
  PORT MAP(
    i_clk => i_clk,
    i_rst => i_rst,
    i_we => i_mem_writeM,
    i_a => i_alu_outM,
    i_wd => i_write_dataM,
    o_rd => s_read_dataM
  );

  -- pipelining register
  m_pip_reg : pip_regMW
  PORT MAP(
    i_clk => i_clk,
    i_rst => i_rst,

    i_reg_writeM => i_reg_writeM,
    o_reg_writeW => o_reg_writeW,

    i_mem_2_regM => i_mem_2_regM,
    o_mem_2_regW => o_mem_2_regW,

    i_read_dataM => s_read_dataM,
    o_read_dataW => o_read_dataW,

    i_alu_outM => i_alu_outM,
    o_alu_outW => o_alu_outW,

    i_RdM => i_RdM,
    o_RdW => o_RdW
  );

END ARCHITECTURE STRUCT;