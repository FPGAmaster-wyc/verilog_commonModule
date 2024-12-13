////////////////////////////////////////////////////////////////////////////////
// File:	axis_fifo.v
// Author:	Jonah Liu <liujiahan@gmail.com>
// Description:
//	AXI-S FIFO which supports packet mode.
//
////////////////////////////////////////////////////////////////////////////////
module axis_fifo(
	aclk,
	aresetn,
	s_tdata,
	s_tvalid,
	s_tlast,
	s_tready,
	m_tdata,
	m_tvalid,
	m_tlast,
	m_tready,

	wr_count,
	rd_count
);
parameter DSIZE = 8;
parameter ASIZE = 4;
parameter MODE = "NORMAL";

input aclk;
input aresetn;
input [DSIZE-1:0] s_tdata;
input s_tvalid;
input s_tlast;
output s_tready;
output [DSIZE-1:0] m_tdata;
output m_tvalid;
output m_tlast;
input m_tready;
output [ASIZE:0] wr_count;
output [ASIZE:0] rd_count;

reg full,empty;
reg [ASIZE:0] rbin, wbin;
reg [ASIZE:0] wbin_packet;
reg [ASIZE:0] wr_count;
reg [ASIZE:0] rd_count;

reg [DSIZE:0] mem[0:(1<<ASIZE)-1];

wire [ASIZE:0] wbin_sync;
wire [ASIZE-1:0] waddr, raddr;
wire [ASIZE:0]  rbinnext, wbinnext;
wire  empty_val,full_val;

reg [DSIZE:0] dout_r;

assign s_tready=!full;

assign m_tdata=dout_r[DSIZE-1:0];
assign m_tlast=dout_r[DSIZE];
assign m_tvalid=!empty;

wire [ASIZE-1:0] raddrnext = rbinnext[ASIZE-1:0];
always @(posedge aclk or negedge aresetn)
begin
	if(!aresetn)
		dout_r <= 0;
	else
		dout_r <= mem[raddrnext];
end

// Write data latch
always@(posedge aclk)
begin
	if (s_tvalid && !full)
		mem[waddr] <= {s_tlast, s_tdata};
end

// Read pointers
always @(posedge aclk or negedge aresetn)
begin
if (!aresetn)
	rbin <= 0;
else
	rbin <= rbinnext;
end

// Memory read-address pointer 
assign raddr = rbin[ASIZE-1:0];
assign rbinnext = rbin + (m_tready & ~empty);

// pointer sync
assign wbin_sync = MODE=="PACKET" ? wbin_packet : wbin;

// FIFO empty when the next rbin == wbin_sync or on reset
assign empty_val = rbinnext == wbin_sync;
always @(posedge aclk or negedge aresetn)
begin
 if (!aresetn)
	 empty <= 1'b1;
 else
	 empty <= empty_val;
end

always @(posedge aclk or negedge aresetn)
begin
	if(!aresetn)
		rd_count <= 0;
	else
		rd_count <= wbin_sync - rbinnext;
end

// Write pointers
always @(posedge aclk or negedge aresetn)
begin
	if (!aresetn)
		wbin <= 0;
	else
		wbin <= wbinnext;
end
always @(posedge aclk or negedge aresetn)
begin
	if (!aresetn)
		wbin_packet <= 0;
	else if(s_tvalid & s_tlast & ~full)
		wbin_packet <= wbinnext;
end

// Memory write-address pointer (okay to use binary to address memory)
assign waddr = wbin[ASIZE-1:0];
assign wbinnext = wbin + (s_tvalid & ~full);

//------------------------------------------------------------------
// Simplified version of the three necessary full-tests:
// assign full_val=(wbinnext[ADDRSIZE]!=rbin[ADDRSIZE]) &&
//                 (wbinnext[ADDRSIZE-1:0]==rbin[ADDRSIZE-1:0]));
//------------------------------------------------------------------
assign full_val = (wbinnext=={~rbin[ASIZE], rbin[ASIZE-1:0]});
always @(posedge aclk or negedge aresetn)
begin
	if (!aresetn)
		full <= 1'b0;
	else
		full <= full_val;
end

always @(posedge aclk or negedge aresetn)
begin
	if(!aresetn)
		wr_count <= 0;
	else
		wr_count <= wbinnext - rbin;
end
endmodule
