/////////////////////////////////////////////////////////////
// Created by: Synopsys Design Compiler(R)
// Version   : X-2025.06
// Date      : Thu Sep 24 09:21:27 2026
/////////////////////////////////////////////////////////////


module shift_register ( pclk, preset_n, ss_n, send_data, lsbfe, cpha, cpol, 
        miso_recv_possclk, miso_recv_negsclk, mosi_send_possclk, 
        mosi_send_negsclk, data_mosi, data_miso, miso, mosi, receive_data );
  input [7:0] data_mosi;
  output [7:0] data_miso;
  input pclk, preset_n, ss_n, send_data, lsbfe, cpha, cpol, miso_recv_possclk,
         miso_recv_negsclk, mosi_send_possclk, mosi_send_negsclk, miso,
         receive_data;
  output mosi;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15,
         N16, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29,
         N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41, N42, N43,
         N44, N45, N46, N47, N48, N49, N50, N51, N52, N53, N54, N55, N56, N57,
         N58, N59, N60, N61, N62, N63, N64, N65, N66, N67, N68, N69, N70, N71,
         N72, N73, N74, N75, N76, N77, N78, N79, N80, N81, N82, N83, N84, N85,
         N86, N87, N88, N89, N90, N91, N92, N93, N94, N95, N96, N97, N98, N99,
         N100, N101, N102, N103, N104, N105, N106, N107, N108, N109, N110,
         N111, N112, N113, N114, N115, N116, N117, N118, N119, N120, N121,
         N122, N123, N124, N125, N126, N127, N128, N129, N130, N131, N132,
         N133, N134, N135, N136, N137, N138, N139, N140, N141, N142, N143,
         N144, N145, N146, N147, N148, N149, N150, N151, N152, N153, N154,
         N155, N156, N157, N158, N159, N160, N161, N162, N163, N164, N165,
         N166, N167, N168, N169, N170, N171, N172, N173, N174, N175, N176,
         N177, N178, N179, N180, N181, N182, N183, N184, N185, N186, N187,
         N188, N189, N190, N191, N192, N193, N194, N195, N196, N197, N198,
         N199, N200, N201, N202, N203, N204, N205, N206, N207, N208, N209,
         N210, N211, N212, N213, N214, N215, N216, N217, N218, N219, N220,
         N221, N222, N223, N224, N225, N226, N227, N228, N229, N230, N231,
         N232, N233, N234, N235, N236, N237, N238, N239, N240, N241, N242,
         N243, N244, N245, N246, N247, N248, N249, N250, N251, N252, N253,
         N254, N255, N256, N257, N258, N259, N260, N261, N262, N263, N264,
         N265, N266, N267, N268, N269, N270, N271, N272, N273, N274, N275,
         N276, N277, N278, N279, N280, N281, N282, N283;
  wire   [7:0] shift_reg;
  wire   [7:0] temp_reg;
  wire   [2:0] count2;
  wire   [2:0] count3;
  wire   [2:0] count;
  wire   [2:0] count1;

  \**SEQGEN**  \shift_reg_reg[7]  ( .clear(N63), .preset(1'b0), .next_state(
        data_mosi[7]), .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(
        shift_reg[7]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(send_data) );
  \**SEQGEN**  \shift_reg_reg[6]  ( .clear(N63), .preset(1'b0), .next_state(
        data_mosi[6]), .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(
        shift_reg[6]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(send_data) );
  \**SEQGEN**  \shift_reg_reg[5]  ( .clear(N63), .preset(1'b0), .next_state(
        data_mosi[5]), .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(
        shift_reg[5]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(send_data) );
  \**SEQGEN**  \shift_reg_reg[4]  ( .clear(N63), .preset(1'b0), .next_state(
        data_mosi[4]), .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(
        shift_reg[4]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(send_data) );
  \**SEQGEN**  \shift_reg_reg[3]  ( .clear(N63), .preset(1'b0), .next_state(
        data_mosi[3]), .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(
        shift_reg[3]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(send_data) );
  \**SEQGEN**  \shift_reg_reg[2]  ( .clear(N63), .preset(1'b0), .next_state(
        data_mosi[2]), .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(
        shift_reg[2]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(send_data) );
  \**SEQGEN**  \shift_reg_reg[1]  ( .clear(N63), .preset(1'b0), .next_state(
        data_mosi[1]), .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(
        shift_reg[1]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(send_data) );
  \**SEQGEN**  \shift_reg_reg[0]  ( .clear(N63), .preset(1'b0), .next_state(
        data_mosi[0]), .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(
        shift_reg[0]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(send_data) );
  \**SEQGEN**  \data_miso_reg[7]  ( .clear(N63), .preset(1'b0), .next_state(
        temp_reg[7]), .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(
        data_miso[7]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(receive_data) );
  \**SEQGEN**  \data_miso_reg[6]  ( .clear(N63), .preset(1'b0), .next_state(
        temp_reg[6]), .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(
        data_miso[6]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(receive_data) );
  \**SEQGEN**  \data_miso_reg[5]  ( .clear(N63), .preset(1'b0), .next_state(
        temp_reg[5]), .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(
        data_miso[5]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(receive_data) );
  \**SEQGEN**  \data_miso_reg[4]  ( .clear(N63), .preset(1'b0), .next_state(
        temp_reg[4]), .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(
        data_miso[4]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(receive_data) );
  \**SEQGEN**  \data_miso_reg[3]  ( .clear(N63), .preset(1'b0), .next_state(
        temp_reg[3]), .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(
        data_miso[3]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(receive_data) );
  \**SEQGEN**  \data_miso_reg[2]  ( .clear(N63), .preset(1'b0), .next_state(
        temp_reg[2]), .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(
        data_miso[2]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(receive_data) );
  \**SEQGEN**  \data_miso_reg[1]  ( .clear(N63), .preset(1'b0), .next_state(
        temp_reg[1]), .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(
        data_miso[1]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(receive_data) );
  \**SEQGEN**  \data_miso_reg[0]  ( .clear(N63), .preset(1'b0), .next_state(
        temp_reg[0]), .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(
        data_miso[0]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(receive_data) );
  \**SEQGEN**  \count3_reg[2]  ( .clear(1'b0), .preset(N63), .next_state(N185), 
        .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(count3[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N230) );
  \**SEQGEN**  \count3_reg[1]  ( .clear(1'b0), .preset(N63), .next_state(N184), 
        .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(count3[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N230) );
  \**SEQGEN**  \count3_reg[0]  ( .clear(1'b0), .preset(N63), .next_state(N183), 
        .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(count3[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N230) );
  \**SEQGEN**  \temp_reg_reg[7]  ( .clear(N63), .preset(1'b0), .next_state(
        miso), .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(
        temp_reg[7]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N193) );
  \**SEQGEN**  \temp_reg_reg[6]  ( .clear(N63), .preset(1'b0), .next_state(
        miso), .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(
        temp_reg[6]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N192) );
  \**SEQGEN**  \temp_reg_reg[5]  ( .clear(N63), .preset(1'b0), .next_state(
        miso), .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(
        temp_reg[5]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N191) );
  \**SEQGEN**  \temp_reg_reg[4]  ( .clear(N63), .preset(1'b0), .next_state(
        miso), .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(
        temp_reg[4]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N190) );
  \**SEQGEN**  \temp_reg_reg[3]  ( .clear(N63), .preset(1'b0), .next_state(
        miso), .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(
        temp_reg[3]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N189) );
  \**SEQGEN**  \temp_reg_reg[2]  ( .clear(N63), .preset(1'b0), .next_state(
        miso), .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(
        temp_reg[2]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N188) );
  \**SEQGEN**  \temp_reg_reg[1]  ( .clear(N63), .preset(1'b0), .next_state(
        miso), .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(
        temp_reg[1]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N187) );
  \**SEQGEN**  \temp_reg_reg[0]  ( .clear(N63), .preset(1'b0), .next_state(
        miso), .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(
        temp_reg[0]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(N186) );
  \**SEQGEN**  \count2_reg[2]  ( .clear(N63), .preset(1'b0), .next_state(N181), 
        .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(count2[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N237) );
  \**SEQGEN**  \count2_reg[1]  ( .clear(N63), .preset(1'b0), .next_state(N180), 
        .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(count2[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N237) );
  \**SEQGEN**  \count2_reg[0]  ( .clear(N63), .preset(1'b0), .next_state(N179), 
        .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(count2[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N237) );
  \**SEQGEN**  \count_reg[2]  ( .clear(N63), .preset(1'b0), .next_state(N220), 
        .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(count[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N242) );
  \**SEQGEN**  \count_reg[1]  ( .clear(N63), .preset(1'b0), .next_state(N219), 
        .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(count[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N242) );
  \**SEQGEN**  \count_reg[0]  ( .clear(N63), .preset(1'b0), .next_state(N218), 
        .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(count[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N242) );
  \**SEQGEN**  \count1_reg[2]  ( .clear(1'b0), .preset(N63), .next_state(N215), 
        .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(count1[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N247) );
  \**SEQGEN**  \count1_reg[1]  ( .clear(1'b0), .preset(N63), .next_state(N214), 
        .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(count1[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N247) );
  \**SEQGEN**  \count1_reg[0]  ( .clear(1'b0), .preset(N63), .next_state(N213), 
        .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(count1[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N247) );
  \**SEQGEN**  mosi_reg ( .clear(N63), .preset(1'b0), .next_state(N217), 
        .clocked_on(pclk), .data_in(1'b0), .enable(1'b0), .Q(mosi), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N221) );
  ADD_UNS_OP add_69 ( .A(count2), .B(1'b1), .Z({N83, N82, N81}) );
  SUB_UNS_OP sub_82 ( .A(count3), .B(1'b1), .Z({N104, N103, N102}) );
  ADD_UNS_OP add_100 ( .A(count2), .B(1'b1), .Z({N133, N132, N131}) );
  SUB_UNS_OP sub_114 ( .A(count3), .B(1'b1), .Z({N154, N153, N152}) );
  ADD_UNS_OP add_151 ( .A(count), .B(1'b1), .Z({N202, N201, N200}) );
  SUB_UNS_OP sub_164 ( .A(count1), .B(1'b1), .Z({N205, N204, N203}) );
  ADD_UNS_OP add_183 ( .A(count), .B(1'b1), .Z({N209, N208, N207}) );
  SUB_UNS_OP sub_196 ( .A(count1), .B(1'b1), .Z({N212, N211, N210}) );
  GTECH_AND2 C731 ( .A(count2[0]), .B(count2[1]), .Z(N248) );
  GTECH_AND2 C732 ( .A(N248), .B(count2[2]), .Z(N80) );
  GTECH_AND2 C733 ( .A(N0), .B(count2[1]), .Z(N249) );
  GTECH_NOT I_0 ( .A(count2[0]), .Z(N0) );
  GTECH_AND2 C734 ( .A(N249), .B(count2[2]), .Z(N79) );
  GTECH_AND2 C735 ( .A(count2[0]), .B(N1), .Z(N250) );
  GTECH_NOT I_1 ( .A(count2[1]), .Z(N1) );
  GTECH_AND2 C736 ( .A(N250), .B(count2[2]), .Z(N78) );
  GTECH_AND2 C737 ( .A(N2), .B(N3), .Z(N251) );
  GTECH_NOT I_2 ( .A(count2[0]), .Z(N2) );
  GTECH_NOT I_3 ( .A(count2[1]), .Z(N3) );
  GTECH_AND2 C738 ( .A(N251), .B(count2[2]), .Z(N77) );
  GTECH_AND2 C739 ( .A(count2[0]), .B(count2[1]), .Z(N252) );
  GTECH_AND2 C740 ( .A(N252), .B(N4), .Z(N76) );
  GTECH_NOT I_4 ( .A(count2[2]), .Z(N4) );
  GTECH_AND2 C741 ( .A(N5), .B(count2[1]), .Z(N253) );
  GTECH_NOT I_5 ( .A(count2[0]), .Z(N5) );
  GTECH_AND2 C742 ( .A(N253), .B(N6), .Z(N75) );
  GTECH_NOT I_6 ( .A(count2[2]), .Z(N6) );
  GTECH_AND2 C743 ( .A(count2[0]), .B(N7), .Z(N254) );
  GTECH_NOT I_7 ( .A(count2[1]), .Z(N7) );
  GTECH_AND2 C744 ( .A(N254), .B(N8), .Z(N74) );
  GTECH_NOT I_8 ( .A(count2[2]), .Z(N8) );
  GTECH_AND2 C745 ( .A(N9), .B(N10), .Z(N255) );
  GTECH_NOT I_9 ( .A(count2[0]), .Z(N9) );
  GTECH_NOT I_10 ( .A(count2[1]), .Z(N10) );
  GTECH_AND2 C746 ( .A(N255), .B(N11), .Z(N73) );
  GTECH_NOT I_11 ( .A(count2[2]), .Z(N11) );
  GTECH_AND2 C747 ( .A(count3[0]), .B(count3[1]), .Z(N256) );
  GTECH_AND2 C748 ( .A(N256), .B(count3[2]), .Z(N101) );
  GTECH_AND2 C749 ( .A(N12), .B(count3[1]), .Z(N257) );
  GTECH_NOT I_12 ( .A(count3[0]), .Z(N12) );
  GTECH_AND2 C750 ( .A(N257), .B(count3[2]), .Z(N100) );
  GTECH_AND2 C751 ( .A(count3[0]), .B(N13), .Z(N258) );
  GTECH_NOT I_13 ( .A(count3[1]), .Z(N13) );
  GTECH_AND2 C752 ( .A(N258), .B(count3[2]), .Z(N99) );
  GTECH_AND2 C753 ( .A(N14), .B(N15), .Z(N259) );
  GTECH_NOT I_14 ( .A(count3[0]), .Z(N14) );
  GTECH_NOT I_15 ( .A(count3[1]), .Z(N15) );
  GTECH_AND2 C754 ( .A(N259), .B(count3[2]), .Z(N98) );
  GTECH_AND2 C755 ( .A(count3[0]), .B(count3[1]), .Z(N260) );
  GTECH_AND2 C756 ( .A(N260), .B(N16), .Z(N97) );
  GTECH_NOT I_16 ( .A(count3[2]), .Z(N16) );
  GTECH_AND2 C757 ( .A(N17), .B(count3[1]), .Z(N261) );
  GTECH_NOT I_17 ( .A(count3[0]), .Z(N17) );
  GTECH_AND2 C758 ( .A(N261), .B(N18), .Z(N96) );
  GTECH_NOT I_18 ( .A(count3[2]), .Z(N18) );
  GTECH_AND2 C759 ( .A(count3[0]), .B(N19), .Z(N262) );
  GTECH_NOT I_19 ( .A(count3[1]), .Z(N19) );
  GTECH_AND2 C760 ( .A(N262), .B(N20), .Z(N95) );
  GTECH_NOT I_20 ( .A(count3[2]), .Z(N20) );
  GTECH_AND2 C761 ( .A(N21), .B(N22), .Z(N263) );
  GTECH_NOT I_21 ( .A(count3[0]), .Z(N21) );
  GTECH_NOT I_22 ( .A(count3[1]), .Z(N22) );
  GTECH_AND2 C762 ( .A(N263), .B(N23), .Z(N94) );
  GTECH_NOT I_23 ( .A(count3[2]), .Z(N23) );
  GTECH_AND2 C763 ( .A(count2[0]), .B(count2[1]), .Z(N264) );
  GTECH_AND2 C764 ( .A(N264), .B(count2[2]), .Z(N130) );
  GTECH_AND2 C765 ( .A(N24), .B(count2[1]), .Z(N265) );
  GTECH_NOT I_24 ( .A(count2[0]), .Z(N24) );
  GTECH_AND2 C766 ( .A(N265), .B(count2[2]), .Z(N129) );
  GTECH_AND2 C767 ( .A(count2[0]), .B(N25), .Z(N266) );
  GTECH_NOT I_25 ( .A(count2[1]), .Z(N25) );
  GTECH_AND2 C768 ( .A(N266), .B(count2[2]), .Z(N128) );
  GTECH_AND2 C769 ( .A(N26), .B(N27), .Z(N267) );
  GTECH_NOT I_26 ( .A(count2[0]), .Z(N26) );
  GTECH_NOT I_27 ( .A(count2[1]), .Z(N27) );
  GTECH_AND2 C770 ( .A(N267), .B(count2[2]), .Z(N127) );
  GTECH_AND2 C771 ( .A(count2[0]), .B(count2[1]), .Z(N268) );
  GTECH_AND2 C772 ( .A(N268), .B(N28), .Z(N126) );
  GTECH_NOT I_28 ( .A(count2[2]), .Z(N28) );
  GTECH_AND2 C773 ( .A(N29), .B(count2[1]), .Z(N269) );
  GTECH_NOT I_29 ( .A(count2[0]), .Z(N29) );
  GTECH_AND2 C774 ( .A(N269), .B(N30), .Z(N125) );
  GTECH_NOT I_30 ( .A(count2[2]), .Z(N30) );
  GTECH_AND2 C775 ( .A(count2[0]), .B(N31), .Z(N270) );
  GTECH_NOT I_31 ( .A(count2[1]), .Z(N31) );
  GTECH_AND2 C776 ( .A(N270), .B(N32), .Z(N124) );
  GTECH_NOT I_32 ( .A(count2[2]), .Z(N32) );
  GTECH_AND2 C777 ( .A(N33), .B(N34), .Z(N271) );
  GTECH_NOT I_33 ( .A(count2[0]), .Z(N33) );
  GTECH_NOT I_34 ( .A(count2[1]), .Z(N34) );
  GTECH_AND2 C778 ( .A(N271), .B(N35), .Z(N123) );
  GTECH_NOT I_35 ( .A(count2[2]), .Z(N35) );
  GTECH_AND2 C779 ( .A(count3[0]), .B(count3[1]), .Z(N272) );
  GTECH_AND2 C780 ( .A(N272), .B(count3[2]), .Z(N151) );
  GTECH_AND2 C781 ( .A(N36), .B(count3[1]), .Z(N273) );
  GTECH_NOT I_36 ( .A(count3[0]), .Z(N36) );
  GTECH_AND2 C782 ( .A(N273), .B(count3[2]), .Z(N150) );
  GTECH_AND2 C783 ( .A(count3[0]), .B(N37), .Z(N274) );
  GTECH_NOT I_37 ( .A(count3[1]), .Z(N37) );
  GTECH_AND2 C784 ( .A(N274), .B(count3[2]), .Z(N149) );
  GTECH_AND2 C785 ( .A(N38), .B(N39), .Z(N275) );
  GTECH_NOT I_38 ( .A(count3[0]), .Z(N38) );
  GTECH_NOT I_39 ( .A(count3[1]), .Z(N39) );
  GTECH_AND2 C786 ( .A(N275), .B(count3[2]), .Z(N148) );
  GTECH_AND2 C787 ( .A(count3[0]), .B(count3[1]), .Z(N276) );
  GTECH_AND2 C788 ( .A(N276), .B(N40), .Z(N147) );
  GTECH_NOT I_40 ( .A(count3[2]), .Z(N40) );
  GTECH_AND2 C789 ( .A(N41), .B(count3[1]), .Z(N277) );
  GTECH_NOT I_41 ( .A(count3[0]), .Z(N41) );
  GTECH_AND2 C790 ( .A(N277), .B(N42), .Z(N146) );
  GTECH_NOT I_42 ( .A(count3[2]), .Z(N42) );
  GTECH_AND2 C791 ( .A(count3[0]), .B(N43), .Z(N278) );
  GTECH_NOT I_43 ( .A(count3[1]), .Z(N43) );
  GTECH_AND2 C792 ( .A(N278), .B(N44), .Z(N145) );
  GTECH_NOT I_44 ( .A(count3[2]), .Z(N44) );
  GTECH_AND2 C793 ( .A(N45), .B(N46), .Z(N279) );
  GTECH_NOT I_45 ( .A(count3[0]), .Z(N45) );
  GTECH_NOT I_46 ( .A(count3[1]), .Z(N46) );
  GTECH_AND2 C794 ( .A(N279), .B(N47), .Z(N144) );
  GTECH_NOT I_47 ( .A(count3[2]), .Z(N47) );
  SELECT_OP C795 ( .DATA1({N80, N79, N78, N77, N76, N75, N74, N73}), .DATA2({
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CONTROL1(N48), 
        .CONTROL2(N49), .Z({N91, N90, N89, N88, N87, N86, N85, N84}) );
  GTECH_BUF B_0 ( .A(miso_recv_negsclk), .Z(N48) );
  GTECH_BUF B_1 ( .A(N93), .Z(N49) );
  SELECT_OP C796 ( .DATA1({N101, N100, N99, N98, N97, N96, N95, N94}), .DATA2(
        {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CONTROL1(N48), 
        .CONTROL2(N49), .Z({N112, N111, N110, N109, N108, N107, N106, N105})
         );
  SELECT_OP C797 ( .DATA1({N91, N90, N89, N88, N87, N86, N85, N84}), .DATA2({
        N112, N111, N110, N109, N108, N107, N106, N105}), .CONTROL1(N50), 
        .CONTROL2(N196), .Z({N120, N119, N118, N117, N116, N115, N114, N113})
         );
  GTECH_BUF B_2 ( .A(lsbfe), .Z(N50) );
  GTECH_NOT I_48 ( .A(lsbfe), .Z(N182) );
  SELECT_OP C799 ( .DATA1({N130, N129, N128, N127, N126, N125, N124, N123}), 
        .DATA2({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CONTROL1(
        N51), .CONTROL2(N52), .Z({N141, N140, N139, N138, N137, N136, N135, 
        N134}) );
  GTECH_BUF B_3 ( .A(miso_recv_possclk), .Z(N51) );
  GTECH_BUF B_4 ( .A(N143), .Z(N52) );
  SELECT_OP C800 ( .DATA1({N151, N150, N149, N148, N147, N146, N145, N144}), 
        .DATA2({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CONTROL1(
        N51), .CONTROL2(N52), .Z({N162, N161, N160, N159, N158, N157, N156, 
        N155}) );
  SELECT_OP C801 ( .DATA1({N141, N140, N139, N138, N137, N136, N135, N134}), 
        .DATA2({N162, N161, N160, N159, N158, N157, N156, N155}), .CONTROL1(
        N50), .CONTROL2(N196), .Z({N170, N169, N168, N167, N166, N165, N164, 
        N163}) );
  SELECT_OP C802 ( .DATA1({N120, N119, N118, N117, N116, N115, N114, N113}), 
        .DATA2({N170, N169, N168, N167, N166, N165, N164, N163}), .CONTROL1(
        N53), .CONTROL2(N54), .Z({N178, N177, N176, N175, N174, N173, N172, 
        N171}) );
  GTECH_BUF B_5 ( .A(N69), .Z(N53) );
  GTECH_BUF B_6 ( .A(N70), .Z(N54) );
  SELECT_OP C803 ( .DATA1({N83, N82, N81}), .DATA2({N133, N132, N131}), 
        .CONTROL1(N53), .CONTROL2(N54), .Z({N181, N180, N179}) );
  SELECT_OP C804 ( .DATA1({N104, N103, N102}), .DATA2({N154, N153, N152}), 
        .CONTROL1(N53), .CONTROL2(N54), .Z({N185, N184, N183}) );
  SELECT_OP C805 ( .DATA1({N178, N177, N176, N175, N174, N173, N172, N171}), 
        .DATA2({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CONTROL1(
        N55), .CONTROL2(N56), .Z({N193, N192, N191, N190, N189, N188, N187, 
        N186}) );
  GTECH_BUF B_7 ( .A(N67), .Z(N55) );
  GTECH_BUF B_8 ( .A(ss_n), .Z(N56) );
  SELECT_OP C806 ( .DATA1(lsbfe), .DATA2(1'b0), .CONTROL1(N55), .CONTROL2(N56), 
        .Z(N194) );
  SELECT_OP C807 ( .DATA1(N182), .DATA2(1'b0), .CONTROL1(N55), .CONTROL2(N56), 
        .Z(N195) );
  SELECT_OP C808 ( .DATA1(N197), .DATA2(N198), .CONTROL1(N50), .CONTROL2(N196), 
        .Z(N217) );
  SELECT_OP C809 ( .DATA1({N205, N204, N203}), .DATA2({N212, N211, N210}), 
        .CONTROL1(N53), .CONTROL2(N54), .Z({N215, N214, N213}) );
  SELECT_OP C810 ( .DATA1(mosi_send_negsclk), .DATA2(mosi_send_possclk), 
        .CONTROL1(N53), .CONTROL2(N54), .Z(N216) );
  SELECT_OP C811 ( .DATA1({N202, N201, N200}), .DATA2({N209, N208, N207}), 
        .CONTROL1(N53), .CONTROL2(N54), .Z({N220, N219, N218}) );
  SELECT_OP C812 ( .DATA1(N216), .DATA2(1'b0), .CONTROL1(N55), .CONTROL2(N56), 
        .Z(N221) );
  MUX_OP C813 ( .D0(shift_reg[0]), .D1(shift_reg[1]), .D2(shift_reg[2]), .D3(
        shift_reg[3]), .D4(shift_reg[4]), .D5(shift_reg[5]), .D6(shift_reg[6]), 
        .D7(shift_reg[7]), .S0(N57), .S1(N58), .S2(N59), .Z(N197) );
  GTECH_BUF B_9 ( .A(count[0]), .Z(N57) );
  GTECH_BUF B_10 ( .A(count[1]), .Z(N58) );
  GTECH_BUF B_11 ( .A(count[2]), .Z(N59) );
  MUX_OP C814 ( .D0(shift_reg[0]), .D1(shift_reg[1]), .D2(shift_reg[2]), .D3(
        shift_reg[3]), .D4(shift_reg[4]), .D5(shift_reg[5]), .D6(shift_reg[6]), 
        .D7(shift_reg[7]), .S0(N60), .S1(N61), .S2(N62), .Z(N198) );
  GTECH_BUF B_12 ( .A(count1[0]), .Z(N60) );
  GTECH_BUF B_13 ( .A(count1[1]), .Z(N61) );
  GTECH_BUF B_14 ( .A(count1[2]), .Z(N62) );
  GTECH_NOT I_49 ( .A(preset_n), .Z(N63) );
  GTECH_NOT I_50 ( .A(cpha), .Z(N64) );
  GTECH_NOT I_51 ( .A(cpol), .Z(N65) );
  GTECH_BUF B_15 ( .A(preset_n), .Z(N66) );
  GTECH_NOT I_52 ( .A(ss_n), .Z(N67) );
  GTECH_AND2 C829 ( .A(N66), .B(N67), .Z(N68) );
  GTECH_OR2 C830 ( .A(N280), .B(N281), .Z(N69) );
  GTECH_AND2 C831 ( .A(cpol), .B(N64), .Z(N280) );
  GTECH_AND2 C832 ( .A(N65), .B(cpha), .Z(N281) );
  GTECH_OR2 C833 ( .A(N282), .B(N283), .Z(N70) );
  GTECH_AND2 C834 ( .A(N65), .B(N64), .Z(N282) );
  GTECH_AND2 C835 ( .A(cpol), .B(cpha), .Z(N283) );
  GTECH_AND2 C838 ( .A(N68), .B(N69), .Z(N71) );
  GTECH_AND2 C840 ( .A(N71), .B(lsbfe), .Z(N72) );
  GTECH_AND2 C842 ( .A(N72), .B(miso_recv_negsclk) );
  GTECH_AND2 C843 ( .A(N71), .B(N196), .Z(N92) );
  GTECH_NOT I_53 ( .A(miso_recv_negsclk), .Z(N93) );
  GTECH_AND2 C846 ( .A(N92), .B(miso_recv_negsclk) );
  GTECH_AND2 C847 ( .A(N68), .B(N70), .Z(N121) );
  GTECH_AND2 C848 ( .A(N121), .B(lsbfe), .Z(N122) );
  GTECH_AND2 C850 ( .A(N122), .B(miso_recv_possclk) );
  GTECH_AND2 C851 ( .A(N121), .B(N196), .Z(N142) );
  GTECH_NOT I_54 ( .A(miso_recv_possclk), .Z(N143) );
  GTECH_AND2 C854 ( .A(N142), .B(miso_recv_possclk) );
  GTECH_NOT I_55 ( .A(lsbfe), .Z(N196) );
  GTECH_NOT I_56 ( .A(mosi_send_negsclk), .Z(N199) );
  GTECH_AND2 C859 ( .A(N72), .B(mosi_send_negsclk) );
  GTECH_AND2 C860 ( .A(N92), .B(mosi_send_negsclk) );
  GTECH_NOT I_57 ( .A(mosi_send_possclk), .Z(N206) );
  GTECH_AND2 C864 ( .A(N122), .B(mosi_send_possclk) );
  GTECH_AND2 C865 ( .A(N142), .B(mosi_send_possclk) );
  GTECH_AND2 C868 ( .A(N69), .B(N67), .Z(N222) );
  GTECH_AND2 C869 ( .A(N196), .B(N222), .Z(N223) );
  GTECH_AND2 C870 ( .A(N93), .B(N223), .Z(N224) );
  GTECH_AND2 C871 ( .A(N70), .B(N67), .Z(N225) );
  GTECH_AND2 C872 ( .A(N196), .B(N225), .Z(N226) );
  GTECH_AND2 C873 ( .A(N143), .B(N226), .Z(N227) );
  GTECH_OR2 C874 ( .A(N224), .B(N227), .Z(N228) );
  GTECH_NOT I_58 ( .A(N228), .Z(N229) );
  GTECH_AND2 C876 ( .A(N195), .B(N229), .Z(N230) );
  GTECH_AND2 C877 ( .A(lsbfe), .B(N222), .Z(N231) );
  GTECH_AND2 C878 ( .A(N93), .B(N231), .Z(N232) );
  GTECH_AND2 C879 ( .A(lsbfe), .B(N225), .Z(N233) );
  GTECH_AND2 C880 ( .A(N143), .B(N233), .Z(N234) );
  GTECH_OR2 C881 ( .A(N232), .B(N234), .Z(N235) );
  GTECH_NOT I_59 ( .A(N235), .Z(N236) );
  GTECH_AND2 C883 ( .A(N194), .B(N236), .Z(N237) );
  GTECH_AND2 C884 ( .A(N199), .B(N231), .Z(N238) );
  GTECH_AND2 C885 ( .A(N206), .B(N233), .Z(N239) );
  GTECH_OR2 C886 ( .A(N238), .B(N239), .Z(N240) );
  GTECH_NOT I_60 ( .A(N240), .Z(N241) );
  GTECH_AND2 C888 ( .A(N194), .B(N241), .Z(N242) );
  GTECH_AND2 C889 ( .A(N199), .B(N223), .Z(N243) );
  GTECH_AND2 C890 ( .A(N206), .B(N226), .Z(N244) );
  GTECH_OR2 C891 ( .A(N243), .B(N244), .Z(N245) );
  GTECH_NOT I_61 ( .A(N245), .Z(N246) );
  GTECH_AND2 C893 ( .A(N195), .B(N246), .Z(N247) );
endmodule

