// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Tue Oct 15 15:45:07 2024
// Host        : DESKTOP-I9U844P running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               e:/Desktop/axi_dma/AXI_DMA_sim_base/AXI_DMA_sim_base.srcs/sources_1/bd/soc/ip/soc_axi_read_0_0/soc_axi_read_0_0_sim_netlist.v
// Design      : soc_axi_read_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "soc_axi_read_0_0,axi_read,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "axi_read,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module soc_axi_read_0_0
   (i_wr_done,
    M_RD_aclk,
    M_RD_aresetn,
    M_RD_tlast,
    M_RD_tvalid,
    M_RD_tdata,
    M_RD_tready,
    m_axi_aclk,
    m_axi_aresetn,
    m_axi_arid,
    m_axi_araddr,
    m_axi_arlen,
    m_axi_arsize,
    m_axi_arburst,
    m_axi_arlock,
    m_axi_arcache,
    m_axi_arprot,
    m_axi_arqos,
    m_axi_arvalid,
    m_axi_arready,
    m_axi_rid,
    m_axi_rdata,
    m_axi_rresp,
    m_axi_rlast,
    m_axi_rvalid,
    m_axi_rready);
  input i_wr_done;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 M_RD_aclk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_RD_aclk, ASSOCIATED_BUSIF M_RD, ASSOCIATED_RESET M_RD_aresetn, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN soc_clk_100M, INSERT_VIP 0" *) input M_RD_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 M_RD_aresetn RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_RD_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input M_RD_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_RD TLAST" *) output M_RD_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_RD TVALID" *) output M_RD_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_RD TDATA" *) output [31:0]M_RD_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_RD TREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_RD, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN soc_clk_100M, LAYERED_METADATA undef, INSERT_VIP 0" *) input M_RD_tready;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 m_axi_aclk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axi_aclk, ASSOCIATED_BUSIF m_axi, ASSOCIATED_RESET m_axi_aresetn, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN soc_clk_100M, INSERT_VIP 0" *) input m_axi_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 m_axi_aresetn RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axi_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input m_axi_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi ARID" *) output m_axi_arid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi ARADDR" *) output [31:0]m_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi ARLEN" *) output [7:0]m_axi_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi ARSIZE" *) output [2:0]m_axi_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi ARBURST" *) output [1:0]m_axi_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi ARLOCK" *) output m_axi_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi ARCACHE" *) output [3:0]m_axi_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi ARPROT" *) output [2:0]m_axi_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi ARQOS" *) output [3:0]m_axi_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi ARVALID" *) output m_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi ARREADY" *) input m_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi RID" *) input m_axi_rid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi RDATA" *) input [31:0]m_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi RRESP" *) input [1:0]m_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi RLAST" *) input m_axi_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi RVALID" *) input m_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi RREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axi, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 1, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_ONLY, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 0, HAS_WSTRB 0, HAS_BRESP 0, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.000, CLK_DOMAIN soc_clk_100M, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) output m_axi_rready;

  wire \<const0> ;
  wire \<const1> ;
  wire M_RD_aclk;
  wire M_RD_aresetn;
  wire [31:0]M_RD_tdata;
  wire M_RD_tlast;
  wire M_RD_tready;
  wire M_RD_tvalid;
  wire i_wr_done;
  wire [5:5]\^m_axi_arlen ;
  wire m_axi_arready;
  wire m_axi_arvalid;
  wire [31:0]m_axi_rdata;
  wire m_axi_rready;
  wire m_axi_rvalid;

  assign m_axi_araddr[31] = \<const0> ;
  assign m_axi_araddr[30] = \<const0> ;
  assign m_axi_araddr[29] = \<const0> ;
  assign m_axi_araddr[28] = \<const0> ;
  assign m_axi_araddr[27] = \<const0> ;
  assign m_axi_araddr[26] = \<const0> ;
  assign m_axi_araddr[25] = \<const0> ;
  assign m_axi_araddr[24] = \<const0> ;
  assign m_axi_araddr[23] = \<const0> ;
  assign m_axi_araddr[22] = \<const0> ;
  assign m_axi_araddr[21] = \<const0> ;
  assign m_axi_araddr[20] = \<const0> ;
  assign m_axi_araddr[19] = \<const0> ;
  assign m_axi_araddr[18] = \<const0> ;
  assign m_axi_araddr[17] = \<const0> ;
  assign m_axi_araddr[16] = \<const0> ;
  assign m_axi_araddr[15] = \<const0> ;
  assign m_axi_araddr[14] = \<const0> ;
  assign m_axi_araddr[13] = \<const0> ;
  assign m_axi_araddr[12] = \<const0> ;
  assign m_axi_araddr[11] = \<const0> ;
  assign m_axi_araddr[10] = \<const0> ;
  assign m_axi_araddr[9] = \<const0> ;
  assign m_axi_araddr[8] = \<const0> ;
  assign m_axi_araddr[7] = \<const0> ;
  assign m_axi_araddr[6] = \<const0> ;
  assign m_axi_araddr[5] = \<const0> ;
  assign m_axi_araddr[4] = \<const0> ;
  assign m_axi_araddr[3] = \<const0> ;
  assign m_axi_araddr[2] = \<const0> ;
  assign m_axi_araddr[1] = \<const0> ;
  assign m_axi_araddr[0] = \<const0> ;
  assign m_axi_arburst[1] = \<const0> ;
  assign m_axi_arburst[0] = \^m_axi_arlen [5];
  assign m_axi_arcache[3] = \<const0> ;
  assign m_axi_arcache[2] = \<const0> ;
  assign m_axi_arcache[1] = \<const1> ;
  assign m_axi_arcache[0] = \<const1> ;
  assign m_axi_arid = \<const0> ;
  assign m_axi_arlen[7] = \<const0> ;
  assign m_axi_arlen[6] = \<const0> ;
  assign m_axi_arlen[5] = \^m_axi_arlen [5];
  assign m_axi_arlen[4] = \^m_axi_arlen [5];
  assign m_axi_arlen[3] = \^m_axi_arlen [5];
  assign m_axi_arlen[2] = \^m_axi_arlen [5];
  assign m_axi_arlen[1] = \^m_axi_arlen [5];
  assign m_axi_arlen[0] = \^m_axi_arlen [5];
  assign m_axi_arlock = \<const0> ;
  assign m_axi_arprot[2] = \<const0> ;
  assign m_axi_arprot[1] = \<const0> ;
  assign m_axi_arprot[0] = \<const0> ;
  assign m_axi_arqos[3] = \<const0> ;
  assign m_axi_arqos[2] = \<const0> ;
  assign m_axi_arqos[1] = \<const0> ;
  assign m_axi_arqos[0] = \<const0> ;
  assign m_axi_arsize[2] = \<const0> ;
  assign m_axi_arsize[1] = \^m_axi_arlen [5];
  assign m_axi_arsize[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  soc_axi_read_0_0_axi_read inst
       (.M_RD_aclk(M_RD_aclk),
        .M_RD_aresetn(M_RD_aresetn),
        .M_RD_tdata(M_RD_tdata),
        .M_RD_tready(M_RD_tready),
        .\ar_len_reg[5]_0 (\^m_axi_arlen ),
        .i_wr_done(i_wr_done),
        .m_axi_arready(m_axi_arready),
        .m_axi_arvalid(m_axi_arvalid),
        .m_axi_rdata(m_axi_rdata),
        .m_axi_rready(m_axi_rready),
        .m_axi_rvalid(m_axi_rvalid),
        .o_last_reg_0(M_RD_tlast),
        .o_valid_reg_0(M_RD_tvalid));
endmodule

(* ORIG_REF_NAME = "axi_read" *) 
module soc_axi_read_0_0_axi_read
   (o_last_reg_0,
    M_RD_tdata,
    o_valid_reg_0,
    \ar_len_reg[5]_0 ,
    m_axi_rready,
    m_axi_arvalid,
    M_RD_aclk,
    m_axi_rdata,
    M_RD_tready,
    m_axi_arready,
    m_axi_rvalid,
    i_wr_done,
    M_RD_aresetn);
  output o_last_reg_0;
  output [31:0]M_RD_tdata;
  output o_valid_reg_0;
  output \ar_len_reg[5]_0 ;
  output m_axi_rready;
  output m_axi_arvalid;
  input M_RD_aclk;
  input [31:0]m_axi_rdata;
  input M_RD_tready;
  input m_axi_arready;
  input m_axi_rvalid;
  input i_wr_done;
  input M_RD_aresetn;

  wire M_RD_aclk;
  wire M_RD_aresetn;
  wire [31:0]M_RD_tdata;
  wire M_RD_tready;
  wire \ar_len[5]_i_1_n_0 ;
  wire \ar_len_reg[5]_0 ;
  wire ar_size;
  wire ar_valid_i_1_n_0;
  wire ar_valid_i_3_n_0;
  wire [2:0]c_state;
  wire i_wr_done;
  wire m_axi_arready;
  wire m_axi_arvalid;
  wire [31:0]m_axi_rdata;
  wire m_axi_rready;
  wire m_axi_rvalid;
  wire [0:0]n_state;
  wire n_state3;
  wire n_state3_carry__0_i_1_n_0;
  wire n_state3_carry__0_i_2_n_0;
  wire n_state3_carry__0_i_3_n_0;
  wire n_state3_carry__0_i_4_n_0;
  wire n_state3_carry__0_n_0;
  wire n_state3_carry__0_n_1;
  wire n_state3_carry__0_n_2;
  wire n_state3_carry__0_n_3;
  wire n_state3_carry__1_i_1_n_0;
  wire n_state3_carry__1_i_2_n_0;
  wire n_state3_carry__1_i_3_n_0;
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
  wire [2:1]n_state__0;
  wire \num_rd_cnt[0]_i_1_n_0 ;
  wire \num_rd_cnt[0]_i_3_n_0 ;
  wire \num_rd_cnt[0]_i_4_n_0 ;
  wire \num_rd_cnt[0]_i_5_n_0 ;
  wire \num_rd_cnt[0]_i_6_n_0 ;
  wire \num_rd_cnt[0]_i_7_n_0 ;
  wire \num_rd_cnt[12]_i_2_n_0 ;
  wire \num_rd_cnt[12]_i_3_n_0 ;
  wire \num_rd_cnt[12]_i_4_n_0 ;
  wire \num_rd_cnt[12]_i_5_n_0 ;
  wire \num_rd_cnt[16]_i_2_n_0 ;
  wire \num_rd_cnt[16]_i_3_n_0 ;
  wire \num_rd_cnt[16]_i_4_n_0 ;
  wire \num_rd_cnt[16]_i_5_n_0 ;
  wire \num_rd_cnt[20]_i_2_n_0 ;
  wire \num_rd_cnt[20]_i_3_n_0 ;
  wire \num_rd_cnt[20]_i_4_n_0 ;
  wire \num_rd_cnt[20]_i_5_n_0 ;
  wire \num_rd_cnt[24]_i_2_n_0 ;
  wire \num_rd_cnt[24]_i_3_n_0 ;
  wire \num_rd_cnt[24]_i_4_n_0 ;
  wire \num_rd_cnt[24]_i_5_n_0 ;
  wire \num_rd_cnt[28]_i_2_n_0 ;
  wire \num_rd_cnt[28]_i_3_n_0 ;
  wire \num_rd_cnt[28]_i_4_n_0 ;
  wire \num_rd_cnt[28]_i_5_n_0 ;
  wire \num_rd_cnt[4]_i_2_n_0 ;
  wire \num_rd_cnt[4]_i_3_n_0 ;
  wire \num_rd_cnt[4]_i_4_n_0 ;
  wire \num_rd_cnt[4]_i_5_n_0 ;
  wire \num_rd_cnt[8]_i_2_n_0 ;
  wire \num_rd_cnt[8]_i_3_n_0 ;
  wire \num_rd_cnt[8]_i_4_n_0 ;
  wire \num_rd_cnt[8]_i_5_n_0 ;
  wire [31:0]num_rd_cnt_reg;
  wire \num_rd_cnt_reg[0]_i_2_n_0 ;
  wire \num_rd_cnt_reg[0]_i_2_n_1 ;
  wire \num_rd_cnt_reg[0]_i_2_n_2 ;
  wire \num_rd_cnt_reg[0]_i_2_n_3 ;
  wire \num_rd_cnt_reg[0]_i_2_n_4 ;
  wire \num_rd_cnt_reg[0]_i_2_n_5 ;
  wire \num_rd_cnt_reg[0]_i_2_n_6 ;
  wire \num_rd_cnt_reg[0]_i_2_n_7 ;
  wire \num_rd_cnt_reg[12]_i_1_n_0 ;
  wire \num_rd_cnt_reg[12]_i_1_n_1 ;
  wire \num_rd_cnt_reg[12]_i_1_n_2 ;
  wire \num_rd_cnt_reg[12]_i_1_n_3 ;
  wire \num_rd_cnt_reg[12]_i_1_n_4 ;
  wire \num_rd_cnt_reg[12]_i_1_n_5 ;
  wire \num_rd_cnt_reg[12]_i_1_n_6 ;
  wire \num_rd_cnt_reg[12]_i_1_n_7 ;
  wire \num_rd_cnt_reg[16]_i_1_n_0 ;
  wire \num_rd_cnt_reg[16]_i_1_n_1 ;
  wire \num_rd_cnt_reg[16]_i_1_n_2 ;
  wire \num_rd_cnt_reg[16]_i_1_n_3 ;
  wire \num_rd_cnt_reg[16]_i_1_n_4 ;
  wire \num_rd_cnt_reg[16]_i_1_n_5 ;
  wire \num_rd_cnt_reg[16]_i_1_n_6 ;
  wire \num_rd_cnt_reg[16]_i_1_n_7 ;
  wire \num_rd_cnt_reg[20]_i_1_n_0 ;
  wire \num_rd_cnt_reg[20]_i_1_n_1 ;
  wire \num_rd_cnt_reg[20]_i_1_n_2 ;
  wire \num_rd_cnt_reg[20]_i_1_n_3 ;
  wire \num_rd_cnt_reg[20]_i_1_n_4 ;
  wire \num_rd_cnt_reg[20]_i_1_n_5 ;
  wire \num_rd_cnt_reg[20]_i_1_n_6 ;
  wire \num_rd_cnt_reg[20]_i_1_n_7 ;
  wire \num_rd_cnt_reg[24]_i_1_n_0 ;
  wire \num_rd_cnt_reg[24]_i_1_n_1 ;
  wire \num_rd_cnt_reg[24]_i_1_n_2 ;
  wire \num_rd_cnt_reg[24]_i_1_n_3 ;
  wire \num_rd_cnt_reg[24]_i_1_n_4 ;
  wire \num_rd_cnt_reg[24]_i_1_n_5 ;
  wire \num_rd_cnt_reg[24]_i_1_n_6 ;
  wire \num_rd_cnt_reg[24]_i_1_n_7 ;
  wire \num_rd_cnt_reg[28]_i_1_n_1 ;
  wire \num_rd_cnt_reg[28]_i_1_n_2 ;
  wire \num_rd_cnt_reg[28]_i_1_n_3 ;
  wire \num_rd_cnt_reg[28]_i_1_n_4 ;
  wire \num_rd_cnt_reg[28]_i_1_n_5 ;
  wire \num_rd_cnt_reg[28]_i_1_n_6 ;
  wire \num_rd_cnt_reg[28]_i_1_n_7 ;
  wire \num_rd_cnt_reg[4]_i_1_n_0 ;
  wire \num_rd_cnt_reg[4]_i_1_n_1 ;
  wire \num_rd_cnt_reg[4]_i_1_n_2 ;
  wire \num_rd_cnt_reg[4]_i_1_n_3 ;
  wire \num_rd_cnt_reg[4]_i_1_n_4 ;
  wire \num_rd_cnt_reg[4]_i_1_n_5 ;
  wire \num_rd_cnt_reg[4]_i_1_n_6 ;
  wire \num_rd_cnt_reg[4]_i_1_n_7 ;
  wire \num_rd_cnt_reg[8]_i_1_n_0 ;
  wire \num_rd_cnt_reg[8]_i_1_n_1 ;
  wire \num_rd_cnt_reg[8]_i_1_n_2 ;
  wire \num_rd_cnt_reg[8]_i_1_n_3 ;
  wire \num_rd_cnt_reg[8]_i_1_n_4 ;
  wire \num_rd_cnt_reg[8]_i_1_n_5 ;
  wire \num_rd_cnt_reg[8]_i_1_n_6 ;
  wire \num_rd_cnt_reg[8]_i_1_n_7 ;
  wire \o_data[7]_i_1_n_0 ;
  wire o_last_i_1_n_0;
  wire o_last_i_2_n_0;
  wire o_last_i_3_n_0;
  wire o_last_reg_0;
  wire o_valid_i_1_n_0;
  wire o_valid_i_2_n_0;
  wire o_valid_i_3_n_0;
  wire o_valid_reg_0;
  wire [3:0]NLW_n_state3_carry_O_UNCONNECTED;
  wire [3:0]NLW_n_state3_carry__0_O_UNCONNECTED;
  wire [3:3]NLW_n_state3_carry__1_CO_UNCONNECTED;
  wire [3:0]NLW_n_state3_carry__1_O_UNCONNECTED;
  wire [3:3]\NLW_num_rd_cnt_reg[28]_i_1_CO_UNCONNECTED ;

  LUT6 #(
    .INIT(64'hFFFFFFFF10222222)) 
    \FSM_sequential_c_state[0]_i_1 
       (.I0(c_state[0]),
        .I1(o_last_i_3_n_0),
        .I2(n_state3),
        .I3(o_valid_reg_0),
        .I4(M_RD_tready),
        .I5(ar_size),
        .O(n_state));
  LUT6 #(
    .INIT(64'h007F00F0007000F0)) 
    \FSM_sequential_c_state[1]_i_1 
       (.I0(o_valid_reg_0),
        .I1(M_RD_tready),
        .I2(c_state[1]),
        .I3(c_state[2]),
        .I4(c_state[0]),
        .I5(m_axi_arready),
        .O(n_state__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00800000)) 
    \FSM_sequential_c_state[2]_i_1 
       (.I0(o_valid_reg_0),
        .I1(M_RD_tready),
        .I2(c_state[1]),
        .I3(c_state[2]),
        .I4(c_state[0]),
        .O(n_state__0[2]));
  (* FSM_ENCODED_STATES = "WAIT_RD:000,RD_ADDR:001,RD_DATA:010,RD_LAST:011,RD_STOP:100" *) 
  FDCE \FSM_sequential_c_state_reg[0] 
       (.C(M_RD_aclk),
        .CE(1'b1),
        .CLR(o_last_i_2_n_0),
        .D(n_state),
        .Q(c_state[0]));
  (* FSM_ENCODED_STATES = "WAIT_RD:000,RD_ADDR:001,RD_DATA:010,RD_LAST:011,RD_STOP:100" *) 
  FDCE \FSM_sequential_c_state_reg[1] 
       (.C(M_RD_aclk),
        .CE(1'b1),
        .CLR(o_last_i_2_n_0),
        .D(n_state__0[1]),
        .Q(c_state[1]));
  (* FSM_ENCODED_STATES = "WAIT_RD:000,RD_ADDR:001,RD_DATA:010,RD_LAST:011,RD_STOP:100" *) 
  FDCE \FSM_sequential_c_state_reg[2] 
       (.C(M_RD_aclk),
        .CE(1'b1),
        .CLR(o_last_i_2_n_0),
        .D(n_state__0[2]),
        .Q(c_state[2]));
  LUT6 #(
    .INIT(64'hFFFFFFFF00000074)) 
    \ar_len[5]_i_1 
       (.I0(m_axi_arready),
        .I1(c_state[0]),
        .I2(i_wr_done),
        .I3(c_state[1]),
        .I4(c_state[2]),
        .I5(\ar_len_reg[5]_0 ),
        .O(\ar_len[5]_i_1_n_0 ));
  FDCE \ar_len_reg[5] 
       (.C(M_RD_aclk),
        .CE(1'b1),
        .CLR(o_last_i_2_n_0),
        .D(\ar_len[5]_i_1_n_0 ),
        .Q(\ar_len_reg[5]_0 ));
  LUT6 #(
    .INIT(64'hAAAAEFEEAAAA2022)) 
    ar_valid_i_1
       (.I0(ar_size),
        .I1(c_state[0]),
        .I2(ar_valid_i_3_n_0),
        .I3(n_state3),
        .I4(o_last_i_3_n_0),
        .I5(m_axi_arvalid),
        .O(ar_valid_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h00101110)) 
    ar_valid_i_2
       (.I0(c_state[2]),
        .I1(c_state[1]),
        .I2(i_wr_done),
        .I3(c_state[0]),
        .I4(m_axi_arready),
        .O(ar_size));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h7)) 
    ar_valid_i_3
       (.I0(o_valid_reg_0),
        .I1(M_RD_tready),
        .O(ar_valid_i_3_n_0));
  FDCE ar_valid_reg
       (.C(M_RD_aclk),
        .CE(1'b1),
        .CLR(o_last_i_2_n_0),
        .D(ar_valid_i_1_n_0),
        .Q(m_axi_arvalid));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h54440000)) 
    m_axi_rready_INST_0
       (.I0(c_state[2]),
        .I1(c_state[1]),
        .I2(m_axi_arready),
        .I3(c_state[0]),
        .I4(M_RD_tready),
        .O(m_axi_rready));
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
        .S({n_state3_carry__0_i_1_n_0,n_state3_carry__0_i_2_n_0,n_state3_carry__0_i_3_n_0,n_state3_carry__0_i_4_n_0}));
  LUT4 #(
    .INIT(16'h0810)) 
    n_state3_carry__0_i_1
       (.I0(num_rd_cnt_reg[22]),
        .I1(num_rd_cnt_reg[23]),
        .I2(\ar_len_reg[5]_0 ),
        .I3(num_rd_cnt_reg[21]),
        .O(n_state3_carry__0_i_1_n_0));
  LUT4 #(
    .INIT(16'h0810)) 
    n_state3_carry__0_i_2
       (.I0(num_rd_cnt_reg[19]),
        .I1(num_rd_cnt_reg[20]),
        .I2(\ar_len_reg[5]_0 ),
        .I3(num_rd_cnt_reg[18]),
        .O(n_state3_carry__0_i_2_n_0));
  LUT4 #(
    .INIT(16'h0810)) 
    n_state3_carry__0_i_3
       (.I0(num_rd_cnt_reg[16]),
        .I1(num_rd_cnt_reg[17]),
        .I2(\ar_len_reg[5]_0 ),
        .I3(num_rd_cnt_reg[15]),
        .O(n_state3_carry__0_i_3_n_0));
  LUT4 #(
    .INIT(16'h0810)) 
    n_state3_carry__0_i_4
       (.I0(num_rd_cnt_reg[13]),
        .I1(num_rd_cnt_reg[14]),
        .I2(\ar_len_reg[5]_0 ),
        .I3(num_rd_cnt_reg[12]),
        .O(n_state3_carry__0_i_4_n_0));
  CARRY4 n_state3_carry__1
       (.CI(n_state3_carry__0_n_0),
        .CO({NLW_n_state3_carry__1_CO_UNCONNECTED[3],n_state3,n_state3_carry__1_n_2,n_state3_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_n_state3_carry__1_O_UNCONNECTED[3:0]),
        .S({1'b0,n_state3_carry__1_i_1_n_0,n_state3_carry__1_i_2_n_0,n_state3_carry__1_i_3_n_0}));
  LUT3 #(
    .INIT(8'h42)) 
    n_state3_carry__1_i_1
       (.I0(\ar_len_reg[5]_0 ),
        .I1(num_rd_cnt_reg[30]),
        .I2(num_rd_cnt_reg[31]),
        .O(n_state3_carry__1_i_1_n_0));
  LUT4 #(
    .INIT(16'h0810)) 
    n_state3_carry__1_i_2
       (.I0(num_rd_cnt_reg[28]),
        .I1(num_rd_cnt_reg[29]),
        .I2(\ar_len_reg[5]_0 ),
        .I3(num_rd_cnt_reg[27]),
        .O(n_state3_carry__1_i_2_n_0));
  LUT4 #(
    .INIT(16'h0810)) 
    n_state3_carry__1_i_3
       (.I0(num_rd_cnt_reg[25]),
        .I1(num_rd_cnt_reg[26]),
        .I2(\ar_len_reg[5]_0 ),
        .I3(num_rd_cnt_reg[24]),
        .O(n_state3_carry__1_i_3_n_0));
  LUT4 #(
    .INIT(16'h0810)) 
    n_state3_carry_i_1
       (.I0(num_rd_cnt_reg[10]),
        .I1(num_rd_cnt_reg[11]),
        .I2(\ar_len_reg[5]_0 ),
        .I3(num_rd_cnt_reg[9]),
        .O(n_state3_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h0810)) 
    n_state3_carry_i_2
       (.I0(num_rd_cnt_reg[7]),
        .I1(num_rd_cnt_reg[8]),
        .I2(\ar_len_reg[5]_0 ),
        .I3(num_rd_cnt_reg[6]),
        .O(n_state3_carry_i_2_n_0));
  LUT3 #(
    .INIT(8'h80)) 
    n_state3_carry_i_3
       (.I0(num_rd_cnt_reg[5]),
        .I1(num_rd_cnt_reg[4]),
        .I2(num_rd_cnt_reg[3]),
        .O(n_state3_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h0880)) 
    n_state3_carry_i_4
       (.I0(num_rd_cnt_reg[2]),
        .I1(num_rd_cnt_reg[1]),
        .I2(num_rd_cnt_reg[0]),
        .I3(\ar_len_reg[5]_0 ),
        .O(n_state3_carry_i_4_n_0));
  LUT3 #(
    .INIT(8'hEA)) 
    \num_rd_cnt[0]_i_1 
       (.I0(o_last_reg_0),
        .I1(M_RD_tready),
        .I2(o_valid_reg_0),
        .O(\num_rd_cnt[0]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \num_rd_cnt[0]_i_3 
       (.I0(o_last_reg_0),
        .O(\num_rd_cnt[0]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \num_rd_cnt[0]_i_4 
       (.I0(num_rd_cnt_reg[3]),
        .I1(o_last_reg_0),
        .O(\num_rd_cnt[0]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \num_rd_cnt[0]_i_5 
       (.I0(num_rd_cnt_reg[2]),
        .I1(o_last_reg_0),
        .O(\num_rd_cnt[0]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \num_rd_cnt[0]_i_6 
       (.I0(num_rd_cnt_reg[1]),
        .I1(o_last_reg_0),
        .O(\num_rd_cnt[0]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \num_rd_cnt[0]_i_7 
       (.I0(num_rd_cnt_reg[0]),
        .I1(o_last_reg_0),
        .O(\num_rd_cnt[0]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \num_rd_cnt[12]_i_2 
       (.I0(num_rd_cnt_reg[15]),
        .I1(o_last_reg_0),
        .O(\num_rd_cnt[12]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \num_rd_cnt[12]_i_3 
       (.I0(num_rd_cnt_reg[14]),
        .I1(o_last_reg_0),
        .O(\num_rd_cnt[12]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \num_rd_cnt[12]_i_4 
       (.I0(num_rd_cnt_reg[13]),
        .I1(o_last_reg_0),
        .O(\num_rd_cnt[12]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \num_rd_cnt[12]_i_5 
       (.I0(num_rd_cnt_reg[12]),
        .I1(o_last_reg_0),
        .O(\num_rd_cnt[12]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \num_rd_cnt[16]_i_2 
       (.I0(num_rd_cnt_reg[19]),
        .I1(o_last_reg_0),
        .O(\num_rd_cnt[16]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \num_rd_cnt[16]_i_3 
       (.I0(num_rd_cnt_reg[18]),
        .I1(o_last_reg_0),
        .O(\num_rd_cnt[16]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \num_rd_cnt[16]_i_4 
       (.I0(num_rd_cnt_reg[17]),
        .I1(o_last_reg_0),
        .O(\num_rd_cnt[16]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \num_rd_cnt[16]_i_5 
       (.I0(num_rd_cnt_reg[16]),
        .I1(o_last_reg_0),
        .O(\num_rd_cnt[16]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \num_rd_cnt[20]_i_2 
       (.I0(num_rd_cnt_reg[23]),
        .I1(o_last_reg_0),
        .O(\num_rd_cnt[20]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \num_rd_cnt[20]_i_3 
       (.I0(num_rd_cnt_reg[22]),
        .I1(o_last_reg_0),
        .O(\num_rd_cnt[20]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \num_rd_cnt[20]_i_4 
       (.I0(num_rd_cnt_reg[21]),
        .I1(o_last_reg_0),
        .O(\num_rd_cnt[20]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \num_rd_cnt[20]_i_5 
       (.I0(num_rd_cnt_reg[20]),
        .I1(o_last_reg_0),
        .O(\num_rd_cnt[20]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \num_rd_cnt[24]_i_2 
       (.I0(num_rd_cnt_reg[27]),
        .I1(o_last_reg_0),
        .O(\num_rd_cnt[24]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \num_rd_cnt[24]_i_3 
       (.I0(num_rd_cnt_reg[26]),
        .I1(o_last_reg_0),
        .O(\num_rd_cnt[24]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \num_rd_cnt[24]_i_4 
       (.I0(num_rd_cnt_reg[25]),
        .I1(o_last_reg_0),
        .O(\num_rd_cnt[24]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \num_rd_cnt[24]_i_5 
       (.I0(num_rd_cnt_reg[24]),
        .I1(o_last_reg_0),
        .O(\num_rd_cnt[24]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \num_rd_cnt[28]_i_2 
       (.I0(num_rd_cnt_reg[31]),
        .I1(o_last_reg_0),
        .O(\num_rd_cnt[28]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \num_rd_cnt[28]_i_3 
       (.I0(num_rd_cnt_reg[30]),
        .I1(o_last_reg_0),
        .O(\num_rd_cnt[28]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \num_rd_cnt[28]_i_4 
       (.I0(num_rd_cnt_reg[29]),
        .I1(o_last_reg_0),
        .O(\num_rd_cnt[28]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \num_rd_cnt[28]_i_5 
       (.I0(num_rd_cnt_reg[28]),
        .I1(o_last_reg_0),
        .O(\num_rd_cnt[28]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \num_rd_cnt[4]_i_2 
       (.I0(num_rd_cnt_reg[7]),
        .I1(o_last_reg_0),
        .O(\num_rd_cnt[4]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \num_rd_cnt[4]_i_3 
       (.I0(num_rd_cnt_reg[6]),
        .I1(o_last_reg_0),
        .O(\num_rd_cnt[4]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \num_rd_cnt[4]_i_4 
       (.I0(num_rd_cnt_reg[5]),
        .I1(o_last_reg_0),
        .O(\num_rd_cnt[4]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \num_rd_cnt[4]_i_5 
       (.I0(num_rd_cnt_reg[4]),
        .I1(o_last_reg_0),
        .O(\num_rd_cnt[4]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \num_rd_cnt[8]_i_2 
       (.I0(num_rd_cnt_reg[11]),
        .I1(o_last_reg_0),
        .O(\num_rd_cnt[8]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \num_rd_cnt[8]_i_3 
       (.I0(num_rd_cnt_reg[10]),
        .I1(o_last_reg_0),
        .O(\num_rd_cnt[8]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \num_rd_cnt[8]_i_4 
       (.I0(num_rd_cnt_reg[9]),
        .I1(o_last_reg_0),
        .O(\num_rd_cnt[8]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \num_rd_cnt[8]_i_5 
       (.I0(num_rd_cnt_reg[8]),
        .I1(o_last_reg_0),
        .O(\num_rd_cnt[8]_i_5_n_0 ));
  FDCE \num_rd_cnt_reg[0] 
       (.C(M_RD_aclk),
        .CE(\num_rd_cnt[0]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(\num_rd_cnt_reg[0]_i_2_n_7 ),
        .Q(num_rd_cnt_reg[0]));
  CARRY4 \num_rd_cnt_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\num_rd_cnt_reg[0]_i_2_n_0 ,\num_rd_cnt_reg[0]_i_2_n_1 ,\num_rd_cnt_reg[0]_i_2_n_2 ,\num_rd_cnt_reg[0]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\num_rd_cnt[0]_i_3_n_0 }),
        .O({\num_rd_cnt_reg[0]_i_2_n_4 ,\num_rd_cnt_reg[0]_i_2_n_5 ,\num_rd_cnt_reg[0]_i_2_n_6 ,\num_rd_cnt_reg[0]_i_2_n_7 }),
        .S({\num_rd_cnt[0]_i_4_n_0 ,\num_rd_cnt[0]_i_5_n_0 ,\num_rd_cnt[0]_i_6_n_0 ,\num_rd_cnt[0]_i_7_n_0 }));
  FDCE \num_rd_cnt_reg[10] 
       (.C(M_RD_aclk),
        .CE(\num_rd_cnt[0]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(\num_rd_cnt_reg[8]_i_1_n_5 ),
        .Q(num_rd_cnt_reg[10]));
  FDCE \num_rd_cnt_reg[11] 
       (.C(M_RD_aclk),
        .CE(\num_rd_cnt[0]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(\num_rd_cnt_reg[8]_i_1_n_4 ),
        .Q(num_rd_cnt_reg[11]));
  FDCE \num_rd_cnt_reg[12] 
       (.C(M_RD_aclk),
        .CE(\num_rd_cnt[0]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(\num_rd_cnt_reg[12]_i_1_n_7 ),
        .Q(num_rd_cnt_reg[12]));
  CARRY4 \num_rd_cnt_reg[12]_i_1 
       (.CI(\num_rd_cnt_reg[8]_i_1_n_0 ),
        .CO({\num_rd_cnt_reg[12]_i_1_n_0 ,\num_rd_cnt_reg[12]_i_1_n_1 ,\num_rd_cnt_reg[12]_i_1_n_2 ,\num_rd_cnt_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\num_rd_cnt_reg[12]_i_1_n_4 ,\num_rd_cnt_reg[12]_i_1_n_5 ,\num_rd_cnt_reg[12]_i_1_n_6 ,\num_rd_cnt_reg[12]_i_1_n_7 }),
        .S({\num_rd_cnt[12]_i_2_n_0 ,\num_rd_cnt[12]_i_3_n_0 ,\num_rd_cnt[12]_i_4_n_0 ,\num_rd_cnt[12]_i_5_n_0 }));
  FDCE \num_rd_cnt_reg[13] 
       (.C(M_RD_aclk),
        .CE(\num_rd_cnt[0]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(\num_rd_cnt_reg[12]_i_1_n_6 ),
        .Q(num_rd_cnt_reg[13]));
  FDCE \num_rd_cnt_reg[14] 
       (.C(M_RD_aclk),
        .CE(\num_rd_cnt[0]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(\num_rd_cnt_reg[12]_i_1_n_5 ),
        .Q(num_rd_cnt_reg[14]));
  FDCE \num_rd_cnt_reg[15] 
       (.C(M_RD_aclk),
        .CE(\num_rd_cnt[0]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(\num_rd_cnt_reg[12]_i_1_n_4 ),
        .Q(num_rd_cnt_reg[15]));
  FDCE \num_rd_cnt_reg[16] 
       (.C(M_RD_aclk),
        .CE(\num_rd_cnt[0]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(\num_rd_cnt_reg[16]_i_1_n_7 ),
        .Q(num_rd_cnt_reg[16]));
  CARRY4 \num_rd_cnt_reg[16]_i_1 
       (.CI(\num_rd_cnt_reg[12]_i_1_n_0 ),
        .CO({\num_rd_cnt_reg[16]_i_1_n_0 ,\num_rd_cnt_reg[16]_i_1_n_1 ,\num_rd_cnt_reg[16]_i_1_n_2 ,\num_rd_cnt_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\num_rd_cnt_reg[16]_i_1_n_4 ,\num_rd_cnt_reg[16]_i_1_n_5 ,\num_rd_cnt_reg[16]_i_1_n_6 ,\num_rd_cnt_reg[16]_i_1_n_7 }),
        .S({\num_rd_cnt[16]_i_2_n_0 ,\num_rd_cnt[16]_i_3_n_0 ,\num_rd_cnt[16]_i_4_n_0 ,\num_rd_cnt[16]_i_5_n_0 }));
  FDCE \num_rd_cnt_reg[17] 
       (.C(M_RD_aclk),
        .CE(\num_rd_cnt[0]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(\num_rd_cnt_reg[16]_i_1_n_6 ),
        .Q(num_rd_cnt_reg[17]));
  FDCE \num_rd_cnt_reg[18] 
       (.C(M_RD_aclk),
        .CE(\num_rd_cnt[0]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(\num_rd_cnt_reg[16]_i_1_n_5 ),
        .Q(num_rd_cnt_reg[18]));
  FDCE \num_rd_cnt_reg[19] 
       (.C(M_RD_aclk),
        .CE(\num_rd_cnt[0]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(\num_rd_cnt_reg[16]_i_1_n_4 ),
        .Q(num_rd_cnt_reg[19]));
  FDCE \num_rd_cnt_reg[1] 
       (.C(M_RD_aclk),
        .CE(\num_rd_cnt[0]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(\num_rd_cnt_reg[0]_i_2_n_6 ),
        .Q(num_rd_cnt_reg[1]));
  FDCE \num_rd_cnt_reg[20] 
       (.C(M_RD_aclk),
        .CE(\num_rd_cnt[0]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(\num_rd_cnt_reg[20]_i_1_n_7 ),
        .Q(num_rd_cnt_reg[20]));
  CARRY4 \num_rd_cnt_reg[20]_i_1 
       (.CI(\num_rd_cnt_reg[16]_i_1_n_0 ),
        .CO({\num_rd_cnt_reg[20]_i_1_n_0 ,\num_rd_cnt_reg[20]_i_1_n_1 ,\num_rd_cnt_reg[20]_i_1_n_2 ,\num_rd_cnt_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\num_rd_cnt_reg[20]_i_1_n_4 ,\num_rd_cnt_reg[20]_i_1_n_5 ,\num_rd_cnt_reg[20]_i_1_n_6 ,\num_rd_cnt_reg[20]_i_1_n_7 }),
        .S({\num_rd_cnt[20]_i_2_n_0 ,\num_rd_cnt[20]_i_3_n_0 ,\num_rd_cnt[20]_i_4_n_0 ,\num_rd_cnt[20]_i_5_n_0 }));
  FDCE \num_rd_cnt_reg[21] 
       (.C(M_RD_aclk),
        .CE(\num_rd_cnt[0]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(\num_rd_cnt_reg[20]_i_1_n_6 ),
        .Q(num_rd_cnt_reg[21]));
  FDCE \num_rd_cnt_reg[22] 
       (.C(M_RD_aclk),
        .CE(\num_rd_cnt[0]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(\num_rd_cnt_reg[20]_i_1_n_5 ),
        .Q(num_rd_cnt_reg[22]));
  FDCE \num_rd_cnt_reg[23] 
       (.C(M_RD_aclk),
        .CE(\num_rd_cnt[0]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(\num_rd_cnt_reg[20]_i_1_n_4 ),
        .Q(num_rd_cnt_reg[23]));
  FDCE \num_rd_cnt_reg[24] 
       (.C(M_RD_aclk),
        .CE(\num_rd_cnt[0]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(\num_rd_cnt_reg[24]_i_1_n_7 ),
        .Q(num_rd_cnt_reg[24]));
  CARRY4 \num_rd_cnt_reg[24]_i_1 
       (.CI(\num_rd_cnt_reg[20]_i_1_n_0 ),
        .CO({\num_rd_cnt_reg[24]_i_1_n_0 ,\num_rd_cnt_reg[24]_i_1_n_1 ,\num_rd_cnt_reg[24]_i_1_n_2 ,\num_rd_cnt_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\num_rd_cnt_reg[24]_i_1_n_4 ,\num_rd_cnt_reg[24]_i_1_n_5 ,\num_rd_cnt_reg[24]_i_1_n_6 ,\num_rd_cnt_reg[24]_i_1_n_7 }),
        .S({\num_rd_cnt[24]_i_2_n_0 ,\num_rd_cnt[24]_i_3_n_0 ,\num_rd_cnt[24]_i_4_n_0 ,\num_rd_cnt[24]_i_5_n_0 }));
  FDCE \num_rd_cnt_reg[25] 
       (.C(M_RD_aclk),
        .CE(\num_rd_cnt[0]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(\num_rd_cnt_reg[24]_i_1_n_6 ),
        .Q(num_rd_cnt_reg[25]));
  FDCE \num_rd_cnt_reg[26] 
       (.C(M_RD_aclk),
        .CE(\num_rd_cnt[0]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(\num_rd_cnt_reg[24]_i_1_n_5 ),
        .Q(num_rd_cnt_reg[26]));
  FDCE \num_rd_cnt_reg[27] 
       (.C(M_RD_aclk),
        .CE(\num_rd_cnt[0]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(\num_rd_cnt_reg[24]_i_1_n_4 ),
        .Q(num_rd_cnt_reg[27]));
  FDCE \num_rd_cnt_reg[28] 
       (.C(M_RD_aclk),
        .CE(\num_rd_cnt[0]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(\num_rd_cnt_reg[28]_i_1_n_7 ),
        .Q(num_rd_cnt_reg[28]));
  CARRY4 \num_rd_cnt_reg[28]_i_1 
       (.CI(\num_rd_cnt_reg[24]_i_1_n_0 ),
        .CO({\NLW_num_rd_cnt_reg[28]_i_1_CO_UNCONNECTED [3],\num_rd_cnt_reg[28]_i_1_n_1 ,\num_rd_cnt_reg[28]_i_1_n_2 ,\num_rd_cnt_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\num_rd_cnt_reg[28]_i_1_n_4 ,\num_rd_cnt_reg[28]_i_1_n_5 ,\num_rd_cnt_reg[28]_i_1_n_6 ,\num_rd_cnt_reg[28]_i_1_n_7 }),
        .S({\num_rd_cnt[28]_i_2_n_0 ,\num_rd_cnt[28]_i_3_n_0 ,\num_rd_cnt[28]_i_4_n_0 ,\num_rd_cnt[28]_i_5_n_0 }));
  FDCE \num_rd_cnt_reg[29] 
       (.C(M_RD_aclk),
        .CE(\num_rd_cnt[0]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(\num_rd_cnt_reg[28]_i_1_n_6 ),
        .Q(num_rd_cnt_reg[29]));
  FDCE \num_rd_cnt_reg[2] 
       (.C(M_RD_aclk),
        .CE(\num_rd_cnt[0]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(\num_rd_cnt_reg[0]_i_2_n_5 ),
        .Q(num_rd_cnt_reg[2]));
  FDCE \num_rd_cnt_reg[30] 
       (.C(M_RD_aclk),
        .CE(\num_rd_cnt[0]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(\num_rd_cnt_reg[28]_i_1_n_5 ),
        .Q(num_rd_cnt_reg[30]));
  FDCE \num_rd_cnt_reg[31] 
       (.C(M_RD_aclk),
        .CE(\num_rd_cnt[0]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(\num_rd_cnt_reg[28]_i_1_n_4 ),
        .Q(num_rd_cnt_reg[31]));
  FDCE \num_rd_cnt_reg[3] 
       (.C(M_RD_aclk),
        .CE(\num_rd_cnt[0]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(\num_rd_cnt_reg[0]_i_2_n_4 ),
        .Q(num_rd_cnt_reg[3]));
  FDCE \num_rd_cnt_reg[4] 
       (.C(M_RD_aclk),
        .CE(\num_rd_cnt[0]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(\num_rd_cnt_reg[4]_i_1_n_7 ),
        .Q(num_rd_cnt_reg[4]));
  CARRY4 \num_rd_cnt_reg[4]_i_1 
       (.CI(\num_rd_cnt_reg[0]_i_2_n_0 ),
        .CO({\num_rd_cnt_reg[4]_i_1_n_0 ,\num_rd_cnt_reg[4]_i_1_n_1 ,\num_rd_cnt_reg[4]_i_1_n_2 ,\num_rd_cnt_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\num_rd_cnt_reg[4]_i_1_n_4 ,\num_rd_cnt_reg[4]_i_1_n_5 ,\num_rd_cnt_reg[4]_i_1_n_6 ,\num_rd_cnt_reg[4]_i_1_n_7 }),
        .S({\num_rd_cnt[4]_i_2_n_0 ,\num_rd_cnt[4]_i_3_n_0 ,\num_rd_cnt[4]_i_4_n_0 ,\num_rd_cnt[4]_i_5_n_0 }));
  FDCE \num_rd_cnt_reg[5] 
       (.C(M_RD_aclk),
        .CE(\num_rd_cnt[0]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(\num_rd_cnt_reg[4]_i_1_n_6 ),
        .Q(num_rd_cnt_reg[5]));
  FDCE \num_rd_cnt_reg[6] 
       (.C(M_RD_aclk),
        .CE(\num_rd_cnt[0]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(\num_rd_cnt_reg[4]_i_1_n_5 ),
        .Q(num_rd_cnt_reg[6]));
  FDCE \num_rd_cnt_reg[7] 
       (.C(M_RD_aclk),
        .CE(\num_rd_cnt[0]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(\num_rd_cnt_reg[4]_i_1_n_4 ),
        .Q(num_rd_cnt_reg[7]));
  FDCE \num_rd_cnt_reg[8] 
       (.C(M_RD_aclk),
        .CE(\num_rd_cnt[0]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(\num_rd_cnt_reg[8]_i_1_n_7 ),
        .Q(num_rd_cnt_reg[8]));
  CARRY4 \num_rd_cnt_reg[8]_i_1 
       (.CI(\num_rd_cnt_reg[4]_i_1_n_0 ),
        .CO({\num_rd_cnt_reg[8]_i_1_n_0 ,\num_rd_cnt_reg[8]_i_1_n_1 ,\num_rd_cnt_reg[8]_i_1_n_2 ,\num_rd_cnt_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\num_rd_cnt_reg[8]_i_1_n_4 ,\num_rd_cnt_reg[8]_i_1_n_5 ,\num_rd_cnt_reg[8]_i_1_n_6 ,\num_rd_cnt_reg[8]_i_1_n_7 }),
        .S({\num_rd_cnt[8]_i_2_n_0 ,\num_rd_cnt[8]_i_3_n_0 ,\num_rd_cnt[8]_i_4_n_0 ,\num_rd_cnt[8]_i_5_n_0 }));
  FDCE \num_rd_cnt_reg[9] 
       (.C(M_RD_aclk),
        .CE(\num_rd_cnt[0]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(\num_rd_cnt_reg[8]_i_1_n_6 ),
        .Q(num_rd_cnt_reg[9]));
  LUT6 #(
    .INIT(64'h8080808080808880)) 
    \o_data[7]_i_1 
       (.I0(m_axi_rvalid),
        .I1(M_RD_tready),
        .I2(o_valid_i_2_n_0),
        .I3(c_state[1]),
        .I4(c_state[2]),
        .I5(o_valid_reg_0),
        .O(\o_data[7]_i_1_n_0 ));
  FDCE \o_data_reg[0] 
       (.C(M_RD_aclk),
        .CE(\o_data[7]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(m_axi_rdata[0]),
        .Q(M_RD_tdata[24]));
  FDCE \o_data_reg[10] 
       (.C(M_RD_aclk),
        .CE(\o_data[7]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(m_axi_rdata[10]),
        .Q(M_RD_tdata[18]));
  FDCE \o_data_reg[11] 
       (.C(M_RD_aclk),
        .CE(\o_data[7]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(m_axi_rdata[11]),
        .Q(M_RD_tdata[19]));
  FDCE \o_data_reg[12] 
       (.C(M_RD_aclk),
        .CE(\o_data[7]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(m_axi_rdata[12]),
        .Q(M_RD_tdata[20]));
  FDCE \o_data_reg[13] 
       (.C(M_RD_aclk),
        .CE(\o_data[7]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(m_axi_rdata[13]),
        .Q(M_RD_tdata[21]));
  FDCE \o_data_reg[14] 
       (.C(M_RD_aclk),
        .CE(\o_data[7]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(m_axi_rdata[14]),
        .Q(M_RD_tdata[22]));
  FDCE \o_data_reg[15] 
       (.C(M_RD_aclk),
        .CE(\o_data[7]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(m_axi_rdata[15]),
        .Q(M_RD_tdata[23]));
  FDCE \o_data_reg[16] 
       (.C(M_RD_aclk),
        .CE(\o_data[7]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(m_axi_rdata[16]),
        .Q(M_RD_tdata[8]));
  FDCE \o_data_reg[17] 
       (.C(M_RD_aclk),
        .CE(\o_data[7]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(m_axi_rdata[17]),
        .Q(M_RD_tdata[9]));
  FDCE \o_data_reg[18] 
       (.C(M_RD_aclk),
        .CE(\o_data[7]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(m_axi_rdata[18]),
        .Q(M_RD_tdata[10]));
  FDCE \o_data_reg[19] 
       (.C(M_RD_aclk),
        .CE(\o_data[7]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(m_axi_rdata[19]),
        .Q(M_RD_tdata[11]));
  FDCE \o_data_reg[1] 
       (.C(M_RD_aclk),
        .CE(\o_data[7]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(m_axi_rdata[1]),
        .Q(M_RD_tdata[25]));
  FDCE \o_data_reg[20] 
       (.C(M_RD_aclk),
        .CE(\o_data[7]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(m_axi_rdata[20]),
        .Q(M_RD_tdata[12]));
  FDCE \o_data_reg[21] 
       (.C(M_RD_aclk),
        .CE(\o_data[7]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(m_axi_rdata[21]),
        .Q(M_RD_tdata[13]));
  FDCE \o_data_reg[22] 
       (.C(M_RD_aclk),
        .CE(\o_data[7]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(m_axi_rdata[22]),
        .Q(M_RD_tdata[14]));
  FDCE \o_data_reg[23] 
       (.C(M_RD_aclk),
        .CE(\o_data[7]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(m_axi_rdata[23]),
        .Q(M_RD_tdata[15]));
  FDCE \o_data_reg[24] 
       (.C(M_RD_aclk),
        .CE(\o_data[7]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(m_axi_rdata[24]),
        .Q(M_RD_tdata[0]));
  FDCE \o_data_reg[25] 
       (.C(M_RD_aclk),
        .CE(\o_data[7]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(m_axi_rdata[25]),
        .Q(M_RD_tdata[1]));
  FDCE \o_data_reg[26] 
       (.C(M_RD_aclk),
        .CE(\o_data[7]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(m_axi_rdata[26]),
        .Q(M_RD_tdata[2]));
  FDCE \o_data_reg[27] 
       (.C(M_RD_aclk),
        .CE(\o_data[7]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(m_axi_rdata[27]),
        .Q(M_RD_tdata[3]));
  FDCE \o_data_reg[28] 
       (.C(M_RD_aclk),
        .CE(\o_data[7]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(m_axi_rdata[28]),
        .Q(M_RD_tdata[4]));
  FDCE \o_data_reg[29] 
       (.C(M_RD_aclk),
        .CE(\o_data[7]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(m_axi_rdata[29]),
        .Q(M_RD_tdata[5]));
  FDCE \o_data_reg[2] 
       (.C(M_RD_aclk),
        .CE(\o_data[7]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(m_axi_rdata[2]),
        .Q(M_RD_tdata[26]));
  FDCE \o_data_reg[30] 
       (.C(M_RD_aclk),
        .CE(\o_data[7]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(m_axi_rdata[30]),
        .Q(M_RD_tdata[6]));
  FDCE \o_data_reg[31] 
       (.C(M_RD_aclk),
        .CE(\o_data[7]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(m_axi_rdata[31]),
        .Q(M_RD_tdata[7]));
  FDCE \o_data_reg[3] 
       (.C(M_RD_aclk),
        .CE(\o_data[7]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(m_axi_rdata[3]),
        .Q(M_RD_tdata[27]));
  FDCE \o_data_reg[4] 
       (.C(M_RD_aclk),
        .CE(\o_data[7]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(m_axi_rdata[4]),
        .Q(M_RD_tdata[28]));
  FDCE \o_data_reg[5] 
       (.C(M_RD_aclk),
        .CE(\o_data[7]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(m_axi_rdata[5]),
        .Q(M_RD_tdata[29]));
  FDCE \o_data_reg[6] 
       (.C(M_RD_aclk),
        .CE(\o_data[7]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(m_axi_rdata[6]),
        .Q(M_RD_tdata[30]));
  FDCE \o_data_reg[7] 
       (.C(M_RD_aclk),
        .CE(\o_data[7]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(m_axi_rdata[7]),
        .Q(M_RD_tdata[31]));
  FDCE \o_data_reg[8] 
       (.C(M_RD_aclk),
        .CE(\o_data[7]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(m_axi_rdata[8]),
        .Q(M_RD_tdata[16]));
  FDCE \o_data_reg[9] 
       (.C(M_RD_aclk),
        .CE(\o_data[7]_i_1_n_0 ),
        .CLR(o_last_i_2_n_0),
        .D(m_axi_rdata[9]),
        .Q(M_RD_tdata[17]));
  LUT6 #(
    .INIT(64'hFFFF77FF00007780)) 
    o_last_i_1
       (.I0(M_RD_tready),
        .I1(o_valid_reg_0),
        .I2(n_state3),
        .I3(c_state[0]),
        .I4(o_last_i_3_n_0),
        .I5(o_last_reg_0),
        .O(o_last_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    o_last_i_2
       (.I0(M_RD_aresetn),
        .O(o_last_i_2_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    o_last_i_3
       (.I0(c_state[2]),
        .I1(c_state[1]),
        .O(o_last_i_3_n_0));
  FDCE o_last_reg
       (.C(M_RD_aclk),
        .CE(1'b1),
        .CLR(o_last_i_2_n_0),
        .D(o_last_i_1_n_0),
        .Q(o_last_reg_0));
  LUT6 #(
    .INIT(64'hAA00FFFFBA000000)) 
    o_valid_i_1
       (.I0(o_valid_i_2_n_0),
        .I1(o_last_i_3_n_0),
        .I2(M_RD_tready),
        .I3(m_axi_rvalid),
        .I4(o_valid_i_3_n_0),
        .I5(o_valid_reg_0),
        .O(o_valid_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h0308)) 
    o_valid_i_2
       (.I0(m_axi_arready),
        .I1(c_state[0]),
        .I2(c_state[2]),
        .I3(c_state[1]),
        .O(o_valid_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h00F8)) 
    o_valid_i_3
       (.I0(c_state[0]),
        .I1(m_axi_arready),
        .I2(c_state[1]),
        .I3(c_state[2]),
        .O(o_valid_i_3_n_0));
  FDCE o_valid_reg
       (.C(M_RD_aclk),
        .CE(1'b1),
        .CLR(o_last_i_2_n_0),
        .D(o_valid_i_1_n_0),
        .Q(o_valid_reg_0));
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
