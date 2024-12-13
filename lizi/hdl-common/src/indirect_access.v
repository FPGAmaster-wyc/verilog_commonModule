module indirect_access #(
	parameter ADDR_BITS = 32,
	parameter DATA_BITS = 32,
	parameter BE_BITS = DATA_BITS/8,
	parameter REG_ADDR_OFFSET = 8'h0,
	parameter REG_DATA_OFFSET = 8'h4
)(
	input	clk,
	input	rst,

	input	[ADDR_BITS-1:0] wr_addr,
	input	[DATA_BITS-1:0] wr_din,
	input	[BE_BITS-1:0] wr_be,
	input	wr_en,

	input	[ADDR_BITS-1:0] rd_addr,
	output	[DATA_BITS-1:0] rd_dout,
	input	rd_en,

	output	[DATA_BITS-1:0] indirect_addr,
	output	indirect_rd_en,
	output	indirect_wr_en,
	output	[DATA_BITS-1:0] indirect_dout,
	input	[DATA_BITS-1:0] indirect_din
);

wire [DATA_BITS-1:0] addr_reg_value;
wire [DATA_BITS-1:0] addr_reg_out;
common_register #(.ADDR_BITS(ADDR_BITS),.DATA_BITS(DATA_BITS),
.ADDR(REG_ADDR_OFFSET), .INIT('b0), .BMSK('b0)
) addr_reg_i(
	.C(clk), .R(rst), 
	.WA(wr_addr), .WE(wr_en), .BE({DATA_BITS/8{1'b1}}), .D(wr_din), .S(), .O(addr_reg_value), 
	.RA(rd_addr), .RE(rd_en), .Q(addr_reg_out), .G(), .B('b0)
);

wire [DATA_BITS-1:0] data_reg_value;
wire [DATA_BITS-1:0] data_reg_out;
wire [DATA_BITS-1:0] data_reg_readback;
wire read_strobe;
wire write_strobe;
common_register #(.ADDR_BITS(ADDR_BITS),.DATA_BITS(DATA_BITS),
.ADDR(REG_DATA_OFFSET), .INIT('b0), .BMSK({DATA_BITS{1'b1}})
) data_reg_i(
	.C(clk), .R(rst), 
	.WA(wr_addr), .WE(wr_en), .BE({DATA_BITS/8{1'b1}}), .D(wr_din), .S(write_strobe), .O(data_reg_value), 
	.RA(rd_addr), .RE(rd_en), .Q(data_reg_out), .G(read_strobe), .B(data_reg_readback)
);

assign rd_dout = addr_reg_out | data_reg_out;
assign indirect_addr = addr_reg_value;
assign indirect_rd_en = read_strobe;
assign indirect_wr_en = write_strobe;
assign indirect_dout = data_reg_value;
assign data_reg_readback = indirect_din;

endmodule
