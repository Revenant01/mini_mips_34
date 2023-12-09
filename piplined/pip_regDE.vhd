LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY pip_regDE IS PORT (

  -- clock and global inputs
  i_clk : IN STD_LOGIC;
  i_rst : IN STD_LOGIC;
  i_clr : IN STD_LOGIC;

  -- propgagting controls signals 
  i_reg_writeD : IN STD_LOGIC;
  o_reg_writeE : OUT STD_LOGIC;

  i_mem_2_regD : IN STD_LOGIC;
  o_mem_2_regE : OUT STD_LOGIC;

  i_mem_writeD : IN STD_LOGIC;
  o_mem_writeE : OUT STD_LOGIC;
  
  
  -- internal blocks control signals 
  i_alu_srcD : IN STD_LOGIC;
  o_alu_srcE : OUT STD_LOGIC;

  i_alu_control : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
  o_alu_control : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
 
 
  -- register files outputs 
  i_rf_rd1D : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
  o_rf_rd1E : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);

  i_rf_rd2D : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
  o_rf_rd2E : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
 
 
  -- regester addresses 
  i_RsD : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
  o_RsE : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);

  i_RtD : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
  o_RtE : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);

  i_RdD : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
  o_RdE : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);

  
  -- sign extend 
  i_sign_extD : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
  o_sign_extE : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
);

END pip_regDE;

ARCHITECTURE sequential OF pip_regDE IS
BEGIN

  PROCESS (i_clk, i_rst) 
  BEGIN
    IF (i_rst = '1') THEN
      o_reg_writeE <= '0';
      o_mem_2_regE <= '0';
      o_mem_writeE <= '0';
      o_alu_srcE <= '0';
      o_alu_control <= "00";
      o_rf_rd1E <= (OTHERS => '0');
      o_rf_rd2E <= (OTHERS => '0');
      o_RsE <= (OTHERS => '0');
      o_RtE <= (OTHERS => '0');
      o_RdE <= (OTHERS => '0');
      o_sign_extE <= (OTHERS => '0');
    ELSIF rising_edge(i_clk) THEN
      IF (i_clr = '1') THEN
        o_reg_writeE <= '0';
        o_mem_2_regE <= '0';
        o_mem_writeE <= '0';
        o_alu_srcE <= '0';
        o_alu_control <= "00";
        o_rf_rd1E <= (OTHERS => '0');
        o_rf_rd2E <= (OTHERS => '0');
        o_RsE <= (OTHERS => '0');
        o_RtE <= (OTHERS => '0');
        o_RdE <= (OTHERS => '0');
        o_sign_extE <= (OTHERS => '0');
      ELSE
        o_reg_writeE <= i_reg_WriteD;
        o_mem_2_regE <= i_mem_2_regD;
        o_mem_writeE <= i_mem_writeD;
        o_alu_srcE <= i_alu_srcD;
        o_alu_control <= i_alu_control;
        o_rf_rd1E <= i_rf_rd1D;
        o_rf_rd2E <= i_rf_rd2D;
        o_RsE <= i_RsD;
        o_RtE <= i_RtD;
        o_RdE <= i_RdD;
        o_sign_extE <= i_sign_extD;

      END IF;
    END IF;
  END PROCESS;

END ARCHITECTURE sequential;