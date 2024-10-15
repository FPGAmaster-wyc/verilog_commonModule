//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
//Date        : Tue Oct 15 15:48:16 2024
//Host        : DESKTOP-I9U844P running 64-bit major release  (build 9200)
//Command     : generate_target soc.bd
//Design      : soc
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "soc,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=soc,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=8,numReposBlks=8,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=3,numPkgbdBlks=0,bdsource=USER,da_clkrst_cnt=3,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "soc.hwdef" *) 
module soc
   (clk_100M,
    i_wr_done,
    rst_n);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_100M CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_100M, ASSOCIATED_RESET rst_n, CLK_DOMAIN soc_clk_100M, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000" *) input clk_100M;
  input i_wr_done;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RST_N RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RST_N, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input rst_n;

  wire [15:0]axi_bram_ctrl_0_BRAM_PORTA_ADDR;
  wire axi_bram_ctrl_0_BRAM_PORTA_CLK;
  wire [31:0]axi_bram_ctrl_0_BRAM_PORTA_DIN;
  wire [31:0]axi_bram_ctrl_0_BRAM_PORTA_DOUT;
  wire axi_bram_ctrl_0_BRAM_PORTA_EN;
  wire axi_bram_ctrl_0_BRAM_PORTA_RST;
  wire [3:0]axi_bram_ctrl_0_BRAM_PORTA_WE;
  wire [31:0]axi_read_0_M_RD_TDATA;
  wire axi_read_0_M_RD_TLAST;
  wire axi_read_0_M_RD_TREADY;
  wire axi_read_0_M_RD_TVALID;
  wire [31:0]axi_read_0_m_axi_ARADDR;
  wire [1:0]axi_read_0_m_axi_ARBURST;
  wire [3:0]axi_read_0_m_axi_ARCACHE;
  wire axi_read_0_m_axi_ARID;
  wire [7:0]axi_read_0_m_axi_ARLEN;
  wire axi_read_0_m_axi_ARLOCK;
  wire [2:0]axi_read_0_m_axi_ARPROT;
  wire [3:0]axi_read_0_m_axi_ARQOS;
  wire axi_read_0_m_axi_ARREADY;
  wire [2:0]axi_read_0_m_axi_ARSIZE;
  wire axi_read_0_m_axi_ARVALID;
  wire [31:0]axi_read_0_m_axi_RDATA;
  wire [0:0]axi_read_0_m_axi_RID;
  wire axi_read_0_m_axi_RLAST;
  wire axi_read_0_m_axi_RREADY;
  wire [1:0]axi_read_0_m_axi_RRESP;
  wire axi_read_0_m_axi_RVALID;
  wire [31:0]axi_write_0_m_axi_AWADDR;
  wire [1:0]axi_write_0_m_axi_AWBURST;
  wire [3:0]axi_write_0_m_axi_AWCACHE;
  wire axi_write_0_m_axi_AWID;
  wire [7:0]axi_write_0_m_axi_AWLEN;
  wire axi_write_0_m_axi_AWLOCK;
  wire [2:0]axi_write_0_m_axi_AWPROT;
  wire [3:0]axi_write_0_m_axi_AWQOS;
  wire axi_write_0_m_axi_AWREADY;
  wire [2:0]axi_write_0_m_axi_AWSIZE;
  wire axi_write_0_m_axi_AWVALID;
  wire [0:0]axi_write_0_m_axi_BID;
  wire axi_write_0_m_axi_BREADY;
  wire [1:0]axi_write_0_m_axi_BRESP;
  wire axi_write_0_m_axi_BVALID;
  wire [31:0]axi_write_0_m_axi_WDATA;
  wire axi_write_0_m_axi_WLAST;
  wire axi_write_0_m_axi_WREADY;
  wire [3:0]axi_write_0_m_axi_WSTRB;
  wire axi_write_0_m_axi_WVALID;
  wire clk_0_1;
  wire [31:0]fifo_generator_0_M_AXIS_TDATA;
  wire fifo_generator_0_M_AXIS_TLAST;
  wire fifo_generator_0_M_AXIS_TREADY;
  wire fifo_generator_0_M_AXIS_TVALID;
  wire [31:0]gen_data_0_interface_axis_TDATA;
  wire gen_data_0_interface_axis_TLAST;
  wire gen_data_0_interface_axis_TVALID;
  wire i_wr_done_0_1;
  wire rst_n_0_1;
  wire [15:0]smartconnect_0_M00_AXI_ARADDR;
  wire [1:0]smartconnect_0_M00_AXI_ARBURST;
  wire [3:0]smartconnect_0_M00_AXI_ARCACHE;
  wire [7:0]smartconnect_0_M00_AXI_ARLEN;
  wire [0:0]smartconnect_0_M00_AXI_ARLOCK;
  wire [2:0]smartconnect_0_M00_AXI_ARPROT;
  wire smartconnect_0_M00_AXI_ARREADY;
  wire [2:0]smartconnect_0_M00_AXI_ARSIZE;
  wire smartconnect_0_M00_AXI_ARVALID;
  wire [15:0]smartconnect_0_M00_AXI_AWADDR;
  wire [1:0]smartconnect_0_M00_AXI_AWBURST;
  wire [3:0]smartconnect_0_M00_AXI_AWCACHE;
  wire [7:0]smartconnect_0_M00_AXI_AWLEN;
  wire [0:0]smartconnect_0_M00_AXI_AWLOCK;
  wire [2:0]smartconnect_0_M00_AXI_AWPROT;
  wire smartconnect_0_M00_AXI_AWREADY;
  wire [2:0]smartconnect_0_M00_AXI_AWSIZE;
  wire smartconnect_0_M00_AXI_AWVALID;
  wire smartconnect_0_M00_AXI_BREADY;
  wire [1:0]smartconnect_0_M00_AXI_BRESP;
  wire smartconnect_0_M00_AXI_BVALID;
  wire [31:0]smartconnect_0_M00_AXI_RDATA;
  wire smartconnect_0_M00_AXI_RLAST;
  wire smartconnect_0_M00_AXI_RREADY;
  wire [1:0]smartconnect_0_M00_AXI_RRESP;
  wire smartconnect_0_M00_AXI_RVALID;
  wire [31:0]smartconnect_0_M00_AXI_WDATA;
  wire smartconnect_0_M00_AXI_WLAST;
  wire smartconnect_0_M00_AXI_WREADY;
  wire [3:0]smartconnect_0_M00_AXI_WSTRB;
  wire smartconnect_0_M00_AXI_WVALID;

  assign clk_0_1 = clk_100M;
  assign i_wr_done_0_1 = i_wr_done;
  assign rst_n_0_1 = rst_n;
  soc_axi_bram_ctrl_0_0 axi_bram_ctrl_0
       (.bram_addr_a(axi_bram_ctrl_0_BRAM_PORTA_ADDR),
        .bram_clk_a(axi_bram_ctrl_0_BRAM_PORTA_CLK),
        .bram_en_a(axi_bram_ctrl_0_BRAM_PORTA_EN),
        .bram_rddata_a(axi_bram_ctrl_0_BRAM_PORTA_DOUT),
        .bram_rst_a(axi_bram_ctrl_0_BRAM_PORTA_RST),
        .bram_we_a(axi_bram_ctrl_0_BRAM_PORTA_WE),
        .bram_wrdata_a(axi_bram_ctrl_0_BRAM_PORTA_DIN),
        .s_axi_aclk(clk_0_1),
        .s_axi_araddr(smartconnect_0_M00_AXI_ARADDR),
        .s_axi_arburst(smartconnect_0_M00_AXI_ARBURST),
        .s_axi_arcache(smartconnect_0_M00_AXI_ARCACHE),
        .s_axi_aresetn(rst_n_0_1),
        .s_axi_arlen(smartconnect_0_M00_AXI_ARLEN),
        .s_axi_arlock(smartconnect_0_M00_AXI_ARLOCK),
        .s_axi_arprot(smartconnect_0_M00_AXI_ARPROT),
        .s_axi_arready(smartconnect_0_M00_AXI_ARREADY),
        .s_axi_arsize(smartconnect_0_M00_AXI_ARSIZE),
        .s_axi_arvalid(smartconnect_0_M00_AXI_ARVALID),
        .s_axi_awaddr(smartconnect_0_M00_AXI_AWADDR),
        .s_axi_awburst(smartconnect_0_M00_AXI_AWBURST),
        .s_axi_awcache(smartconnect_0_M00_AXI_AWCACHE),
        .s_axi_awlen(smartconnect_0_M00_AXI_AWLEN),
        .s_axi_awlock(smartconnect_0_M00_AXI_AWLOCK),
        .s_axi_awprot(smartconnect_0_M00_AXI_AWPROT),
        .s_axi_awready(smartconnect_0_M00_AXI_AWREADY),
        .s_axi_awsize(smartconnect_0_M00_AXI_AWSIZE),
        .s_axi_awvalid(smartconnect_0_M00_AXI_AWVALID),
        .s_axi_bready(smartconnect_0_M00_AXI_BREADY),
        .s_axi_bresp(smartconnect_0_M00_AXI_BRESP),
        .s_axi_bvalid(smartconnect_0_M00_AXI_BVALID),
        .s_axi_rdata(smartconnect_0_M00_AXI_RDATA),
        .s_axi_rlast(smartconnect_0_M00_AXI_RLAST),
        .s_axi_rready(smartconnect_0_M00_AXI_RREADY),
        .s_axi_rresp(smartconnect_0_M00_AXI_RRESP),
        .s_axi_rvalid(smartconnect_0_M00_AXI_RVALID),
        .s_axi_wdata(smartconnect_0_M00_AXI_WDATA),
        .s_axi_wlast(smartconnect_0_M00_AXI_WLAST),
        .s_axi_wready(smartconnect_0_M00_AXI_WREADY),
        .s_axi_wstrb(smartconnect_0_M00_AXI_WSTRB),
        .s_axi_wvalid(smartconnect_0_M00_AXI_WVALID));
  soc_axi_read_0_0 axi_read_0
       (.M_RD_aclk(clk_0_1),
        .M_RD_aresetn(rst_n_0_1),
        .M_RD_tdata(axi_read_0_M_RD_TDATA),
        .M_RD_tlast(axi_read_0_M_RD_TLAST),
        .M_RD_tready(axi_read_0_M_RD_TREADY),
        .M_RD_tvalid(axi_read_0_M_RD_TVALID),
        .i_wr_done(i_wr_done_0_1),
        .m_axi_aclk(clk_0_1),
        .m_axi_araddr(axi_read_0_m_axi_ARADDR),
        .m_axi_arburst(axi_read_0_m_axi_ARBURST),
        .m_axi_arcache(axi_read_0_m_axi_ARCACHE),
        .m_axi_aresetn(rst_n_0_1),
        .m_axi_arid(axi_read_0_m_axi_ARID),
        .m_axi_arlen(axi_read_0_m_axi_ARLEN),
        .m_axi_arlock(axi_read_0_m_axi_ARLOCK),
        .m_axi_arprot(axi_read_0_m_axi_ARPROT),
        .m_axi_arqos(axi_read_0_m_axi_ARQOS),
        .m_axi_arready(axi_read_0_m_axi_ARREADY),
        .m_axi_arsize(axi_read_0_m_axi_ARSIZE),
        .m_axi_arvalid(axi_read_0_m_axi_ARVALID),
        .m_axi_rdata(axi_read_0_m_axi_RDATA),
        .m_axi_rid(axi_read_0_m_axi_RID),
        .m_axi_rlast(axi_read_0_m_axi_RLAST),
        .m_axi_rready(axi_read_0_m_axi_RREADY),
        .m_axi_rresp(axi_read_0_m_axi_RRESP),
        .m_axi_rvalid(axi_read_0_m_axi_RVALID));
  soc_axi_write_0_0 axi_write_0
       (.S_WR_aclk(clk_0_1),
        .S_WR_aresetn(rst_n_0_1),
        .S_WR_tdata(fifo_generator_0_M_AXIS_TDATA),
        .S_WR_tlast(fifo_generator_0_M_AXIS_TLAST),
        .S_WR_tready(fifo_generator_0_M_AXIS_TREADY),
        .S_WR_tvalid(fifo_generator_0_M_AXIS_TVALID),
        .m_axi_aclk(clk_0_1),
        .m_axi_aresetn(rst_n_0_1),
        .m_axi_awaddr(axi_write_0_m_axi_AWADDR),
        .m_axi_awburst(axi_write_0_m_axi_AWBURST),
        .m_axi_awcache(axi_write_0_m_axi_AWCACHE),
        .m_axi_awid(axi_write_0_m_axi_AWID),
        .m_axi_awlen(axi_write_0_m_axi_AWLEN),
        .m_axi_awlock(axi_write_0_m_axi_AWLOCK),
        .m_axi_awprot(axi_write_0_m_axi_AWPROT),
        .m_axi_awqos(axi_write_0_m_axi_AWQOS),
        .m_axi_awready(axi_write_0_m_axi_AWREADY),
        .m_axi_awsize(axi_write_0_m_axi_AWSIZE),
        .m_axi_awvalid(axi_write_0_m_axi_AWVALID),
        .m_axi_bid(axi_write_0_m_axi_BID),
        .m_axi_bready(axi_write_0_m_axi_BREADY),
        .m_axi_bresp(axi_write_0_m_axi_BRESP),
        .m_axi_bvalid(axi_write_0_m_axi_BVALID),
        .m_axi_wdata(axi_write_0_m_axi_WDATA),
        .m_axi_wlast(axi_write_0_m_axi_WLAST),
        .m_axi_wready(axi_write_0_m_axi_WREADY),
        .m_axi_wstrb(axi_write_0_m_axi_WSTRB),
        .m_axi_wvalid(axi_write_0_m_axi_WVALID));
  soc_blk_mem_gen_0_0 blk_mem_gen_0
       (.addra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,axi_bram_ctrl_0_BRAM_PORTA_ADDR}),
        .clka(axi_bram_ctrl_0_BRAM_PORTA_CLK),
        .dina(axi_bram_ctrl_0_BRAM_PORTA_DIN),
        .douta(axi_bram_ctrl_0_BRAM_PORTA_DOUT),
        .ena(axi_bram_ctrl_0_BRAM_PORTA_EN),
        .rsta(axi_bram_ctrl_0_BRAM_PORTA_RST),
        .wea(axi_bram_ctrl_0_BRAM_PORTA_WE));
  soc_fifo_generator_0_0 fifo_generator_0
       (.m_axis_tdata(fifo_generator_0_M_AXIS_TDATA),
        .m_axis_tlast(fifo_generator_0_M_AXIS_TLAST),
        .m_axis_tready(fifo_generator_0_M_AXIS_TREADY),
        .m_axis_tvalid(fifo_generator_0_M_AXIS_TVALID),
        .s_aclk(clk_0_1),
        .s_aresetn(rst_n_0_1),
        .s_axis_tdata(gen_data_0_interface_axis_TDATA),
        .s_axis_tlast(gen_data_0_interface_axis_TLAST),
        .s_axis_tvalid(gen_data_0_interface_axis_TVALID));
  soc_fifo_generator_0_1 fifo_generator_1
       (.m_axis_tready(1'b1),
        .s_aclk(clk_0_1),
        .s_aresetn(rst_n_0_1),
        .s_axis_tdata(axi_read_0_M_RD_TDATA),
        .s_axis_tlast(axi_read_0_M_RD_TLAST),
        .s_axis_tready(axi_read_0_M_RD_TREADY),
        .s_axis_tvalid(axi_read_0_M_RD_TVALID));
  soc_gen_data_0_0 gen_data_0
       (.clk(clk_0_1),
        .rst_n(rst_n_0_1),
        .tdata(gen_data_0_interface_axis_TDATA),
        .tlast(gen_data_0_interface_axis_TLAST),
        .tvalid(gen_data_0_interface_axis_TVALID));
  soc_smartconnect_0_0 smartconnect_0
       (.M00_AXI_araddr(smartconnect_0_M00_AXI_ARADDR),
        .M00_AXI_arburst(smartconnect_0_M00_AXI_ARBURST),
        .M00_AXI_arcache(smartconnect_0_M00_AXI_ARCACHE),
        .M00_AXI_arlen(smartconnect_0_M00_AXI_ARLEN),
        .M00_AXI_arlock(smartconnect_0_M00_AXI_ARLOCK),
        .M00_AXI_arprot(smartconnect_0_M00_AXI_ARPROT),
        .M00_AXI_arready(smartconnect_0_M00_AXI_ARREADY),
        .M00_AXI_arsize(smartconnect_0_M00_AXI_ARSIZE),
        .M00_AXI_arvalid(smartconnect_0_M00_AXI_ARVALID),
        .M00_AXI_awaddr(smartconnect_0_M00_AXI_AWADDR),
        .M00_AXI_awburst(smartconnect_0_M00_AXI_AWBURST),
        .M00_AXI_awcache(smartconnect_0_M00_AXI_AWCACHE),
        .M00_AXI_awlen(smartconnect_0_M00_AXI_AWLEN),
        .M00_AXI_awlock(smartconnect_0_M00_AXI_AWLOCK),
        .M00_AXI_awprot(smartconnect_0_M00_AXI_AWPROT),
        .M00_AXI_awready(smartconnect_0_M00_AXI_AWREADY),
        .M00_AXI_awsize(smartconnect_0_M00_AXI_AWSIZE),
        .M00_AXI_awvalid(smartconnect_0_M00_AXI_AWVALID),
        .M00_AXI_bready(smartconnect_0_M00_AXI_BREADY),
        .M00_AXI_bresp(smartconnect_0_M00_AXI_BRESP),
        .M00_AXI_bvalid(smartconnect_0_M00_AXI_BVALID),
        .M00_AXI_rdata(smartconnect_0_M00_AXI_RDATA),
        .M00_AXI_rlast(smartconnect_0_M00_AXI_RLAST),
        .M00_AXI_rready(smartconnect_0_M00_AXI_RREADY),
        .M00_AXI_rresp(smartconnect_0_M00_AXI_RRESP),
        .M00_AXI_rvalid(smartconnect_0_M00_AXI_RVALID),
        .M00_AXI_wdata(smartconnect_0_M00_AXI_WDATA),
        .M00_AXI_wlast(smartconnect_0_M00_AXI_WLAST),
        .M00_AXI_wready(smartconnect_0_M00_AXI_WREADY),
        .M00_AXI_wstrb(smartconnect_0_M00_AXI_WSTRB),
        .M00_AXI_wvalid(smartconnect_0_M00_AXI_WVALID),
        .S00_AXI_awaddr(axi_write_0_m_axi_AWADDR),
        .S00_AXI_awburst(axi_write_0_m_axi_AWBURST),
        .S00_AXI_awcache(axi_write_0_m_axi_AWCACHE),
        .S00_AXI_awid(axi_write_0_m_axi_AWID),
        .S00_AXI_awlen(axi_write_0_m_axi_AWLEN),
        .S00_AXI_awlock(axi_write_0_m_axi_AWLOCK),
        .S00_AXI_awprot(axi_write_0_m_axi_AWPROT),
        .S00_AXI_awqos(axi_write_0_m_axi_AWQOS),
        .S00_AXI_awready(axi_write_0_m_axi_AWREADY),
        .S00_AXI_awsize(axi_write_0_m_axi_AWSIZE),
        .S00_AXI_awvalid(axi_write_0_m_axi_AWVALID),
        .S00_AXI_bid(axi_write_0_m_axi_BID),
        .S00_AXI_bready(axi_write_0_m_axi_BREADY),
        .S00_AXI_bresp(axi_write_0_m_axi_BRESP),
        .S00_AXI_bvalid(axi_write_0_m_axi_BVALID),
        .S00_AXI_wdata(axi_write_0_m_axi_WDATA),
        .S00_AXI_wlast(axi_write_0_m_axi_WLAST),
        .S00_AXI_wready(axi_write_0_m_axi_WREADY),
        .S00_AXI_wstrb(axi_write_0_m_axi_WSTRB),
        .S00_AXI_wvalid(axi_write_0_m_axi_WVALID),
        .S01_AXI_araddr(axi_read_0_m_axi_ARADDR),
        .S01_AXI_arburst(axi_read_0_m_axi_ARBURST),
        .S01_AXI_arcache(axi_read_0_m_axi_ARCACHE),
        .S01_AXI_arid(axi_read_0_m_axi_ARID),
        .S01_AXI_arlen(axi_read_0_m_axi_ARLEN),
        .S01_AXI_arlock(axi_read_0_m_axi_ARLOCK),
        .S01_AXI_arprot(axi_read_0_m_axi_ARPROT),
        .S01_AXI_arqos(axi_read_0_m_axi_ARQOS),
        .S01_AXI_arready(axi_read_0_m_axi_ARREADY),
        .S01_AXI_arsize(axi_read_0_m_axi_ARSIZE),
        .S01_AXI_arvalid(axi_read_0_m_axi_ARVALID),
        .S01_AXI_rdata(axi_read_0_m_axi_RDATA),
        .S01_AXI_rid(axi_read_0_m_axi_RID),
        .S01_AXI_rlast(axi_read_0_m_axi_RLAST),
        .S01_AXI_rready(axi_read_0_m_axi_RREADY),
        .S01_AXI_rresp(axi_read_0_m_axi_RRESP),
        .S01_AXI_rvalid(axi_read_0_m_axi_RVALID),
        .aclk(clk_0_1),
        .aresetn(1'b1));
endmodule
