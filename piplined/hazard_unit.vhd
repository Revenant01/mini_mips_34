LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY hazard_unit IS
  PORT (
    o_stallF : OUT STD_LOGIC;

    o_stallD : OUT STD_LOGIC;
    i_RsD : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    i_RtD : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    o_forwardAD : OUT STD_LOGIC;
    o_forwardAB : OUT STD_LOGIC;

    o_flushE : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
    i_RsE : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    i_RtE : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    i_RdE : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    i_mem_2_regE : IN STD_LOGIC;
    i_reg_writeE : IN STD_LOGIC;
    o_forwardAE : OUT STD_LOGIC;
    o_forwardBE : OUT STD_LOGIC;

    i_mem_2_regM : IN STD_LOGIC;
    i_reg_writeM : IN STD_LOGIC;
    i_reg_writeW : IN STD_LOGIC
  );

END hazard_unit;

ARCHITECTURE RTL OF hazard_unit IS

BEGIN

END ARCHITECTURE RTL;