LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY testbench IS
END testbench;

ARCHITECTURE test OF testbench IS
  COMPONENT mips IS
    PORT (
      i_clk, i_rst : IN STD_LOGIC
    );
  END COMPONENT;

  SIGNAL s_clk_tb : STD_LOGIC := '1';
  SIGNAL s_rst_tb : STD_LOGIC := '0';

BEGIN

  -- instentiate the DUT
  dut : mips
  PORT MAP(
    i_clk => s_clk_tb,
    i_rst => s_rst_tb
  );
  -- Create the clk with period 10ns
  clk_process : PROCESS
  BEGIN
    s_clk_tb <= NOT s_clk_tb;
    WAIT FOR 10ns;
  END PROCESS;

  -- Generate reset for first two clock cycles
  PROCESS BEGIN
    WAIT FOR 5 ns;
    s_rst_tb <= '1';
    WAIT FOR 3 ns;
    s_rst_tb <= '0';
    WAIT;
  END PROCESS;

END;