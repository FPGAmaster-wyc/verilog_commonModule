// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Tue Oct 15 15:45:08 2024
// Host        : DESKTOP-I9U844P running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               E:/Desktop/axi_dma/AXI_DMA_sim_base/AXI_DMA_sim_base.srcs/sources_1/bd/soc/ip/soc_axi_write_0_0/soc_axi_write_0_0_sim_netlist.v
// Design      : soc_axi_write_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "soc_axi_write_0_0,axi_write,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "axi_write,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module soc_axi_write_0_0
   (S_WR_aclk,
    S_WR_aresetn,
    S_WR_tdata,
    S_WR_tvalid,
    S_WR_tlast,
    S_WR_tready,
    m_axi_aclk,
    m_axi_aresetn,
    m_axi_awid,
    m_axi_awaddr,
    m_axi_awlen,
    m_axi_awsize,
    m_axi_awburst,
    m_axi_awlock,
    m_axi_awcache,
    m_axi_awprot,
    m_axi_awqos,
    m_axi_awvalid,
    m_axi_awready,
    m_axi_wdata,
    m_axi_wstrb,
    m_axi_wlast,
    m_axi_wvalid,
    m_axi_wready,
    m_axi_bid,
    m_axi_bresp,
    m_axi_bvalid,
    m_axi_bready);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 S_WR_aclk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_WR_aclk, ASSOCIATED_BUSIF S_WR, ASSOCIATED_RESET S_WR_aresetn, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN soc_clk_100M, INSERT_VIP 0" *) input S_WR_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 S_WR_aresetn RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_WR_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input S_WR_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_WR TDATA" *) input [31:0]S_WR_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_WR TVALID" *) input S_WR_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_WR TLAST" *) input S_WR_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_WR TREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_WR, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN soc_clk_100M, LAYERED_METADATA undef, INSERT_VIP 0" *) output S_WR_tready;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 m_axi_aclk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axi_aclk, ASSOCIATED_BUSIF m_axi, ASSOCIATED_RESET m_axi_aresetn, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN soc_clk_100M, INSERT_VIP 0" *) input m_axi_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 m_axi_aresetn RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axi_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input m_axi_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi AWID" *) output m_axi_awid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi AWADDR" *) output [31:0]m_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi AWLEN" *) output [7:0]m_axi_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi AWSIZE" *) output [2:0]m_axi_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi AWBURST" *) output [1:0]m_axi_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi AWLOCK" *) output m_axi_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi AWCACHE" *) output [3:0]m_axi_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi AWPROT" *) output [2:0]m_axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi AWQOS" *) output [3:0]m_axi_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi AWVALID" *) output m_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi AWREADY" *) input m_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi WDATA" *) output [31:0]m_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi WSTRB" *) output [3:0]m_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi WLAST" *) output m_axi_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi WVALID" *) output m_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi WREADY" *) input m_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi BID" *) input m_axi_bid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi BRESP" *) input [1:0]m_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi BVALID" *) input m_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi BREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axi, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 1, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE WRITE_ONLY, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 0, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.000, CLK_DOMAIN soc_clk_100M, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) output m_axi_bready;

  wire \<const0> ;
  wire \<const1> ;
  wire S_WR_aclk;
  wire S_WR_aresetn;
  wire [31:0]S_WR_tdata;
  wire S_WR_tready;
  wire S_WR_tvalid;
  wire [28:7]\^m_axi_awaddr ;
  wire [5:5]\^m_axi_awlen ;
  wire m_axi_awready;
  wire m_axi_awvalid;
  wire m_axi_bready;
  wire [31:0]m_axi_wdata;
  wire m_axi_wlast;
  wire m_axi_wready;
  wire m_axi_wvalid;

  assign m_axi_awaddr[31] = \<const0> ;
  assign m_axi_awaddr[30] = \<const0> ;
  assign m_axi_awaddr[29] = \<const0> ;
  assign m_axi_awaddr[28:7] = \^m_axi_awaddr [28:7];
  assign m_axi_awaddr[6] = \<const0> ;
  assign m_axi_awaddr[5] = \<const0> ;
  assign m_axi_awaddr[4] = \<const0> ;
  assign m_axi_awaddr[3] = \<const0> ;
  assign m_axi_awaddr[2] = \<const0> ;
  assign m_axi_awaddr[1] = \<const0> ;
  assign m_axi_awaddr[0] = \<const0> ;
  assign m_axi_awburst[1] = \<const0> ;
  assign m_axi_awburst[0] = \^m_axi_awlen [5];
  assign m_axi_awcache[3] = \<const0> ;
  assign m_axi_awcache[2] = \<const0> ;
  assign m_axi_awcache[1] = \<const1> ;
  assign m_axi_awcache[0] = \<const1> ;
  assign m_axi_awid = \<const0> ;
  assign m_axi_awlen[7] = \<const0> ;
  assign m_axi_awlen[6] = \<const0> ;
  assign m_axi_awlen[5] = \^m_axi_awlen [5];
  assign m_axi_awlen[4] = \^m_axi_awlen [5];
  assign m_axi_awlen[3] = \^m_axi_awlen [5];
  assign m_axi_awlen[2] = \^m_axi_awlen [5];
  assign m_axi_awlen[1] = \^m_axi_awlen [5];
  assign m_axi_awlen[0] = \^m_axi_awlen [5];
  assign m_axi_awlock = \<const0> ;
  assign m_axi_awprot[2] = \<const0> ;
  assign m_axi_awprot[1] = \<const0> ;
  assign m_axi_awprot[0] = \<const0> ;
  assign m_axi_awqos[3] = \<const0> ;
  assign m_axi_awqos[2] = \<const0> ;
  assign m_axi_awqos[1] = \<const0> ;
  assign m_axi_awqos[0] = \<const0> ;
  assign m_axi_awsize[2] = \<const0> ;
  assign m_axi_awsize[1] = \^m_axi_awlen [5];
  assign m_axi_awsize[0] = \<const0> ;
  assign m_axi_wstrb[3] = \^m_axi_awlen [5];
  assign m_axi_wstrb[2] = \^m_axi_awlen [5];
  assign m_axi_wstrb[1] = \^m_axi_awlen [5];
  assign m_axi_wstrb[0] = \^m_axi_awlen [5];
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  soc_axi_write_0_0_axi_write inst
       (.S_WR_aclk(S_WR_aclk),
        .S_WR_aresetn(S_WR_aresetn),
        .S_WR_tdata(S_WR_tdata),
        .S_WR_tready(S_WR_tready),
        .S_WR_tvalid(S_WR_tvalid),
        .\aw_len_reg[5]_0 (\^m_axi_awlen ),
        .m_axi_awaddr(\^m_axi_awaddr ),
        .m_axi_awready(m_axi_awready),
        .m_axi_awvalid(m_axi_awvalid),
        .m_axi_bready(m_axi_bready),
        .m_axi_wdata(m_axi_wdata),
        .m_axi_wready(m_axi_wready),
        .w_last_reg_0(m_axi_wlast),
        .w_valid_reg_0(m_axi_wvalid));
endmodule

(* ORIG_REF_NAME = "axi_write" *) 
module soc_axi_write_0_0_axi_write
   (w_last_reg_0,
    m_axi_awaddr,
    m_axi_wdata,
    m_axi_bready,
    \aw_len_reg[5]_0 ,
    w_valid_reg_0,
    S_WR_tready,
    m_axi_awvalid,
    S_WR_aclk,
    S_WR_tdata,
    m_axi_wready,
    S_WR_tvalid,
    m_axi_awready,
    S_WR_aresetn);
  output w_last_reg_0;
  output [21:0]m_axi_awaddr;
  output [31:0]m_axi_wdata;
  output m_axi_bready;
  output \aw_len_reg[5]_0 ;
  output w_valid_reg_0;
  output S_WR_tready;
  output m_axi_awvalid;
  input S_WR_aclk;
  input [31:0]S_WR_tdata;
  input m_axi_wready;
  input S_WR_tvalid;
  input m_axi_awready;
  input S_WR_aresetn;

  wire \FSM_onehot_c_state[0]_i_1_n_0 ;
  wire \FSM_onehot_c_state[1]_i_1_n_0 ;
  wire \FSM_onehot_c_state[2]_i_1_n_0 ;
  wire \FSM_onehot_c_state[3]_i_1_n_0 ;
  wire \FSM_onehot_c_state[4]_i_1_n_0 ;
  wire \FSM_onehot_c_state_reg_n_0_[0] ;
  wire \FSM_onehot_c_state_reg_n_0_[1] ;
  wire \FSM_onehot_c_state_reg_n_0_[2] ;
  wire \FSM_onehot_c_state_reg_n_0_[3] ;
  wire \FSM_onehot_c_state_reg_n_0_[4] ;
  wire S_WR_aclk;
  wire S_WR_aresetn;
  wire [31:0]S_WR_tdata;
  wire S_WR_tready;
  wire S_WR_tready_INST_0_i_1_n_0;
  wire S_WR_tready_INST_0_i_2_n_0;
  wire S_WR_tready_INST_0_i_3_n_0;
  wire S_WR_tvalid;
  wire \aw_addr[28]_i_2_n_0 ;
  wire [28:7]aw_addr_cnt;
  wire [28:7]aw_addr_cnt0;
  wire aw_addr_cnt0_carry__0_n_0;
  wire aw_addr_cnt0_carry__0_n_1;
  wire aw_addr_cnt0_carry__0_n_2;
  wire aw_addr_cnt0_carry__0_n_3;
  wire aw_addr_cnt0_carry__1_n_0;
  wire aw_addr_cnt0_carry__1_n_1;
  wire aw_addr_cnt0_carry__1_n_2;
  wire aw_addr_cnt0_carry__1_n_3;
  wire aw_addr_cnt0_carry__2_n_0;
  wire aw_addr_cnt0_carry__2_n_1;
  wire aw_addr_cnt0_carry__2_n_2;
  wire aw_addr_cnt0_carry__2_n_3;
  wire aw_addr_cnt0_carry__3_n_0;
  wire aw_addr_cnt0_carry__3_n_1;
  wire aw_addr_cnt0_carry__3_n_2;
  wire aw_addr_cnt0_carry__3_n_3;
  wire aw_addr_cnt0_carry__4_n_3;
  wire aw_addr_cnt0_carry_i_1_n_0;
  wire aw_addr_cnt0_carry_n_0;
  wire aw_addr_cnt0_carry_n_1;
  wire aw_addr_cnt0_carry_n_2;
  wire aw_addr_cnt0_carry_n_3;
  wire aw_addr_cnt1;
  wire \aw_addr_cnt[10]_i_1_n_0 ;
  wire \aw_addr_cnt[11]_i_1_n_0 ;
  wire \aw_addr_cnt[12]_i_1_n_0 ;
  wire \aw_addr_cnt[13]_i_1_n_0 ;
  wire \aw_addr_cnt[14]_i_1_n_0 ;
  wire \aw_addr_cnt[15]_i_1_n_0 ;
  wire \aw_addr_cnt[16]_i_1_n_0 ;
  wire \aw_addr_cnt[17]_i_1_n_0 ;
  wire \aw_addr_cnt[18]_i_1_n_0 ;
  wire \aw_addr_cnt[19]_i_1_n_0 ;
  wire \aw_addr_cnt[20]_i_1_n_0 ;
  wire \aw_addr_cnt[21]_i_1_n_0 ;
  wire \aw_addr_cnt[22]_i_1_n_0 ;
  wire \aw_addr_cnt[23]_i_1_n_0 ;
  wire \aw_addr_cnt[24]_i_1_n_0 ;
  wire \aw_addr_cnt[25]_i_1_n_0 ;
  wire \aw_addr_cnt[26]_i_1_n_0 ;
  wire \aw_addr_cnt[27]_i_1_n_0 ;
  wire \aw_addr_cnt[28]_i_1_n_0 ;
  wire \aw_addr_cnt[28]_i_4_n_0 ;
  wire \aw_addr_cnt[28]_i_5_n_0 ;
  wire \aw_addr_cnt[28]_i_6_n_0 ;
  wire \aw_addr_cnt[28]_i_7_n_0 ;
  wire \aw_addr_cnt[28]_i_8_n_0 ;
  wire \aw_addr_cnt[7]_i_1_n_0 ;
  wire \aw_addr_cnt[8]_i_1_n_0 ;
  wire \aw_addr_cnt[9]_i_1_n_0 ;
  wire aw_burst;
  wire \aw_len_reg[5]_0 ;
  wire aw_valid_i_1_n_0;
  wire [21:0]m_axi_awaddr;
  wire m_axi_awready;
  wire m_axi_awvalid;
  wire m_axi_bready;
  wire [31:0]m_axi_wdata;
  wire m_axi_wready;
  wire n_state3;
  wire n_state3_carry__0_n_0;
  wire n_state3_carry__0_n_1;
  wire n_state3_carry__0_n_2;
  wire n_state3_carry__0_n_3;
  wire n_state3_carry__1_n_2;
  wire n_state3_carry__1_n_3;
  wire n_state3_carry_i_1_n_0;
  wire n_state3_carry_i_2_n_0;
  wire n_state3_carry_i_3_n_0;
  wire n_state3_carry_i_4_n_0;
  wire n_state3_carry_n_0;
  wire n_state3_carry_n_1;
  wire n_state3_carry_n_2;
  wire n_state3_carry_n_3;
  wire \number_cnt[0]_i_1_n_0 ;
  wire \number_cnt[0]_i_3_n_0 ;
  wire \number_cnt[0]_i_4_n_0 ;
  wire \number_cnt[0]_i_5_n_0 ;
  wire \number_cnt[0]_i_6_n_0 ;
  wire \number_cnt[0]_i_7_n_0 ;
  wire \number_cnt[4]_i_2_n_0 ;
  wire \number_cnt[4]_i_3_n_0 ;
  wire \number_cnt[4]_i_4_n_0 ;
  wire \number_cnt[4]_i_5_n_0 ;
  wire \number_cnt[8]_i_2_n_0 ;
  wire \number_cnt[8]_i_3_n_0 ;
  wire \number_cnt[8]_i_4_n_0 ;
  wire \number_cnt[8]_i_5_n_0 ;
  wire [11:0]number_cnt_reg;
  wire \number_cnt_reg[0]_i_2_n_0 ;
  wire \number_cnt_reg[0]_i_2_n_1 ;
  wire \number_cnt_reg[0]_i_2_n_2 ;
  wire \number_cnt_reg[0]_i_2_n_3 ;
  wire \number_cnt_reg[0]_i_2_n_4 ;
  wire \number_cnt_reg[0]_i_2_n_5 ;
  wire \number_cnt_reg[0]_i_2_n_6 ;
  wire \number_cnt_reg[0]_i_2_n_7 ;
  wire \number_cnt_reg[4]_i_1_n_0 ;
  wire \number_cnt_reg[4]_i_1_n_1 ;
  wire \number_cnt_reg[4]_i_1_n_2 ;
  wire \number_cnt_reg[4]_i_1_n_3 ;
  wire \number_cnt_reg[4]_i_1_n_4 ;
  wire \number_cnt_reg[4]_i_1_n_5 ;
  wire \number_cnt_reg[4]_i_1_n_6 ;
  wire \number_cnt_reg[4]_i_1_n_7 ;
  wire \number_cnt_reg[8]_i_1_n_1 ;
  wire \number_cnt_reg[8]_i_1_n_2 ;
  wire \number_cnt_reg[8]_i_1_n_3 ;
  wire \number_cnt_reg[8]_i_1_n_4 ;
  wire \number_cnt_reg[8]_i_1_n_5 ;
  wire \number_cnt_reg[8]_i_1_n_6 ;
  wire \number_cnt_reg[8]_i_1_n_7 ;
  wire [28:28]p_1_in;
  wire p_1_in_0;
  wire \w_data[31]_i_1_n_0 ;
  wire w_last_i_1_n_0;
  wire w_last_reg_0;
  wire w_valid_i_1_n_0;
  wire w_valid_reg_0;
  wire [3:1]NLW_aw_addr_cnt0_carry__4_CO_UNCONNECTED;
  wire [3:2]NLW_aw_addr_cnt0_carry__4_O_UNCONNECTED;
  wire [3:0]NLW_n_state3_carry_O_UNCONNECTED;
  wire [3:0]NLW_n_state3_carry__0_O_UNCONNECTED;
  wire [3:3]NLW_n_state3_carry__1_CO_UNCONNECTED;
  wire [3:0]NLW_n_state3_carry__1_O_UNCONNECTED;
  wire [3:3]\NLW_number_cnt_reg[8]_i_1_CO_UNCONNECTED ;

  LUT3 #(
    .INIT(8'hBA)) 
    \FSM_onehot_c_state[0]_i_1 
       (.I0(\FSM_onehot_c_state_reg_n_0_[4] ),
        .I1(S_WR_tvalid),
        .I2(\FSM_onehot_c_state_reg_n_0_[0] ),
        .O(\FSM_onehot_c_state[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8F88)) 
    \FSM_onehot_c_state[1]_i_1 
       (.I0(S_WR_tvalid),
        .I1(\FSM_onehot_c_state_reg_n_0_[0] ),
        .I2(m_axi_awready),
        .I3(\FSM_onehot_c_state_reg_n_0_[1] ),
        .O(\FSM_onehot_c_state[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8FFFFFFF88888888)) 
    \FSM_onehot_c_state[2]_i_1 
       (.I0(m_axi_awready),
        .I1(\FSM_onehot_c_state_reg_n_0_[1] ),
        .I2(m_axi_wready),
        .I3(w_valid_reg_0),
        .I4(n_state3),
        .I5(\FSM_onehot_c_state_reg_n_0_[2] ),
        .O(\FSM_onehot_c_state[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8FFFFFFF88000000)) 
    \FSM_onehot_c_state[3]_i_1 
       (.I0(n_state3),
        .I1(\FSM_onehot_c_state_reg_n_0_[2] ),
        .I2(w_last_reg_0),
        .I3(m_axi_wready),
        .I4(w_valid_reg_0),
        .I5(\FSM_onehot_c_state_reg_n_0_[3] ),
        .O(\FSM_onehot_c_state[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \FSM_onehot_c_state[4]_i_1 
       (.I0(\FSM_onehot_c_state_reg_n_0_[3] ),
        .I1(w_valid_reg_0),
        .I2(m_axi_wready),
        .I3(w_last_reg_0),
        .O(\FSM_onehot_c_state[4]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "WR_IDLE:00001,WR_ADDR:00010,WR_DATA:00100,WR_LAST:01000,WR_STOP:10000" *) 
  FDPE #(
    .INIT(1'b1)) 
    \FSM_onehot_c_state_reg[0] 
       (.C(S_WR_aclk),
        .CE(1'b1),
        .D(\FSM_onehot_c_state[0]_i_1_n_0 ),
        .PRE(\aw_addr[28]_i_2_n_0 ),
        .Q(\FSM_onehot_c_state_reg_n_0_[0] ));
  (* FSM_ENCODED_STATES = "WR_IDLE:00001,WR_ADDR:00010,WR_DATA:00100,WR_LAST:01000,WR_STOP:10000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_c_state_reg[1] 
       (.C(S_WR_aclk),
        .CE(1'b1),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(\FSM_onehot_c_state[1]_i_1_n_0 ),
        .Q(\FSM_onehot_c_state_reg_n_0_[1] ));
  (* FSM_ENCODED_STATES = "WR_IDLE:00001,WR_ADDR:00010,WR_DATA:00100,WR_LAST:01000,WR_STOP:10000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_c_state_reg[2] 
       (.C(S_WR_aclk),
        .CE(1'b1),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(\FSM_onehot_c_state[2]_i_1_n_0 ),
        .Q(\FSM_onehot_c_state_reg_n_0_[2] ));
  (* FSM_ENCODED_STATES = "WR_IDLE:00001,WR_ADDR:00010,WR_DATA:00100,WR_LAST:01000,WR_STOP:10000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_c_state_reg[3] 
       (.C(S_WR_aclk),
        .CE(1'b1),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(\FSM_onehot_c_state[3]_i_1_n_0 ),
        .Q(\FSM_onehot_c_state_reg_n_0_[3] ));
  (* FSM_ENCODED_STATES = "WR_IDLE:00001,WR_ADDR:00010,WR_DATA:00100,WR_LAST:01000,WR_STOP:10000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_c_state_reg[4] 
       (.C(S_WR_aclk),
        .CE(1'b1),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(\FSM_onehot_c_state[4]_i_1_n_0 ),
        .Q(\FSM_onehot_c_state_reg_n_0_[4] ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0820)) 
    S_WR_tready_INST_0
       (.I0(m_axi_wready),
        .I1(S_WR_tready_INST_0_i_1_n_0),
        .I2(S_WR_tready_INST_0_i_2_n_0),
        .I3(S_WR_tready_INST_0_i_3_n_0),
        .O(S_WR_tready));
  LUT6 #(
    .INIT(64'hFFFFAEEEAEEEAEEE)) 
    S_WR_tready_INST_0_i_1
       (.I0(\FSM_onehot_c_state_reg_n_0_[1] ),
        .I1(\FSM_onehot_c_state_reg_n_0_[2] ),
        .I2(n_state3),
        .I3(p_1_in_0),
        .I4(\FSM_onehot_c_state_reg_n_0_[0] ),
        .I5(S_WR_tvalid),
        .O(S_WR_tready_INST_0_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hEAAAAAAA)) 
    S_WR_tready_INST_0_i_2
       (.I0(\FSM_onehot_c_state_reg_n_0_[3] ),
        .I1(m_axi_wready),
        .I2(w_valid_reg_0),
        .I3(n_state3),
        .I4(\FSM_onehot_c_state_reg_n_0_[2] ),
        .O(S_WR_tready_INST_0_i_2_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFF707070)) 
    S_WR_tready_INST_0_i_3
       (.I0(p_1_in_0),
        .I1(n_state3),
        .I2(\FSM_onehot_c_state_reg_n_0_[2] ),
        .I3(\FSM_onehot_c_state_reg_n_0_[1] ),
        .I4(m_axi_awready),
        .I5(\FSM_onehot_c_state[4]_i_1_n_0 ),
        .O(S_WR_tready_INST_0_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h8)) 
    S_WR_tready_INST_0_i_4
       (.I0(w_valid_reg_0),
        .I1(m_axi_wready),
        .O(p_1_in_0));
  LUT3 #(
    .INIT(8'h02)) 
    \aw_addr[28]_i_1 
       (.I0(S_WR_tready_INST_0_i_1_n_0),
        .I1(S_WR_tready_INST_0_i_2_n_0),
        .I2(S_WR_tready_INST_0_i_3_n_0),
        .O(aw_burst));
  LUT1 #(
    .INIT(2'h1)) 
    \aw_addr[28]_i_2 
       (.I0(S_WR_aresetn),
        .O(\aw_addr[28]_i_2_n_0 ));
  CARRY4 aw_addr_cnt0_carry
       (.CI(1'b0),
        .CO({aw_addr_cnt0_carry_n_0,aw_addr_cnt0_carry_n_1,aw_addr_cnt0_carry_n_2,aw_addr_cnt0_carry_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,aw_addr_cnt[8],1'b0}),
        .O(aw_addr_cnt0[10:7]),
        .S({aw_addr_cnt[10:9],aw_addr_cnt0_carry_i_1_n_0,aw_addr_cnt[7]}));
  CARRY4 aw_addr_cnt0_carry__0
       (.CI(aw_addr_cnt0_carry_n_0),
        .CO({aw_addr_cnt0_carry__0_n_0,aw_addr_cnt0_carry__0_n_1,aw_addr_cnt0_carry__0_n_2,aw_addr_cnt0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(aw_addr_cnt0[14:11]),
        .S(aw_addr_cnt[14:11]));
  CARRY4 aw_addr_cnt0_carry__1
       (.CI(aw_addr_cnt0_carry__0_n_0),
        .CO({aw_addr_cnt0_carry__1_n_0,aw_addr_cnt0_carry__1_n_1,aw_addr_cnt0_carry__1_n_2,aw_addr_cnt0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(aw_addr_cnt0[18:15]),
        .S(aw_addr_cnt[18:15]));
  CARRY4 aw_addr_cnt0_carry__2
       (.CI(aw_addr_cnt0_carry__1_n_0),
        .CO({aw_addr_cnt0_carry__2_n_0,aw_addr_cnt0_carry__2_n_1,aw_addr_cnt0_carry__2_n_2,aw_addr_cnt0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(aw_addr_cnt0[22:19]),
        .S(aw_addr_cnt[22:19]));
  CARRY4 aw_addr_cnt0_carry__3
       (.CI(aw_addr_cnt0_carry__2_n_0),
        .CO({aw_addr_cnt0_carry__3_n_0,aw_addr_cnt0_carry__3_n_1,aw_addr_cnt0_carry__3_n_2,aw_addr_cnt0_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(aw_addr_cnt0[26:23]),
        .S(aw_addr_cnt[26:23]));
  CARRY4 aw_addr_cnt0_carry__4
       (.CI(aw_addr_cnt0_carry__3_n_0),
        .CO({NLW_aw_addr_cnt0_carry__4_CO_UNCONNECTED[3:1],aw_addr_cnt0_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_aw_addr_cnt0_carry__4_O_UNCONNECTED[3:2],aw_addr_cnt0[28:27]}),
        .S({1'b0,1'b0,aw_addr_cnt[28:27]}));
  LUT1 #(
    .INIT(2'h1)) 
    aw_addr_cnt0_carry_i_1
       (.I0(aw_addr_cnt[8]),
        .O(aw_addr_cnt0_carry_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \aw_addr_cnt[10]_i_1 
       (.I0(aw_addr_cnt1),
        .I1(aw_addr_cnt0[10]),
        .O(\aw_addr_cnt[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \aw_addr_cnt[11]_i_1 
       (.I0(aw_addr_cnt1),
        .I1(aw_addr_cnt0[11]),
        .O(\aw_addr_cnt[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \aw_addr_cnt[12]_i_1 
       (.I0(aw_addr_cnt1),
        .I1(aw_addr_cnt0[12]),
        .O(\aw_addr_cnt[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \aw_addr_cnt[13]_i_1 
       (.I0(aw_addr_cnt1),
        .I1(aw_addr_cnt0[13]),
        .O(\aw_addr_cnt[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \aw_addr_cnt[14]_i_1 
       (.I0(aw_addr_cnt1),
        .I1(aw_addr_cnt0[14]),
        .O(\aw_addr_cnt[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \aw_addr_cnt[15]_i_1 
       (.I0(aw_addr_cnt1),
        .I1(aw_addr_cnt0[15]),
        .O(\aw_addr_cnt[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \aw_addr_cnt[16]_i_1 
       (.I0(aw_addr_cnt1),
        .I1(aw_addr_cnt0[16]),
        .O(\aw_addr_cnt[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \aw_addr_cnt[17]_i_1 
       (.I0(aw_addr_cnt1),
        .I1(aw_addr_cnt0[17]),
        .O(\aw_addr_cnt[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \aw_addr_cnt[18]_i_1 
       (.I0(aw_addr_cnt1),
        .I1(aw_addr_cnt0[18]),
        .O(\aw_addr_cnt[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \aw_addr_cnt[19]_i_1 
       (.I0(aw_addr_cnt1),
        .I1(aw_addr_cnt0[19]),
        .O(\aw_addr_cnt[19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \aw_addr_cnt[20]_i_1 
       (.I0(aw_addr_cnt1),
        .I1(aw_addr_cnt0[20]),
        .O(\aw_addr_cnt[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \aw_addr_cnt[21]_i_1 
       (.I0(aw_addr_cnt1),
        .I1(aw_addr_cnt0[21]),
        .O(\aw_addr_cnt[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \aw_addr_cnt[22]_i_1 
       (.I0(aw_addr_cnt1),
        .I1(aw_addr_cnt0[22]),
        .O(\aw_addr_cnt[22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \aw_addr_cnt[23]_i_1 
       (.I0(aw_addr_cnt1),
        .I1(aw_addr_cnt0[23]),
        .O(\aw_addr_cnt[23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \aw_addr_cnt[24]_i_1 
       (.I0(aw_addr_cnt1),
        .I1(aw_addr_cnt0[24]),
        .O(\aw_addr_cnt[24]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \aw_addr_cnt[25]_i_1 
       (.I0(aw_addr_cnt1),
        .I1(aw_addr_cnt0[25]),
        .O(\aw_addr_cnt[25]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \aw_addr_cnt[26]_i_1 
       (.I0(aw_addr_cnt1),
        .I1(aw_addr_cnt0[26]),
        .O(\aw_addr_cnt[26]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \aw_addr_cnt[27]_i_1 
       (.I0(aw_addr_cnt1),
        .I1(aw_addr_cnt0[27]),
        .O(\aw_addr_cnt[27]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h40)) 
    \aw_addr_cnt[28]_i_1 
       (.I0(S_WR_tready_INST_0_i_1_n_0),
        .I1(S_WR_tready_INST_0_i_3_n_0),
        .I2(S_WR_tready_INST_0_i_2_n_0),
        .O(\aw_addr_cnt[28]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \aw_addr_cnt[28]_i_2 
       (.I0(aw_addr_cnt0[28]),
        .I1(aw_addr_cnt1),
        .O(p_1_in));
  LUT6 #(
    .INIT(64'h00000001FFFFFFFF)) 
    \aw_addr_cnt[28]_i_3 
       (.I0(\aw_addr_cnt[28]_i_4_n_0 ),
        .I1(\aw_addr_cnt[28]_i_5_n_0 ),
        .I2(\aw_addr_cnt[28]_i_6_n_0 ),
        .I3(\aw_addr_cnt[28]_i_7_n_0 ),
        .I4(\aw_addr_cnt[28]_i_8_n_0 ),
        .I5(aw_addr_cnt[28]),
        .O(aw_addr_cnt1));
  LUT5 #(
    .INIT(32'h80000000)) 
    \aw_addr_cnt[28]_i_4 
       (.I0(aw_addr_cnt[8]),
        .I1(aw_addr_cnt[11]),
        .I2(aw_addr_cnt[12]),
        .I3(aw_addr_cnt[9]),
        .I4(aw_addr_cnt[10]),
        .O(\aw_addr_cnt[28]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \aw_addr_cnt[28]_i_5 
       (.I0(aw_addr_cnt[17]),
        .I1(aw_addr_cnt[16]),
        .I2(aw_addr_cnt[19]),
        .I3(aw_addr_cnt[18]),
        .O(\aw_addr_cnt[28]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hFE)) 
    \aw_addr_cnt[28]_i_6 
       (.I0(aw_addr_cnt[13]),
        .I1(aw_addr_cnt[15]),
        .I2(aw_addr_cnt[14]),
        .O(\aw_addr_cnt[28]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \aw_addr_cnt[28]_i_7 
       (.I0(aw_addr_cnt[25]),
        .I1(aw_addr_cnt[24]),
        .I2(aw_addr_cnt[27]),
        .I3(aw_addr_cnt[26]),
        .O(\aw_addr_cnt[28]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \aw_addr_cnt[28]_i_8 
       (.I0(aw_addr_cnt[21]),
        .I1(aw_addr_cnt[20]),
        .I2(aw_addr_cnt[23]),
        .I3(aw_addr_cnt[22]),
        .O(\aw_addr_cnt[28]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \aw_addr_cnt[7]_i_1 
       (.I0(aw_addr_cnt1),
        .I1(aw_addr_cnt0[7]),
        .O(\aw_addr_cnt[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \aw_addr_cnt[8]_i_1 
       (.I0(aw_addr_cnt1),
        .I1(aw_addr_cnt0[8]),
        .O(\aw_addr_cnt[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \aw_addr_cnt[9]_i_1 
       (.I0(aw_addr_cnt1),
        .I1(aw_addr_cnt0[9]),
        .O(\aw_addr_cnt[9]_i_1_n_0 ));
  FDCE \aw_addr_cnt_reg[10] 
       (.C(S_WR_aclk),
        .CE(\aw_addr_cnt[28]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(\aw_addr_cnt[10]_i_1_n_0 ),
        .Q(aw_addr_cnt[10]));
  FDCE \aw_addr_cnt_reg[11] 
       (.C(S_WR_aclk),
        .CE(\aw_addr_cnt[28]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(\aw_addr_cnt[11]_i_1_n_0 ),
        .Q(aw_addr_cnt[11]));
  FDCE \aw_addr_cnt_reg[12] 
       (.C(S_WR_aclk),
        .CE(\aw_addr_cnt[28]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(\aw_addr_cnt[12]_i_1_n_0 ),
        .Q(aw_addr_cnt[12]));
  FDCE \aw_addr_cnt_reg[13] 
       (.C(S_WR_aclk),
        .CE(\aw_addr_cnt[28]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(\aw_addr_cnt[13]_i_1_n_0 ),
        .Q(aw_addr_cnt[13]));
  FDCE \aw_addr_cnt_reg[14] 
       (.C(S_WR_aclk),
        .CE(\aw_addr_cnt[28]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(\aw_addr_cnt[14]_i_1_n_0 ),
        .Q(aw_addr_cnt[14]));
  FDCE \aw_addr_cnt_reg[15] 
       (.C(S_WR_aclk),
        .CE(\aw_addr_cnt[28]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(\aw_addr_cnt[15]_i_1_n_0 ),
        .Q(aw_addr_cnt[15]));
  FDCE \aw_addr_cnt_reg[16] 
       (.C(S_WR_aclk),
        .CE(\aw_addr_cnt[28]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(\aw_addr_cnt[16]_i_1_n_0 ),
        .Q(aw_addr_cnt[16]));
  FDCE \aw_addr_cnt_reg[17] 
       (.C(S_WR_aclk),
        .CE(\aw_addr_cnt[28]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(\aw_addr_cnt[17]_i_1_n_0 ),
        .Q(aw_addr_cnt[17]));
  FDCE \aw_addr_cnt_reg[18] 
       (.C(S_WR_aclk),
        .CE(\aw_addr_cnt[28]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(\aw_addr_cnt[18]_i_1_n_0 ),
        .Q(aw_addr_cnt[18]));
  FDCE \aw_addr_cnt_reg[19] 
       (.C(S_WR_aclk),
        .CE(\aw_addr_cnt[28]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(\aw_addr_cnt[19]_i_1_n_0 ),
        .Q(aw_addr_cnt[19]));
  FDCE \aw_addr_cnt_reg[20] 
       (.C(S_WR_aclk),
        .CE(\aw_addr_cnt[28]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(\aw_addr_cnt[20]_i_1_n_0 ),
        .Q(aw_addr_cnt[20]));
  FDCE \aw_addr_cnt_reg[21] 
       (.C(S_WR_aclk),
        .CE(\aw_addr_cnt[28]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(\aw_addr_cnt[21]_i_1_n_0 ),
        .Q(aw_addr_cnt[21]));
  FDCE \aw_addr_cnt_reg[22] 
       (.C(S_WR_aclk),
        .CE(\aw_addr_cnt[28]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(\aw_addr_cnt[22]_i_1_n_0 ),
        .Q(aw_addr_cnt[22]));
  FDCE \aw_addr_cnt_reg[23] 
       (.C(S_WR_aclk),
        .CE(\aw_addr_cnt[28]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(\aw_addr_cnt[23]_i_1_n_0 ),
        .Q(aw_addr_cnt[23]));
  FDCE \aw_addr_cnt_reg[24] 
       (.C(S_WR_aclk),
        .CE(\aw_addr_cnt[28]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(\aw_addr_cnt[24]_i_1_n_0 ),
        .Q(aw_addr_cnt[24]));
  FDCE \aw_addr_cnt_reg[25] 
       (.C(S_WR_aclk),
        .CE(\aw_addr_cnt[28]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(\aw_addr_cnt[25]_i_1_n_0 ),
        .Q(aw_addr_cnt[25]));
  FDCE \aw_addr_cnt_reg[26] 
       (.C(S_WR_aclk),
        .CE(\aw_addr_cnt[28]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(\aw_addr_cnt[26]_i_1_n_0 ),
        .Q(aw_addr_cnt[26]));
  FDCE \aw_addr_cnt_reg[27] 
       (.C(S_WR_aclk),
        .CE(\aw_addr_cnt[28]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(\aw_addr_cnt[27]_i_1_n_0 ),
        .Q(aw_addr_cnt[27]));
  FDPE \aw_addr_cnt_reg[28] 
       (.C(S_WR_aclk),
        .CE(\aw_addr_cnt[28]_i_1_n_0 ),
        .D(p_1_in),
        .PRE(\aw_addr[28]_i_2_n_0 ),
        .Q(aw_addr_cnt[28]));
  FDCE \aw_addr_cnt_reg[7] 
       (.C(S_WR_aclk),
        .CE(\aw_addr_cnt[28]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(\aw_addr_cnt[7]_i_1_n_0 ),
        .Q(aw_addr_cnt[7]));
  FDCE \aw_addr_cnt_reg[8] 
       (.C(S_WR_aclk),
        .CE(\aw_addr_cnt[28]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(\aw_addr_cnt[8]_i_1_n_0 ),
        .Q(aw_addr_cnt[8]));
  FDCE \aw_addr_cnt_reg[9] 
       (.C(S_WR_aclk),
        .CE(\aw_addr_cnt[28]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(\aw_addr_cnt[9]_i_1_n_0 ),
        .Q(aw_addr_cnt[9]));
  FDCE \aw_addr_reg[10] 
       (.C(S_WR_aclk),
        .CE(aw_burst),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(aw_addr_cnt[10]),
        .Q(m_axi_awaddr[3]));
  FDCE \aw_addr_reg[11] 
       (.C(S_WR_aclk),
        .CE(aw_burst),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(aw_addr_cnt[11]),
        .Q(m_axi_awaddr[4]));
  FDCE \aw_addr_reg[12] 
       (.C(S_WR_aclk),
        .CE(aw_burst),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(aw_addr_cnt[12]),
        .Q(m_axi_awaddr[5]));
  FDCE \aw_addr_reg[13] 
       (.C(S_WR_aclk),
        .CE(aw_burst),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(aw_addr_cnt[13]),
        .Q(m_axi_awaddr[6]));
  FDCE \aw_addr_reg[14] 
       (.C(S_WR_aclk),
        .CE(aw_burst),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(aw_addr_cnt[14]),
        .Q(m_axi_awaddr[7]));
  FDCE \aw_addr_reg[15] 
       (.C(S_WR_aclk),
        .CE(aw_burst),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(aw_addr_cnt[15]),
        .Q(m_axi_awaddr[8]));
  FDCE \aw_addr_reg[16] 
       (.C(S_WR_aclk),
        .CE(aw_burst),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(aw_addr_cnt[16]),
        .Q(m_axi_awaddr[9]));
  FDCE \aw_addr_reg[17] 
       (.C(S_WR_aclk),
        .CE(aw_burst),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(aw_addr_cnt[17]),
        .Q(m_axi_awaddr[10]));
  FDCE \aw_addr_reg[18] 
       (.C(S_WR_aclk),
        .CE(aw_burst),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(aw_addr_cnt[18]),
        .Q(m_axi_awaddr[11]));
  FDCE \aw_addr_reg[19] 
       (.C(S_WR_aclk),
        .CE(aw_burst),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(aw_addr_cnt[19]),
        .Q(m_axi_awaddr[12]));
  FDCE \aw_addr_reg[20] 
       (.C(S_WR_aclk),
        .CE(aw_burst),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(aw_addr_cnt[20]),
        .Q(m_axi_awaddr[13]));
  FDCE \aw_addr_reg[21] 
       (.C(S_WR_aclk),
        .CE(aw_burst),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(aw_addr_cnt[21]),
        .Q(m_axi_awaddr[14]));
  FDCE \aw_addr_reg[22] 
       (.C(S_WR_aclk),
        .CE(aw_burst),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(aw_addr_cnt[22]),
        .Q(m_axi_awaddr[15]));
  FDCE \aw_addr_reg[23] 
       (.C(S_WR_aclk),
        .CE(aw_burst),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(aw_addr_cnt[23]),
        .Q(m_axi_awaddr[16]));
  FDCE \aw_addr_reg[24] 
       (.C(S_WR_aclk),
        .CE(aw_burst),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(aw_addr_cnt[24]),
        .Q(m_axi_awaddr[17]));
  FDCE \aw_addr_reg[25] 
       (.C(S_WR_aclk),
        .CE(aw_burst),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(aw_addr_cnt[25]),
        .Q(m_axi_awaddr[18]));
  FDCE \aw_addr_reg[26] 
       (.C(S_WR_aclk),
        .CE(aw_burst),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(aw_addr_cnt[26]),
        .Q(m_axi_awaddr[19]));
  FDCE \aw_addr_reg[27] 
       (.C(S_WR_aclk),
        .CE(aw_burst),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(aw_addr_cnt[27]),
        .Q(m_axi_awaddr[20]));
  FDCE \aw_addr_reg[28] 
       (.C(S_WR_aclk),
        .CE(aw_burst),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(aw_addr_cnt[28]),
        .Q(m_axi_awaddr[21]));
  FDCE \aw_addr_reg[7] 
       (.C(S_WR_aclk),
        .CE(aw_burst),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(aw_addr_cnt[7]),
        .Q(m_axi_awaddr[0]));
  FDCE \aw_addr_reg[8] 
       (.C(S_WR_aclk),
        .CE(aw_burst),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(aw_addr_cnt[8]),
        .Q(m_axi_awaddr[1]));
  FDCE \aw_addr_reg[9] 
       (.C(S_WR_aclk),
        .CE(aw_burst),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(aw_addr_cnt[9]),
        .Q(m_axi_awaddr[2]));
  FDCE \aw_len_reg[5] 
       (.C(S_WR_aclk),
        .CE(aw_burst),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(1'b1),
        .Q(\aw_len_reg[5]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hF704)) 
    aw_valid_i_1
       (.I0(S_WR_tready_INST_0_i_3_n_0),
        .I1(S_WR_tready_INST_0_i_1_n_0),
        .I2(S_WR_tready_INST_0_i_2_n_0),
        .I3(m_axi_awvalid),
        .O(aw_valid_i_1_n_0));
  FDCE aw_valid_reg
       (.C(S_WR_aclk),
        .CE(1'b1),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(aw_valid_i_1_n_0),
        .Q(m_axi_awvalid));
  FDCE b_ready_reg
       (.C(S_WR_aclk),
        .CE(1'b1),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(1'b1),
        .Q(m_axi_bready));
  CARRY4 n_state3_carry
       (.CI(1'b0),
        .CO({n_state3_carry_n_0,n_state3_carry_n_1,n_state3_carry_n_2,n_state3_carry_n_3}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_n_state3_carry_O_UNCONNECTED[3:0]),
        .S({n_state3_carry_i_1_n_0,n_state3_carry_i_2_n_0,n_state3_carry_i_3_n_0,n_state3_carry_i_4_n_0}));
  CARRY4 n_state3_carry__0
       (.CI(n_state3_carry_n_0),
        .CO({n_state3_carry__0_n_0,n_state3_carry__0_n_1,n_state3_carry__0_n_2,n_state3_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_n_state3_carry__0_O_UNCONNECTED[3:0]),
        .S({\aw_len_reg[5]_0 ,\aw_len_reg[5]_0 ,\aw_len_reg[5]_0 ,\aw_len_reg[5]_0 }));
  CARRY4 n_state3_carry__1
       (.CI(n_state3_carry__0_n_0),
        .CO({NLW_n_state3_carry__1_CO_UNCONNECTED[3],n_state3,n_state3_carry__1_n_2,n_state3_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_n_state3_carry__1_O_UNCONNECTED[3:0]),
        .S({1'b0,\aw_len_reg[5]_0 ,\aw_len_reg[5]_0 ,\aw_len_reg[5]_0 }));
  LUT4 #(
    .INIT(16'h2004)) 
    n_state3_carry_i_1
       (.I0(number_cnt_reg[9]),
        .I1(\aw_len_reg[5]_0 ),
        .I2(number_cnt_reg[11]),
        .I3(number_cnt_reg[10]),
        .O(n_state3_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h2004)) 
    n_state3_carry_i_2
       (.I0(number_cnt_reg[6]),
        .I1(\aw_len_reg[5]_0 ),
        .I2(number_cnt_reg[8]),
        .I3(number_cnt_reg[7]),
        .O(n_state3_carry_i_2_n_0));
  LUT3 #(
    .INIT(8'h80)) 
    n_state3_carry_i_3
       (.I0(number_cnt_reg[3]),
        .I1(number_cnt_reg[5]),
        .I2(number_cnt_reg[4]),
        .O(n_state3_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h6000)) 
    n_state3_carry_i_4
       (.I0(number_cnt_reg[0]),
        .I1(\aw_len_reg[5]_0 ),
        .I2(number_cnt_reg[2]),
        .I3(number_cnt_reg[1]),
        .O(n_state3_carry_i_4_n_0));
  LUT3 #(
    .INIT(8'hEA)) 
    \number_cnt[0]_i_1 
       (.I0(w_last_reg_0),
        .I1(m_axi_wready),
        .I2(w_valid_reg_0),
        .O(\number_cnt[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \number_cnt[0]_i_3 
       (.I0(number_cnt_reg[0]),
        .I1(w_last_reg_0),
        .O(\number_cnt[0]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \number_cnt[0]_i_4 
       (.I0(number_cnt_reg[3]),
        .I1(w_last_reg_0),
        .O(\number_cnt[0]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \number_cnt[0]_i_5 
       (.I0(number_cnt_reg[2]),
        .I1(w_last_reg_0),
        .O(\number_cnt[0]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \number_cnt[0]_i_6 
       (.I0(number_cnt_reg[1]),
        .I1(w_last_reg_0),
        .O(\number_cnt[0]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \number_cnt[0]_i_7 
       (.I0(number_cnt_reg[0]),
        .I1(w_last_reg_0),
        .O(\number_cnt[0]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \number_cnt[4]_i_2 
       (.I0(number_cnt_reg[7]),
        .I1(w_last_reg_0),
        .O(\number_cnt[4]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \number_cnt[4]_i_3 
       (.I0(number_cnt_reg[6]),
        .I1(w_last_reg_0),
        .O(\number_cnt[4]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \number_cnt[4]_i_4 
       (.I0(number_cnt_reg[5]),
        .I1(w_last_reg_0),
        .O(\number_cnt[4]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \number_cnt[4]_i_5 
       (.I0(number_cnt_reg[4]),
        .I1(w_last_reg_0),
        .O(\number_cnt[4]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \number_cnt[8]_i_2 
       (.I0(number_cnt_reg[11]),
        .I1(w_last_reg_0),
        .O(\number_cnt[8]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \number_cnt[8]_i_3 
       (.I0(number_cnt_reg[10]),
        .I1(w_last_reg_0),
        .O(\number_cnt[8]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \number_cnt[8]_i_4 
       (.I0(number_cnt_reg[9]),
        .I1(w_last_reg_0),
        .O(\number_cnt[8]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \number_cnt[8]_i_5 
       (.I0(number_cnt_reg[8]),
        .I1(w_last_reg_0),
        .O(\number_cnt[8]_i_5_n_0 ));
  FDCE \number_cnt_reg[0] 
       (.C(S_WR_aclk),
        .CE(\number_cnt[0]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(\number_cnt_reg[0]_i_2_n_7 ),
        .Q(number_cnt_reg[0]));
  CARRY4 \number_cnt_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\number_cnt_reg[0]_i_2_n_0 ,\number_cnt_reg[0]_i_2_n_1 ,\number_cnt_reg[0]_i_2_n_2 ,\number_cnt_reg[0]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\number_cnt[0]_i_3_n_0 }),
        .O({\number_cnt_reg[0]_i_2_n_4 ,\number_cnt_reg[0]_i_2_n_5 ,\number_cnt_reg[0]_i_2_n_6 ,\number_cnt_reg[0]_i_2_n_7 }),
        .S({\number_cnt[0]_i_4_n_0 ,\number_cnt[0]_i_5_n_0 ,\number_cnt[0]_i_6_n_0 ,\number_cnt[0]_i_7_n_0 }));
  FDCE \number_cnt_reg[10] 
       (.C(S_WR_aclk),
        .CE(\number_cnt[0]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(\number_cnt_reg[8]_i_1_n_5 ),
        .Q(number_cnt_reg[10]));
  FDCE \number_cnt_reg[11] 
       (.C(S_WR_aclk),
        .CE(\number_cnt[0]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(\number_cnt_reg[8]_i_1_n_4 ),
        .Q(number_cnt_reg[11]));
  FDCE \number_cnt_reg[1] 
       (.C(S_WR_aclk),
        .CE(\number_cnt[0]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(\number_cnt_reg[0]_i_2_n_6 ),
        .Q(number_cnt_reg[1]));
  FDCE \number_cnt_reg[2] 
       (.C(S_WR_aclk),
        .CE(\number_cnt[0]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(\number_cnt_reg[0]_i_2_n_5 ),
        .Q(number_cnt_reg[2]));
  FDCE \number_cnt_reg[3] 
       (.C(S_WR_aclk),
        .CE(\number_cnt[0]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(\number_cnt_reg[0]_i_2_n_4 ),
        .Q(number_cnt_reg[3]));
  FDCE \number_cnt_reg[4] 
       (.C(S_WR_aclk),
        .CE(\number_cnt[0]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(\number_cnt_reg[4]_i_1_n_7 ),
        .Q(number_cnt_reg[4]));
  CARRY4 \number_cnt_reg[4]_i_1 
       (.CI(\number_cnt_reg[0]_i_2_n_0 ),
        .CO({\number_cnt_reg[4]_i_1_n_0 ,\number_cnt_reg[4]_i_1_n_1 ,\number_cnt_reg[4]_i_1_n_2 ,\number_cnt_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\number_cnt_reg[4]_i_1_n_4 ,\number_cnt_reg[4]_i_1_n_5 ,\number_cnt_reg[4]_i_1_n_6 ,\number_cnt_reg[4]_i_1_n_7 }),
        .S({\number_cnt[4]_i_2_n_0 ,\number_cnt[4]_i_3_n_0 ,\number_cnt[4]_i_4_n_0 ,\number_cnt[4]_i_5_n_0 }));
  FDCE \number_cnt_reg[5] 
       (.C(S_WR_aclk),
        .CE(\number_cnt[0]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(\number_cnt_reg[4]_i_1_n_6 ),
        .Q(number_cnt_reg[5]));
  FDCE \number_cnt_reg[6] 
       (.C(S_WR_aclk),
        .CE(\number_cnt[0]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(\number_cnt_reg[4]_i_1_n_5 ),
        .Q(number_cnt_reg[6]));
  FDCE \number_cnt_reg[7] 
       (.C(S_WR_aclk),
        .CE(\number_cnt[0]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(\number_cnt_reg[4]_i_1_n_4 ),
        .Q(number_cnt_reg[7]));
  FDCE \number_cnt_reg[8] 
       (.C(S_WR_aclk),
        .CE(\number_cnt[0]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(\number_cnt_reg[8]_i_1_n_7 ),
        .Q(number_cnt_reg[8]));
  CARRY4 \number_cnt_reg[8]_i_1 
       (.CI(\number_cnt_reg[4]_i_1_n_0 ),
        .CO({\NLW_number_cnt_reg[8]_i_1_CO_UNCONNECTED [3],\number_cnt_reg[8]_i_1_n_1 ,\number_cnt_reg[8]_i_1_n_2 ,\number_cnt_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\number_cnt_reg[8]_i_1_n_4 ,\number_cnt_reg[8]_i_1_n_5 ,\number_cnt_reg[8]_i_1_n_6 ,\number_cnt_reg[8]_i_1_n_7 }),
        .S({\number_cnt[8]_i_2_n_0 ,\number_cnt[8]_i_3_n_0 ,\number_cnt[8]_i_4_n_0 ,\number_cnt[8]_i_5_n_0 }));
  FDCE \number_cnt_reg[9] 
       (.C(S_WR_aclk),
        .CE(\number_cnt[0]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(\number_cnt_reg[8]_i_1_n_6 ),
        .Q(number_cnt_reg[9]));
  LUT5 #(
    .INIT(32'h03008000)) 
    \w_data[31]_i_1 
       (.I0(m_axi_wready),
        .I1(S_WR_tready_INST_0_i_3_n_0),
        .I2(S_WR_tready_INST_0_i_1_n_0),
        .I3(S_WR_tvalid),
        .I4(S_WR_tready_INST_0_i_2_n_0),
        .O(\w_data[31]_i_1_n_0 ));
  FDCE \w_data_reg[0] 
       (.C(S_WR_aclk),
        .CE(\w_data[31]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(S_WR_tdata[0]),
        .Q(m_axi_wdata[0]));
  FDCE \w_data_reg[10] 
       (.C(S_WR_aclk),
        .CE(\w_data[31]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(S_WR_tdata[10]),
        .Q(m_axi_wdata[10]));
  FDCE \w_data_reg[11] 
       (.C(S_WR_aclk),
        .CE(\w_data[31]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(S_WR_tdata[11]),
        .Q(m_axi_wdata[11]));
  FDCE \w_data_reg[12] 
       (.C(S_WR_aclk),
        .CE(\w_data[31]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(S_WR_tdata[12]),
        .Q(m_axi_wdata[12]));
  FDCE \w_data_reg[13] 
       (.C(S_WR_aclk),
        .CE(\w_data[31]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(S_WR_tdata[13]),
        .Q(m_axi_wdata[13]));
  FDCE \w_data_reg[14] 
       (.C(S_WR_aclk),
        .CE(\w_data[31]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(S_WR_tdata[14]),
        .Q(m_axi_wdata[14]));
  FDCE \w_data_reg[15] 
       (.C(S_WR_aclk),
        .CE(\w_data[31]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(S_WR_tdata[15]),
        .Q(m_axi_wdata[15]));
  FDCE \w_data_reg[16] 
       (.C(S_WR_aclk),
        .CE(\w_data[31]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(S_WR_tdata[16]),
        .Q(m_axi_wdata[16]));
  FDCE \w_data_reg[17] 
       (.C(S_WR_aclk),
        .CE(\w_data[31]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(S_WR_tdata[17]),
        .Q(m_axi_wdata[17]));
  FDCE \w_data_reg[18] 
       (.C(S_WR_aclk),
        .CE(\w_data[31]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(S_WR_tdata[18]),
        .Q(m_axi_wdata[18]));
  FDCE \w_data_reg[19] 
       (.C(S_WR_aclk),
        .CE(\w_data[31]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(S_WR_tdata[19]),
        .Q(m_axi_wdata[19]));
  FDCE \w_data_reg[1] 
       (.C(S_WR_aclk),
        .CE(\w_data[31]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(S_WR_tdata[1]),
        .Q(m_axi_wdata[1]));
  FDCE \w_data_reg[20] 
       (.C(S_WR_aclk),
        .CE(\w_data[31]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(S_WR_tdata[20]),
        .Q(m_axi_wdata[20]));
  FDCE \w_data_reg[21] 
       (.C(S_WR_aclk),
        .CE(\w_data[31]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(S_WR_tdata[21]),
        .Q(m_axi_wdata[21]));
  FDCE \w_data_reg[22] 
       (.C(S_WR_aclk),
        .CE(\w_data[31]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(S_WR_tdata[22]),
        .Q(m_axi_wdata[22]));
  FDCE \w_data_reg[23] 
       (.C(S_WR_aclk),
        .CE(\w_data[31]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(S_WR_tdata[23]),
        .Q(m_axi_wdata[23]));
  FDCE \w_data_reg[24] 
       (.C(S_WR_aclk),
        .CE(\w_data[31]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(S_WR_tdata[24]),
        .Q(m_axi_wdata[24]));
  FDCE \w_data_reg[25] 
       (.C(S_WR_aclk),
        .CE(\w_data[31]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(S_WR_tdata[25]),
        .Q(m_axi_wdata[25]));
  FDCE \w_data_reg[26] 
       (.C(S_WR_aclk),
        .CE(\w_data[31]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(S_WR_tdata[26]),
        .Q(m_axi_wdata[26]));
  FDCE \w_data_reg[27] 
       (.C(S_WR_aclk),
        .CE(\w_data[31]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(S_WR_tdata[27]),
        .Q(m_axi_wdata[27]));
  FDCE \w_data_reg[28] 
       (.C(S_WR_aclk),
        .CE(\w_data[31]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(S_WR_tdata[28]),
        .Q(m_axi_wdata[28]));
  FDCE \w_data_reg[29] 
       (.C(S_WR_aclk),
        .CE(\w_data[31]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(S_WR_tdata[29]),
        .Q(m_axi_wdata[29]));
  FDCE \w_data_reg[2] 
       (.C(S_WR_aclk),
        .CE(\w_data[31]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(S_WR_tdata[2]),
        .Q(m_axi_wdata[2]));
  FDCE \w_data_reg[30] 
       (.C(S_WR_aclk),
        .CE(\w_data[31]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(S_WR_tdata[30]),
        .Q(m_axi_wdata[30]));
  FDCE \w_data_reg[31] 
       (.C(S_WR_aclk),
        .CE(\w_data[31]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(S_WR_tdata[31]),
        .Q(m_axi_wdata[31]));
  FDCE \w_data_reg[3] 
       (.C(S_WR_aclk),
        .CE(\w_data[31]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(S_WR_tdata[3]),
        .Q(m_axi_wdata[3]));
  FDCE \w_data_reg[4] 
       (.C(S_WR_aclk),
        .CE(\w_data[31]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(S_WR_tdata[4]),
        .Q(m_axi_wdata[4]));
  FDCE \w_data_reg[5] 
       (.C(S_WR_aclk),
        .CE(\w_data[31]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(S_WR_tdata[5]),
        .Q(m_axi_wdata[5]));
  FDCE \w_data_reg[6] 
       (.C(S_WR_aclk),
        .CE(\w_data[31]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(S_WR_tdata[6]),
        .Q(m_axi_wdata[6]));
  FDCE \w_data_reg[7] 
       (.C(S_WR_aclk),
        .CE(\w_data[31]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(S_WR_tdata[7]),
        .Q(m_axi_wdata[7]));
  FDCE \w_data_reg[8] 
       (.C(S_WR_aclk),
        .CE(\w_data[31]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(S_WR_tdata[8]),
        .Q(m_axi_wdata[8]));
  FDCE \w_data_reg[9] 
       (.C(S_WR_aclk),
        .CE(\w_data[31]_i_1_n_0 ),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(S_WR_tdata[9]),
        .Q(m_axi_wdata[9]));
  LUT5 #(
    .INIT(32'hBBFF1000)) 
    w_last_i_1
       (.I0(S_WR_tready_INST_0_i_1_n_0),
        .I1(S_WR_tready_INST_0_i_3_n_0),
        .I2(S_WR_tvalid),
        .I3(S_WR_tready_INST_0_i_2_n_0),
        .I4(w_last_reg_0),
        .O(w_last_i_1_n_0));
  FDCE w_last_reg
       (.C(S_WR_aclk),
        .CE(1'b1),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(w_last_i_1_n_0),
        .Q(w_last_reg_0));
  LUT6 #(
    .INIT(64'hFF50F5FF00508000)) 
    w_valid_i_1
       (.I0(S_WR_tready_INST_0_i_3_n_0),
        .I1(m_axi_wready),
        .I2(S_WR_tvalid),
        .I3(S_WR_tready_INST_0_i_1_n_0),
        .I4(S_WR_tready_INST_0_i_2_n_0),
        .I5(w_valid_reg_0),
        .O(w_valid_i_1_n_0));
  FDCE w_valid_reg
       (.C(S_WR_aclk),
        .CE(1'b1),
        .CLR(\aw_addr[28]_i_2_n_0 ),
        .D(w_valid_i_1_n_0),
        .Q(w_valid_reg_0));
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
