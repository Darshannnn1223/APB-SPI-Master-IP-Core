/////////////////////////////////////////////////////////////
// Created by: Synopsys Design Compiler(R)
// Version   : X-2025.06
// Date      : Sat Oct 10 13:04:21 2026
/////////////////////////////////////////////////////////////


module baud_rate_generator ( pclk, preset_n, spi_mode, spiswai, sppr, spr, 
        cpol, cpha, ss_n, sclk, miso_recv_possclk, miso_recv_negsclk, 
        mosi_send_possclk, mosi_send_negsclk, baudratedivisor );
  input [1:0] spi_mode;
  input [2:0] sppr;
  input [2:0] spr;
  output [11:0] baudratedivisor;
  input pclk, preset_n, spiswai, cpol, cpha, ss_n;
  output sclk, miso_recv_possclk, miso_recv_negsclk, mosi_send_possclk,
         mosi_send_negsclk;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15,
         N16, N17, N18, N19, N20, N21, N22, N23, N24, N25, pre_sclk, N26, N27,
         N28, N29, N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41,
         N42, N43, N44, N45, N46, N47, N48, N49, N50, N51, N52, N53, N54, N55,
         N56, N57, N58, N59, N60, N61, N62, N63, N64, N65, N66, N67, N68, N69,
         N70, N71, N72, N73, N74, N75, N76, N77, N78, N79, N80, N81, N82, N83,
         N84, N85, N86, N87, N88, N89, N90, N91, N92, N93, N94, N95, N96, N97,
         N98, N99, N100, N101, N102, N103, N104, N105, N106, N107, N108, N109,
         N110, N111, N112, N113, N114, N115, N116, N117, N118, N119, N120,
         N121, N122, N123, N124, N125, N126, N127, N128, N129, N130, N131,
         N132, N133, N134, N135, N136, N137, N138, N139, N140, N141, N142,
         N143, N144, N145, N146, N147, N148, N149, N150, N151, N152, N153,
         N154, N155, N156, N157, N158, N159, N160, N161, N162, N163, N164,
         N165, N166, N167, N168, N169, N170, N171, N172, N173, N174, N175,
         N176, N177;
  wire   [11:0] count;

  EQ_UNS_OP eq_29 ( .A(count), .B({N40, N40, N40, N40, N40, N40, N40, N40, N40, 
        N40, N40, N40, N40, N40, N40, N40, N40, N40, N40, N40, N40, N39, N38, 
        N37, N36, N35, N34, N33, N32, N31, N30, N29}), .Z(N41) );
  \**SEQGEN**  \count_reg[11]  ( .clear(N82), .preset(1'b0), .next_state(N79), 
        .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(count[11]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \count_reg[10]  ( .clear(N82), .preset(1'b0), .next_state(N78), 
        .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(count[10]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \count_reg[9]  ( .clear(N82), .preset(1'b0), .next_state(N77), 
        .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(count[9]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \count_reg[8]  ( .clear(N82), .preset(1'b0), .next_state(N76), 
        .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(count[8]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \count_reg[7]  ( .clear(N82), .preset(1'b0), .next_state(N75), 
        .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(count[7]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \count_reg[6]  ( .clear(N82), .preset(1'b0), .next_state(N74), 
        .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(count[6]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \count_reg[5]  ( .clear(N82), .preset(1'b0), .next_state(N73), 
        .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(count[5]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \count_reg[4]  ( .clear(N82), .preset(1'b0), .next_state(N72), 
        .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(count[4]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \count_reg[3]  ( .clear(N82), .preset(1'b0), .next_state(N71), 
        .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(count[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \count_reg[2]  ( .clear(N82), .preset(1'b0), .next_state(N70), 
        .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(count[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \count_reg[1]  ( .clear(N82), .preset(1'b0), .next_state(N69), 
        .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(count[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \count_reg[0]  ( .clear(N82), .preset(1'b0), .next_state(N68), 
        .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(count[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  sclk_reg ( .clear(1'b0), .preset(1'b0), .next_state(N81), 
        .clocked_on(pclk), .data_in(pre_sclk), .enable(N82), .Q(sclk), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N80) );
  EQ_UNS_OP eq_86 ( .A(count), .B({N96, N96, N96, N96, N96, N96, N96, N96, N96, 
        N96, N96, N96, N96, N96, N96, N96, N96, N96, N96, N96, N96, N95, N94, 
        N93, N92, N91, N90, N89, N88, N87, N86, N85}), .Z(N97) );
  EQ_UNS_OP eq_63 ( .A(count), .B({N113, N113, N113, N113, N113, N113, N113, 
        N113, N113, N113, N113, N113, N113, N113, N113, N113, N113, N113, N113, 
        N113, N113, N112, N111, N110, N109, N108, N107, N106, N105, N104, N103, 
        N102}), .Z(N114) );
  \**SEQGEN**  miso_recv_possclk_reg ( .clear(N82), .preset(1'b0), 
        .next_state(N118), .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), 
        .Q(miso_recv_possclk), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N117) );
  \**SEQGEN**  miso_recv_negsclk_reg ( .clear(N82), .preset(1'b0), 
        .next_state(N115), .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), 
        .Q(miso_recv_negsclk), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N116) );
  EQ_UNS_OP eq_118 ( .A(count), .B({N138, N138, N138, N138, N138, N138, N138, 
        N138, N138, N138, N138, N138, N138, N138, N138, N138, N138, N138, N138, 
        N138, N138, N137, N136, N135, N134, N133, N132, N131, N130, N129, N128, 
        N127}), .Z(N139) );
  EQ_UNS_OP eq_132 ( .A(count), .B({N155, N155, N155, N155, N155, N155, N155, 
        N155, N155, N155, N155, N155, N155, N155, N155, N155, N155, N155, N155, 
        N155, N155, N154, N153, N152, N151, N150, N149, N148, N147, N146, N145, 
        N144}), .Z(N156) );
  \**SEQGEN**  mosi_send_possclk_reg ( .clear(N82), .preset(1'b0), 
        .next_state(N142), .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), 
        .Q(mosi_send_possclk), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N157) );
  \**SEQGEN**  mosi_send_negsclk_reg ( .clear(N82), .preset(1'b0), 
        .next_state(N159), .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), 
        .Q(mosi_send_negsclk), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(N158) );
  ASH_UNS_UNS_OP shift_pow_16 ( .A({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b1}), .SH({N13, N12, N11, N10}), .Z({N25, 
        N24, N23, N22, N21, N20, N19, N18, N17, N16, N15, N14}) );
  GTECH_NOT I_0 ( .A(spi_mode[0]), .Z(N163) );
  GTECH_OR2 C173 ( .A(N163), .B(spi_mode[1]), .Z(N164) );
  GTECH_NOT I_1 ( .A(N164), .Z(N165) );
  GTECH_OR2 C175 ( .A(spi_mode[0]), .B(spi_mode[1]), .Z(N166) );
  GTECH_NOT I_2 ( .A(N166), .Z(N167) );
  ADD_UNS_OP add_16 ( .A(sppr), .B(1'b1), .Z({N9, N8, N7, N6}) );
  ADD_UNS_OP add_16_2 ( .A(spr), .B(1'b1), .Z({N13, N12, N11, N10}) );
  MULT_UNS_OP mult_16 ( .A({N9, N8, N7, N6}), .B({N25, N24, N23, N22, N21, N20, 
        N19, N18, N17, N16, N15, N14}), .Z(baudratedivisor) );
  SUB_UNS_OP sub_29 ( .A(baudratedivisor[11:1]), .B(1'b1), .Z({N40, N39, N38, 
        N37, N36, N35, N34, N33, N32, N31, N30, N29}) );
  SUB_UNS_OP sub_86 ( .A(baudratedivisor[11:1]), .B(1'b1), .Z({N96, N95, N94, 
        N93, N92, N91, N90, N89, N88, N87, N86, N85}) );
  SUB_UNS_OP sub_63 ( .A(baudratedivisor[11:1]), .B(1'b1), .Z({N113, N112, 
        N111, N110, N109, N108, N107, N106, N105, N104, N103, N102}) );
  SUB_UNS_OP sub_118 ( .A(baudratedivisor[11:1]), .B({1'b1, 1'b0}), .Z({N138, 
        N137, N136, N135, N134, N133, N132, N131, N130, N129, N128, N127}) );
  SUB_UNS_OP sub_132 ( .A(baudratedivisor[11:1]), .B({1'b1, 1'b0}), .Z({N155, 
        N154, N153, N152, N151, N150, N149, N148, N147, N146, N145, N144}) );
  ADD_UNS_OP add_36 ( .A(count), .B(1'b1), .Z({N55, N54, N53, N52, N51, N50, 
        N49, N48, N47, N46, N45, N44}) );
  SELECT_OP C177 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0}), .DATA2({N55, N54, N53, N52, N51, N50, N49, 
        N48, N47, N46, N45, N44}), .CONTROL1(N0), .CONTROL2(N42), .Z({N67, N66, 
        N65, N64, N63, N62, N61, N60, N59, N58, N57, N56}) );
  GTECH_BUF B_0 ( .A(N41), .Z(N0) );
  SELECT_OP C178 ( .DATA1({N67, N66, N65, N64, N63, N62, N61, N60, N59, N58, 
        N57, N56}), .DATA2({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0}), .CONTROL1(N1), .CONTROL2(N27), .Z({N79, N78, 
        N77, N76, N75, N74, N73, N72, N71, N70, N69, N68}) );
  GTECH_BUF B_1 ( .A(N26), .Z(N1) );
  SELECT_OP C179 ( .DATA1(N41), .DATA2(1'b1), .CONTROL1(N1), .CONTROL2(N27), 
        .Z(N80) );
  SELECT_OP C180 ( .DATA1(N43), .DATA2(pre_sclk), .CONTROL1(N1), .CONTROL2(N27), .Z(N81) );
  SELECT_OP C181 ( .DATA1(N114), .DATA2(1'b0), .CONTROL1(N2), .CONTROL2(N3), 
        .Z(N115) );
  GTECH_BUF B_2 ( .A(sclk), .Z(N2) );
  GTECH_BUF B_3 ( .A(N43), .Z(N3) );
  SELECT_OP C182 ( .DATA1(1'b1), .DATA2(1'b0), .DATA3(1'b0), .DATA4(1'b0), 
        .CONTROL1(N4), .CONTROL2(N120), .CONTROL3(N123), .CONTROL4(N100), .Z(
        N116) );
  GTECH_BUF B_4 ( .A(N84), .Z(N4) );
  SELECT_OP C183 ( .DATA1(1'b0), .DATA2(1'b1), .DATA3(1'b1), .DATA4(1'b1), 
        .CONTROL1(N4), .CONTROL2(N120), .CONTROL3(N123), .CONTROL4(N100), .Z(
        N117) );
  SELECT_OP C184 ( .DATA1(1'b0), .DATA2(1'b1), .DATA3(1'b0), .CONTROL1(N120), 
        .CONTROL2(N123), .CONTROL3(N100), .Z(N118) );
  SELECT_OP C185 ( .DATA1(1'b0), .DATA2(1'b1), .DATA3(1'b0), .CONTROL1(N2), 
        .CONTROL2(N162), .CONTROL3(N141), .Z(N142) );
  SELECT_OP C186 ( .DATA1(1'b1), .DATA2(1'b0), .DATA3(1'b0), .CONTROL1(N5), 
        .CONTROL2(N161), .CONTROL3(N126), .Z(N157) );
  GTECH_BUF B_5 ( .A(N124), .Z(N5) );
  SELECT_OP C187 ( .DATA1(1'b0), .DATA2(1'b1), .DATA3(1'b1), .CONTROL1(N5), 
        .CONTROL2(N161), .CONTROL3(N126), .Z(N158) );
  SELECT_OP C188 ( .DATA1(N156), .DATA2(1'b0), .CONTROL1(N161), .CONTROL2(N126), .Z(N159) );
  GTECH_BUF B_6 ( .A(cpol), .Z(pre_sclk) );
  GTECH_AND2 C193 ( .A(N170), .B(N171), .Z(N26) );
  GTECH_OR2 C194 ( .A(N169), .B(N167), .Z(N170) );
  GTECH_AND2 C195 ( .A(N165), .B(N168), .Z(N169) );
  GTECH_NOT I_3 ( .A(spiswai), .Z(N168) );
  GTECH_NOT I_4 ( .A(ss_n), .Z(N171) );
  GTECH_NOT I_5 ( .A(N26), .Z(N27) );
  GTECH_AND2 C200 ( .A(N83), .B(N26), .Z(N28) );
  GTECH_NOT I_6 ( .A(N41), .Z(N42) );
  GTECH_NOT I_7 ( .A(sclk), .Z(N43) );
  GTECH_AND2 C204 ( .A(N28), .B(N42) );
  GTECH_NOT I_8 ( .A(preset_n), .Z(N82) );
  GTECH_BUF B_7 ( .A(preset_n), .Z(N83) );
  GTECH_OR2 C208 ( .A(N173), .B(N175), .Z(N84) );
  GTECH_AND2 C209 ( .A(cpol), .B(N172), .Z(N173) );
  GTECH_NOT I_9 ( .A(cpha), .Z(N172) );
  GTECH_AND2 C211 ( .A(N174), .B(cpha), .Z(N175) );
  GTECH_NOT I_10 ( .A(cpol), .Z(N174) );
  GTECH_OR2 C216 ( .A(sclk), .B(N84), .Z(N98) );
  GTECH_OR2 C217 ( .A(N97), .B(N98), .Z(N99) );
  GTECH_NOT I_11 ( .A(N99), .Z(N100) );
  GTECH_AND2 C219 ( .A(N83), .B(N84), .Z(N101) );
  GTECH_AND2 C223 ( .A(N101), .B(sclk) );
  GTECH_NOT I_12 ( .A(N84), .Z(N119) );
  GTECH_AND2 C226 ( .A(sclk), .B(N119), .Z(N120) );
  GTECH_NOT I_13 ( .A(sclk), .Z(N121) );
  GTECH_AND2 C228 ( .A(N119), .B(N121), .Z(N122) );
  GTECH_AND2 C229 ( .A(N97), .B(N122), .Z(N123) );
  GTECH_OR2 C230 ( .A(N176), .B(N177), .Z(N124) );
  GTECH_AND2 C231 ( .A(N174), .B(N172), .Z(N176) );
  GTECH_AND2 C234 ( .A(cpol), .B(cpha), .Z(N177) );
  GTECH_OR2 C237 ( .A(sclk), .B(N124), .Z(N125) );
  GTECH_NOT I_14 ( .A(N125), .Z(N126) );
  GTECH_AND2 C239 ( .A(N83), .B(N124) );
  GTECH_OR2 C242 ( .A(N139), .B(sclk), .Z(N140) );
  GTECH_NOT I_15 ( .A(N140), .Z(N141) );
  GTECH_AND2 C244 ( .A(N83), .B(N161), .Z(N143) );
  GTECH_NOT I_16 ( .A(N124), .Z(N160) );
  GTECH_AND2 C247 ( .A(sclk), .B(N160), .Z(N161) );
  GTECH_AND2 C248 ( .A(N143), .B(N160) );
  GTECH_AND2 C250 ( .A(N139), .B(N121), .Z(N162) );
endmodule

