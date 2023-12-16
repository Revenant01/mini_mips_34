LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY testbench IS
END testbench;

ARCHITECTURE test OF testbench IS
  COMPONENT fetch_stage IS
    PORT (
          i_clk : IN STD_LOGIC;
    i_rst : IN STD_LOGIC;

    i_stallF : IN STD_LOGIC;
    i_stallD : IN STD_LOGIC;

    i_jump_enD : IN STD_LOGIC;
    i_branchD : IN STD_LOGIC;

    i_pc_newD : IN STD_LOGIC_VECTOR (31 DOWNTO 0);

    o_instD : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
    );
  END COMPONENT;

  SIGNAL s_clk_tb : STD_LOGIC := '1';
  SIGNAL s_rst_tb : STD_LOGIC := '0';
  SIGNAL s_stallF_tb : STD_LOGIC := '0';
  SIGNAL s_stallD_tb : STD_LOGIC := '0';
  SIGNAL s_jump_enD_tb : STD_LOGIC := '0';
  SIGNAL s_branchD_tb : STD_LOGIC := '0';
  SIGNAL s_pc_newD_tb : std_logic_vector (31 downto 0);
  SIGNAL s_instD_tb : std_logic_vector (31 downto 0);
  

BEGIN

  -- instentiate the DUT
  dut : fetch_stage
  PORT MAP(
     i_clk => s_clk_tb,
     i_rst => s_rst_tb,
     i_stallF => s_stallF_tb,
     i_stallD => s_stallD_tb,
    i_jump_enD => s_jump_enD_tb,
    i_branchD => s_branchD_tb,
    i_pc_newD => s_pc_newD_tb,
    o_instD => s_instD_tb
  );
  -- Create the clk with period 10ns
  clk_process : PROCESS
  BEGIN
    s_clk_tb <= NOT s_clk_tb;
    WAIT FOR 5ns;
  END PROCESS;

  -- Generate reset for first two clock cycles
  PROCESS BEGIN
    WAIT FOR 10ns;
    s_rst_tb <= '1';
    WAIT FOR 10 ns;
    s_rst_tb <= '0';
    WAIT;
  END PROCESS;


END;