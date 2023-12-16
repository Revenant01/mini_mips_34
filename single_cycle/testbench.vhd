LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY testbench IS
END testbench;

ARCHITECTURE test OF testbench IS
  COMPONENT top_module IS
    PORT (
      i_clk, i_rst : IN STD_LOGIC;
      i_inst : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      b_pc : BUFFER STD_LOGIC_VECTOR (31 DOWNTO 0);
      b_writedata : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0);
      b_dataadr : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
  END COMPONENT;

  SIGNAL s_clk_tb : STD_LOGIC := '1';
  SIGNAL s_rst_tb : STD_LOGIC := '0';
  SIGNAL s_inst_tb : STD_LOGIC_VECTOR(31 DOWNTO 0) := X"00000000";
  SIGNAL s_pc_tb, s_write_data_tb, s_data_adr_tb : STD_LOGIC_VECTOR (31 DOWNTO 0);

BEGIN

  -- instentiate the DUT
  dut : top_module
  PORT MAP(
    i_clk => s_clk_tb,
    i_rst => s_rst_tb,
    i_inst => s_inst_tb,
    b_pc => s_pc_tb,
    b_writedata => s_write_data_tb,
    b_dataadr => s_data_adr_tb
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

  stimuli_process : PROCESS
  BEGIN
    WAIT FOR 20ns;
    s_inst_tb <= X"00408405";
    WAIT FOR 10ns;
    s_inst_tb <= X"00808823";
    WAIT FOR 10ns;
    s_inst_tb <= X"00400C41";
    WAIT FOR 10ns;
    s_inst_tb <= X"10000CE1";
    WAIT FOR 10ns;
    s_inst_tb <= X"00801022";
    WAIT FOR 10ns;
    s_inst_tb <= X"02001483";
    WAIT FOR 10ns;
    s_inst_tb <= X"100004C5";
    WAIT FOR 10ns;
    s_inst_tb <= X"08001925";
    WAIT FOR 10ns;
    s_inst_tb <= X"04001C26";

    WAIT;
  END PROCESS;

END;