LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mips IS PORT (
  i_clk : IN STD_LOGIC;
  i_rst : IN STD_LOGIC
);

END mips;

ARCHITECTURE structural OF mips IS
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

  COMPONENT decode_stage IS
    PORT (
      i_clk : IN STD_LOGIC;
      i_rst : IN STD_LOGIC;

      i_instD : IN STD_LOGIC_VECTOR (31 DOWNTO 0);

      -- control signals 
      o_reg_writeE : OUT STD_LOGIC;
      o_mem_2_regE : OUT STD_LOGIC;
      o_mem_writeE : OUT STD_LOGIC;
      o_alu_srcE : OUT STD_LOGIC;
      o_alu_controlE : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      o_rf_rd1E : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
      o_rf_rd2E : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);

      -- control signal delayed to be synchronous with reg written data
      i_reg_writeW : IN STD_LOGIC;
      -- regester addresses 
      o_RsE : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
      o_RtE : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
      o_RdE : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);

      -- sign extend 
      o_sign_extE : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);

      -- feedback signals for writing on register
      i_RdW : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
      i_resultW : IN STD_LOGIC_VECTOR (31 DOWNTO 0);

      -- forwarded signal to resolve RAW of branch and jump
      i_alu_outM : IN STD_LOGIC_VECTOR (31 DOWNTO 0);

      -- Hazard unit signals --
      -- used to detect if a branch RAW hazard occured, they'll be compared with RdE to introduce a branch stall, 
      -- also compared with RdM incase of LW instruction 
      o_RsD : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
      o_RtD : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);

      i_forwardAD : IN STD_LOGIC;
      i_forwardBD : IN STD_LOGIC;
      i_flushE : IN STD_LOGIC;

      o_pc_branch : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);

      o_branchD : OUT STD_LOGIC;
      o_jumpD : OUT STD_LOGIC
    );
  END COMPONENT;

  COMPONENT execut_stage IS
    PORT (

      i_clk : STD_LOGIC;
    i_rst : STD_LOGIC;
    i_clr : STD_LOGIC;
    -- alu srcs 
    i_rf_rd1E : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    i_rf_rd2E : IN STD_LOGIC_VECTOR (31 DOWNTO 0);

    -- only for srcB
    i_sign_extE : IN STD_LOGIC_VECTOR (31 DOWNTO 0);

    -- feedback signals for the forwarding 
    i_alu_outM : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    i_resultW : IN STD_LOGIC_VECTOR (31 DOWNTO 0);

    -- internal blocks control singls
    i_alu_ctrlE : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    i_alu_srcE : IN STD_LOGIC;

    -- propagating control signals 
    i_reg_writeE : IN STD_LOGIC;
    o_reg_writeM : OUT STD_LOGIC;

    i_mem_2_regE : IN STD_LOGIC;
    o_mem_2_regM : OUT STD_LOGIC;

    i_mem_writeE : IN STD_LOGIC;
    o_mem_writeM : OUT STD_LOGIC;

    -- hazard unit control sigals 
    i_forwardAE : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
    i_forwardBE : IN STD_LOGIC_VECTOR (1 DOWNTO 0);

    -- outputs  
    o_alu_outM : OUT STD_LOGIC_VECTOR (31 DOWNTO 0); 
    o_write_dataM : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);

    -- propagating
    i_RdE : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    o_RdM : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
    
    o_RdE : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);

    -- hazard unit registers input--> outputs 
    i_RsE : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    i_RtE : IN STD_LOGIC_VECTOR (4 DOWNTO 0);

    o_RsE : OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
    o_RtE : OUT STD_LOGIC_VECTOR (4 DOWNTO 0)
    );

  END COMPONENT execut_stage;

  COMPONENT meomry_stage IS
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
      i_RdM : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
      o_RdW : OUT STD_LOGIC_VECTOR (4 DOWNTO 0)
    );

  END COMPONENT meomry_stage;

  COMPONENT writeback_stage IS
    PORT (

      -- input signals
      i_alu_outW : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      i_read_dataW : IN STD_LOGIC_VECTOR (31 DOWNTO 0);

      -- mux control signal
      i_mem_2_regW : IN STD_LOGIC;

      -- output signal 
      o_resultW : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
    );
  END COMPONENT writeback_stage;

  COMPONENT hazard_unit IS
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

  END COMPONENT hazard_unit;

  SIGNAL s_stallF_HF : STD_LOGIC := '0';
  SIGNAL s_stallD_HF : STD_LOGIC := '0';
  SIGNAL s_jump_en_DF : STD_LOGIC := '0';
  SIGNAL s_branch_DF : STD_LOGIC := '0';
  SIGNAL s_pc_new_DF : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
  SIGNAL s_instFD : STD_LOGIC_VECTOR (31 DOWNTO 0);

  SIGNAL s_reg_write_DE : STD_LOGIC := '0';
  SIGNAL s_mem_2_reg_DE : STD_LOGIC := '0';
  SIGNAL s_mem_write_DE : STD_LOGIC := '0';
  SIGNAL s_alu_src_DE : STD_LOGIC := '0';
  SIGNAL s_alu_control_DE : STD_LOGIC_VECTOR (1 DOWNTO 0) := (OTHERS => '0');
  SIGNAL s_rf_rd1_DE : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL s_rf_rd2_DE : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL s_Rs_DE : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL s_Rt_DE : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL s_Rd_DE : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL s_sign_ext_DE : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL s_Rd_WD : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL s_resultW : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL s_alu_outM : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL s_RsD_DH : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL s_RtD_DH : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL s_forwardAD_HD : STD_LOGIC := '0';
  SIGNAL s_forwardBD_HD : STD_LOGIC := '0';
  SIGNAL s_flushE_HD : STD_LOGIC := '0';

  SIGNAL s_flushE_HE : STD_LOGIC := '0';
  SIGNAL s_reg_write_EM : STD_LOGIC := '0';
  SIGNAL s_mem_2_reg_EM : STD_LOGIC := '0';
  SIGNAL s_mem_write_EM : STD_LOGIC := '0';
  SIGNAL s_forwardAD_HE : STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
  SIGNAL s_forwardBD_HE : STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
  SIGNAL s_write_data_EM : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL s_RsD_EH : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL s_RtD_EH : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL s_Rd_EM : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL s_Rd_EH : STD_LOGIC_VECTOR (4 DOWNTO 0);
  SIGNAL s_alu_out_EM : STD_LOGIC_VECTOR (31 DOWNTO 0);

  SIGNAL s_reg_write_WD : STD_LOGIC := '0';
  SIGNAL s_mem_2_reg_MW : STD_LOGIC := '0';
  SIGNAL s_read_data_MW : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL s_alu_out_MW : STD_LOGIC_VECTOR (31 DOWNTO 0);

BEGIN

  m_fs : fetch_stage
  PORT MAP(
    i_clk => i_clk,
    i_rst => i_rst,
    i_stallF => s_stallF_Hf,
    i_stallD => s_stallD_HF,
    i_jump_enD => s_jump_en_DF,
    i_branchD => s_branch_DF,
    i_pc_newD => s_pc_new_DF,
    o_instD => s_instFD
  );

  m_ds : decode_stage
  PORT MAP(
    i_clk => i_clk,
    i_rst => i_rst,
    i_instD => s_instFD,
    o_reg_writeE => s_reg_write_DE,
    o_mem_2_regE => s_mem_2_reg_DE,
    o_mem_writeE => s_mem_write_DE,
    o_alu_srcE => s_alu_src_DE,
    o_alu_controlE => s_alu_control_DE,
    o_rf_rd1E => s_rf_rd1_DE,
    o_rf_rd2E => s_rf_rd2_DE,
    i_reg_writeW => s_reg_write_WD,
    o_RsE => s_Rs_DE,
    o_RtE => s_Rt_DE,
    o_RdE => s_Rd_DE,
    o_sign_extE => s_sign_ext_DE,
    i_RdW => s_Rd_WD,
    i_resultW => s_resultW,
    i_alu_outM => s_alu_outM,
    o_pc_branch => s_pc_new_DF,
    o_branchD => s_branch_DF,
    o_jumpD => s_jump_en_DF,
    o_RsD => s_RsD_DH,
    o_RtD => s_RtD_DH,
    i_forwardAD => s_forwardAD_HD,
    i_forwardBD => s_forwardBD_HD,
    i_flushE => s_flushE_HD
  );

  m_es : execut_stage
  PORT MAP(
    i_clk => i_clk,
    i_rst => i_rst,
    i_clr => s_flushE_HE,
    i_rf_rd1E => s_rf_rd1_DE,
    i_rf_rd2E => s_rf_rd2_DE,
    i_sign_extE => s_sign_ext_DE,
    i_alu_outM => s_alu_outM,
    i_resultW => s_resultW,
    i_alu_ctrlE => s_alu_control_DE,
    i_alu_srcE => s_alu_src_DE,
    i_reg_writeE => s_reg_write_DE,
    o_reg_writeM => s_reg_write_EM,
    i_mem_2_regE => s_mem_2_reg_DE,
    o_mem_2_regM => s_mem_2_reg_EM,
    i_mem_writeE => s_mem_write_DE,
    o_mem_writeM => s_mem_write_EM,
    i_forwardAE => s_forwardAD_HE,
    i_forwardBE => s_forwardBD_HE,
    o_alu_outM => s_alu_out_EM,
    o_write_dataM => s_write_data_EM,
    i_RdE => s_Rd_DE,
    o_RdM => s_Rd_EM,
    o_RdE => s_Rd_EH,
    i_RsE => s_Rs_DE,
    i_RtE => s_Rt_DE,
    o_RsE => s_RsD_EH,
    o_RtE => s_RtD_EH
  );

  m_ms : meomry_stage
  PORT MAP(
    i_clk => i_clk,
    i_rst => i_rst,
    i_alu_outM => s_alu_out_EM,
    i_write_dataM => s_write_data_EM,
    i_reg_writeM => s_reg_write_EM,
    o_reg_writeW => s_reg_write_WD,
    i_mem_2_regM => s_mem_2_reg_EM,
    o_mem_2_regW => s_mem_2_reg_MW,
    i_mem_writeM => s_mem_write_EM,
    o_alu_outW => s_alu_out_MW,
    o_alu_outM => s_alu_outM,
    o_read_dataW => s_read_data_MW,
    i_RdM => s_Rd_EM,
    o_RdW => s_Rd_WD
  );

  m_ws : writeback_stage
  PORT MAP(
    i_alu_outW => s_alu_out_MW,
    i_read_dataW => s_read_data_MW,
    i_mem_2_regW => s_mem_2_reg_MW,
    o_resultW => s_resultW
  );

  m_hu : hazard_unit
  PORT MAP(
    o_stallF => s_stallF_HF,
    o_stallD => s_stallD_HF,
    i_RsD => s_RsD_DH,
    i_RtD => s_RtD_DH,
    i_branchD => s_branch_DF,
    o_forwardAD => s_forwardAD_HD,
    o_forwardBD => s_forwardBD_HD,
    o_flushE => s_flushE_HD,
    i_RsE => s_RsD_EH,
    i_RtE => s_RtD_EH,
    i_RdE => s_Rd_EH, 
    i_mem_2_regE => s_mem_2_reg_DE,
    i_reg_writeE => s_reg_write_DE,
    o_forwardAE => s_forwardAD_HE,
    o_forwardBE => s_forwardBD_HE,
    i_mem_2_regM => s_mem_2_reg_EM,
    i_reg_writeM => s_reg_write_EM,
    i_reg_writeW => s_reg_write_WD, 
    i_RdM => s_Rd_EM,
    i_RdW => s_Rd_WD
  );
END ARCHITECTURE structural;