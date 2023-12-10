LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY writeback_stage IS
  PORT (

    -- input signals
    i_alu_outW : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    i_read_dataW : IN STD_LOGIC_VECTOR (31 DOWNTO 0);

    -- mux control signal
    i_mem_2_regW : IN STD_LOGIC;

    -- output signal 
    o_resultW : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
  );
END ENTITY writeback_stage;

ARCHITECTURE STRUCT OF writeback_stage IS

  COMPONENT MUX2X1 IS
    GENERIC (width : INTEGER);
    PORT (
      i_in0, i_in1 : IN STD_LOGIC_VECTOR (width - 1 DOWNTO 0);
      i_sel : IN STD_LOGIC;
      o_out : OUT STD_LOGIC_VECTOR (width - 1 DOWNTO 0)
    );
    END COMPONENT;
    
  BEGIN

  m_mux_WB : MUX2X1
  GENERIC MAP (32)
  PORT MAP(
    i_in0 => i_read_dataW,
    i_in1 => i_alu_outW,
    i_sel => i_mem_2_regW,
    o_out => o_resultW
  );

  END ARCHITECTURE STRUCT;