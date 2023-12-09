LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164;
ENTITY decode_stage IS
  PORT (
    i_clk : IN STD_LOGIC;
    i_rst : IN STD_LOGIC;

    i_instD : IN STD_LOGIC_VECTOR (31 DOWNTO 0);

    -- control signals 
    o_reg_writeE : OUT STD_LOGIC;
    o_mem_2_regE : OUT STD_LOGIC;
    o_mem_writeE : OUT STD_LOGIC;
    o_alu_srcE : OUT STD_LOGIC;
    o_alu_control : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
    o_rf_rd1E : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    o_rf_rd2E : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
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
  );

END decode_stage;

ARCHITECTURE structural OF decode_stage IS
  COMPONENT adder IS
    PORT (
      i_a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      i_b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      o_sum : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT control_unit IS
    PORT (
      i_rst : IN STD_LOGIC;
      i_opcode : IN STD_LOGIC_VECTOR (9 DOWNTO 0);
      i_ir_indicator : IN STD_LOGIC_VECTOR (6 DOWNTO 0);
      o_reg_write : OUT STD_LOGIC;
      o_mem_write : OUT STD_LOGIC;
      o_alu_control : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
      o_mem_2_reg : OUT STD_LOGIC;
      o_alu_src : OUT STD_LOGIC;
      o_branch_en : OUT STD_LOGIC;
      o_jump : OUT STD_LOGIC;
      o_sw_en : OUT STD_LOGIC;
      o_jr_src : OUT STD_LOGIC;
      o_lw_vs_imm : OUT STD_LOGIC
    );
  END COMPONENT;

  COMPONENT MUX2X1 IS
    GENERIC (width : INTEGER);
    PORT (
      i_in0, i_in1 : IN STD_LOGIC_VECTOR (width - 1 DOWNTO 0);
      i_sel : IN STD_LOGIC;
      o_out : OUT STD_LOGIC_VECTOR (width - 1 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT sign_extend IS
    PORT (
      i_in5 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      o_out32 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT reg_file IS -- three-port register file
    PORT (
      i_clk : IN STD_LOGIC;
      i_rst : IN STD_LOGIC;
      i_we3 : IN STD_LOGIC;
      i_ra1, i_ra2, i_wa3 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      i_wd3 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      o_rd1 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      b_rd2 : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT pip_regDE IS PORT (

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
  END COMPONENT;

BEGIN

END ARCHITECTURE structural;