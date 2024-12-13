module frame_detect #(
	parameter TIMER_BITS = 32
)
(
	input	reset,
	input	clk_in,

	input	dvalid,
	input	lvalid,
	input	fvalid,

	output	reg [TIMER_BITS-1:0] hsize, // line data size, in unit of clock
	output	reg [TIMER_BITS-1:0] vsize, // vertical size, in unit of lines
	output	reg [TIMER_BITS-1:0] hblank, // blanking bwtween lines, in unit of clock
	output	reg [TIMER_BITS-1:0] vblank, // vertical blanking, in unit of clock 
	output	reg [TIMER_BITS-1:0] fblank // additional blanking between fields, in unit of clock cycles
);

reg dval_0;
reg lval_0;
reg fval_0;

reg [TIMER_BITS-1:0] dcnt;
reg [TIMER_BITS-1:0] lcnt;
reg [TIMER_BITS-1:0] hbcnt;
reg [TIMER_BITS-1:0] vbcnt;
reg [TIMER_BITS-1:0] fbcnt;

wire lstart = !lval_0 && lvalid;
wire lend = lval_0 && !lvalid;
wire fstart = !fval_0 && fvalid;
wire fend = fval_0 && !fvalid;

always @(posedge clk_in, posedge reset)
begin
	if(reset) begin
		hsize <= 1'b0;
		vsize <= 1'b0;
		hblank <= 1'b0;
		vblank <= 1'b0;
		fblank <= 1'b0;
	end
	else begin
		if(fstart) begin
			hsize <= dcnt;
			vsize <= lcnt;
			hblank <= hbcnt;
			vblank <= vbcnt;
		end
		if(fstart) begin
			fblank <= fbcnt;
		end
	end
end

always @(posedge clk_in, posedge reset)
begin
	if(reset) begin
		dval_0 <= 1'b0;
		lval_0 <= 1'b0;
		fval_0 <= 1'b0;
	end
	else begin
		dval_0 <= dvalid;
		lval_0 <= lvalid;
		fval_0 <= fvalid;
	end
end

always @(posedge clk_in, posedge reset)
begin
	if(reset) begin
		dcnt <= 'b0;
	end
	else if(dval_0 && lval_0 && fval_0) begin
		dcnt <= dcnt + 1;
	end
	else if(lstart) begin
		dcnt <= 'b0;
	end
end

always @(posedge clk_in, posedge reset)
begin
	if(reset) begin
		lcnt <= 'b0;
	end
	else if(lend) begin
		lcnt <= lcnt + 1;
	end
	else if(fstart) begin
		lcnt <= 'b0;
	end
end

always @(posedge clk_in, posedge reset)
begin
	if(reset) begin
		hbcnt <= 'b0;
	end
	else if(!lval_0 && fval_0) begin
		hbcnt <= hbcnt + 1;
	end
	else if(lend) begin
		hbcnt <= 'b0;
	end
end

always @(posedge clk_in, posedge reset)
begin
	if(reset) begin
		vbcnt <= 'b0;
	end
	else if(!lval_0 && fval_0) begin
		vbcnt <= hbcnt + 1;
	end
	else if(lstart) begin
		vbcnt <= 'b0;
	end
end

always @(posedge clk_in, posedge reset)
begin
	if(reset) begin
		fbcnt <= 'b0;
	end
	else if(!fvalid) begin
		fbcnt <= fbcnt + 1;
	end
	else if(fstart) begin
		fbcnt <= 'b0;
	end
end


endmodule
