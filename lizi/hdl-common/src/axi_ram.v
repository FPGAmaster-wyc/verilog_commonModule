//% Parametric AXI4 RAM module
`timescale 1ns/1ps
module axi_ram (
	// AXI Clock & Reset
	aresetn,
	aclk,

	// AXI Master Write Address
	s_awid,
	s_awaddr,
	s_awlen,
	s_awsize,
	s_awburst,
	s_awvalid,
	s_awready,

	// AXI Master Write Data
	s_wdata,
	s_wstrb,
	s_wlast,
	s_wvalid,
	s_wready,

	// AXI Master Write Response
	s_bready,
	s_bid,
	s_bresp,
	s_bvalid,

	// AXI Master Read Address
	s_arid,
	s_araddr,
	s_arlen,
	s_arsize,
	s_arburst,
	s_arvalid,
	s_arready,

	// AXI Master Read Data
	s_rready,
 	s_rid,
	s_rdata,
 	s_rresp,
	s_rlast,
	s_rvalid
);

parameter MEMORY_DEPTH=1024;
parameter ID_WIDTH=4;
parameter DATA_WIDTH=32;

function integer clogb2 (input integer size);
begin
	size = size - 1;
	for (clogb2=1; size>1; clogb2=clogb2+1)
		size = size >> 1;
end
endfunction

localparam STRB_WIDTH=DATA_WIDTH/8;
localparam MEM_ADDR_LSB = clogb2(STRB_WIDTH);
localparam MEM_ADDR_MSB = clogb2(MEMORY_DEPTH)+MEM_ADDR_LSB-1;

// AXI Clock & Reset
input	aresetn;
input	aclk;

// AXI Master Write Address
input	[ID_WIDTH-1:0]	s_awid;
input	[MEM_ADDR_MSB:0]	s_awaddr;
input	[7:0]	s_awlen;
input	[2:0]	s_awsize;
input	[1:0]	s_awburst;
input	s_awvalid;
output reg	s_awready;

// AXI Master Write Data
input	[DATA_WIDTH-1:0]	s_wdata;
input	[STRB_WIDTH-1:0]	s_wstrb;
input	s_wlast;
input	s_wvalid;
output reg	s_wready;

// AXI Master Write Response
input	s_bready;
output [ID_WIDTH-1:0]	s_bid;
output [1:0]	s_bresp;
output reg	s_bvalid;

// AXI Master Read Address
input	[ID_WIDTH-1:0]	s_arid;
input	[MEM_ADDR_MSB:0]	s_araddr;
input	[7:0]	s_arlen;
input	[2:0]	s_arsize;
input	[1:0]	s_arburst;
input	s_arvalid;
output reg	s_arready;

// AXI Master Read Data
input	s_rready;
output [ID_WIDTH-1:0]	s_rid;
output reg	[DATA_WIDTH-1:0]	s_rdata;
output [1:0]	s_rresp;
output reg	s_rlast;
output reg	s_rvalid;

// Local connections
reg	[MEM_ADDR_MSB:0]	write_addr;
reg	[MEM_ADDR_MSB:0]	read_addr;
reg	[7:0]	read_len;
reg	[ID_WIDTH-1:0]	write_id;
reg	[ID_WIDTH-1:0]	read_id;
reg read_start;

wire write_strobe;
wire read_strobe;

assign s_bid = write_id;
assign s_bresp = 2'b0;
assign s_rid = read_id;
assign s_rresp = 2'b0;

assign write_strobe = (s_wvalid && s_wready);
assign read_strobe = (read_start || (s_rvalid && s_rready));

////////////////////////////////////////////////////////////////////////////////
// Write Stage
//% Address Acknowledge
always @(posedge aclk,negedge aresetn)
begin
	if(!aresetn) begin
		s_awready <= 1'b1;
	end
	else if(s_awready) begin
		if(s_awvalid) begin
			s_awready <= 1'b0;
		end
	end
	else if(s_bvalid && s_bready) begin
		s_awready <= 1'b1;
	end
end

//% Data Acknowledge
always @(posedge aclk,negedge aresetn)
begin
	if(!aresetn) begin
		s_wready <= 1'b0;
	end
	else if(s_awvalid && s_awready) begin
		s_wready <= 1'b1;
	end
	else if(s_wvalid && s_wready && s_wlast) begin
		s_wready <= 1'b0;
	end
end

//% Write ID Latch 
always @(posedge aclk)
begin
	if(s_awvalid && s_awready) begin
		write_id <= s_awid;
	end
end

//% Write Addressing
always @(posedge aclk)
begin
	if(s_awvalid && s_awready) begin
		write_addr <= s_awaddr;
	end
	else if(s_wvalid && s_wready) begin
		write_addr <= write_addr + STRB_WIDTH;
	end
end

//% Write Response
always @(posedge aclk,negedge aresetn)
begin
	if(!aresetn) begin
		s_bvalid <= 1'b0;
	end
	else if(s_wvalid && s_wready && s_wlast) begin
		s_bvalid <= 1'b1;
	end
	else if(s_bready) begin
		s_bvalid <= 1'b0;
	end
end

////////////////////////////////////////////////////////////////////////////////
// Read Stage
//% Read Address Acknowledge
always @(posedge aclk, negedge aresetn)
begin
	if(!aresetn) begin
		s_arready <= 1'b1;
	end
	else if(s_arvalid && s_arready) begin
		s_arready <= 1'b0;
	end
	else if(s_rvalid && s_rready && s_rlast) begin
		s_arready <= 1'b1;
	end
end

//% Read Strobe Start
always @(posedge aclk, negedge aresetn)
begin
	if(!aresetn) begin
		read_start <= 1'b0;
	end
	else if(s_arvalid && s_arready) begin
		read_start <= 1'b1;
	end
	else begin
		read_start <= 1'b0;
	end
end

//% Read ID Latch
always @(posedge aclk)
begin
	if(s_arvalid && s_arready) begin
		read_id <= s_arid;
	end
end

//% Read Length Couting
always @(posedge aclk)
begin
	if(s_arvalid && s_arready) begin
		read_len <= s_arlen;
	end
	else if(read_strobe) begin
		read_len <= read_len-1;
	end
end

//% Read Response Last Detection
always @(posedge aclk)
begin
	if(read_strobe) begin
		s_rlast <= (read_len==0);
	end
end

//% Read Data Response
always @(posedge aclk, negedge aresetn) 
begin
	if(!aresetn) begin
		s_rvalid <= 1'b0;
	end
	else if(read_start) begin
		s_rvalid <= 1'b1;
	end
	else if(s_rready && s_rlast) begin
		s_rvalid <= 1'b0;
	end
end

//% Read Addressing
always @(posedge aclk)
begin
	if(s_arvalid && s_arready) begin
		read_addr <= s_araddr;
	end
	else if(read_strobe) begin
		read_addr <= read_addr + STRB_WIDTH;
	end
end

//% Internal Memory
reg [DATA_WIDTH-1:0] mem[0:MEMORY_DEPTH-1];

//% Memory Write
generate
genvar i;
for(i=0;i<STRB_WIDTH;i=i+1) begin:WRITE
	always @(posedge aclk) 
	begin
		if(write_strobe && s_wstrb[i])
			mem[write_addr[MEM_ADDR_MSB:MEM_ADDR_LSB]][i*8+7:i*8] 
				<= s_wdata[i*8+7:i*8];
	end
end
endgenerate

//% Memory Read
always @(posedge aclk)
begin
	if(read_strobe)
		s_rdata <= mem[read_addr[MEM_ADDR_MSB:MEM_ADDR_LSB]];
end

/* synthesis translate_off */

task init(input [DATA_WIDTH-1:0] data);
	integer i;
begin
	for(i=0;i<MEMORY_DEPTH;i=i+1) 
		mem[i] = data;
end
endtask

task write(input [MEM_ADDR_MSB:0] addr, input [DATA_WIDTH-1:0] data);
begin
	mem[addr[MEM_ADDR_MSB:MEM_ADDR_LSB]] = data;
end
endtask

function [DATA_WIDTH-1:0] read(input [MEM_ADDR_MSB:0] addr);
begin
	read = mem[addr[MEM_ADDR_MSB:MEM_ADDR_LSB]];
end
endfunction

/* synthesis translate_on*/

endmodule
