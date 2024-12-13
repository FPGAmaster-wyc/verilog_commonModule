////////////////////////////////////////////////////////////////////////////////
// File:	fifo_async.v
// Author:	Jonah Liu <liujiahan@gmail.com>
// Description:
//	Generic asynchronous FIFO which supports both normal and 
//	first-word-fall-through mode.
//
////////////////////////////////////////////////////////////////////////////////
module fifo_async(
	wr_rst,
	wr_clk,
	din,
	wr_en,
	full,
	wr_count,
	rd_rst,
	rd_clk,
	dout,
	rd_en,
	empty,
	rd_count
);
parameter DSIZE = 8;
parameter ASIZE = 4;
parameter MODE = "NORMAL";

function [ASIZE:0] gray_encode(input [ASIZE:0] binary);
begin
	gray_encode = (binary>>1) ^ binary;
end
endfunction

function [ASIZE:0] gray_decode(input [ASIZE:0] gray);
	integer i;
begin
	gray_decode[ASIZE] = gray[ASIZE];
	for(i=ASIZE-1;i>=0;i=i-1)
		gray_decode[i] = gray_decode[i+1]^gray[i];
end
endfunction

output [DSIZE-1:0] dout;
output full;
output empty;
output [ASIZE:0] wr_count;
output [ASIZE:0] rd_count;
input [DSIZE-1:0] din;
input wr_en, wr_clk, wr_rst;
input rd_en, rd_clk, rd_rst;

reg full,empty;
reg [ASIZE:0] wptr, rptr;
reg [ASIZE:0] rbin, wbin;
(* ASYNC_REG = "TRUE" *) reg [ASIZE:0] wq2_rptr, wq1_rptr;
(* ASYNC_REG = "TRUE" *) reg [ASIZE:0] rq2_wptr, rq1_wptr;
reg [ASIZE:0] wq2_rbin;
reg [ASIZE:0] rq2_wbin;
reg [ASIZE:0] wr_count;
reg [ASIZE:0] rd_count;

reg [DSIZE-1:0] mem[0:(1<<ASIZE)-1];

wire [ASIZE-1:0] waddr, raddr;
wire [ASIZE:0]  rgraynext, rbinnext,wgraynext,wbinnext;
wire  empty_val,full_val;

reg [DSIZE-1:0] dout_r;
assign dout = dout_r;

generate
if(MODE=="FWFT") begin
    wire [ASIZE-1:0] raddrnext = rbinnext[ASIZE-1:0];
    always @(posedge rd_clk or posedge rd_rst)
    begin
        if(rd_rst)
            dout_r <= 0;
        else
            dout_r <= mem[raddrnext];
    end
end
else begin
    always @(posedge rd_clk or posedge rd_rst)
    begin
        if(rd_rst)
            dout_r <= 0;
        else if(rd_en && !empty)
            dout_r <= mem[raddr];
    end
end
endgenerate

// Write data latch
always@(posedge wr_clk)
begin
	if (wr_en && !full)
		mem[waddr] <= din;
end

// Read pointer synchornization
always @(posedge wr_clk or posedge wr_rst)
	if (wr_rst)
		{wq2_rptr,wq1_rptr} <= 0;
	else
		{wq2_rptr,wq1_rptr} <= {wq1_rptr,rptr};

// Write pointer synchornization
always @(posedge rd_clk or posedge rd_rst)
	if (rd_rst)
		{rq2_wptr,rq1_wptr} <= 0;
	else
		{rq2_wptr,rq1_wptr} <= {rq1_wptr,wptr};

// Read pointers
always @(posedge rd_clk or posedge rd_rst)
begin
if (rd_rst)
	{rbin, rptr} <= 0;
else
	{rbin, rptr} <= {rbinnext, rgraynext};
end

// Memory read-address pointer (okay to use binary to address memory)
assign raddr = rbin[ASIZE-1:0];
assign rbinnext = rbin + (rd_en & ~empty);
//assign rgraynext = (rbinnext>>1) ^ rbinnext;
assign rgraynext = gray_encode(rbinnext);

// FIFO empty when the next rptr == synchronized wptr or on reset
assign empty_val = (rgraynext == rq2_wptr);
always @(posedge rd_clk or posedge rd_rst)
begin
 if (rd_rst)
	 empty <= 1'b1;
 else
	 empty <= empty_val;
end

always @(posedge rd_clk or posedge rd_rst)
begin
	if(rd_rst)
		rq2_wbin <= 0;
	else
		rq2_wbin <= gray_decode(rq2_wptr);
end

always @(posedge rd_clk or posedge rd_rst)
begin
	if(rd_rst)
		rd_count <= 0;
	else
		rd_count <= rq2_wbin - rbinnext;
end

// Write pointers
always @(posedge wr_clk or posedge wr_rst)
begin
	if (wr_rst)
		{wbin, wptr} <= 0;
	else
		{wbin, wptr} <= {wbinnext, wgraynext};
end

// Memory write-address pointer (okay to use binary to address memory)
assign waddr = wbin[ASIZE-1:0];
assign wbinnext = wbin + (wr_en & ~full);
//assign wgraynext = (wbinnext>>1) ^ wbinnext;
assign wgraynext = gray_encode(wbinnext);

//------------------------------------------------------------------
// Simplified version of the three necessary full-tests:
// assign full_val=((wgnext[ADDRSIZE] !=wq2_rptr[ADDRSIZE] ) &&
// (wgnext[ADDRSIZE-1] !=wq2_rptr[ADDRSIZE-1]) &&
// (wgnext[ADDRSIZE-2:0]==wq2_rptr[ADDRSIZE-2:0]));

//------------------------------------------------------------------
assign full_val = (wgraynext=={~wq2_rptr[ASIZE:ASIZE-1], wq2_rptr[ASIZE-2:0]});
always @(posedge wr_clk or posedge wr_rst)
begin
	if (wr_rst)
		full <= 1'b0;
	else
		full <= full_val;
end

always @(posedge wr_clk or posedge wr_rst)
begin
	if(wr_rst)
		wq2_rbin <= 0;
	else
		wq2_rbin <= gray_decode(wq2_rptr);
end

always @(posedge wr_clk or posedge wr_rst)
begin
	if(wr_rst)
		wr_count <= 0;
	else
		wr_count <= wbinnext - wq2_rbin;
end

endmodule
