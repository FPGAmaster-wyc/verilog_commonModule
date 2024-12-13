// IEEE 802.3 standard PHY emulation
module phy_emu(
	input	clk,
	input	rst,
	input	mdc_i,
	input	mdio_i,
	output	mdio_o,
	output	mdio_oe,
	input	[1:0] speed,
	input	duplex,
	input	linkup
);

parameter PHY_ADDR = 0;
parameter [21:0] OUI = 0;
parameter [5:0] MFN = 0;
parameter [3:0] REV = 0;

wire [4:0] read_addr;
wire read_enable;
reg [15:0] read_data;

wire [4:0] write_addr;
wire [15:0] write_data;
wire write_enable;

mdio_slave_if #(.PHY_ADDR(PHY_ADDR)) if_i(
	.clk(clk),
	.rst(rst),
	.mdc_i(mdc_i),
	.mdio_i(mdio_i),
	.mdio_o(mdio_o),
	.mdio_oe(mdio_oe),
	.read_addr(read_addr),
	.read_enable(read_enable),
	.read_data(read_data),
	.write_addr(write_addr),
	.write_data(write_data),
	.write_enable(write_enable)
);

wire [15:0] CONTROL;
wire [15:0] STATUS;
wire [15:0] IDH;
wire [15:0] IDL;
wire [15:0] ANA;
wire [15:0] LPA;
wire [15:0] ANE;
wire [15:0] NPT;
wire [15:0] RNP;
wire [15:0] MSCR;
wire [15:0] MSSR;
wire [15:0] EXTSTAT;

assign CONTROL[15] = 0;//CTRL_RST;
assign CONTROL[14] = 0;//CTRL_LOOPBACK;
assign CONTROL[13] = speed[0];
assign CONTROL[12] = 1;//CTRL_ANE;
assign CONTROL[11] = 0;//CTRL_PD;
assign CONTROL[10] = 0;//CTRL_ISO;
assign CONTROL[9] = 0;//CTRL_RESTART;
assign CONTROL[8] = duplex;
assign CONTROL[7] = 0;//CTRL_COL_TEST;
assign CONTROL[6] = speed[1];
assign CONTROL[5:0] = 0;

assign STATUS[15] = 0;//100BASE-T4
assign STATUS[14] = 1;//100BASE-X FD
assign STATUS[13] = 1;//100BASE-X HD
assign STATUS[12] = 1;//10Mb/s FD
assign STATUS[11] = 1;//10Mb/s HD
assign STATUS[10] = 0;//100BASE-T2 FD
assign STATUS[9] = 0;//100BASE-T2 HD
assign STATUS[8] = 1;//Extend status
assign STATUS[7] = 0;
assign STATUS[6] = 1;//MF Preamble suppression
assign STATUS[5] = 1;//AN complete
assign STATUS[4] = 0;//Remote Fault
assign STATUS[3] = 1;// AN ability
assign STATUS[2] = linkup;// Link status
assign STATUS[1] = 0;//Jabber Detect
assign STATUS[0] = 1;// Extend Cap

assign IDH = OUI[21:6];
assign IDL = {OUI[5:0], MFN, REV};

assign ANA[15] = 0;//Next Page 
assign ANA[14] = 0;//Ack
assign ANA[13] = 0;//Remote Fault
assign ANA[12] = 0;
assign ANA[11] = 0;//ASY Pause
assign ANA[10] = 0;//Pause Capable
assign ANA[9] = 0;//100Base-T4
assign ANA[8] = 1;//100Base-TX FD Cap
assign ANA[7] = 1;//100Base-TX HD Cap
assign ANA[6] = 1;//10Base-T FD Cap
assign ANA[5] = 1;//10Base-T HD Cap
assign ANA[4:0] = 1;//802.3

assign LPA[15] = 0;//Next Page 
assign LPA[14] = 0;//Ack
assign LPA[13] = 0;//Remote Fault
assign LPA[12] = 0;//TAF
assign LPA[11] = 0;//ASY Pause
assign LPA[10] = 0;//Pause Capable
assign LPA[9] = 0;//100Base-T4
assign LPA[8] = speed[0]&&duplex;//100Base-TX FD Cap
assign LPA[7] = speed[0]&&!duplex;//100Base-TX HD Cap
assign LPA[6] = !speed[0]&&duplex;//10Base-T FD Cap
assign LPA[5] = !speed[0]&&!duplex;//10Base-T HD Cap
assign LPA[4:0] = 1;

assign ANE[15:5] = 0;
assign ANE[4] = 0;// Fault
assign ANE[3] = 0;// Next Page Cap
assign ANE[2] = 1;// Local Next Page Cap
assign ANE[1] = 0;// New page
assign ANE[0] = 1;// Partner AN

assign NPT[15] = 0;// Next Page
assign NPT[14] = 0;
assign NPT[13] = 1;
assign NPT[12] = 0;
assign NPT[11] = 0;
assign NPT[10:0] = 1;

assign RNP[15] = 0;
assign RNP[14] = 0;
assign RNP[13] = 0;
assign RNP[12] = 0;
assign RNP[11] = 0;
assign RNP[10:0] = 0;

assign MSCR[15:13] = 0; 
assign MSCR[12] = 0;
assign MSCR[11] = 0;
assign MSCR[10] = 0;
assign MSCR[9] = 1;// 1000BASE-T FD
assign MSCR[8] = 1;// 1000BASE-T HD
assign MSCR[7:0] = 0;

assign MSSR[15] = 0;
assign MSSR[14] = 0;
assign MSSR[13] = 0;
assign MSSR[12] = 0;
assign MSSR[11] = speed[1]&&duplex;// 1000BASE-T FD
assign MSSR[10] = speed[1]&&!duplex;// 1000BASE-T HD
assign MSSR[9:8] = 0;
assign MSSR[7:0] = 0;

assign EXTSTAT[15] = 0;//1000Base-X FD 
assign EXTSTAT[14] = 0;//1000Base-X HD 
assign EXTSTAT[13] = 1;//1000Base-T FD 
assign EXTSTAT[12] = 1;//1000Base-T HD 
assign EXTSTAT[11:0] = 0;

always @(*)
begin
	case(read_addr)
		0: read_data = CONTROL;
		1: read_data = STATUS;
		2: read_data = IDH;
		3: read_data = IDL;
		4: read_data = ANA;
		5: read_data = LPA;
		6: read_data = ANE;
		7: read_data = NPT;
		8: read_data = RNP;
		9: read_data = MSCR;
		10: read_data = MSSR;
		15: read_data = EXTSTAT;
		default: read_data = 'bx;
	endcase
end


endmodule
