LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY fetch_stage IS
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

END fetch_stage;

ARCHITECTURE structural OF fetch_stage IS

  COMPONENT generic_reg IS
    GENERIC (w : INTEGER);
    PORT (
      i_clk : IN STD_LOGIC;
      i_rst : IN STD_LOGIC;
      i_nEN : IN STD_LOGIC;
      i_d : IN STD_LOGIC_VECTOR(w - 1 DOWNTO 0);
      o_q : OUT STD_LOGIC_VECTOR(w - 1 DOWNTO 0));
  END COMPONENT;

  COMPONENT MUX2X1 IS
    GENERIC (width : INTEGER);
    PORT (
      i_in0, i_in1 : IN STD_LOGIC_VECTOR (width - 1 DOWNTO 0);
      i_sel : IN STD_LOGIC;
      o_out : OUT STD_LOGIC_VECTOR (width - 1 DOWNTO 0)
    );

  END COMPONENT;

  COMPONENT adder IS
    PORT (
      i_a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      i_b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      o_sum : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );

  END COMPONENT;

  COMPONENT imem IS
    PORT (
      i_rst : IN STD_LOGIC;
      i_a : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      o_inst : OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
  END COMPONENT;

  COMPONENT pipe_reg_FD IS
    PORT (
      i_clk : IN STD_LOGIC;
      i_rst : IN STD_LOGIC;
      i_clr : IN STD_LOGIC;

      i_nEN : IN STD_LOGIC;

      i_instF : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
      o_instD : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
    );
  END COMPONENT;

  SIGNAL s_mux1_res : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL s_pc_next : STD_LOGIC_VECTOR (31 DOWNTO 0);
  SIGNAL s_pc : STD_LOGIC_VECTOR (31 DOWNTO 0) := (OTHERS => '0');
  SIGNAL s_instF : STD_LOGIC_VECTOR (31 DOWNTO 0) := (OTHERS => '0');
  SIGNAL s_pc_plus4 : STD_LOGIC_VECTOR (31 DOWNTO 0) := (OTHERS => '0');
  SIGNAL s_clr_pip_reg : STD_LOGIC := '0';
BEGIN

  s_clr_pip_reg <= i_jump_enD OR i_branchD;

  m_pc_reg : generic_reg
  GENERIC MAP(32)
  PORT MAP(
    i_clk => i_clk,
    i_rst => i_rst,
    i_nEN => i_stallF,
    i_d => s_pc_next,
    o_q => s_pc
  );

  m_imem : imem
  PORT MAP(
    i_rst => i_rst,
    i_a => s_pc,
    o_inst => s_instF
  );

  m_adder : adder
  PORT MAP(
    i_a => s_pc,
    i_b => X"00000001",
    o_sum => s_pc_plus4
  );

  m_pc_mux1 : MUX2X1
  GENERIC MAP(32)
  PORT MAP(
    i_in0 => s_pc_plus4,
    i_in1 => i_pc_newD,
    i_sel => i_jump_enD,
    o_out => s_mux1_res
  );

  m_pc_mux2 : MUX2X1
  GENERIC MAP(32)
  PORT MAP(
    i_in0 => s_mux1_res,
    i_in1 => i_pc_newD,
    i_sel => i_branchD,
    o_out => s_pc_next
  );

  m_pip_reg : pipe_reg_FD
  PORT MAP(
    i_clk => i_clk,
    i_rst => i_rst,
    i_clr => s_clr_pip_reg,

    i_nEN => i_stallD,
    i_instF => s_instF,
    o_instD => o_instD
  );

END ARCHITECTURE structural;