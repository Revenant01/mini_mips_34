LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY hazard_unit IS
  PORT (
    o_stallF : OUT STD_LOGIC;

    o_stallD : OUT STD_LOGIC;
    i_RsD : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    i_RtD : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    i_branchD : IN STD_LOGIC;
    o_forwardAD : OUT STD_LOGIC;
    o_forwardBD : OUT STD_LOGIC;

    o_flushE : OUT STD_LOGIC;
    i_RsE : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    i_RtE : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    i_RdE : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    i_mem_2_regE : IN STD_LOGIC;
    i_reg_writeE : IN STD_LOGIC;
    o_forwardAE : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    o_forwardBE : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);

    i_mem_2_regM : IN STD_LOGIC;
    i_reg_writeM : IN STD_LOGIC;
    i_reg_writeW : IN STD_LOGIC;
    i_RdM : IN STD_LOGIC_VECTOR(4 DOWNTO 0);

    i_RdW : IN STD_LOGIC_VECTOR (4 DOWNTO 0)
  );

END hazard_unit;

ARCHITECTURE RTL OF hazard_unit IS

  SIGNAL s_lw_stall : STD_LOGIC := '0';
  SIGNAL s_branch_stall : STD_LOGIC := '0';
BEGIN
  -- introduce forwarding
  RAW_srcA_hazard : PROCESS (i_RsE, i_RdM, i_RdW, i_reg_writeM, i_reg_writeW) BEGIN
    IF (i_RsE /= 0) AND (i_RsE = i_RdM) AND (i_reg_writeM = '1') THEN
      o_forwardAE <= "01";
    ELSIF (i_RsE /= 0) AND (i_RsE = i_RdW) AND (i_reg_writeW = '1') THEN
      o_forwardAE <= "10";
    ELSE
      o_forwardAE <= "00";
    END IF;
  END PROCESS;

  -- introduce forwarding
  RAW_srcB_hazard : PROCESS (i_RtE, i_RdM, i_RdW, i_reg_writeM, i_reg_writeW) BEGIN
    IF (i_RtE /= 0) AND (i_RtE = i_RdM) AND (i_reg_writeM = '1') THEN
      o_forwardBE <= "01";
    ELSIF (i_RtE /= 0) AND (i_RtE = i_RdW) AND (i_reg_writeW = '1') THEN
      o_forwardBE <= "10";
    ELSE
      o_forwardBE <= "00";
    END IF;
  END PROCESS;

  -- introduce stalling
  lw_hazard : PROCESS (i_RsD, i_RtD, i_RdE, i_mem_2_regE) BEGIN
    IF ((i_RsD = i_RdE) OR (i_RtD = i_RdE)) AND (i_mem_2_regE = '1') THEN
      s_lw_stall <= '0';
    END IF;
  END PROCESS;

  beqz_hazard : PROCESS (i_RsD, i_RtD, i_RdM, i_reg_writeM) BEGIN
    -- data is in memory stage, forwarding 
    IF ((i_RsD /= 0) AND (i_RsD = i_RdM) AND (i_reg_writeM = '1')) THEN
      o_forwardAD <= '1';
    ELSE
      o_forwardAD <= '0';
    END IF;

    -- data is in memory stage, forwarding 
    IF ((i_RtD /= 0) AND (i_RtD = i_RdM) AND (i_reg_writeM = '1')) THEN
      o_forwardBD <= '1';
    ELSE
      o_forwardBD <= '0';
    END IF;

    -- data is in execute stage or lw in mem stage , stalling
    IF ((i_branchD = '1') AND (i_reg_writeE = '1') AND ((i_RdE = i_RsD) OR (i_RdE = i_RtD))) OR
      ((i_branchD = '1') AND (i_mem_2_regM = '1') AND ((i_RdM = i_RsD) OR (i_RdM = i_RtD))) THEN
      s_branch_stall <= '1';
    ELSE
      s_branch_stall <= '0';
    END IF;
  END PROCESS;

  o_stallF <= '1' WHEN (s_branch_stall = '1') OR (s_lw_stall = '1') ELSE
    '0';
  o_stallD <= '1' WHEN (s_branch_stall = '1') OR (s_lw_stall = '1') ELSE
    '0';
  o_flushE <= '1' WHEN (s_branch_stall = '1') OR (s_lw_stall = '1') ELSE
    '0';

END ARCHITECTURE RTL;