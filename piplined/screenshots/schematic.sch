# File saved with Nlview 7.0r6  2020-01-29 bk=1.5227 VDI=41 GEI=36 GUI=JA:9.0 non-TLS-threadsafe
# 
# non-default properties - (restore without -noprops)
property attrcolor #000000
property attrfontsize 8
property autobundle 1
property backgroundcolor #ffffff
property boxcolor0 #000000
property boxcolor1 #000000
property boxcolor2 #000000
property boxinstcolor #000000
property boxpincolor #000000
property buscolor #008000
property closeenough 5
property createnetattrdsp 2048
property decorate 1
property elidetext 40
property fillcolor1 #ffffcc
property fillcolor2 #dfebf8
property fillcolor3 #f0f0f0
property gatecellname 2
property instattrmax 30
property instdrag 15
property instorder 1
property marksize 12
property maxfontsize 12
property maxzoom 5
property netcolor #19b400
property objecthighlight0 #ff00ff
property objecthighlight1 #ffff00
property objecthighlight2 #00ff00
property objecthighlight3 #ff6666
property objecthighlight4 #0000ff
property objecthighlight5 #ffc800
property objecthighlight7 #00ffff
property objecthighlight8 #ff00ff
property objecthighlight9 #ccccff
property objecthighlight10 #0ead00
property objecthighlight11 #cefc00
property objecthighlight12 #9e2dbe
property objecthighlight13 #ba6a29
property objecthighlight14 #fc0188
property objecthighlight15 #02f990
property objecthighlight16 #f1b0fb
property objecthighlight17 #fec004
property objecthighlight18 #149bff
property objecthighlight19 #eb591b
property overlapcolor #19b400
property pbuscolor #000000
property pbusnamecolor #000000
property pinattrmax 20
property pinorder 2
property pinpermute 0
property portcolor #000000
property portnamecolor #000000
property ripindexfontsize 8
property rippercolor #000000
property rubberbandcolor #000000
property rubberbandfontsize 12
property selectattr 0
property selectionappearance 2
property selectioncolor #0000ff
property sheetheight 44
property sheetwidth 68
property showmarks 1
property shownetname 0
property showpagenumbers 1
property showripindex 4
property timelimit 1
#
module new mips work:mips:NOFILE -nosplit
load symbol decode_stage work:decode_stage:NOFILE HIERBOX pin i_clk input.left pin i_flushE input.left pin i_forwardAD input.left pin i_forwardBD input.left pin i_reg_writeW input.left pin i_rst input.left pin o_alu_srcE output.right pin o_branchD output.right pin o_jumpD output.right pin o_mem_2_regE output.right pin o_mem_writeE output.right pin o_reg_writeE output.right pinBus i_RdW input.left [4:0] pinBus i_alu_outM input.left [31:0] pinBus i_instD input.left [31:0] pinBus i_resultW input.left [31:0] pinBus o_RdE output.right [4:0] pinBus o_RsD output.right [4:0] pinBus o_RsE output.right [4:0] pinBus o_RtD output.right [4:0] pinBus o_RtE output.right [4:0] pinBus o_alu_controlE output.right [1:0] pinBus o_pc_branch output.right [31:0] pinBus o_rf_rd1E output.right [31:0] pinBus o_rf_rd2E output.right [31:0] pinBus o_sign_extE output.right [31:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol execut_stage work:execut_stage:NOFILE HIERBOX pin i_alu_srcE input.left pin i_clk input.left pin i_clr input.left pin i_mem_2_regE input.left pin i_mem_writeE input.left pin i_reg_writeE input.left pin i_rst input.left pin o_mem_2_regM output.right pin o_mem_writeM output.right pin o_reg_writeM output.right pinBus i_RdE input.left [4:0] pinBus i_RsE input.left [4:0] pinBus i_RtE input.left [4:0] pinBus i_alu_ctrlE input.left [1:0] pinBus i_alu_outM input.left [31:0] pinBus i_forwardAE input.left [1:0] pinBus i_forwardBE input.left [1:0] pinBus i_resultW input.left [31:0] pinBus i_rf_rd1E input.left [31:0] pinBus i_rf_rd2E input.left [31:0] pinBus i_sign_extE input.left [31:0] pinBus o_RdE output.right [4:0] pinBus o_RdM output.right [4:0] pinBus o_RsE output.right [4:0] pinBus o_RtE output.right [4:0] pinBus o_alu_outM output.right [31:0] pinBus o_write_dataM output.right [31:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol fetch_stage work:fetch_stage:NOFILE HIERBOX pin i_branchD input.left pin i_clk input.left pin i_jump_enD input.left pin i_rst input.left pin i_stallD input.left pin i_stallF input.left pinBus i_pc_newD input.left [31:0] pinBus o_instD output.right [31:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol hazard_unit work:hazard_unit:NOFILE HIERBOX pin i_branchD input.left pin i_mem_2_regE input.left pin i_mem_2_regM input.left pin i_reg_writeE input.left pin i_reg_writeM input.left pin i_reg_writeW input.left pin i_rst input.left pin o_flushE output.right pin o_forwardAD output.right pin o_forwardBD output.right pin o_stallD output.right pin o_stallF output.right pinBus i_RdE input.left [4:0] pinBus i_RdM input.left [4:0] pinBus i_RdW input.left [4:0] pinBus i_RsD input.left [4:0] pinBus i_RsE input.left [4:0] pinBus i_RtD input.left [4:0] pinBus i_RtE input.left [4:0] pinBus o_forwardAE output.right [1:0] pinBus o_forwardBE output.right [1:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol meomry_stage work:meomry_stage:NOFILE HIERBOX pin i_clk input.left pin i_mem_2_regM input.left pin i_mem_writeM input.left pin i_reg_writeM input.left pin i_rst input.left pin o_mem_2_regW output.right pin o_reg_writeW output.right pinBus i_RdM input.left [4:0] pinBus i_alu_outM input.left [31:0] pinBus i_write_dataM input.left [31:0] pinBus o_RdW output.right [4:0] pinBus o_alu_outM output.right [31:0] pinBus o_alu_outW output.right [31:0] pinBus o_read_dataW output.right [31:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol writeback_stage work:writeback_stage:NOFILE HIERBOX pin i_mem_2_regW input.left pinBus i_alu_outW input.left [31:0] pinBus i_read_dataW input.left [31:0] pinBus o_resultW output.right [31:0] boxcolor 1 fillcolor 2 minwidth 13%
load port i_clk input -pg 1 -lvl 0 -x 0 -y 670
load port i_rst input -pg 1 -lvl 0 -x 0 -y 690
load inst m_ds decode_stage work:decode_stage:NOFILE -autohide -attr @cell(#000000) decode_stage -pinBusAttr i_RdW @name i_RdW[4:0] -pinBusAttr i_alu_outM @name i_alu_outM[31:0] -pinBusAttr i_instD @name i_instD[31:0] -pinBusAttr i_resultW @name i_resultW[31:0] -pinBusAttr o_RdE @name o_RdE[4:0] -pinBusAttr o_RsD @name o_RsD[4:0] -pinBusAttr o_RsE @name o_RsE[4:0] -pinBusAttr o_RtD @name o_RtD[4:0] -pinBusAttr o_RtE @name o_RtE[4:0] -pinBusAttr o_alu_controlE @name o_alu_controlE[1:0] -pinBusAttr o_pc_branch @name o_pc_branch[31:0] -pinBusAttr o_rf_rd1E @name o_rf_rd1E[31:0] -pinBusAttr o_rf_rd2E @name o_rf_rd2E[31:0] -pinBusAttr o_sign_extE @name o_sign_extE[31:0] -pg 1 -lvl 6 -x 2930 -y 640
load inst m_es execut_stage work:execut_stage:NOFILE -autohide -attr @cell(#000000) execut_stage -pinBusAttr i_RdE @name i_RdE[4:0] -pinBusAttr i_RsE @name i_RsE[4:0] -pinBusAttr i_RtE @name i_RtE[4:0] -pinBusAttr i_alu_ctrlE @name i_alu_ctrlE[1:0] -pinBusAttr i_alu_outM @name i_alu_outM[31:0] -pinBusAttr i_forwardAE @name i_forwardAE[1:0] -pinBusAttr i_forwardBE @name i_forwardBE[1:0] -pinBusAttr i_resultW @name i_resultW[31:0] -pinBusAttr i_rf_rd1E @name i_rf_rd1E[31:0] -pinBusAttr i_rf_rd2E @name i_rf_rd2E[31:0] -pinBusAttr i_sign_extE @name i_sign_extE[31:0] -pinBusAttr o_RdE @name o_RdE[4:0] -pinBusAttr o_RdM @name o_RdM[4:0] -pinBusAttr o_RsE @name o_RsE[4:0] -pinBusAttr o_RtE @name o_RtE[4:0] -pinBusAttr o_alu_outM @name o_alu_outM[31:0] -pinBusAttr o_write_dataM @name o_write_dataM[31:0] -pg 1 -lvl 3 -x 1340 -y 140
load inst m_fs fetch_stage work:fetch_stage:NOFILE -autohide -attr @cell(#000000) fetch_stage -pinBusAttr i_pc_newD @name i_pc_newD[31:0] -pinBusAttr o_instD @name o_instD[31:0] -pg 1 -lvl 5 -x 2550 -y 500
load inst m_hu hazard_unit work:hazard_unit:NOFILE -autohide -attr @cell(#000000) hazard_unit -pinBusAttr i_RdE @name i_RdE[4:0] -pinBusAttr i_RdM @name i_RdM[4:0] -pinBusAttr i_RdW @name i_RdW[4:0] -pinBusAttr i_RsD @name i_RsD[4:0] -pinBusAttr i_RsE @name i_RsE[4:0] -pinBusAttr i_RtD @name i_RtD[4:0] -pinBusAttr i_RtE @name i_RtE[4:0] -pinBusAttr o_forwardAE @name o_forwardAE[1:0] -pinBusAttr o_forwardBE @name o_forwardBE[1:0] -pg 1 -lvl 4 -x 1950 -y 380
load inst m_ms meomry_stage work:meomry_stage:NOFILE -autohide -attr @cell(#000000) meomry_stage -pinBusAttr i_RdM @name i_RdM[4:0] -pinBusAttr i_alu_outM @name i_alu_outM[31:0] -pinBusAttr i_write_dataM @name i_write_dataM[31:0] -pinBusAttr o_RdW @name o_RdW[4:0] -pinBusAttr o_alu_outM @name o_alu_outM[31:0] -pinBusAttr o_alu_outW @name o_alu_outW[31:0] -pinBusAttr o_read_dataW @name o_read_dataW[31:0] -pg 1 -lvl 1 -x 240 -y 620
load inst m_ws writeback_stage work:writeback_stage:NOFILE -autohide -attr @cell(#000000) writeback_stage -pinBusAttr i_alu_outW @name i_alu_outW[31:0] -pinBusAttr i_read_dataW @name i_read_dataW[31:0] -pinBusAttr o_resultW @name o_resultW[31:0] -pg 1 -lvl 2 -x 690 -y 780
load net <const0> -ground -pin m_es i_clr
load net i_clk -port i_clk -pin m_ds i_clk -pin m_es i_clk -pin m_fs i_clk -pin m_ms i_clk
netloc i_clk 1 0 6 20 810 530J 710 870 750 NJ 750 2360 750 NJ
load net i_rst -port i_rst -pin m_ds i_rst -pin m_es i_rst -pin m_fs i_rst -pin m_hu i_rst -pin m_ms i_rst
netloc i_rst 1 0 6 40 530 NJ 530 1030 610 1670 710 2140 890 NJ
load net o_alu_controlE[0] -attr @rip o_alu_controlE[0] -pin m_ds o_alu_controlE[0] -pin m_es i_alu_ctrlE[0]
load net o_alu_controlE[1] -attr @rip o_alu_controlE[1] -pin m_ds o_alu_controlE[1] -pin m_es i_alu_ctrlE[1]
load net o_alu_srcE -pin m_ds o_alu_srcE -pin m_es i_alu_srcE
netloc o_alu_srcE 1 2 5 1150 30 NJ 30 NJ 30 NJ 30 3250
load net o_branchD -pin m_ds o_branchD -pin m_fs i_branchD -pin m_hu i_branchD
netloc o_branchD 1 3 4 1830 690 2220 430 NJ 430 3230
load net o_flushE -pin m_ds i_flushE -pin m_hu o_flushE
netloc o_flushE 1 4 2 2260 770 NJ
load net o_forwardAD -pin m_ds i_forwardAD -pin m_hu o_forwardAD
netloc o_forwardAD 1 4 2 2320 790 NJ
load net o_forwardAE[0] -attr @rip o_forwardAE[0] -pin m_es i_forwardAE[0] -pin m_hu o_forwardAE[0]
load net o_forwardAE[1] -attr @rip o_forwardAE[1] -pin m_es i_forwardAE[1] -pin m_hu o_forwardAE[1]
load net o_forwardBD -pin m_ds i_forwardBD -pin m_hu o_forwardBD
netloc o_forwardBD 1 4 2 2180 810 NJ
load net o_forwardBE[0] -attr @rip o_forwardBE[0] -pin m_es i_forwardBE[0] -pin m_hu o_forwardBE[0]
load net o_forwardBE[1] -attr @rip o_forwardBE[1] -pin m_es i_forwardBE[1] -pin m_hu o_forwardBE[1]
load net o_jumpD -pin m_ds o_jumpD -pin m_fs i_jump_enD
netloc o_jumpD 1 4 3 2400 990 NJ 990 3250
load net o_mem_2_regE -pin m_ds o_mem_2_regE -pin m_es i_mem_2_regE -pin m_hu i_mem_2_regE
netloc o_mem_2_regE 1 2 5 1170 570 1630 1010 NJ 1010 NJ 1010 3230
load net o_mem_2_regM -pin m_es o_mem_2_regM -pin m_hu i_mem_2_regM -pin m_ms i_mem_2_regM
netloc o_mem_2_regM 1 0 4 100 570 NJ 570 950J 650 1650
load net o_mem_2_regW -pin m_ms o_mem_2_regW -pin m_ws i_mem_2_regW
netloc o_mem_2_regW 1 1 1 510 710n
load net o_mem_writeE -pin m_ds o_mem_writeE -pin m_es i_mem_writeE
netloc o_mem_writeE 1 2 5 1170 90 NJ 90 NJ 90 NJ 90 3290
load net o_mem_writeM -pin m_es o_mem_writeM -pin m_ms i_mem_writeM
netloc o_mem_writeM 1 0 4 80 550 NJ 550 990J 630 1550
load net o_pc_branch[0] -attr @rip o_pc_branch[0] -pin m_ds o_pc_branch[0] -pin m_fs i_pc_newD[0]
load net o_pc_branch[10] -attr @rip o_pc_branch[10] -pin m_ds o_pc_branch[10] -pin m_fs i_pc_newD[10]
load net o_pc_branch[11] -attr @rip o_pc_branch[11] -pin m_ds o_pc_branch[11] -pin m_fs i_pc_newD[11]
load net o_pc_branch[12] -attr @rip o_pc_branch[12] -pin m_ds o_pc_branch[12] -pin m_fs i_pc_newD[12]
load net o_pc_branch[13] -attr @rip o_pc_branch[13] -pin m_ds o_pc_branch[13] -pin m_fs i_pc_newD[13]
load net o_pc_branch[14] -attr @rip o_pc_branch[14] -pin m_ds o_pc_branch[14] -pin m_fs i_pc_newD[14]
load net o_pc_branch[15] -attr @rip o_pc_branch[15] -pin m_ds o_pc_branch[15] -pin m_fs i_pc_newD[15]
load net o_pc_branch[16] -attr @rip o_pc_branch[16] -pin m_ds o_pc_branch[16] -pin m_fs i_pc_newD[16]
load net o_pc_branch[17] -attr @rip o_pc_branch[17] -pin m_ds o_pc_branch[17] -pin m_fs i_pc_newD[17]
load net o_pc_branch[18] -attr @rip o_pc_branch[18] -pin m_ds o_pc_branch[18] -pin m_fs i_pc_newD[18]
load net o_pc_branch[19] -attr @rip o_pc_branch[19] -pin m_ds o_pc_branch[19] -pin m_fs i_pc_newD[19]
load net o_pc_branch[1] -attr @rip o_pc_branch[1] -pin m_ds o_pc_branch[1] -pin m_fs i_pc_newD[1]
load net o_pc_branch[20] -attr @rip o_pc_branch[20] -pin m_ds o_pc_branch[20] -pin m_fs i_pc_newD[20]
load net o_pc_branch[21] -attr @rip o_pc_branch[21] -pin m_ds o_pc_branch[21] -pin m_fs i_pc_newD[21]
load net o_pc_branch[22] -attr @rip o_pc_branch[22] -pin m_ds o_pc_branch[22] -pin m_fs i_pc_newD[22]
load net o_pc_branch[23] -attr @rip o_pc_branch[23] -pin m_ds o_pc_branch[23] -pin m_fs i_pc_newD[23]
load net o_pc_branch[24] -attr @rip o_pc_branch[24] -pin m_ds o_pc_branch[24] -pin m_fs i_pc_newD[24]
load net o_pc_branch[25] -attr @rip o_pc_branch[25] -pin m_ds o_pc_branch[25] -pin m_fs i_pc_newD[25]
load net o_pc_branch[26] -attr @rip o_pc_branch[26] -pin m_ds o_pc_branch[26] -pin m_fs i_pc_newD[26]
load net o_pc_branch[27] -attr @rip o_pc_branch[27] -pin m_ds o_pc_branch[27] -pin m_fs i_pc_newD[27]
load net o_pc_branch[28] -attr @rip o_pc_branch[28] -pin m_ds o_pc_branch[28] -pin m_fs i_pc_newD[28]
load net o_pc_branch[29] -attr @rip o_pc_branch[29] -pin m_ds o_pc_branch[29] -pin m_fs i_pc_newD[29]
load net o_pc_branch[2] -attr @rip o_pc_branch[2] -pin m_ds o_pc_branch[2] -pin m_fs i_pc_newD[2]
load net o_pc_branch[30] -attr @rip o_pc_branch[30] -pin m_ds o_pc_branch[30] -pin m_fs i_pc_newD[30]
load net o_pc_branch[31] -attr @rip o_pc_branch[31] -pin m_ds o_pc_branch[31] -pin m_fs i_pc_newD[31]
load net o_pc_branch[3] -attr @rip o_pc_branch[3] -pin m_ds o_pc_branch[3] -pin m_fs i_pc_newD[3]
load net o_pc_branch[4] -attr @rip o_pc_branch[4] -pin m_ds o_pc_branch[4] -pin m_fs i_pc_newD[4]
load net o_pc_branch[5] -attr @rip o_pc_branch[5] -pin m_ds o_pc_branch[5] -pin m_fs i_pc_newD[5]
load net o_pc_branch[6] -attr @rip o_pc_branch[6] -pin m_ds o_pc_branch[6] -pin m_fs i_pc_newD[6]
load net o_pc_branch[7] -attr @rip o_pc_branch[7] -pin m_ds o_pc_branch[7] -pin m_fs i_pc_newD[7]
load net o_pc_branch[8] -attr @rip o_pc_branch[8] -pin m_ds o_pc_branch[8] -pin m_fs i_pc_newD[8]
load net o_pc_branch[9] -attr @rip o_pc_branch[9] -pin m_ds o_pc_branch[9] -pin m_fs i_pc_newD[9]
load net o_reg_writeE -pin m_ds o_reg_writeE -pin m_es i_reg_writeE -pin m_hu i_reg_writeE
netloc o_reg_writeE 1 2 5 1190 590 1710 1050 NJ 1050 NJ 1050 3190
load net o_reg_writeM -pin m_es o_reg_writeM -pin m_hu i_reg_writeM -pin m_ms i_reg_writeM
netloc o_reg_writeM 1 0 4 100 830 550J 730 890J 710 1690
load net o_reg_writeW -pin m_ds i_reg_writeW -pin m_hu i_reg_writeW -pin m_ms o_reg_writeW
netloc o_reg_writeW 1 1 5 490J 690 NJ 690 1810 850 NJ 850 NJ
load net o_stallD -pin m_fs i_stallD -pin m_hu o_stallD
netloc o_stallD 1 4 1 2340 550n
load net o_stallF -pin m_fs i_stallF -pin m_hu o_stallF
netloc o_stallF 1 4 1 2300 570n
load net s_Rd_DE[0] -attr @rip o_RdE[0] -pin m_ds o_RdE[0] -pin m_es i_RdE[0]
load net s_Rd_DE[1] -attr @rip o_RdE[1] -pin m_ds o_RdE[1] -pin m_es i_RdE[1]
load net s_Rd_DE[2] -attr @rip o_RdE[2] -pin m_ds o_RdE[2] -pin m_es i_RdE[2]
load net s_Rd_DE[3] -attr @rip o_RdE[3] -pin m_ds o_RdE[3] -pin m_es i_RdE[3]
load net s_Rd_DE[4] -attr @rip o_RdE[4] -pin m_ds o_RdE[4] -pin m_es i_RdE[4]
load net s_Rd_EH[0] -attr @rip o_RdE[0] -pin m_es o_RdE[0] -pin m_hu i_RdE[0]
load net s_Rd_EH[1] -attr @rip o_RdE[1] -pin m_es o_RdE[1] -pin m_hu i_RdE[1]
load net s_Rd_EH[2] -attr @rip o_RdE[2] -pin m_es o_RdE[2] -pin m_hu i_RdE[2]
load net s_Rd_EH[3] -attr @rip o_RdE[3] -pin m_es o_RdE[3] -pin m_hu i_RdE[3]
load net s_Rd_EH[4] -attr @rip o_RdE[4] -pin m_es o_RdE[4] -pin m_hu i_RdE[4]
load net s_Rd_EM[0] -attr @rip o_RdM[0] -pin m_es o_RdM[0] -pin m_hu i_RdM[0] -pin m_ms i_RdM[0]
load net s_Rd_EM[1] -attr @rip o_RdM[1] -pin m_es o_RdM[1] -pin m_hu i_RdM[1] -pin m_ms i_RdM[1]
load net s_Rd_EM[2] -attr @rip o_RdM[2] -pin m_es o_RdM[2] -pin m_hu i_RdM[2] -pin m_ms i_RdM[2]
load net s_Rd_EM[3] -attr @rip o_RdM[3] -pin m_es o_RdM[3] -pin m_hu i_RdM[3] -pin m_ms i_RdM[3]
load net s_Rd_EM[4] -attr @rip o_RdM[4] -pin m_es o_RdM[4] -pin m_hu i_RdM[4] -pin m_ms i_RdM[4]
load net s_Rd_WD[0] -attr @rip o_RdW[0] -pin m_ds i_RdW[0] -pin m_hu i_RdW[0] -pin m_ms o_RdW[0]
load net s_Rd_WD[1] -attr @rip o_RdW[1] -pin m_ds i_RdW[1] -pin m_hu i_RdW[1] -pin m_ms o_RdW[1]
load net s_Rd_WD[2] -attr @rip o_RdW[2] -pin m_ds i_RdW[2] -pin m_hu i_RdW[2] -pin m_ms o_RdW[2]
load net s_Rd_WD[3] -attr @rip o_RdW[3] -pin m_ds i_RdW[3] -pin m_hu i_RdW[3] -pin m_ms o_RdW[3]
load net s_Rd_WD[4] -attr @rip o_RdW[4] -pin m_ds i_RdW[4] -pin m_hu i_RdW[4] -pin m_ms o_RdW[4]
load net s_RsD_DH[0] -attr @rip o_RsD[0] -pin m_ds o_RsD[0] -pin m_hu i_RsD[0]
load net s_RsD_DH[1] -attr @rip o_RsD[1] -pin m_ds o_RsD[1] -pin m_hu i_RsD[1]
load net s_RsD_DH[2] -attr @rip o_RsD[2] -pin m_ds o_RsD[2] -pin m_hu i_RsD[2]
load net s_RsD_DH[3] -attr @rip o_RsD[3] -pin m_ds o_RsD[3] -pin m_hu i_RsD[3]
load net s_RsD_DH[4] -attr @rip o_RsD[4] -pin m_ds o_RsD[4] -pin m_hu i_RsD[4]
load net s_RsD_EH[0] -attr @rip o_RsE[0] -pin m_es o_RsE[0] -pin m_hu i_RsE[0]
load net s_RsD_EH[1] -attr @rip o_RsE[1] -pin m_es o_RsE[1] -pin m_hu i_RsE[1]
load net s_RsD_EH[2] -attr @rip o_RsE[2] -pin m_es o_RsE[2] -pin m_hu i_RsE[2]
load net s_RsD_EH[3] -attr @rip o_RsE[3] -pin m_es o_RsE[3] -pin m_hu i_RsE[3]
load net s_RsD_EH[4] -attr @rip o_RsE[4] -pin m_es o_RsE[4] -pin m_hu i_RsE[4]
load net s_Rs_DE[0] -attr @rip o_RsE[0] -pin m_ds o_RsE[0] -pin m_es i_RsE[0]
load net s_Rs_DE[1] -attr @rip o_RsE[1] -pin m_ds o_RsE[1] -pin m_es i_RsE[1]
load net s_Rs_DE[2] -attr @rip o_RsE[2] -pin m_ds o_RsE[2] -pin m_es i_RsE[2]
load net s_Rs_DE[3] -attr @rip o_RsE[3] -pin m_ds o_RsE[3] -pin m_es i_RsE[3]
load net s_Rs_DE[4] -attr @rip o_RsE[4] -pin m_ds o_RsE[4] -pin m_es i_RsE[4]
load net s_RtD_DH[0] -attr @rip o_RtD[0] -pin m_ds o_RtD[0] -pin m_hu i_RtD[0]
load net s_RtD_DH[1] -attr @rip o_RtD[1] -pin m_ds o_RtD[1] -pin m_hu i_RtD[1]
load net s_RtD_DH[2] -attr @rip o_RtD[2] -pin m_ds o_RtD[2] -pin m_hu i_RtD[2]
load net s_RtD_DH[3] -attr @rip o_RtD[3] -pin m_ds o_RtD[3] -pin m_hu i_RtD[3]
load net s_RtD_DH[4] -attr @rip o_RtD[4] -pin m_ds o_RtD[4] -pin m_hu i_RtD[4]
load net s_RtD_EH[0] -attr @rip o_RtE[0] -pin m_es o_RtE[0] -pin m_hu i_RtE[0]
load net s_RtD_EH[1] -attr @rip o_RtE[1] -pin m_es o_RtE[1] -pin m_hu i_RtE[1]
load net s_RtD_EH[2] -attr @rip o_RtE[2] -pin m_es o_RtE[2] -pin m_hu i_RtE[2]
load net s_RtD_EH[3] -attr @rip o_RtE[3] -pin m_es o_RtE[3] -pin m_hu i_RtE[3]
load net s_RtD_EH[4] -attr @rip o_RtE[4] -pin m_es o_RtE[4] -pin m_hu i_RtE[4]
load net s_Rt_DE[0] -attr @rip o_RtE[0] -pin m_ds o_RtE[0] -pin m_es i_RtE[0]
load net s_Rt_DE[1] -attr @rip o_RtE[1] -pin m_ds o_RtE[1] -pin m_es i_RtE[1]
load net s_Rt_DE[2] -attr @rip o_RtE[2] -pin m_ds o_RtE[2] -pin m_es i_RtE[2]
load net s_Rt_DE[3] -attr @rip o_RtE[3] -pin m_ds o_RtE[3] -pin m_es i_RtE[3]
load net s_Rt_DE[4] -attr @rip o_RtE[4] -pin m_ds o_RtE[4] -pin m_es i_RtE[4]
load net s_alu_outM[0] -attr @rip o_alu_outM[0] -pin m_ds i_alu_outM[0] -pin m_es i_alu_outM[0] -pin m_ms o_alu_outM[0]
load net s_alu_outM[10] -attr @rip o_alu_outM[10] -pin m_ds i_alu_outM[10] -pin m_es i_alu_outM[10] -pin m_ms o_alu_outM[10]
load net s_alu_outM[11] -attr @rip o_alu_outM[11] -pin m_ds i_alu_outM[11] -pin m_es i_alu_outM[11] -pin m_ms o_alu_outM[11]
load net s_alu_outM[12] -attr @rip o_alu_outM[12] -pin m_ds i_alu_outM[12] -pin m_es i_alu_outM[12] -pin m_ms o_alu_outM[12]
load net s_alu_outM[13] -attr @rip o_alu_outM[13] -pin m_ds i_alu_outM[13] -pin m_es i_alu_outM[13] -pin m_ms o_alu_outM[13]
load net s_alu_outM[14] -attr @rip o_alu_outM[14] -pin m_ds i_alu_outM[14] -pin m_es i_alu_outM[14] -pin m_ms o_alu_outM[14]
load net s_alu_outM[15] -attr @rip o_alu_outM[15] -pin m_ds i_alu_outM[15] -pin m_es i_alu_outM[15] -pin m_ms o_alu_outM[15]
load net s_alu_outM[16] -attr @rip o_alu_outM[16] -pin m_ds i_alu_outM[16] -pin m_es i_alu_outM[16] -pin m_ms o_alu_outM[16]
load net s_alu_outM[17] -attr @rip o_alu_outM[17] -pin m_ds i_alu_outM[17] -pin m_es i_alu_outM[17] -pin m_ms o_alu_outM[17]
load net s_alu_outM[18] -attr @rip o_alu_outM[18] -pin m_ds i_alu_outM[18] -pin m_es i_alu_outM[18] -pin m_ms o_alu_outM[18]
load net s_alu_outM[19] -attr @rip o_alu_outM[19] -pin m_ds i_alu_outM[19] -pin m_es i_alu_outM[19] -pin m_ms o_alu_outM[19]
load net s_alu_outM[1] -attr @rip o_alu_outM[1] -pin m_ds i_alu_outM[1] -pin m_es i_alu_outM[1] -pin m_ms o_alu_outM[1]
load net s_alu_outM[20] -attr @rip o_alu_outM[20] -pin m_ds i_alu_outM[20] -pin m_es i_alu_outM[20] -pin m_ms o_alu_outM[20]
load net s_alu_outM[21] -attr @rip o_alu_outM[21] -pin m_ds i_alu_outM[21] -pin m_es i_alu_outM[21] -pin m_ms o_alu_outM[21]
load net s_alu_outM[22] -attr @rip o_alu_outM[22] -pin m_ds i_alu_outM[22] -pin m_es i_alu_outM[22] -pin m_ms o_alu_outM[22]
load net s_alu_outM[23] -attr @rip o_alu_outM[23] -pin m_ds i_alu_outM[23] -pin m_es i_alu_outM[23] -pin m_ms o_alu_outM[23]
load net s_alu_outM[24] -attr @rip o_alu_outM[24] -pin m_ds i_alu_outM[24] -pin m_es i_alu_outM[24] -pin m_ms o_alu_outM[24]
load net s_alu_outM[25] -attr @rip o_alu_outM[25] -pin m_ds i_alu_outM[25] -pin m_es i_alu_outM[25] -pin m_ms o_alu_outM[25]
load net s_alu_outM[26] -attr @rip o_alu_outM[26] -pin m_ds i_alu_outM[26] -pin m_es i_alu_outM[26] -pin m_ms o_alu_outM[26]
load net s_alu_outM[27] -attr @rip o_alu_outM[27] -pin m_ds i_alu_outM[27] -pin m_es i_alu_outM[27] -pin m_ms o_alu_outM[27]
load net s_alu_outM[28] -attr @rip o_alu_outM[28] -pin m_ds i_alu_outM[28] -pin m_es i_alu_outM[28] -pin m_ms o_alu_outM[28]
load net s_alu_outM[29] -attr @rip o_alu_outM[29] -pin m_ds i_alu_outM[29] -pin m_es i_alu_outM[29] -pin m_ms o_alu_outM[29]
load net s_alu_outM[2] -attr @rip o_alu_outM[2] -pin m_ds i_alu_outM[2] -pin m_es i_alu_outM[2] -pin m_ms o_alu_outM[2]
load net s_alu_outM[30] -attr @rip o_alu_outM[30] -pin m_ds i_alu_outM[30] -pin m_es i_alu_outM[30] -pin m_ms o_alu_outM[30]
load net s_alu_outM[31] -attr @rip o_alu_outM[31] -pin m_ds i_alu_outM[31] -pin m_es i_alu_outM[31] -pin m_ms o_alu_outM[31]
load net s_alu_outM[3] -attr @rip o_alu_outM[3] -pin m_ds i_alu_outM[3] -pin m_es i_alu_outM[3] -pin m_ms o_alu_outM[3]
load net s_alu_outM[4] -attr @rip o_alu_outM[4] -pin m_ds i_alu_outM[4] -pin m_es i_alu_outM[4] -pin m_ms o_alu_outM[4]
load net s_alu_outM[5] -attr @rip o_alu_outM[5] -pin m_ds i_alu_outM[5] -pin m_es i_alu_outM[5] -pin m_ms o_alu_outM[5]
load net s_alu_outM[6] -attr @rip o_alu_outM[6] -pin m_ds i_alu_outM[6] -pin m_es i_alu_outM[6] -pin m_ms o_alu_outM[6]
load net s_alu_outM[7] -attr @rip o_alu_outM[7] -pin m_ds i_alu_outM[7] -pin m_es i_alu_outM[7] -pin m_ms o_alu_outM[7]
load net s_alu_outM[8] -attr @rip o_alu_outM[8] -pin m_ds i_alu_outM[8] -pin m_es i_alu_outM[8] -pin m_ms o_alu_outM[8]
load net s_alu_outM[9] -attr @rip o_alu_outM[9] -pin m_ds i_alu_outM[9] -pin m_es i_alu_outM[9] -pin m_ms o_alu_outM[9]
load net s_alu_out_EM[0] -attr @rip o_alu_outM[0] -pin m_es o_alu_outM[0] -pin m_ms i_alu_outM[0]
load net s_alu_out_EM[10] -attr @rip o_alu_outM[10] -pin m_es o_alu_outM[10] -pin m_ms i_alu_outM[10]
load net s_alu_out_EM[11] -attr @rip o_alu_outM[11] -pin m_es o_alu_outM[11] -pin m_ms i_alu_outM[11]
load net s_alu_out_EM[12] -attr @rip o_alu_outM[12] -pin m_es o_alu_outM[12] -pin m_ms i_alu_outM[12]
load net s_alu_out_EM[13] -attr @rip o_alu_outM[13] -pin m_es o_alu_outM[13] -pin m_ms i_alu_outM[13]
load net s_alu_out_EM[14] -attr @rip o_alu_outM[14] -pin m_es o_alu_outM[14] -pin m_ms i_alu_outM[14]
load net s_alu_out_EM[15] -attr @rip o_alu_outM[15] -pin m_es o_alu_outM[15] -pin m_ms i_alu_outM[15]
load net s_alu_out_EM[16] -attr @rip o_alu_outM[16] -pin m_es o_alu_outM[16] -pin m_ms i_alu_outM[16]
load net s_alu_out_EM[17] -attr @rip o_alu_outM[17] -pin m_es o_alu_outM[17] -pin m_ms i_alu_outM[17]
load net s_alu_out_EM[18] -attr @rip o_alu_outM[18] -pin m_es o_alu_outM[18] -pin m_ms i_alu_outM[18]
load net s_alu_out_EM[19] -attr @rip o_alu_outM[19] -pin m_es o_alu_outM[19] -pin m_ms i_alu_outM[19]
load net s_alu_out_EM[1] -attr @rip o_alu_outM[1] -pin m_es o_alu_outM[1] -pin m_ms i_alu_outM[1]
load net s_alu_out_EM[20] -attr @rip o_alu_outM[20] -pin m_es o_alu_outM[20] -pin m_ms i_alu_outM[20]
load net s_alu_out_EM[21] -attr @rip o_alu_outM[21] -pin m_es o_alu_outM[21] -pin m_ms i_alu_outM[21]
load net s_alu_out_EM[22] -attr @rip o_alu_outM[22] -pin m_es o_alu_outM[22] -pin m_ms i_alu_outM[22]
load net s_alu_out_EM[23] -attr @rip o_alu_outM[23] -pin m_es o_alu_outM[23] -pin m_ms i_alu_outM[23]
load net s_alu_out_EM[24] -attr @rip o_alu_outM[24] -pin m_es o_alu_outM[24] -pin m_ms i_alu_outM[24]
load net s_alu_out_EM[25] -attr @rip o_alu_outM[25] -pin m_es o_alu_outM[25] -pin m_ms i_alu_outM[25]
load net s_alu_out_EM[26] -attr @rip o_alu_outM[26] -pin m_es o_alu_outM[26] -pin m_ms i_alu_outM[26]
load net s_alu_out_EM[27] -attr @rip o_alu_outM[27] -pin m_es o_alu_outM[27] -pin m_ms i_alu_outM[27]
load net s_alu_out_EM[28] -attr @rip o_alu_outM[28] -pin m_es o_alu_outM[28] -pin m_ms i_alu_outM[28]
load net s_alu_out_EM[29] -attr @rip o_alu_outM[29] -pin m_es o_alu_outM[29] -pin m_ms i_alu_outM[29]
load net s_alu_out_EM[2] -attr @rip o_alu_outM[2] -pin m_es o_alu_outM[2] -pin m_ms i_alu_outM[2]
load net s_alu_out_EM[30] -attr @rip o_alu_outM[30] -pin m_es o_alu_outM[30] -pin m_ms i_alu_outM[30]
load net s_alu_out_EM[31] -attr @rip o_alu_outM[31] -pin m_es o_alu_outM[31] -pin m_ms i_alu_outM[31]
load net s_alu_out_EM[3] -attr @rip o_alu_outM[3] -pin m_es o_alu_outM[3] -pin m_ms i_alu_outM[3]
load net s_alu_out_EM[4] -attr @rip o_alu_outM[4] -pin m_es o_alu_outM[4] -pin m_ms i_alu_outM[4]
load net s_alu_out_EM[5] -attr @rip o_alu_outM[5] -pin m_es o_alu_outM[5] -pin m_ms i_alu_outM[5]
load net s_alu_out_EM[6] -attr @rip o_alu_outM[6] -pin m_es o_alu_outM[6] -pin m_ms i_alu_outM[6]
load net s_alu_out_EM[7] -attr @rip o_alu_outM[7] -pin m_es o_alu_outM[7] -pin m_ms i_alu_outM[7]
load net s_alu_out_EM[8] -attr @rip o_alu_outM[8] -pin m_es o_alu_outM[8] -pin m_ms i_alu_outM[8]
load net s_alu_out_EM[9] -attr @rip o_alu_outM[9] -pin m_es o_alu_outM[9] -pin m_ms i_alu_outM[9]
load net s_alu_out_MW[0] -attr @rip o_alu_outW[0] -pin m_ms o_alu_outW[0] -pin m_ws i_alu_outW[0]
load net s_alu_out_MW[10] -attr @rip o_alu_outW[10] -pin m_ms o_alu_outW[10] -pin m_ws i_alu_outW[10]
load net s_alu_out_MW[11] -attr @rip o_alu_outW[11] -pin m_ms o_alu_outW[11] -pin m_ws i_alu_outW[11]
load net s_alu_out_MW[12] -attr @rip o_alu_outW[12] -pin m_ms o_alu_outW[12] -pin m_ws i_alu_outW[12]
load net s_alu_out_MW[13] -attr @rip o_alu_outW[13] -pin m_ms o_alu_outW[13] -pin m_ws i_alu_outW[13]
load net s_alu_out_MW[14] -attr @rip o_alu_outW[14] -pin m_ms o_alu_outW[14] -pin m_ws i_alu_outW[14]
load net s_alu_out_MW[15] -attr @rip o_alu_outW[15] -pin m_ms o_alu_outW[15] -pin m_ws i_alu_outW[15]
load net s_alu_out_MW[16] -attr @rip o_alu_outW[16] -pin m_ms o_alu_outW[16] -pin m_ws i_alu_outW[16]
load net s_alu_out_MW[17] -attr @rip o_alu_outW[17] -pin m_ms o_alu_outW[17] -pin m_ws i_alu_outW[17]
load net s_alu_out_MW[18] -attr @rip o_alu_outW[18] -pin m_ms o_alu_outW[18] -pin m_ws i_alu_outW[18]
load net s_alu_out_MW[19] -attr @rip o_alu_outW[19] -pin m_ms o_alu_outW[19] -pin m_ws i_alu_outW[19]
load net s_alu_out_MW[1] -attr @rip o_alu_outW[1] -pin m_ms o_alu_outW[1] -pin m_ws i_alu_outW[1]
load net s_alu_out_MW[20] -attr @rip o_alu_outW[20] -pin m_ms o_alu_outW[20] -pin m_ws i_alu_outW[20]
load net s_alu_out_MW[21] -attr @rip o_alu_outW[21] -pin m_ms o_alu_outW[21] -pin m_ws i_alu_outW[21]
load net s_alu_out_MW[22] -attr @rip o_alu_outW[22] -pin m_ms o_alu_outW[22] -pin m_ws i_alu_outW[22]
load net s_alu_out_MW[23] -attr @rip o_alu_outW[23] -pin m_ms o_alu_outW[23] -pin m_ws i_alu_outW[23]
load net s_alu_out_MW[24] -attr @rip o_alu_outW[24] -pin m_ms o_alu_outW[24] -pin m_ws i_alu_outW[24]
load net s_alu_out_MW[25] -attr @rip o_alu_outW[25] -pin m_ms o_alu_outW[25] -pin m_ws i_alu_outW[25]
load net s_alu_out_MW[26] -attr @rip o_alu_outW[26] -pin m_ms o_alu_outW[26] -pin m_ws i_alu_outW[26]
load net s_alu_out_MW[27] -attr @rip o_alu_outW[27] -pin m_ms o_alu_outW[27] -pin m_ws i_alu_outW[27]
load net s_alu_out_MW[28] -attr @rip o_alu_outW[28] -pin m_ms o_alu_outW[28] -pin m_ws i_alu_outW[28]
load net s_alu_out_MW[29] -attr @rip o_alu_outW[29] -pin m_ms o_alu_outW[29] -pin m_ws i_alu_outW[29]
load net s_alu_out_MW[2] -attr @rip o_alu_outW[2] -pin m_ms o_alu_outW[2] -pin m_ws i_alu_outW[2]
load net s_alu_out_MW[30] -attr @rip o_alu_outW[30] -pin m_ms o_alu_outW[30] -pin m_ws i_alu_outW[30]
load net s_alu_out_MW[31] -attr @rip o_alu_outW[31] -pin m_ms o_alu_outW[31] -pin m_ws i_alu_outW[31]
load net s_alu_out_MW[3] -attr @rip o_alu_outW[3] -pin m_ms o_alu_outW[3] -pin m_ws i_alu_outW[3]
load net s_alu_out_MW[4] -attr @rip o_alu_outW[4] -pin m_ms o_alu_outW[4] -pin m_ws i_alu_outW[4]
load net s_alu_out_MW[5] -attr @rip o_alu_outW[5] -pin m_ms o_alu_outW[5] -pin m_ws i_alu_outW[5]
load net s_alu_out_MW[6] -attr @rip o_alu_outW[6] -pin m_ms o_alu_outW[6] -pin m_ws i_alu_outW[6]
load net s_alu_out_MW[7] -attr @rip o_alu_outW[7] -pin m_ms o_alu_outW[7] -pin m_ws i_alu_outW[7]
load net s_alu_out_MW[8] -attr @rip o_alu_outW[8] -pin m_ms o_alu_outW[8] -pin m_ws i_alu_outW[8]
load net s_alu_out_MW[9] -attr @rip o_alu_outW[9] -pin m_ms o_alu_outW[9] -pin m_ws i_alu_outW[9]
load net s_instFD[0] -attr @rip o_instD[0] -pin m_ds i_instD[0] -pin m_fs o_instD[0]
load net s_instFD[10] -attr @rip o_instD[10] -pin m_ds i_instD[10] -pin m_fs o_instD[10]
load net s_instFD[11] -attr @rip o_instD[11] -pin m_ds i_instD[11] -pin m_fs o_instD[11]
load net s_instFD[12] -attr @rip o_instD[12] -pin m_ds i_instD[12] -pin m_fs o_instD[12]
load net s_instFD[13] -attr @rip o_instD[13] -pin m_ds i_instD[13] -pin m_fs o_instD[13]
load net s_instFD[14] -attr @rip o_instD[14] -pin m_ds i_instD[14] -pin m_fs o_instD[14]
load net s_instFD[15] -attr @rip o_instD[15] -pin m_ds i_instD[15] -pin m_fs o_instD[15]
load net s_instFD[16] -attr @rip o_instD[16] -pin m_ds i_instD[16] -pin m_fs o_instD[16]
load net s_instFD[17] -attr @rip o_instD[17] -pin m_ds i_instD[17] -pin m_fs o_instD[17]
load net s_instFD[18] -attr @rip o_instD[18] -pin m_ds i_instD[18] -pin m_fs o_instD[18]
load net s_instFD[19] -attr @rip o_instD[19] -pin m_ds i_instD[19] -pin m_fs o_instD[19]
load net s_instFD[1] -attr @rip o_instD[1] -pin m_ds i_instD[1] -pin m_fs o_instD[1]
load net s_instFD[20] -attr @rip o_instD[20] -pin m_ds i_instD[20] -pin m_fs o_instD[20]
load net s_instFD[21] -attr @rip o_instD[21] -pin m_ds i_instD[21] -pin m_fs o_instD[21]
load net s_instFD[22] -attr @rip o_instD[22] -pin m_ds i_instD[22] -pin m_fs o_instD[22]
load net s_instFD[23] -attr @rip o_instD[23] -pin m_ds i_instD[23] -pin m_fs o_instD[23]
load net s_instFD[24] -attr @rip o_instD[24] -pin m_ds i_instD[24] -pin m_fs o_instD[24]
load net s_instFD[25] -attr @rip o_instD[25] -pin m_ds i_instD[25] -pin m_fs o_instD[25]
load net s_instFD[26] -attr @rip o_instD[26] -pin m_ds i_instD[26] -pin m_fs o_instD[26]
load net s_instFD[27] -attr @rip o_instD[27] -pin m_ds i_instD[27] -pin m_fs o_instD[27]
load net s_instFD[28] -attr @rip o_instD[28] -pin m_ds i_instD[28] -pin m_fs o_instD[28]
load net s_instFD[29] -attr @rip o_instD[29] -pin m_ds i_instD[29] -pin m_fs o_instD[29]
load net s_instFD[2] -attr @rip o_instD[2] -pin m_ds i_instD[2] -pin m_fs o_instD[2]
load net s_instFD[30] -attr @rip o_instD[30] -pin m_ds i_instD[30] -pin m_fs o_instD[30]
load net s_instFD[31] -attr @rip o_instD[31] -pin m_ds i_instD[31] -pin m_fs o_instD[31]
load net s_instFD[3] -attr @rip o_instD[3] -pin m_ds i_instD[3] -pin m_fs o_instD[3]
load net s_instFD[4] -attr @rip o_instD[4] -pin m_ds i_instD[4] -pin m_fs o_instD[4]
load net s_instFD[5] -attr @rip o_instD[5] -pin m_ds i_instD[5] -pin m_fs o_instD[5]
load net s_instFD[6] -attr @rip o_instD[6] -pin m_ds i_instD[6] -pin m_fs o_instD[6]
load net s_instFD[7] -attr @rip o_instD[7] -pin m_ds i_instD[7] -pin m_fs o_instD[7]
load net s_instFD[8] -attr @rip o_instD[8] -pin m_ds i_instD[8] -pin m_fs o_instD[8]
load net s_instFD[9] -attr @rip o_instD[9] -pin m_ds i_instD[9] -pin m_fs o_instD[9]
load net s_read_data_MW[0] -attr @rip o_read_dataW[0] -pin m_ms o_read_dataW[0] -pin m_ws i_read_dataW[0]
load net s_read_data_MW[10] -attr @rip o_read_dataW[10] -pin m_ms o_read_dataW[10] -pin m_ws i_read_dataW[10]
load net s_read_data_MW[11] -attr @rip o_read_dataW[11] -pin m_ms o_read_dataW[11] -pin m_ws i_read_dataW[11]
load net s_read_data_MW[12] -attr @rip o_read_dataW[12] -pin m_ms o_read_dataW[12] -pin m_ws i_read_dataW[12]
load net s_read_data_MW[13] -attr @rip o_read_dataW[13] -pin m_ms o_read_dataW[13] -pin m_ws i_read_dataW[13]
load net s_read_data_MW[14] -attr @rip o_read_dataW[14] -pin m_ms o_read_dataW[14] -pin m_ws i_read_dataW[14]
load net s_read_data_MW[15] -attr @rip o_read_dataW[15] -pin m_ms o_read_dataW[15] -pin m_ws i_read_dataW[15]
load net s_read_data_MW[16] -attr @rip o_read_dataW[16] -pin m_ms o_read_dataW[16] -pin m_ws i_read_dataW[16]
load net s_read_data_MW[17] -attr @rip o_read_dataW[17] -pin m_ms o_read_dataW[17] -pin m_ws i_read_dataW[17]
load net s_read_data_MW[18] -attr @rip o_read_dataW[18] -pin m_ms o_read_dataW[18] -pin m_ws i_read_dataW[18]
load net s_read_data_MW[19] -attr @rip o_read_dataW[19] -pin m_ms o_read_dataW[19] -pin m_ws i_read_dataW[19]
load net s_read_data_MW[1] -attr @rip o_read_dataW[1] -pin m_ms o_read_dataW[1] -pin m_ws i_read_dataW[1]
load net s_read_data_MW[20] -attr @rip o_read_dataW[20] -pin m_ms o_read_dataW[20] -pin m_ws i_read_dataW[20]
load net s_read_data_MW[21] -attr @rip o_read_dataW[21] -pin m_ms o_read_dataW[21] -pin m_ws i_read_dataW[21]
load net s_read_data_MW[22] -attr @rip o_read_dataW[22] -pin m_ms o_read_dataW[22] -pin m_ws i_read_dataW[22]
load net s_read_data_MW[23] -attr @rip o_read_dataW[23] -pin m_ms o_read_dataW[23] -pin m_ws i_read_dataW[23]
load net s_read_data_MW[24] -attr @rip o_read_dataW[24] -pin m_ms o_read_dataW[24] -pin m_ws i_read_dataW[24]
load net s_read_data_MW[25] -attr @rip o_read_dataW[25] -pin m_ms o_read_dataW[25] -pin m_ws i_read_dataW[25]
load net s_read_data_MW[26] -attr @rip o_read_dataW[26] -pin m_ms o_read_dataW[26] -pin m_ws i_read_dataW[26]
load net s_read_data_MW[27] -attr @rip o_read_dataW[27] -pin m_ms o_read_dataW[27] -pin m_ws i_read_dataW[27]
load net s_read_data_MW[28] -attr @rip o_read_dataW[28] -pin m_ms o_read_dataW[28] -pin m_ws i_read_dataW[28]
load net s_read_data_MW[29] -attr @rip o_read_dataW[29] -pin m_ms o_read_dataW[29] -pin m_ws i_read_dataW[29]
load net s_read_data_MW[2] -attr @rip o_read_dataW[2] -pin m_ms o_read_dataW[2] -pin m_ws i_read_dataW[2]
load net s_read_data_MW[30] -attr @rip o_read_dataW[30] -pin m_ms o_read_dataW[30] -pin m_ws i_read_dataW[30]
load net s_read_data_MW[31] -attr @rip o_read_dataW[31] -pin m_ms o_read_dataW[31] -pin m_ws i_read_dataW[31]
load net s_read_data_MW[3] -attr @rip o_read_dataW[3] -pin m_ms o_read_dataW[3] -pin m_ws i_read_dataW[3]
load net s_read_data_MW[4] -attr @rip o_read_dataW[4] -pin m_ms o_read_dataW[4] -pin m_ws i_read_dataW[4]
load net s_read_data_MW[5] -attr @rip o_read_dataW[5] -pin m_ms o_read_dataW[5] -pin m_ws i_read_dataW[5]
load net s_read_data_MW[6] -attr @rip o_read_dataW[6] -pin m_ms o_read_dataW[6] -pin m_ws i_read_dataW[6]
load net s_read_data_MW[7] -attr @rip o_read_dataW[7] -pin m_ms o_read_dataW[7] -pin m_ws i_read_dataW[7]
load net s_read_data_MW[8] -attr @rip o_read_dataW[8] -pin m_ms o_read_dataW[8] -pin m_ws i_read_dataW[8]
load net s_read_data_MW[9] -attr @rip o_read_dataW[9] -pin m_ms o_read_dataW[9] -pin m_ws i_read_dataW[9]
load net s_resultW[0] -attr @rip o_resultW[0] -pin m_ds i_resultW[0] -pin m_es i_resultW[0] -pin m_ws o_resultW[0]
load net s_resultW[10] -attr @rip o_resultW[10] -pin m_ds i_resultW[10] -pin m_es i_resultW[10] -pin m_ws o_resultW[10]
load net s_resultW[11] -attr @rip o_resultW[11] -pin m_ds i_resultW[11] -pin m_es i_resultW[11] -pin m_ws o_resultW[11]
load net s_resultW[12] -attr @rip o_resultW[12] -pin m_ds i_resultW[12] -pin m_es i_resultW[12] -pin m_ws o_resultW[12]
load net s_resultW[13] -attr @rip o_resultW[13] -pin m_ds i_resultW[13] -pin m_es i_resultW[13] -pin m_ws o_resultW[13]
load net s_resultW[14] -attr @rip o_resultW[14] -pin m_ds i_resultW[14] -pin m_es i_resultW[14] -pin m_ws o_resultW[14]
load net s_resultW[15] -attr @rip o_resultW[15] -pin m_ds i_resultW[15] -pin m_es i_resultW[15] -pin m_ws o_resultW[15]
load net s_resultW[16] -attr @rip o_resultW[16] -pin m_ds i_resultW[16] -pin m_es i_resultW[16] -pin m_ws o_resultW[16]
load net s_resultW[17] -attr @rip o_resultW[17] -pin m_ds i_resultW[17] -pin m_es i_resultW[17] -pin m_ws o_resultW[17]
load net s_resultW[18] -attr @rip o_resultW[18] -pin m_ds i_resultW[18] -pin m_es i_resultW[18] -pin m_ws o_resultW[18]
load net s_resultW[19] -attr @rip o_resultW[19] -pin m_ds i_resultW[19] -pin m_es i_resultW[19] -pin m_ws o_resultW[19]
load net s_resultW[1] -attr @rip o_resultW[1] -pin m_ds i_resultW[1] -pin m_es i_resultW[1] -pin m_ws o_resultW[1]
load net s_resultW[20] -attr @rip o_resultW[20] -pin m_ds i_resultW[20] -pin m_es i_resultW[20] -pin m_ws o_resultW[20]
load net s_resultW[21] -attr @rip o_resultW[21] -pin m_ds i_resultW[21] -pin m_es i_resultW[21] -pin m_ws o_resultW[21]
load net s_resultW[22] -attr @rip o_resultW[22] -pin m_ds i_resultW[22] -pin m_es i_resultW[22] -pin m_ws o_resultW[22]
load net s_resultW[23] -attr @rip o_resultW[23] -pin m_ds i_resultW[23] -pin m_es i_resultW[23] -pin m_ws o_resultW[23]
load net s_resultW[24] -attr @rip o_resultW[24] -pin m_ds i_resultW[24] -pin m_es i_resultW[24] -pin m_ws o_resultW[24]
load net s_resultW[25] -attr @rip o_resultW[25] -pin m_ds i_resultW[25] -pin m_es i_resultW[25] -pin m_ws o_resultW[25]
load net s_resultW[26] -attr @rip o_resultW[26] -pin m_ds i_resultW[26] -pin m_es i_resultW[26] -pin m_ws o_resultW[26]
load net s_resultW[27] -attr @rip o_resultW[27] -pin m_ds i_resultW[27] -pin m_es i_resultW[27] -pin m_ws o_resultW[27]
load net s_resultW[28] -attr @rip o_resultW[28] -pin m_ds i_resultW[28] -pin m_es i_resultW[28] -pin m_ws o_resultW[28]
load net s_resultW[29] -attr @rip o_resultW[29] -pin m_ds i_resultW[29] -pin m_es i_resultW[29] -pin m_ws o_resultW[29]
load net s_resultW[2] -attr @rip o_resultW[2] -pin m_ds i_resultW[2] -pin m_es i_resultW[2] -pin m_ws o_resultW[2]
load net s_resultW[30] -attr @rip o_resultW[30] -pin m_ds i_resultW[30] -pin m_es i_resultW[30] -pin m_ws o_resultW[30]
load net s_resultW[31] -attr @rip o_resultW[31] -pin m_ds i_resultW[31] -pin m_es i_resultW[31] -pin m_ws o_resultW[31]
load net s_resultW[3] -attr @rip o_resultW[3] -pin m_ds i_resultW[3] -pin m_es i_resultW[3] -pin m_ws o_resultW[3]
load net s_resultW[4] -attr @rip o_resultW[4] -pin m_ds i_resultW[4] -pin m_es i_resultW[4] -pin m_ws o_resultW[4]
load net s_resultW[5] -attr @rip o_resultW[5] -pin m_ds i_resultW[5] -pin m_es i_resultW[5] -pin m_ws o_resultW[5]
load net s_resultW[6] -attr @rip o_resultW[6] -pin m_ds i_resultW[6] -pin m_es i_resultW[6] -pin m_ws o_resultW[6]
load net s_resultW[7] -attr @rip o_resultW[7] -pin m_ds i_resultW[7] -pin m_es i_resultW[7] -pin m_ws o_resultW[7]
load net s_resultW[8] -attr @rip o_resultW[8] -pin m_ds i_resultW[8] -pin m_es i_resultW[8] -pin m_ws o_resultW[8]
load net s_resultW[9] -attr @rip o_resultW[9] -pin m_ds i_resultW[9] -pin m_es i_resultW[9] -pin m_ws o_resultW[9]
load net s_rf_rd1_DE[0] -attr @rip o_rf_rd1E[0] -pin m_ds o_rf_rd1E[0] -pin m_es i_rf_rd1E[0]
load net s_rf_rd1_DE[10] -attr @rip o_rf_rd1E[10] -pin m_ds o_rf_rd1E[10] -pin m_es i_rf_rd1E[10]
load net s_rf_rd1_DE[11] -attr @rip o_rf_rd1E[11] -pin m_ds o_rf_rd1E[11] -pin m_es i_rf_rd1E[11]
load net s_rf_rd1_DE[12] -attr @rip o_rf_rd1E[12] -pin m_ds o_rf_rd1E[12] -pin m_es i_rf_rd1E[12]
load net s_rf_rd1_DE[13] -attr @rip o_rf_rd1E[13] -pin m_ds o_rf_rd1E[13] -pin m_es i_rf_rd1E[13]
load net s_rf_rd1_DE[14] -attr @rip o_rf_rd1E[14] -pin m_ds o_rf_rd1E[14] -pin m_es i_rf_rd1E[14]
load net s_rf_rd1_DE[15] -attr @rip o_rf_rd1E[15] -pin m_ds o_rf_rd1E[15] -pin m_es i_rf_rd1E[15]
load net s_rf_rd1_DE[16] -attr @rip o_rf_rd1E[16] -pin m_ds o_rf_rd1E[16] -pin m_es i_rf_rd1E[16]
load net s_rf_rd1_DE[17] -attr @rip o_rf_rd1E[17] -pin m_ds o_rf_rd1E[17] -pin m_es i_rf_rd1E[17]
load net s_rf_rd1_DE[18] -attr @rip o_rf_rd1E[18] -pin m_ds o_rf_rd1E[18] -pin m_es i_rf_rd1E[18]
load net s_rf_rd1_DE[19] -attr @rip o_rf_rd1E[19] -pin m_ds o_rf_rd1E[19] -pin m_es i_rf_rd1E[19]
load net s_rf_rd1_DE[1] -attr @rip o_rf_rd1E[1] -pin m_ds o_rf_rd1E[1] -pin m_es i_rf_rd1E[1]
load net s_rf_rd1_DE[20] -attr @rip o_rf_rd1E[20] -pin m_ds o_rf_rd1E[20] -pin m_es i_rf_rd1E[20]
load net s_rf_rd1_DE[21] -attr @rip o_rf_rd1E[21] -pin m_ds o_rf_rd1E[21] -pin m_es i_rf_rd1E[21]
load net s_rf_rd1_DE[22] -attr @rip o_rf_rd1E[22] -pin m_ds o_rf_rd1E[22] -pin m_es i_rf_rd1E[22]
load net s_rf_rd1_DE[23] -attr @rip o_rf_rd1E[23] -pin m_ds o_rf_rd1E[23] -pin m_es i_rf_rd1E[23]
load net s_rf_rd1_DE[24] -attr @rip o_rf_rd1E[24] -pin m_ds o_rf_rd1E[24] -pin m_es i_rf_rd1E[24]
load net s_rf_rd1_DE[25] -attr @rip o_rf_rd1E[25] -pin m_ds o_rf_rd1E[25] -pin m_es i_rf_rd1E[25]
load net s_rf_rd1_DE[26] -attr @rip o_rf_rd1E[26] -pin m_ds o_rf_rd1E[26] -pin m_es i_rf_rd1E[26]
load net s_rf_rd1_DE[27] -attr @rip o_rf_rd1E[27] -pin m_ds o_rf_rd1E[27] -pin m_es i_rf_rd1E[27]
load net s_rf_rd1_DE[28] -attr @rip o_rf_rd1E[28] -pin m_ds o_rf_rd1E[28] -pin m_es i_rf_rd1E[28]
load net s_rf_rd1_DE[29] -attr @rip o_rf_rd1E[29] -pin m_ds o_rf_rd1E[29] -pin m_es i_rf_rd1E[29]
load net s_rf_rd1_DE[2] -attr @rip o_rf_rd1E[2] -pin m_ds o_rf_rd1E[2] -pin m_es i_rf_rd1E[2]
load net s_rf_rd1_DE[30] -attr @rip o_rf_rd1E[30] -pin m_ds o_rf_rd1E[30] -pin m_es i_rf_rd1E[30]
load net s_rf_rd1_DE[31] -attr @rip o_rf_rd1E[31] -pin m_ds o_rf_rd1E[31] -pin m_es i_rf_rd1E[31]
load net s_rf_rd1_DE[3] -attr @rip o_rf_rd1E[3] -pin m_ds o_rf_rd1E[3] -pin m_es i_rf_rd1E[3]
load net s_rf_rd1_DE[4] -attr @rip o_rf_rd1E[4] -pin m_ds o_rf_rd1E[4] -pin m_es i_rf_rd1E[4]
load net s_rf_rd1_DE[5] -attr @rip o_rf_rd1E[5] -pin m_ds o_rf_rd1E[5] -pin m_es i_rf_rd1E[5]
load net s_rf_rd1_DE[6] -attr @rip o_rf_rd1E[6] -pin m_ds o_rf_rd1E[6] -pin m_es i_rf_rd1E[6]
load net s_rf_rd1_DE[7] -attr @rip o_rf_rd1E[7] -pin m_ds o_rf_rd1E[7] -pin m_es i_rf_rd1E[7]
load net s_rf_rd1_DE[8] -attr @rip o_rf_rd1E[8] -pin m_ds o_rf_rd1E[8] -pin m_es i_rf_rd1E[8]
load net s_rf_rd1_DE[9] -attr @rip o_rf_rd1E[9] -pin m_ds o_rf_rd1E[9] -pin m_es i_rf_rd1E[9]
load net s_rf_rd2_DE[0] -attr @rip o_rf_rd2E[0] -pin m_ds o_rf_rd2E[0] -pin m_es i_rf_rd2E[0]
load net s_rf_rd2_DE[10] -attr @rip o_rf_rd2E[10] -pin m_ds o_rf_rd2E[10] -pin m_es i_rf_rd2E[10]
load net s_rf_rd2_DE[11] -attr @rip o_rf_rd2E[11] -pin m_ds o_rf_rd2E[11] -pin m_es i_rf_rd2E[11]
load net s_rf_rd2_DE[12] -attr @rip o_rf_rd2E[12] -pin m_ds o_rf_rd2E[12] -pin m_es i_rf_rd2E[12]
load net s_rf_rd2_DE[13] -attr @rip o_rf_rd2E[13] -pin m_ds o_rf_rd2E[13] -pin m_es i_rf_rd2E[13]
load net s_rf_rd2_DE[14] -attr @rip o_rf_rd2E[14] -pin m_ds o_rf_rd2E[14] -pin m_es i_rf_rd2E[14]
load net s_rf_rd2_DE[15] -attr @rip o_rf_rd2E[15] -pin m_ds o_rf_rd2E[15] -pin m_es i_rf_rd2E[15]
load net s_rf_rd2_DE[16] -attr @rip o_rf_rd2E[16] -pin m_ds o_rf_rd2E[16] -pin m_es i_rf_rd2E[16]
load net s_rf_rd2_DE[17] -attr @rip o_rf_rd2E[17] -pin m_ds o_rf_rd2E[17] -pin m_es i_rf_rd2E[17]
load net s_rf_rd2_DE[18] -attr @rip o_rf_rd2E[18] -pin m_ds o_rf_rd2E[18] -pin m_es i_rf_rd2E[18]
load net s_rf_rd2_DE[19] -attr @rip o_rf_rd2E[19] -pin m_ds o_rf_rd2E[19] -pin m_es i_rf_rd2E[19]
load net s_rf_rd2_DE[1] -attr @rip o_rf_rd2E[1] -pin m_ds o_rf_rd2E[1] -pin m_es i_rf_rd2E[1]
load net s_rf_rd2_DE[20] -attr @rip o_rf_rd2E[20] -pin m_ds o_rf_rd2E[20] -pin m_es i_rf_rd2E[20]
load net s_rf_rd2_DE[21] -attr @rip o_rf_rd2E[21] -pin m_ds o_rf_rd2E[21] -pin m_es i_rf_rd2E[21]
load net s_rf_rd2_DE[22] -attr @rip o_rf_rd2E[22] -pin m_ds o_rf_rd2E[22] -pin m_es i_rf_rd2E[22]
load net s_rf_rd2_DE[23] -attr @rip o_rf_rd2E[23] -pin m_ds o_rf_rd2E[23] -pin m_es i_rf_rd2E[23]
load net s_rf_rd2_DE[24] -attr @rip o_rf_rd2E[24] -pin m_ds o_rf_rd2E[24] -pin m_es i_rf_rd2E[24]
load net s_rf_rd2_DE[25] -attr @rip o_rf_rd2E[25] -pin m_ds o_rf_rd2E[25] -pin m_es i_rf_rd2E[25]
load net s_rf_rd2_DE[26] -attr @rip o_rf_rd2E[26] -pin m_ds o_rf_rd2E[26] -pin m_es i_rf_rd2E[26]
load net s_rf_rd2_DE[27] -attr @rip o_rf_rd2E[27] -pin m_ds o_rf_rd2E[27] -pin m_es i_rf_rd2E[27]
load net s_rf_rd2_DE[28] -attr @rip o_rf_rd2E[28] -pin m_ds o_rf_rd2E[28] -pin m_es i_rf_rd2E[28]
load net s_rf_rd2_DE[29] -attr @rip o_rf_rd2E[29] -pin m_ds o_rf_rd2E[29] -pin m_es i_rf_rd2E[29]
load net s_rf_rd2_DE[2] -attr @rip o_rf_rd2E[2] -pin m_ds o_rf_rd2E[2] -pin m_es i_rf_rd2E[2]
load net s_rf_rd2_DE[30] -attr @rip o_rf_rd2E[30] -pin m_ds o_rf_rd2E[30] -pin m_es i_rf_rd2E[30]
load net s_rf_rd2_DE[31] -attr @rip o_rf_rd2E[31] -pin m_ds o_rf_rd2E[31] -pin m_es i_rf_rd2E[31]
load net s_rf_rd2_DE[3] -attr @rip o_rf_rd2E[3] -pin m_ds o_rf_rd2E[3] -pin m_es i_rf_rd2E[3]
load net s_rf_rd2_DE[4] -attr @rip o_rf_rd2E[4] -pin m_ds o_rf_rd2E[4] -pin m_es i_rf_rd2E[4]
load net s_rf_rd2_DE[5] -attr @rip o_rf_rd2E[5] -pin m_ds o_rf_rd2E[5] -pin m_es i_rf_rd2E[5]
load net s_rf_rd2_DE[6] -attr @rip o_rf_rd2E[6] -pin m_ds o_rf_rd2E[6] -pin m_es i_rf_rd2E[6]
load net s_rf_rd2_DE[7] -attr @rip o_rf_rd2E[7] -pin m_ds o_rf_rd2E[7] -pin m_es i_rf_rd2E[7]
load net s_rf_rd2_DE[8] -attr @rip o_rf_rd2E[8] -pin m_ds o_rf_rd2E[8] -pin m_es i_rf_rd2E[8]
load net s_rf_rd2_DE[9] -attr @rip o_rf_rd2E[9] -pin m_ds o_rf_rd2E[9] -pin m_es i_rf_rd2E[9]
load net s_sign_ext_DE[0] -attr @rip o_sign_extE[0] -pin m_ds o_sign_extE[0] -pin m_es i_sign_extE[0]
load net s_sign_ext_DE[10] -attr @rip o_sign_extE[10] -pin m_ds o_sign_extE[10] -pin m_es i_sign_extE[10]
load net s_sign_ext_DE[11] -attr @rip o_sign_extE[11] -pin m_ds o_sign_extE[11] -pin m_es i_sign_extE[11]
load net s_sign_ext_DE[12] -attr @rip o_sign_extE[12] -pin m_ds o_sign_extE[12] -pin m_es i_sign_extE[12]
load net s_sign_ext_DE[13] -attr @rip o_sign_extE[13] -pin m_ds o_sign_extE[13] -pin m_es i_sign_extE[13]
load net s_sign_ext_DE[14] -attr @rip o_sign_extE[14] -pin m_ds o_sign_extE[14] -pin m_es i_sign_extE[14]
load net s_sign_ext_DE[15] -attr @rip o_sign_extE[15] -pin m_ds o_sign_extE[15] -pin m_es i_sign_extE[15]
load net s_sign_ext_DE[16] -attr @rip o_sign_extE[16] -pin m_ds o_sign_extE[16] -pin m_es i_sign_extE[16]
load net s_sign_ext_DE[17] -attr @rip o_sign_extE[17] -pin m_ds o_sign_extE[17] -pin m_es i_sign_extE[17]
load net s_sign_ext_DE[18] -attr @rip o_sign_extE[18] -pin m_ds o_sign_extE[18] -pin m_es i_sign_extE[18]
load net s_sign_ext_DE[19] -attr @rip o_sign_extE[19] -pin m_ds o_sign_extE[19] -pin m_es i_sign_extE[19]
load net s_sign_ext_DE[1] -attr @rip o_sign_extE[1] -pin m_ds o_sign_extE[1] -pin m_es i_sign_extE[1]
load net s_sign_ext_DE[20] -attr @rip o_sign_extE[20] -pin m_ds o_sign_extE[20] -pin m_es i_sign_extE[20]
load net s_sign_ext_DE[21] -attr @rip o_sign_extE[21] -pin m_ds o_sign_extE[21] -pin m_es i_sign_extE[21]
load net s_sign_ext_DE[22] -attr @rip o_sign_extE[22] -pin m_ds o_sign_extE[22] -pin m_es i_sign_extE[22]
load net s_sign_ext_DE[23] -attr @rip o_sign_extE[23] -pin m_ds o_sign_extE[23] -pin m_es i_sign_extE[23]
load net s_sign_ext_DE[24] -attr @rip o_sign_extE[24] -pin m_ds o_sign_extE[24] -pin m_es i_sign_extE[24]
load net s_sign_ext_DE[25] -attr @rip o_sign_extE[25] -pin m_ds o_sign_extE[25] -pin m_es i_sign_extE[25]
load net s_sign_ext_DE[26] -attr @rip o_sign_extE[26] -pin m_ds o_sign_extE[26] -pin m_es i_sign_extE[26]
load net s_sign_ext_DE[27] -attr @rip o_sign_extE[27] -pin m_ds o_sign_extE[27] -pin m_es i_sign_extE[27]
load net s_sign_ext_DE[28] -attr @rip o_sign_extE[28] -pin m_ds o_sign_extE[28] -pin m_es i_sign_extE[28]
load net s_sign_ext_DE[29] -attr @rip o_sign_extE[29] -pin m_ds o_sign_extE[29] -pin m_es i_sign_extE[29]
load net s_sign_ext_DE[2] -attr @rip o_sign_extE[2] -pin m_ds o_sign_extE[2] -pin m_es i_sign_extE[2]
load net s_sign_ext_DE[30] -attr @rip o_sign_extE[30] -pin m_ds o_sign_extE[30] -pin m_es i_sign_extE[30]
load net s_sign_ext_DE[31] -attr @rip o_sign_extE[31] -pin m_ds o_sign_extE[31] -pin m_es i_sign_extE[31]
load net s_sign_ext_DE[3] -attr @rip o_sign_extE[3] -pin m_ds o_sign_extE[3] -pin m_es i_sign_extE[3]
load net s_sign_ext_DE[4] -attr @rip o_sign_extE[4] -pin m_ds o_sign_extE[4] -pin m_es i_sign_extE[4]
load net s_sign_ext_DE[5] -attr @rip o_sign_extE[5] -pin m_ds o_sign_extE[5] -pin m_es i_sign_extE[5]
load net s_sign_ext_DE[6] -attr @rip o_sign_extE[6] -pin m_ds o_sign_extE[6] -pin m_es i_sign_extE[6]
load net s_sign_ext_DE[7] -attr @rip o_sign_extE[7] -pin m_ds o_sign_extE[7] -pin m_es i_sign_extE[7]
load net s_sign_ext_DE[8] -attr @rip o_sign_extE[8] -pin m_ds o_sign_extE[8] -pin m_es i_sign_extE[8]
load net s_sign_ext_DE[9] -attr @rip o_sign_extE[9] -pin m_ds o_sign_extE[9] -pin m_es i_sign_extE[9]
load net s_write_data_EM[0] -attr @rip o_write_dataM[0] -pin m_es o_write_dataM[0] -pin m_ms i_write_dataM[0]
load net s_write_data_EM[10] -attr @rip o_write_dataM[10] -pin m_es o_write_dataM[10] -pin m_ms i_write_dataM[10]
load net s_write_data_EM[11] -attr @rip o_write_dataM[11] -pin m_es o_write_dataM[11] -pin m_ms i_write_dataM[11]
load net s_write_data_EM[12] -attr @rip o_write_dataM[12] -pin m_es o_write_dataM[12] -pin m_ms i_write_dataM[12]
load net s_write_data_EM[13] -attr @rip o_write_dataM[13] -pin m_es o_write_dataM[13] -pin m_ms i_write_dataM[13]
load net s_write_data_EM[14] -attr @rip o_write_dataM[14] -pin m_es o_write_dataM[14] -pin m_ms i_write_dataM[14]
load net s_write_data_EM[15] -attr @rip o_write_dataM[15] -pin m_es o_write_dataM[15] -pin m_ms i_write_dataM[15]
load net s_write_data_EM[16] -attr @rip o_write_dataM[16] -pin m_es o_write_dataM[16] -pin m_ms i_write_dataM[16]
load net s_write_data_EM[17] -attr @rip o_write_dataM[17] -pin m_es o_write_dataM[17] -pin m_ms i_write_dataM[17]
load net s_write_data_EM[18] -attr @rip o_write_dataM[18] -pin m_es o_write_dataM[18] -pin m_ms i_write_dataM[18]
load net s_write_data_EM[19] -attr @rip o_write_dataM[19] -pin m_es o_write_dataM[19] -pin m_ms i_write_dataM[19]
load net s_write_data_EM[1] -attr @rip o_write_dataM[1] -pin m_es o_write_dataM[1] -pin m_ms i_write_dataM[1]
load net s_write_data_EM[20] -attr @rip o_write_dataM[20] -pin m_es o_write_dataM[20] -pin m_ms i_write_dataM[20]
load net s_write_data_EM[21] -attr @rip o_write_dataM[21] -pin m_es o_write_dataM[21] -pin m_ms i_write_dataM[21]
load net s_write_data_EM[22] -attr @rip o_write_dataM[22] -pin m_es o_write_dataM[22] -pin m_ms i_write_dataM[22]
load net s_write_data_EM[23] -attr @rip o_write_dataM[23] -pin m_es o_write_dataM[23] -pin m_ms i_write_dataM[23]
load net s_write_data_EM[24] -attr @rip o_write_dataM[24] -pin m_es o_write_dataM[24] -pin m_ms i_write_dataM[24]
load net s_write_data_EM[25] -attr @rip o_write_dataM[25] -pin m_es o_write_dataM[25] -pin m_ms i_write_dataM[25]
load net s_write_data_EM[26] -attr @rip o_write_dataM[26] -pin m_es o_write_dataM[26] -pin m_ms i_write_dataM[26]
load net s_write_data_EM[27] -attr @rip o_write_dataM[27] -pin m_es o_write_dataM[27] -pin m_ms i_write_dataM[27]
load net s_write_data_EM[28] -attr @rip o_write_dataM[28] -pin m_es o_write_dataM[28] -pin m_ms i_write_dataM[28]
load net s_write_data_EM[29] -attr @rip o_write_dataM[29] -pin m_es o_write_dataM[29] -pin m_ms i_write_dataM[29]
load net s_write_data_EM[2] -attr @rip o_write_dataM[2] -pin m_es o_write_dataM[2] -pin m_ms i_write_dataM[2]
load net s_write_data_EM[30] -attr @rip o_write_dataM[30] -pin m_es o_write_dataM[30] -pin m_ms i_write_dataM[30]
load net s_write_data_EM[31] -attr @rip o_write_dataM[31] -pin m_es o_write_dataM[31] -pin m_ms i_write_dataM[31]
load net s_write_data_EM[3] -attr @rip o_write_dataM[3] -pin m_es o_write_dataM[3] -pin m_ms i_write_dataM[3]
load net s_write_data_EM[4] -attr @rip o_write_dataM[4] -pin m_es o_write_dataM[4] -pin m_ms i_write_dataM[4]
load net s_write_data_EM[5] -attr @rip o_write_dataM[5] -pin m_es o_write_dataM[5] -pin m_ms i_write_dataM[5]
load net s_write_data_EM[6] -attr @rip o_write_dataM[6] -pin m_es o_write_dataM[6] -pin m_ms i_write_dataM[6]
load net s_write_data_EM[7] -attr @rip o_write_dataM[7] -pin m_es o_write_dataM[7] -pin m_ms i_write_dataM[7]
load net s_write_data_EM[8] -attr @rip o_write_dataM[8] -pin m_es o_write_dataM[8] -pin m_ms i_write_dataM[8]
load net s_write_data_EM[9] -attr @rip o_write_dataM[9] -pin m_es o_write_dataM[9] -pin m_ms i_write_dataM[9]
load netBundle @s_Rd_DE 5 s_Rd_DE[4] s_Rd_DE[3] s_Rd_DE[2] s_Rd_DE[1] s_Rd_DE[0] -autobundled
netbloc @s_Rd_DE 1 2 5 1050 810 1730J 770 2200J 670 2720J 550 3130
load netBundle @s_RsD_DH 5 s_RsD_DH[4] s_RsD_DH[3] s_RsD_DH[2] s_RsD_DH[1] s_RsD_DH[0] -autobundled
netbloc @s_RsD_DH 1 3 4 1810 310 NJ 310 NJ 310 3190
load netBundle @s_Rs_DE 5 s_Rs_DE[4] s_Rs_DE[3] s_Rs_DE[2] s_Rs_DE[1] s_Rs_DE[0] -autobundled
netbloc @s_Rs_DE 1 2 5 1070 830 1750J 790 2240J 690 2780J 570 3150
load netBundle @s_RtD_DH 5 s_RtD_DH[4] s_RtD_DH[3] s_RtD_DH[2] s_RtD_DH[1] s_RtD_DH[0] -autobundled
netbloc @s_RtD_DH 1 3 4 1830 330 NJ 330 NJ 330 3210
load netBundle @s_Rt_DE 5 s_Rt_DE[4] s_Rt_DE[3] s_Rt_DE[2] s_Rt_DE[1] s_Rt_DE[0] -autobundled
netbloc @s_Rt_DE 1 2 5 1090 850 1770J 810 2160J 710 2740J 590 3170
load netBundle @o_alu_controlE 2 o_alu_controlE[1] o_alu_controlE[0] -autobundled
netbloc @o_alu_controlE 1 2 5 1130 10 NJ 10 NJ 10 NJ 10 3270
load netBundle @o_pc_branch 32 o_pc_branch[31] o_pc_branch[30] o_pc_branch[29] o_pc_branch[28] o_pc_branch[27] o_pc_branch[26] o_pc_branch[25] o_pc_branch[24] o_pc_branch[23] o_pc_branch[22] o_pc_branch[21] o_pc_branch[20] o_pc_branch[19] o_pc_branch[18] o_pc_branch[17] o_pc_branch[16] o_pc_branch[15] o_pc_branch[14] o_pc_branch[13] o_pc_branch[12] o_pc_branch[11] o_pc_branch[10] o_pc_branch[9] o_pc_branch[8] o_pc_branch[7] o_pc_branch[6] o_pc_branch[5] o_pc_branch[4] o_pc_branch[3] o_pc_branch[2] o_pc_branch[1] o_pc_branch[0] -autobundled
netbloc @o_pc_branch 1 4 3 2420 1030 NJ 1030 3210
load netBundle @s_rf_rd1_DE 32 s_rf_rd1_DE[31] s_rf_rd1_DE[30] s_rf_rd1_DE[29] s_rf_rd1_DE[28] s_rf_rd1_DE[27] s_rf_rd1_DE[26] s_rf_rd1_DE[25] s_rf_rd1_DE[24] s_rf_rd1_DE[23] s_rf_rd1_DE[22] s_rf_rd1_DE[21] s_rf_rd1_DE[20] s_rf_rd1_DE[19] s_rf_rd1_DE[18] s_rf_rd1_DE[17] s_rf_rd1_DE[16] s_rf_rd1_DE[15] s_rf_rd1_DE[14] s_rf_rd1_DE[13] s_rf_rd1_DE[12] s_rf_rd1_DE[11] s_rf_rd1_DE[10] s_rf_rd1_DE[9] s_rf_rd1_DE[8] s_rf_rd1_DE[7] s_rf_rd1_DE[6] s_rf_rd1_DE[5] s_rf_rd1_DE[4] s_rf_rd1_DE[3] s_rf_rd1_DE[2] s_rf_rd1_DE[1] s_rf_rd1_DE[0] -autobundled
netbloc @s_rf_rd1_DE 1 2 5 1110 1070 NJ 1070 NJ 1070 NJ 1070 3170
load netBundle @s_rf_rd2_DE 32 s_rf_rd2_DE[31] s_rf_rd2_DE[30] s_rf_rd2_DE[29] s_rf_rd2_DE[28] s_rf_rd2_DE[27] s_rf_rd2_DE[26] s_rf_rd2_DE[25] s_rf_rd2_DE[24] s_rf_rd2_DE[23] s_rf_rd2_DE[22] s_rf_rd2_DE[21] s_rf_rd2_DE[20] s_rf_rd2_DE[19] s_rf_rd2_DE[18] s_rf_rd2_DE[17] s_rf_rd2_DE[16] s_rf_rd2_DE[15] s_rf_rd2_DE[14] s_rf_rd2_DE[13] s_rf_rd2_DE[12] s_rf_rd2_DE[11] s_rf_rd2_DE[10] s_rf_rd2_DE[9] s_rf_rd2_DE[8] s_rf_rd2_DE[7] s_rf_rd2_DE[6] s_rf_rd2_DE[5] s_rf_rd2_DE[4] s_rf_rd2_DE[3] s_rf_rd2_DE[2] s_rf_rd2_DE[1] s_rf_rd2_DE[0] -autobundled
netbloc @s_rf_rd2_DE 1 2 5 1130 1090 NJ 1090 NJ 1090 NJ 1090 3150
load netBundle @s_sign_ext_DE 32 s_sign_ext_DE[31] s_sign_ext_DE[30] s_sign_ext_DE[29] s_sign_ext_DE[28] s_sign_ext_DE[27] s_sign_ext_DE[26] s_sign_ext_DE[25] s_sign_ext_DE[24] s_sign_ext_DE[23] s_sign_ext_DE[22] s_sign_ext_DE[21] s_sign_ext_DE[20] s_sign_ext_DE[19] s_sign_ext_DE[18] s_sign_ext_DE[17] s_sign_ext_DE[16] s_sign_ext_DE[15] s_sign_ext_DE[14] s_sign_ext_DE[13] s_sign_ext_DE[12] s_sign_ext_DE[11] s_sign_ext_DE[10] s_sign_ext_DE[9] s_sign_ext_DE[8] s_sign_ext_DE[7] s_sign_ext_DE[6] s_sign_ext_DE[5] s_sign_ext_DE[4] s_sign_ext_DE[3] s_sign_ext_DE[2] s_sign_ext_DE[1] s_sign_ext_DE[0] -autobundled
netbloc @s_sign_ext_DE 1 2 5 1150 1110 NJ 1110 NJ 1110 NJ 1110 3130
load netBundle @s_Rd_EH 5 s_Rd_EH[4] s_Rd_EH[3] s_Rd_EH[2] s_Rd_EH[1] s_Rd_EH[0] -autobundled
netbloc @s_Rd_EH 1 3 1 1790 230n
load netBundle @s_Rd_EM 5 s_Rd_EM[4] s_Rd_EM[3] s_Rd_EM[2] s_Rd_EM[1] s_Rd_EM[0] -autobundled
netbloc @s_Rd_EM 1 0 4 60 510 NJ 510 1010J 550 1610
load netBundle @s_RsD_EH 5 s_RsD_EH[4] s_RsD_EH[3] s_RsD_EH[2] s_RsD_EH[1] s_RsD_EH[0] -autobundled
netbloc @s_RsD_EH 1 3 1 1730 270n
load netBundle @s_RtD_EH 5 s_RtD_EH[4] s_RtD_EH[3] s_RtD_EH[2] s_RtD_EH[1] s_RtD_EH[0] -autobundled
netbloc @s_RtD_EH 1 3 1 1710 290n
load netBundle @s_alu_out_EM 32 s_alu_out_EM[31] s_alu_out_EM[30] s_alu_out_EM[29] s_alu_out_EM[28] s_alu_out_EM[27] s_alu_out_EM[26] s_alu_out_EM[25] s_alu_out_EM[24] s_alu_out_EM[23] s_alu_out_EM[22] s_alu_out_EM[21] s_alu_out_EM[20] s_alu_out_EM[19] s_alu_out_EM[18] s_alu_out_EM[17] s_alu_out_EM[16] s_alu_out_EM[15] s_alu_out_EM[14] s_alu_out_EM[13] s_alu_out_EM[12] s_alu_out_EM[11] s_alu_out_EM[10] s_alu_out_EM[9] s_alu_out_EM[8] s_alu_out_EM[7] s_alu_out_EM[6] s_alu_out_EM[5] s_alu_out_EM[4] s_alu_out_EM[3] s_alu_out_EM[2] s_alu_out_EM[1] s_alu_out_EM[0] -autobundled
netbloc @s_alu_out_EM 1 0 4 60 870 NJ 870 870J 770 1590
load netBundle @s_write_data_EM 32 s_write_data_EM[31] s_write_data_EM[30] s_write_data_EM[29] s_write_data_EM[28] s_write_data_EM[27] s_write_data_EM[26] s_write_data_EM[25] s_write_data_EM[24] s_write_data_EM[23] s_write_data_EM[22] s_write_data_EM[21] s_write_data_EM[20] s_write_data_EM[19] s_write_data_EM[18] s_write_data_EM[17] s_write_data_EM[16] s_write_data_EM[15] s_write_data_EM[14] s_write_data_EM[13] s_write_data_EM[12] s_write_data_EM[11] s_write_data_EM[10] s_write_data_EM[9] s_write_data_EM[8] s_write_data_EM[7] s_write_data_EM[6] s_write_data_EM[5] s_write_data_EM[4] s_write_data_EM[3] s_write_data_EM[2] s_write_data_EM[1] s_write_data_EM[0] -autobundled
netbloc @s_write_data_EM 1 0 4 80 890 NJ 890 1010J 790 1570
load netBundle @s_instFD 32 s_instFD[31] s_instFD[30] s_instFD[29] s_instFD[28] s_instFD[27] s_instFD[26] s_instFD[25] s_instFD[24] s_instFD[23] s_instFD[22] s_instFD[21] s_instFD[20] s_instFD[19] s_instFD[18] s_instFD[17] s_instFD[16] s_instFD[15] s_instFD[14] s_instFD[13] s_instFD[12] s_instFD[11] s_instFD[10] s_instFD[9] s_instFD[8] s_instFD[7] s_instFD[6] s_instFD[5] s_instFD[4] s_instFD[3] s_instFD[2] s_instFD[1] s_instFD[0] -autobundled
netbloc @s_instFD 1 5 1 2760 570n
load netBundle @o_forwardAE 2 o_forwardAE[1] o_forwardAE[0] -autobundled
netbloc @o_forwardAE 1 2 3 1190 70 NJ 70 2180
load netBundle @o_forwardBE 2 o_forwardBE[1] o_forwardBE[0] -autobundled
netbloc @o_forwardBE 1 2 3 1110 50 NJ 50 2200
load netBundle @s_Rd_WD 5 s_Rd_WD[4] s_Rd_WD[3] s_Rd_WD[2] s_Rd_WD[1] s_Rd_WD[0] -autobundled
netbloc @s_Rd_WD 1 1 5 NJ 650 930J 670 1790 830 2380J 730 2780J
load netBundle @s_alu_outM 32 s_alu_outM[31] s_alu_outM[30] s_alu_outM[29] s_alu_outM[28] s_alu_outM[27] s_alu_outM[26] s_alu_outM[25] s_alu_outM[24] s_alu_outM[23] s_alu_outM[22] s_alu_outM[21] s_alu_outM[20] s_alu_outM[19] s_alu_outM[18] s_alu_outM[17] s_alu_outM[16] s_alu_outM[15] s_alu_outM[14] s_alu_outM[13] s_alu_outM[12] s_alu_outM[11] s_alu_outM[10] s_alu_outM[9] s_alu_outM[8] s_alu_outM[7] s_alu_outM[6] s_alu_outM[5] s_alu_outM[4] s_alu_outM[3] s_alu_outM[2] s_alu_outM[1] s_alu_outM[0] -autobundled
netbloc @s_alu_outM 1 1 5 NJ 670 910 730 NJ 730 2280J 450 2800J
load netBundle @s_alu_out_MW 32 s_alu_out_MW[31] s_alu_out_MW[30] s_alu_out_MW[29] s_alu_out_MW[28] s_alu_out_MW[27] s_alu_out_MW[26] s_alu_out_MW[25] s_alu_out_MW[24] s_alu_out_MW[23] s_alu_out_MW[22] s_alu_out_MW[21] s_alu_out_MW[20] s_alu_out_MW[19] s_alu_out_MW[18] s_alu_out_MW[17] s_alu_out_MW[16] s_alu_out_MW[15] s_alu_out_MW[14] s_alu_out_MW[13] s_alu_out_MW[12] s_alu_out_MW[11] s_alu_out_MW[10] s_alu_out_MW[9] s_alu_out_MW[8] s_alu_out_MW[7] s_alu_out_MW[6] s_alu_out_MW[5] s_alu_out_MW[4] s_alu_out_MW[3] s_alu_out_MW[2] s_alu_out_MW[1] s_alu_out_MW[0] -autobundled
netbloc @s_alu_out_MW 1 1 1 470 690n
load netBundle @s_read_data_MW 32 s_read_data_MW[31] s_read_data_MW[30] s_read_data_MW[29] s_read_data_MW[28] s_read_data_MW[27] s_read_data_MW[26] s_read_data_MW[25] s_read_data_MW[24] s_read_data_MW[23] s_read_data_MW[22] s_read_data_MW[21] s_read_data_MW[20] s_read_data_MW[19] s_read_data_MW[18] s_read_data_MW[17] s_read_data_MW[16] s_read_data_MW[15] s_read_data_MW[14] s_read_data_MW[13] s_read_data_MW[12] s_read_data_MW[11] s_read_data_MW[10] s_read_data_MW[9] s_read_data_MW[8] s_read_data_MW[7] s_read_data_MW[6] s_read_data_MW[5] s_read_data_MW[4] s_read_data_MW[3] s_read_data_MW[2] s_read_data_MW[1] s_read_data_MW[0] -autobundled
netbloc @s_read_data_MW 1 1 1 450 730n
load netBundle @s_resultW 32 s_resultW[31] s_resultW[30] s_resultW[29] s_resultW[28] s_resultW[27] s_resultW[26] s_resultW[25] s_resultW[24] s_resultW[23] s_resultW[22] s_resultW[21] s_resultW[20] s_resultW[19] s_resultW[18] s_resultW[17] s_resultW[16] s_resultW[15] s_resultW[14] s_resultW[13] s_resultW[12] s_resultW[11] s_resultW[10] s_resultW[9] s_resultW[8] s_resultW[7] s_resultW[6] s_resultW[5] s_resultW[4] s_resultW[3] s_resultW[2] s_resultW[1] s_resultW[0] -autobundled
netbloc @s_resultW 1 2 4 970 870 NJ 870 NJ 870 NJ
levelinfo -pg 1 0 240 690 1340 1950 2550 2930 3310
pagesize -pg 1 -db -bbox -sgen -80 0 3310 1120
show
fullfit
#
# initialize ictrl to current module mips work:mips:NOFILE
ictrl init topinfo |
