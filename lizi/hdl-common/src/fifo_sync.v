////////////////////////////////////////////////////////////////////////////////
// File:	fifo_sync.v
// Author:	Jonah Liu <liujiahan@gmail.com>
// Description:
//	Generic FIFO which supports both normal and first-word-fall-through mode.
//
////////////////////////////////////////////////////////////////////////////////
module fifo_sync(
	rst,
	clk,
	din,
	wr_en,
	full,
	dout,
	rd_en,
	empty,
	data_count
);
parameter DSIZE = 8;
parameter ASIZE = 4;
parameter MODE = "NORMAL";

output [DSIZE-1:0] dout;
output full;
output empty;
output [ASIZE:0] data_count;
input [DSIZE-1:0] din;
input wr_en;
input rd_en;
input clk;
input rst;

reg full,empty;
reg [ASIZE:0] rbin, wbin;
reg [ASIZE:0] data_count;

reg [DSIZE-1:0] mem[0:(1<<ASIZE)-1];

wire [ASIZE-1:0] waddr, raddr;
wire [ASIZE:0]  rbinnext, wbinnext;
wire  empty_val,full_val;

reg [DSIZE-1:0] dout_r;
assign dout=dout_r;

generate
if(MODE=="FWFT") begin
    wire [ASIZE-1:0] raddrnext = rbinnext[ASIZE-1:0];
    always @(posedge clk or posedge rst)
    begin
        if(rst)
            dout_r <= 0;
        else
            dout_r <= mem[raddrnext];
    end
end
else begin
	always @(posedge clk or posedge rst)
	begin
		if(rst)
			dout_r <= 0;
		else if(rd_en && !empty)
			dout_r <= mem[raddr];
	end
end
endgenerate

// Write data latch
always@(posedge clk)
begin
	if (wr_en && !full)
		mem[waddr] <= din;
end

// Read pointers
always @(posedge clk or posedge rst)
begin
if (rst)
	rbin <= 0;
else
	rbin <= rbinnext;
end

// Memory read-address pointer 
assign raddr = rbin[ASIZE-1:0];
assign rbinnext = rbin + (rd_en & ~empty);

// FIFO empty when the next rbin == wbin or on reset
assign empty_val = rbinnext == wbinnext;
always @(posedge clk or posedge rst)
begin
 if (rst)
	 empty <= 1'b1;
 else
	 empty <= empty_val;
end

// Write pointers
always @(posedge clk or posedge rst)
begin
	if (rst)
		wbin <= 0;
	else
		wbin <= wbinnext;
end

// Memory write-address pointer (okay to use binary to address memory)
assign waddr = wbin[ASIZE-1:0];
assign wbinnext = wbin + (wr_en & ~full);

//------------------------------------------------------------------
// Simplified version of the three necessary full-tests:
// assign full_val=(wbinnext[ADDRSIZE]!=rbin[ADDRSIZE]) &&
//                 (wbinnext[ADDRSIZE-1:0]==rbin[ADDRSIZE-1:0]));
//------------------------------------------------------------------
assign full_val = (wbinnext=={~rbinnext[ASIZE], rbinnext[ASIZE-1:0]});
always @(posedge clk or posedge rst)
begin
	if (rst)
		full <= 1'b0;
	else
		full <= full_val;
end

// data count
always @(posedge clk or posedge rst)
begin
	if(rst)
		data_count <= 0;
	else
		data_count <= wbinnext - rbinnext;
end

endmodule
