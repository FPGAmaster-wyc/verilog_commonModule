// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Tue Oct 15 15:45:07 2024
// Host        : DESKTOP-I9U844P running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               E:/Desktop/axi_dma/AXI_DMA_sim_base/AXI_DMA_sim_base.srcs/sources_1/bd/soc/ip/soc_gen_data_0_0/soc_gen_data_0_0_sim_netlist.v
// Design      : soc_gen_data_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "soc_gen_data_0_0,gen_data,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "gen_data,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module soc_gen_data_0_0
   (clk,
    rst_n,
    tdata,
    tvalid,
    tlast);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_BUSIF interface_axis, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN soc_clk_100M, INSERT_VIP 0" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst_n RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input rst_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 interface_axis TDATA" *) output [31:0]tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 interface_axis TVALID" *) output tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 interface_axis TLAST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME interface_axis, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN soc_clk_100M, LAYERED_METADATA undef, INSERT_VIP 0" *) output tlast;

  wire \<const0> ;
  wire clk;
  wire rst_n;
  wire [11:0]\^tdata ;
  wire tlast;
  wire tvalid;

  assign tdata[31] = \<const0> ;
  assign tdata[30] = \<const0> ;
  assign tdata[29] = \<const0> ;
  assign tdata[28] = \<const0> ;
  assign tdata[27] = \<const0> ;
  assign tdata[26] = \<const0> ;
  assign tdata[25] = \<const0> ;
  assign tdata[24] = \<const0> ;
  assign tdata[23] = \<const0> ;
  assign tdata[22] = \<const0> ;
  assign tdata[21] = \<const0> ;
  assign tdata[20] = \<const0> ;
  assign tdata[19] = \<const0> ;
  assign tdata[18] = \<const0> ;
  assign tdata[17] = \<const0> ;
  assign tdata[16] = \<const0> ;
  assign tdata[15] = \<const0> ;
  assign tdata[14] = \<const0> ;
  assign tdata[13] = \<const0> ;
  assign tdata[12] = \<const0> ;
  assign tdata[11:0] = \^tdata [11:0];
  GND GND
       (.G(\<const0> ));
  soc_gen_data_0_0_gen_data inst
       (.clk(clk),
        .rst_n(rst_n),
        .tdata(\^tdata ),
        .tlast(tlast),
        .tvalid(tvalid));
endmodule

(* ORIG_REF_NAME = "gen_data" *) 
module soc_gen_data_0_0_gen_data
   (tdata,
    tlast,
    tvalid,
    clk,
    rst_n);
  output [11:0]tdata;
  output tlast;
  output tvalid;
  input clk;
  input rst_n;

  wire clk;
  wire [11:0]data_cnt;
  wire data_cnt0_carry__0_n_0;
  wire data_cnt0_carry__0_n_1;
  wire data_cnt0_carry__0_n_2;
  wire data_cnt0_carry__0_n_3;
  wire data_cnt0_carry__0_n_4;
  wire data_cnt0_carry__0_n_5;
  wire data_cnt0_carry__0_n_6;
  wire data_cnt0_carry__0_n_7;
  wire data_cnt0_carry__1_n_2;
  wire data_cnt0_carry__1_n_3;
  wire data_cnt0_carry__1_n_5;
  wire data_cnt0_carry__1_n_6;
  wire data_cnt0_carry__1_n_7;
  wire data_cnt0_carry_n_0;
  wire data_cnt0_carry_n_1;
  wire data_cnt0_carry_n_2;
  wire data_cnt0_carry_n_3;
  wire data_cnt0_carry_n_4;
  wire data_cnt0_carry_n_5;
  wire data_cnt0_carry_n_6;
  wire data_cnt0_carry_n_7;
  wire \data_cnt[0]_i_1_n_0 ;
  wire \data_cnt[11]_i_2_n_0 ;
  wire \data_cnt[11]_i_3_n_0 ;
  wire \data_cnt[11]_i_4_n_0 ;
  wire [11:1]data_cnt_1;
  wire [4:0]delay_cnt;
  wire \delay_cnt[0]_i_1_n_0 ;
  wire \delay_cnt[1]_i_1_n_0 ;
  wire \delay_cnt[2]_i_1_n_0 ;
  wire \delay_cnt[3]_i_1_n_0 ;
  wire \delay_cnt[4]_i_1_n_0 ;
  wire [5:0]last_cnt;
  wire \last_cnt[0]_i_1_n_0 ;
  wire [5:1]last_cnt_0;
  wire rst_n;
  wire sending;
  wire sending_i_1_n_0;
  wire [11:0]tdata;
  wire \tdata[11]_i_1_n_0 ;
  wire \tdata[11]_i_2_n_0 ;
  wire tlast;
  wire tvalid;
  wire tvalid_i_1_n_0;
  wire waiting;
  wire waiting_i_1_n_0;
  wire waiting_i_2_n_0;
  wire waiting_reg_n_0;
  wire [3:2]NLW_data_cnt0_carry__1_CO_UNCONNECTED;
  wire [3:3]NLW_data_cnt0_carry__1_O_UNCONNECTED;

  CARRY4 data_cnt0_carry
       (.CI(1'b0),
        .CO({data_cnt0_carry_n_0,data_cnt0_carry_n_1,data_cnt0_carry_n_2,data_cnt0_carry_n_3}),
        .CYINIT(data_cnt[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({data_cnt0_carry_n_4,data_cnt0_carry_n_5,data_cnt0_carry_n_6,data_cnt0_carry_n_7}),
        .S(data_cnt[4:1]));
  CARRY4 data_cnt0_carry__0
       (.CI(data_cnt0_carry_n_0),
        .CO({data_cnt0_carry__0_n_0,data_cnt0_carry__0_n_1,data_cnt0_carry__0_n_2,data_cnt0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({data_cnt0_carry__0_n_4,data_cnt0_carry__0_n_5,data_cnt0_carry__0_n_6,data_cnt0_carry__0_n_7}),
        .S(data_cnt[8:5]));
  CARRY4 data_cnt0_carry__1
       (.CI(data_cnt0_carry__0_n_0),
        .CO({NLW_data_cnt0_carry__1_CO_UNCONNECTED[3:2],data_cnt0_carry__1_n_2,data_cnt0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_data_cnt0_carry__1_O_UNCONNECTED[3],data_cnt0_carry__1_n_5,data_cnt0_carry__1_n_6,data_cnt0_carry__1_n_7}),
        .S({1'b0,data_cnt[11:9]}));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \data_cnt[0]_i_1 
       (.I0(\data_cnt[11]_i_2_n_0 ),
        .I1(data_cnt[0]),
        .O(\data_cnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \data_cnt[10]_i_1 
       (.I0(data_cnt0_carry__1_n_6),
        .I1(\data_cnt[11]_i_2_n_0 ),
        .O(data_cnt_1[10]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \data_cnt[11]_i_1 
       (.I0(data_cnt0_carry__1_n_5),
        .I1(\data_cnt[11]_i_2_n_0 ),
        .O(data_cnt_1[11]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF7FFF)) 
    \data_cnt[11]_i_2 
       (.I0(data_cnt[9]),
        .I1(data_cnt[8]),
        .I2(data_cnt[10]),
        .I3(data_cnt[0]),
        .I4(\data_cnt[11]_i_3_n_0 ),
        .I5(\data_cnt[11]_i_4_n_0 ),
        .O(\data_cnt[11]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFF7F)) 
    \data_cnt[11]_i_3 
       (.I0(data_cnt[2]),
        .I1(data_cnt[3]),
        .I2(data_cnt[1]),
        .I3(data_cnt[11]),
        .O(\data_cnt[11]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \data_cnt[11]_i_4 
       (.I0(data_cnt[6]),
        .I1(data_cnt[7]),
        .I2(data_cnt[4]),
        .I3(data_cnt[5]),
        .O(\data_cnt[11]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \data_cnt[1]_i_1 
       (.I0(data_cnt0_carry_n_7),
        .I1(\data_cnt[11]_i_2_n_0 ),
        .O(data_cnt_1[1]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \data_cnt[2]_i_1 
       (.I0(data_cnt0_carry_n_6),
        .I1(\data_cnt[11]_i_2_n_0 ),
        .O(data_cnt_1[2]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \data_cnt[3]_i_1 
       (.I0(data_cnt0_carry_n_5),
        .I1(\data_cnt[11]_i_2_n_0 ),
        .O(data_cnt_1[3]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \data_cnt[4]_i_1 
       (.I0(data_cnt0_carry_n_4),
        .I1(\data_cnt[11]_i_2_n_0 ),
        .O(data_cnt_1[4]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \data_cnt[5]_i_1 
       (.I0(data_cnt0_carry__0_n_7),
        .I1(\data_cnt[11]_i_2_n_0 ),
        .O(data_cnt_1[5]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \data_cnt[6]_i_1 
       (.I0(data_cnt0_carry__0_n_6),
        .I1(\data_cnt[11]_i_2_n_0 ),
        .O(data_cnt_1[6]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \data_cnt[7]_i_1 
       (.I0(data_cnt0_carry__0_n_5),
        .I1(\data_cnt[11]_i_2_n_0 ),
        .O(data_cnt_1[7]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \data_cnt[8]_i_1 
       (.I0(data_cnt0_carry__0_n_4),
        .I1(\data_cnt[11]_i_2_n_0 ),
        .O(data_cnt_1[8]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \data_cnt[9]_i_1 
       (.I0(data_cnt0_carry__1_n_7),
        .I1(\data_cnt[11]_i_2_n_0 ),
        .O(data_cnt_1[9]));
  FDCE \data_cnt_reg[0] 
       (.C(clk),
        .CE(\tdata[11]_i_1_n_0 ),
        .CLR(\tdata[11]_i_2_n_0 ),
        .D(\data_cnt[0]_i_1_n_0 ),
        .Q(data_cnt[0]));
  FDCE \data_cnt_reg[10] 
       (.C(clk),
        .CE(\tdata[11]_i_1_n_0 ),
        .CLR(\tdata[11]_i_2_n_0 ),
        .D(data_cnt_1[10]),
        .Q(data_cnt[10]));
  FDCE \data_cnt_reg[11] 
       (.C(clk),
        .CE(\tdata[11]_i_1_n_0 ),
        .CLR(\tdata[11]_i_2_n_0 ),
        .D(data_cnt_1[11]),
        .Q(data_cnt[11]));
  FDCE \data_cnt_reg[1] 
       (.C(clk),
        .CE(\tdata[11]_i_1_n_0 ),
        .CLR(\tdata[11]_i_2_n_0 ),
        .D(data_cnt_1[1]),
        .Q(data_cnt[1]));
  FDCE \data_cnt_reg[2] 
       (.C(clk),
        .CE(\tdata[11]_i_1_n_0 ),
        .CLR(\tdata[11]_i_2_n_0 ),
        .D(data_cnt_1[2]),
        .Q(data_cnt[2]));
  FDCE \data_cnt_reg[3] 
       (.C(clk),
        .CE(\tdata[11]_i_1_n_0 ),
        .CLR(\tdata[11]_i_2_n_0 ),
        .D(data_cnt_1[3]),
        .Q(data_cnt[3]));
  FDCE \data_cnt_reg[4] 
       (.C(clk),
        .CE(\tdata[11]_i_1_n_0 ),
        .CLR(\tdata[11]_i_2_n_0 ),
        .D(data_cnt_1[4]),
        .Q(data_cnt[4]));
  FDCE \data_cnt_reg[5] 
       (.C(clk),
        .CE(\tdata[11]_i_1_n_0 ),
        .CLR(\tdata[11]_i_2_n_0 ),
        .D(data_cnt_1[5]),
        .Q(data_cnt[5]));
  FDCE \data_cnt_reg[6] 
       (.C(clk),
        .CE(\tdata[11]_i_1_n_0 ),
        .CLR(\tdata[11]_i_2_n_0 ),
        .D(data_cnt_1[6]),
        .Q(data_cnt[6]));
  FDCE \data_cnt_reg[7] 
       (.C(clk),
        .CE(\tdata[11]_i_1_n_0 ),
        .CLR(\tdata[11]_i_2_n_0 ),
        .D(data_cnt_1[7]),
        .Q(data_cnt[7]));
  FDCE \data_cnt_reg[8] 
       (.C(clk),
        .CE(\tdata[11]_i_1_n_0 ),
        .CLR(\tdata[11]_i_2_n_0 ),
        .D(data_cnt_1[8]),
        .Q(data_cnt[8]));
  FDCE \data_cnt_reg[9] 
       (.C(clk),
        .CE(\tdata[11]_i_1_n_0 ),
        .CLR(\tdata[11]_i_2_n_0 ),
        .D(data_cnt_1[9]),
        .Q(data_cnt[9]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h0000FDFF)) 
    \delay_cnt[0]_i_1 
       (.I0(delay_cnt[4]),
        .I1(delay_cnt[3]),
        .I2(delay_cnt[1]),
        .I3(delay_cnt[2]),
        .I4(delay_cnt[0]),
        .O(\delay_cnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \delay_cnt[1]_i_1 
       (.I0(delay_cnt[0]),
        .I1(delay_cnt[1]),
        .O(\delay_cnt[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h0FFDF000)) 
    \delay_cnt[2]_i_1 
       (.I0(delay_cnt[4]),
        .I1(delay_cnt[3]),
        .I2(delay_cnt[0]),
        .I3(delay_cnt[1]),
        .I4(delay_cnt[2]),
        .O(\delay_cnt[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \delay_cnt[3]_i_1 
       (.I0(delay_cnt[3]),
        .I1(delay_cnt[0]),
        .I2(delay_cnt[1]),
        .I3(delay_cnt[2]),
        .O(\delay_cnt[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h6AA8AAAA)) 
    \delay_cnt[4]_i_1 
       (.I0(delay_cnt[4]),
        .I1(delay_cnt[3]),
        .I2(delay_cnt[0]),
        .I3(delay_cnt[1]),
        .I4(delay_cnt[2]),
        .O(\delay_cnt[4]_i_1_n_0 ));
  FDCE \delay_cnt_reg[0] 
       (.C(clk),
        .CE(waiting_reg_n_0),
        .CLR(\tdata[11]_i_2_n_0 ),
        .D(\delay_cnt[0]_i_1_n_0 ),
        .Q(delay_cnt[0]));
  FDCE \delay_cnt_reg[1] 
       (.C(clk),
        .CE(waiting_reg_n_0),
        .CLR(\tdata[11]_i_2_n_0 ),
        .D(\delay_cnt[1]_i_1_n_0 ),
        .Q(delay_cnt[1]));
  FDCE \delay_cnt_reg[2] 
       (.C(clk),
        .CE(waiting_reg_n_0),
        .CLR(\tdata[11]_i_2_n_0 ),
        .D(\delay_cnt[2]_i_1_n_0 ),
        .Q(delay_cnt[2]));
  FDCE \delay_cnt_reg[3] 
       (.C(clk),
        .CE(waiting_reg_n_0),
        .CLR(\tdata[11]_i_2_n_0 ),
        .D(\delay_cnt[3]_i_1_n_0 ),
        .Q(delay_cnt[3]));
  FDCE \delay_cnt_reg[4] 
       (.C(clk),
        .CE(waiting_reg_n_0),
        .CLR(\tdata[11]_i_2_n_0 ),
        .D(\delay_cnt[4]_i_1_n_0 ),
        .Q(delay_cnt[4]));
  LUT1 #(
    .INIT(2'h1)) 
    \last_cnt[0]_i_1 
       (.I0(last_cnt[0]),
        .O(\last_cnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \last_cnt[1]_i_1 
       (.I0(last_cnt[0]),
        .I1(last_cnt[1]),
        .O(last_cnt_0[1]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \last_cnt[2]_i_1 
       (.I0(last_cnt[2]),
        .I1(last_cnt[0]),
        .I2(last_cnt[1]),
        .O(last_cnt_0[2]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h6CCC)) 
    \last_cnt[3]_i_1 
       (.I0(last_cnt[2]),
        .I1(last_cnt[3]),
        .I2(last_cnt[0]),
        .I3(last_cnt[1]),
        .O(last_cnt_0[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \last_cnt[4]_i_1 
       (.I0(last_cnt[2]),
        .I1(last_cnt[3]),
        .I2(last_cnt[0]),
        .I3(last_cnt[1]),
        .I4(last_cnt[4]),
        .O(last_cnt_0[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \last_cnt[5]_i_1 
       (.I0(last_cnt[2]),
        .I1(last_cnt[3]),
        .I2(last_cnt[0]),
        .I3(last_cnt[1]),
        .I4(last_cnt[4]),
        .I5(last_cnt[5]),
        .O(last_cnt_0[5]));
  FDCE \last_cnt_reg[0] 
       (.C(clk),
        .CE(\tdata[11]_i_1_n_0 ),
        .CLR(\tdata[11]_i_2_n_0 ),
        .D(\last_cnt[0]_i_1_n_0 ),
        .Q(last_cnt[0]));
  FDCE \last_cnt_reg[1] 
       (.C(clk),
        .CE(\tdata[11]_i_1_n_0 ),
        .CLR(\tdata[11]_i_2_n_0 ),
        .D(last_cnt_0[1]),
        .Q(last_cnt[1]));
  FDCE \last_cnt_reg[2] 
       (.C(clk),
        .CE(\tdata[11]_i_1_n_0 ),
        .CLR(\tdata[11]_i_2_n_0 ),
        .D(last_cnt_0[2]),
        .Q(last_cnt[2]));
  FDCE \last_cnt_reg[3] 
       (.C(clk),
        .CE(\tdata[11]_i_1_n_0 ),
        .CLR(\tdata[11]_i_2_n_0 ),
        .D(last_cnt_0[3]),
        .Q(last_cnt[3]));
  FDCE \last_cnt_reg[4] 
       (.C(clk),
        .CE(\tdata[11]_i_1_n_0 ),
        .CLR(\tdata[11]_i_2_n_0 ),
        .D(last_cnt_0[4]),
        .Q(last_cnt[4]));
  FDCE \last_cnt_reg[5] 
       (.C(clk),
        .CE(\tdata[11]_i_1_n_0 ),
        .CLR(\tdata[11]_i_2_n_0 ),
        .D(last_cnt_0[5]),
        .Q(last_cnt[5]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'hC8F8)) 
    sending_i_1
       (.I0(waiting_i_2_n_0),
        .I1(waiting_reg_n_0),
        .I2(sending),
        .I3(waiting),
        .O(sending_i_1_n_0));
  FDCE sending_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(\tdata[11]_i_2_n_0 ),
        .D(sending_i_1_n_0),
        .Q(sending));
  LUT2 #(
    .INIT(4'h2)) 
    \tdata[11]_i_1 
       (.I0(sending),
        .I1(waiting_reg_n_0),
        .O(\tdata[11]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \tdata[11]_i_2 
       (.I0(rst_n),
        .O(\tdata[11]_i_2_n_0 ));
  FDCE \tdata_reg[0] 
       (.C(clk),
        .CE(\tdata[11]_i_1_n_0 ),
        .CLR(\tdata[11]_i_2_n_0 ),
        .D(data_cnt[0]),
        .Q(tdata[0]));
  FDCE \tdata_reg[10] 
       (.C(clk),
        .CE(\tdata[11]_i_1_n_0 ),
        .CLR(\tdata[11]_i_2_n_0 ),
        .D(data_cnt[10]),
        .Q(tdata[10]));
  FDCE \tdata_reg[11] 
       (.C(clk),
        .CE(\tdata[11]_i_1_n_0 ),
        .CLR(\tdata[11]_i_2_n_0 ),
        .D(data_cnt[11]),
        .Q(tdata[11]));
  FDCE \tdata_reg[1] 
       (.C(clk),
        .CE(\tdata[11]_i_1_n_0 ),
        .CLR(\tdata[11]_i_2_n_0 ),
        .D(data_cnt[1]),
        .Q(tdata[1]));
  FDCE \tdata_reg[2] 
       (.C(clk),
        .CE(\tdata[11]_i_1_n_0 ),
        .CLR(\tdata[11]_i_2_n_0 ),
        .D(data_cnt[2]),
        .Q(tdata[2]));
  FDCE \tdata_reg[3] 
       (.C(clk),
        .CE(\tdata[11]_i_1_n_0 ),
        .CLR(\tdata[11]_i_2_n_0 ),
        .D(data_cnt[3]),
        .Q(tdata[3]));
  FDCE \tdata_reg[4] 
       (.C(clk),
        .CE(\tdata[11]_i_1_n_0 ),
        .CLR(\tdata[11]_i_2_n_0 ),
        .D(data_cnt[4]),
        .Q(tdata[4]));
  FDCE \tdata_reg[5] 
       (.C(clk),
        .CE(\tdata[11]_i_1_n_0 ),
        .CLR(\tdata[11]_i_2_n_0 ),
        .D(data_cnt[5]),
        .Q(tdata[5]));
  FDCE \tdata_reg[6] 
       (.C(clk),
        .CE(\tdata[11]_i_1_n_0 ),
        .CLR(\tdata[11]_i_2_n_0 ),
        .D(data_cnt[6]),
        .Q(tdata[6]));
  FDCE \tdata_reg[7] 
       (.C(clk),
        .CE(\tdata[11]_i_1_n_0 ),
        .CLR(\tdata[11]_i_2_n_0 ),
        .D(data_cnt[7]),
        .Q(tdata[7]));
  FDCE \tdata_reg[8] 
       (.C(clk),
        .CE(\tdata[11]_i_1_n_0 ),
        .CLR(\tdata[11]_i_2_n_0 ),
        .D(data_cnt[8]),
        .Q(tdata[8]));
  FDCE \tdata_reg[9] 
       (.C(clk),
        .CE(\tdata[11]_i_1_n_0 ),
        .CLR(\tdata[11]_i_2_n_0 ),
        .D(data_cnt[9]),
        .Q(tdata[9]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    tlast_i_1
       (.I0(last_cnt[3]),
        .I1(last_cnt[5]),
        .I2(last_cnt[4]),
        .I3(last_cnt[2]),
        .I4(last_cnt[0]),
        .I5(last_cnt[1]),
        .O(waiting));
  FDCE tlast_reg
       (.C(clk),
        .CE(\tdata[11]_i_1_n_0 ),
        .CLR(\tdata[11]_i_2_n_0 ),
        .D(waiting),
        .Q(tlast));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h54)) 
    tvalid_i_1
       (.I0(waiting_reg_n_0),
        .I1(sending),
        .I2(tvalid),
        .O(tvalid_i_1_n_0));
  FDCE tvalid_reg
       (.C(clk),
        .CE(1'b1),
        .CLR(\tdata[11]_i_2_n_0 ),
        .D(tvalid_i_1_n_0),
        .Q(tvalid));
  LUT4 #(
    .INIT(16'h7444)) 
    waiting_i_1
       (.I0(waiting_i_2_n_0),
        .I1(waiting_reg_n_0),
        .I2(sending),
        .I3(waiting),
        .O(waiting_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00000020)) 
    waiting_i_2
       (.I0(delay_cnt[2]),
        .I1(delay_cnt[0]),
        .I2(delay_cnt[4]),
        .I3(delay_cnt[3]),
        .I4(delay_cnt[1]),
        .O(waiting_i_2_n_0));
  FDPE waiting_reg
       (.C(clk),
        .CE(1'b1),
        .D(waiting_i_1_n_0),
        .PRE(\tdata[11]_i_2_n_0 ),
        .Q(waiting_reg_n_0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
