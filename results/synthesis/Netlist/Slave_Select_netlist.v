/////////////////////////////////////////////////////////////
// Created by: Synopsys Design Compiler(R)
// Version   : X-2025.06
// Date      : Tue Oct 13 21:56:28 2026
/////////////////////////////////////////////////////////////


module slave_block ( pclk, preset_n, mstr, spiswai, spi_mode, send_data, 
        baudratedivisor, receive_data, ss, tip );
  input [1:0] spi_mode;
  input [11:0] baudratedivisor;
  input pclk, preset_n, mstr, spiswai, send_data;
  output receive_data, ss, tip;
  wire   N0, N1, N2, N3, N4, rcv, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14,
         N15, N16, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28,
         N29, N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41, N42,
         N43, N44, N45, N46, N47, N48, N49, N50, N51, N52, N53, N54, N55, N56,
         N57, N58, N59, N60, N61, N62, N63, N64, N65, N66, N67, N68, N69, N70,
         N71, N72, N73, N74, N75, N76, N77, N78, N79, N80, N81, N82, N83, N84,
         N85, N86, N87, N88, N89, N90, N91, N92, N93, N94, N95, N96, N97, N98,
         N99, N100, N101, N102, N103, N104, N105, N106, N107, N108, N109, N110,
         N111, N112, N113, N114, N115, N116, N117, N118, N119, N120, N121,
         N122, N123, N124, N125;
  wire   [15:0] counter;

  LEQ_UNS_OP lte_26 ( .A(counter), .B({N26, N25, N24, N23, N22, N21, N20, N19, 
        N18, N17, N16, N15, N14, N13, N12, N11}), .Z(N27) );
  EQ_UNS_OP eq_29 ( .A(counter), .B({N60, N59, N58, N57, N56, N55, N54, N53, 
        N52, N51, N50, N49, N48, N47, N46, N45}), .Z(N61) );
  \**SEQGEN**  \counter_reg[15]  ( .clear(1'b0), .preset(N4), .next_state(N114), .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(counter[15]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \counter_reg[14]  ( .clear(1'b0), .preset(N4), .next_state(N113), .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(counter[14]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \counter_reg[13]  ( .clear(1'b0), .preset(N4), .next_state(N112), .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(counter[13]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \counter_reg[12]  ( .clear(1'b0), .preset(N4), .next_state(N111), .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(counter[12]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \counter_reg[11]  ( .clear(1'b0), .preset(N4), .next_state(N110), .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(counter[11]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \counter_reg[10]  ( .clear(1'b0), .preset(N4), .next_state(N109), .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(counter[10]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \counter_reg[9]  ( .clear(1'b0), .preset(N4), .next_state(N108), 
        .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(counter[9]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \counter_reg[8]  ( .clear(1'b0), .preset(N4), .next_state(N107), 
        .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(counter[8]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \counter_reg[7]  ( .clear(1'b0), .preset(N4), .next_state(N106), 
        .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(counter[7]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \counter_reg[6]  ( .clear(1'b0), .preset(N4), .next_state(N105), 
        .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(counter[6]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \counter_reg[5]  ( .clear(1'b0), .preset(N4), .next_state(N104), 
        .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(counter[5]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \counter_reg[4]  ( .clear(1'b0), .preset(N4), .next_state(N103), 
        .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(counter[4]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \counter_reg[3]  ( .clear(1'b0), .preset(N4), .next_state(N102), 
        .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(counter[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \counter_reg[2]  ( .clear(1'b0), .preset(N4), .next_state(N101), 
        .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(counter[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \counter_reg[1]  ( .clear(1'b0), .preset(N4), .next_state(N100), 
        .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(counter[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \counter_reg[0]  ( .clear(1'b0), .preset(N4), .next_state(N99), 
        .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(counter[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  ss_reg ( .clear(1'b0), .preset(N4), .next_state(N117), 
        .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(ss), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  rcv_reg ( .clear(N4), .preset(1'b0), .next_state(N116), 
        .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(rcv), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N115) );
  \**SEQGEN**  receive_data_reg ( .clear(N4), .preset(1'b0), .next_state(rcv), 
        .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(receive_data), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  GTECH_OR2 C134 ( .A(spi_mode[0]), .B(spi_mode[1]), .Z(N118) );
  GTECH_NOT I_0 ( .A(N118), .Z(N119) );
  GTECH_NOT I_1 ( .A(spi_mode[0]), .Z(N120) );
  GTECH_OR2 C137 ( .A(N120), .B(spi_mode[1]), .Z(N121) );
  GTECH_NOT I_2 ( .A(N121), .Z(N122) );
  SUB_UNS_OP sub_26 ( .A({baudratedivisor, 1'b0, 1'b0, 1'b0}), .B(1'b1), .Z({
        N26, N25, N24, N23, N22, N21, N20, N19, N18, N17, N16, N15, N14, N13, 
        N12, N11}) );
  ADD_UNS_OP add_28 ( .A(counter), .B(1'b1), .Z({N44, N43, N42, N41, N40, N39, 
        N38, N37, N36, N35, N34, N33, N32, N31, N30, N29}) );
  SUB_UNS_OP sub_29 ( .A({baudratedivisor, 1'b0, 1'b0, 1'b0}), .B(1'b1), .Z({
        N60, N59, N58, N57, N56, N55, N54, N53, N52, N51, N50, N49, N48, N47, 
        N46, N45}) );
  GTECH_NOT I_3 ( .A(N27), .Z(N62) );
  SELECT_OP C140 ( .DATA1({N44, N43, N42, N41, N40, N39, N38, N37, N36, N35, 
        N34, N33, N32, N31, N30, N29}), .DATA2({1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 
        1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1}), 
        .CONTROL1(N0), .CONTROL2(N28), .Z({N78, N77, N76, N75, N74, N73, N72, 
        N71, N70, N69, N68, N67, N66, N65, N64, N63}) );
  GTECH_BUF B_0 ( .A(N27), .Z(N0) );
  SELECT_OP C141 ( .DATA1(N61), .DATA2(1'b1), .CONTROL1(N0), .CONTROL2(N28), 
        .Z(N79) );
  SELECT_OP C142 ( .DATA1(N79), .DATA2(1'b1), .CONTROL1(N1), .CONTROL2(N2), 
        .Z(N80) );
  GTECH_BUF B_1 ( .A(N9), .Z(N1) );
  GTECH_BUF B_2 ( .A(send_data), .Z(N2) );
  SELECT_OP C143 ( .DATA1(N27), .DATA2(1'b0), .CONTROL1(N1), .CONTROL2(N2), 
        .Z(N81) );
  SELECT_OP C144 ( .DATA1(N62), .DATA2(1'b0), .CONTROL1(N1), .CONTROL2(N2), 
        .Z(N82) );
  SELECT_OP C145 ( .DATA1({N78, N77, N76, N75, N74, N73, N72, N71, N70, N69, 
        N68, N67, N66, N65, N64, N63}), .DATA2({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), 
        .CONTROL1(N1), .CONTROL2(N2), .Z({N98, N97, N96, N95, N94, N93, N92, 
        N91, N90, N89, N88, N87, N86, N85, N84, N83}) );
  SELECT_OP C146 ( .DATA1({N98, N97, N96, N95, N94, N93, N92, N91, N90, N89, 
        N88, N87, N86, N85, N84, N83}), .DATA2({1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 
        1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1}), 
        .CONTROL1(N3), .CONTROL2(N7), .Z({N114, N113, N112, N111, N110, N109, 
        N108, N107, N106, N105, N104, N103, N102, N101, N100, N99}) );
  GTECH_BUF B_3 ( .A(N6), .Z(N3) );
  SELECT_OP C147 ( .DATA1(N80), .DATA2(1'b1), .CONTROL1(N3), .CONTROL2(N7), 
        .Z(N115) );
  SELECT_OP C148 ( .DATA1(N81), .DATA2(1'b0), .CONTROL1(N3), .CONTROL2(N7), 
        .Z(N116) );
  SELECT_OP C149 ( .DATA1(N82), .DATA2(1'b1), .CONTROL1(N3), .CONTROL2(N7), 
        .Z(N117) );
  GTECH_NOT I_4 ( .A(ss), .Z(tip) );
  GTECH_NOT I_5 ( .A(preset_n), .Z(N4) );
  GTECH_BUF B_4 ( .A(preset_n), .Z(N5) );
  GTECH_AND2 C156 ( .A(N125), .B(mstr), .Z(N6) );
  GTECH_OR2 C157 ( .A(N119), .B(N124), .Z(N125) );
  GTECH_AND2 C158 ( .A(N122), .B(N123), .Z(N124) );
  GTECH_NOT I_6 ( .A(spiswai), .Z(N123) );
  GTECH_NOT I_7 ( .A(N6), .Z(N7) );
  GTECH_AND2 C162 ( .A(N5), .B(N6), .Z(N8) );
  GTECH_NOT I_8 ( .A(send_data), .Z(N9) );
  GTECH_AND2 C166 ( .A(N8), .B(N9), .Z(N10) );
  GTECH_NOT I_9 ( .A(N27), .Z(N28) );
  GTECH_AND2 C169 ( .A(N10), .B(N27) );
endmodule

