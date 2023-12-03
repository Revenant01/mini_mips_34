LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY control_unit IS
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
END control_unit;

ARCHITECTURE RTL OF control_unit IS

BEGIN
  PROCESS (i_opcode, i_ir_indicator) BEGIN
    IF (i_rst = '1') THEN
      o_alu_control <= "XX"; -- XX
      o_reg_write <= '0';
      o_mem_write <= '0';
      o_lw_vs_imm <= 'X'; -- X
      o_jr_src <= 'X'; -- X
      o_alu_src <= 'X'; -- X
      o_mem_2_reg <= 'X'; -- X
      o_jump <= 'X'; -- X
      o_branch_en <= 'X'; -- X
      o_sw_en <= 'X'; -- X
    ELSE

      CASE i_opcode IS
        WHEN "0000000001" =>
          IF (i_ir_indicator(0) = '1') THEN -- ADDI
            o_alu_control <= "00";
            o_reg_write <= '1';
            o_mem_write <= '0';
            o_lw_vs_imm <= '1';
            o_jr_src <= '0';
            o_alu_src <= '1';
            o_mem_2_reg <= '1';
            o_jump <= '0';
            o_branch_en <= '0';
            o_sw_en <= '0';
          ELSE --ADD
            o_alu_control <= "00";
            o_reg_write <= '1';
            o_mem_write <= '0';
            o_lw_vs_imm <= '1';
            o_jr_src <= '0';
            o_alu_src <= '0';
            o_mem_2_reg <= '1';
            o_jump <= '0';
            o_branch_en <= '0';
            o_sw_en <= '0';
          END IF;
        WHEN "0000000010" =>
          IF (i_ir_indicator(0) = '1') THEN -- SUBI
            o_alu_control <= "01";
            o_reg_write <= '1';
            o_mem_write <= '0';
            o_lw_vs_imm <= '1';
            o_jr_src <= '0';
            o_alu_src <= '1';
            o_mem_2_reg <= '1';
            o_jump <= '0';
            o_branch_en <= '0';
            o_sw_en <= '0';
          ELSE --SUB
            o_alu_control <= "01";
            o_reg_write <= '1';
            o_mem_write <= '0';
            o_lw_vs_imm <= '1';
            o_jr_src <= '0';
            o_alu_src <= '0';
            o_mem_2_reg <= '1';
            o_jump <= '0';
            o_branch_en <= '0';
            o_sw_en <= '0';
          END IF;
        WHEN "0000001000" => --AND
          o_alu_control <= "10";
          o_reg_write <= '1';
          o_mem_write <= '0';
          o_lw_vs_imm <= '1';
          o_jr_src <= '0';
          o_alu_src <= '0';
          o_mem_2_reg <= '1';
          o_jump <= '0';
          o_branch_en <= '0';
          o_sw_en <= '0';
        WHEN "0000010000" => --OR
          o_alu_control <= "11";
          o_reg_write <= '1';
          o_mem_write <= '0';
          o_lw_vs_imm <= '1';
          o_jr_src <= '0';
          o_alu_src <= '0';
          o_mem_2_reg <= '1';
          o_jump <= '0';
          o_branch_en <= '0';
          o_sw_en <= '0';
        WHEN "0000100000" => --LW
          o_alu_control <= "00";
          o_reg_write <= '1';
          o_mem_write <= '0';
          o_lw_vs_imm <= '0';
          o_jr_src <= '0';
          o_alu_src <= '1';
          o_mem_2_reg <= '0';
          o_jump <= '0';
          o_branch_en <= '0';
          o_sw_en <= '0';
        WHEN "0001000000" => --SW
          o_alu_control <= "00";
          o_reg_write <= '0';
          o_mem_write <= '1';
          o_lw_vs_imm <= '0';
          o_jr_src <= '0';
          o_alu_src <= '1';
          o_mem_2_reg <= 'X'; -- X
          o_jump <= '0';
          o_branch_en <= '0';
          o_sw_en <= '1';
        WHEN "0010000000" => --JR
          o_alu_control <= "XX"; -- XX
          o_reg_write <= '0';
          o_mem_write <= '0';
          o_lw_vs_imm <= '0'; -- X
          o_jr_src <= '1';
          o_alu_src <= 'X'; -- X
          o_mem_2_reg <= 'X'; -- X
          o_jump <= '1';
          o_branch_en <= '0';
          o_sw_en <= '0';
        WHEN "0100000000" => --BEQZ
          o_alu_control <= "XX"; -- XX
          o_reg_write <= '0';
          o_mem_write <= '0';
          o_lw_vs_imm <= '0'; -- X
          o_jr_src <= '1'; -- X
          o_alu_src <= 'X'; -- X
          o_mem_2_reg <= 'X'; -- X
          o_jump <= '0'; -- X
          o_branch_en <= '1';
          o_sw_en <= '0';

        WHEN OTHERS =>
          o_alu_control <= "XX"; -- XX
          o_reg_write <= '0';
          o_mem_write <= '0';
          o_lw_vs_imm <= 'X'; -- X
          o_jr_src <= 'X'; -- X
          o_alu_src <= 'X'; -- X
          o_mem_2_reg <= 'X'; -- X
          o_jump <= 'X'; -- X
          o_branch_en <= 'X'; -- X
          o_sw_en <= 'X'; -- X

      END CASE;
    END IF;
  END PROCESS;
END ARCHITECTURE RTL;