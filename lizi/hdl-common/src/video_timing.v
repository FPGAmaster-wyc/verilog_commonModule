module video_timing #(
	parameter TIMER_BITS = 32
)
(
	input	reset,
	input	clk_in,
	input	[TIMER_BITS-1:0] bsize, // active data beats in a burst
	input	[TIMER_BITS-1:0] btotal, // total clock cycles per bursts
	input	[TIMER_BITS-1:0] hsize, // active line size, in unit of bursts 
	input	[TIMER_BITS-1:0] htotal, // total line size, in unit of bursts
	input	[TIMER_BITS-1:0] hsync_start, // hsync start position, in unit of bursts
	input	[TIMER_BITS-1:0] hsync_width, // hsync pulse width, in unit of bursts
	input	[TIMER_BITS-1:0] vsize, // active vertical size, in unit of lines
	input	[TIMER_BITS-1:0] vtotal, // total vertical size, in unit of lines
	input	[TIMER_BITS-1:0] vsync_start, // vsync start position, in unit of lines
	input	[TIMER_BITS-1:0] vsync_width, // vsync pulse width, in unit of lines
	input	[TIMER_BITS-1:0] fspace, // additional spacing between fields, in unit of clock cycles
	input	ready, // frame data ready, will skip a frame if not ready
    input   trigger, // pulse for one-shot mode, tie to 1 for continuous mode
	// digital style
	output	fvalid, // frame valid
	output	lvalid, // line valid
	output	dvalid, // date valid
	output	tvalid, // transmission valid
	// streaming style
	output	de, // data valid
	output	sof, // start of frame
	output	eof, // end of frame
	output	sol, // start of line
	output	eol, // end of line
	// video timing style
	output	hblank, // horizontal blank
	output	vblank,  // vertical blank
	output  hsync,  // horizontal sync
	output  vsync, // vertical sync
    output  last
);

reg enable;

reg [TIMER_BITS-1:0] dcnt;
reg [TIMER_BITS-1:0] bcnt;
reg [TIMER_BITS-1:0] lcnt;
reg [TIMER_BITS-1:0] fbcnt;
reg [TIMER_BITS-1:0] bsize_r;
reg [TIMER_BITS-1:0] hsize_r;
reg [TIMER_BITS-1:0] vsize_r;
reg [TIMER_BITS-1:0] fspace_r;
reg [TIMER_BITS-1:0] btotal_r;
reg [TIMER_BITS-1:0] htotal_r;
reg [TIMER_BITS-1:0] vtotal_r;
reg [TIMER_BITS-1:0] hsync_start_r;
reg [TIMER_BITS-1:0] hsync_end_r;
reg [TIMER_BITS-1:0] vsync_start_r;
reg [TIMER_BITS-1:0] vsync_end_r;

reg dvalid_r;
reg lvalid_r;
reg fvalid_r;
reg tvalid_r;
reg ready_r;
reg hsync_r;
reg vsync_r;
reg sof_r;
reg eof_r;
reg sol_r;
reg eol_r;

assign dvalid = dvalid_r&ready_r;
assign lvalid = lvalid_r&ready_r;
assign fvalid = fvalid_r&ready_r;
assign tvalid = tvalid_r&ready_r;
assign sof = sof_r&ready_r;
assign eof = eof_r&ready_r;
assign sol = sol_r&ready_r;
assign eol = eol_r&ready_r;
assign hsync = hsync_r&ready_r;
assign vsync = vsync_r&ready_r;

assign de = dvalid;
assign hblank = !lvalid;
assign vblank = !fvalid;

always @(posedge clk_in, posedge reset)
begin
    if(reset) begin
        enable <= 1'b0;
    end
    else if(!enable) begin
        enable <= trigger;
    end
	else if(fbcnt==fspace_r && dcnt+1==btotal_r && bcnt+1==htotal_r && lcnt+1==vtotal_r) begin
        enable <= trigger;
    end
end

always @(posedge clk_in, posedge reset)
begin
	if(reset) begin
		bsize_r <= 1;
		hsize_r <= 1;
		vsize_r <= 1;
		fspace_r <= 0;
		btotal_r <= 1;
		htotal_r <= 1;
		vtotal_r <= 1;
        hsync_start_r <= 0;
        hsync_end_r <= 1;
        vsync_start_r <= 0;
        vsync_end_r <= 1;
	end 
	else if(
		dcnt+1==btotal_r &&
		bcnt+1==htotal_r &&
		lcnt+1==vtotal_r
	)begin
		bsize_r <= bsize;
		hsize_r <= hsize;
		vsize_r <= vsize;
		fspace_r <= fspace;
		btotal_r <= btotal;
		htotal_r <= htotal;
		vtotal_r <= vtotal;
        hsync_start_r <= hsync_start;
        hsync_end_r <= hsync_start+hsync_width;
        vsync_start_r <= vsync_start;
        vsync_end_r <= vsync_start+vsync_width;
	end
end

always @(posedge clk_in, posedge reset)
begin
	if(reset) begin
		dcnt <= 'b0;
		bcnt <= 'b0;
		lcnt <= 'b0;
		fbcnt <= -1;
	end
    else if(enable) begin
        if(fbcnt==fspace_r) begin
            if(dcnt+1==btotal_r) begin
                if(bcnt+1==htotal_r) begin
                    if(lcnt+1==vtotal_r) begin
                        fbcnt<=0;
                        lcnt <= 'b0;
                    end 
                    else begin
                        lcnt <= lcnt+1;
                    end
                    bcnt <= 'b0;
                end
                else begin
                    bcnt <= bcnt+1;
                end
                dcnt <= 'b0;
            end
            else begin
                dcnt <= dcnt+1;
            end
        end
        else begin
            fbcnt <= fbcnt+1;
        end
    end
end

wire tvalid_a = fbcnt == fspace_r;
wire fvalid_a = lcnt<vsize_r;
wire lvalid_a = bcnt<hsize_r;
wire dvalid_a = dcnt<bsize_r;
wire hsync_a = bcnt>=hsync_start_r && bcnt<hsync_end_r;
wire vsync_a = lcnt>=vsync_start_r && lcnt<vsync_end_r;
wire sof_a = dcnt==0 && bcnt==0 && lcnt==0;
wire eof_a = dcnt+1==bsize_r && bcnt+1==hsize_r && lcnt+1==vsize_r;
wire sol_a = dcnt==0 && bcnt==0;
wire eol_a = dcnt+1==bsize_r && bcnt+1==hsize_r;
always @(posedge clk_in, posedge reset)
begin
	if(reset) begin
		dvalid_r <= 1'b0;
		lvalid_r <= 1'b0;
		fvalid_r <= 1'b0;
		tvalid_r <= 1'b0;
        	hsync_r <= 1'b0;
        	vsync_r <= 1'b0;
		sof_r <= 1'b0;
		eof_r <= 1'b0;
		sol_r <= 1'b0;
		eol_r <= 1'b0;
	end
	else if(enable) begin
		dvalid_r <= dvalid_a & lvalid_a & fvalid_a & tvalid_a;
		lvalid_r <= lvalid_a & fvalid_a & tvalid_a;
		fvalid_r <= fvalid_a & tvalid_a;
		tvalid_r <= tvalid_a;
        hsync_r <= hsync_a;
        vsync_r <= vsync_a;
		sof_r <= sof_a & dvalid_a & lvalid_a & fvalid_a & tvalid_a;
		eof_r <= eof_a & dvalid_a & lvalid_a & fvalid_a & tvalid_a;
		sol_r <= sol_a & dvalid_a & lvalid_a & fvalid_a & tvalid_a;
		eol_r <= eol_a & dvalid_a & lvalid_a & fvalid_a & tvalid_a;
	end
end
assign last = tvalid_a;

always @(posedge clk_in, posedge reset)
begin
	if(reset) begin
		ready_r <= 1'b0;
	end
	else if(dcnt==0 && bcnt==0 && lcnt==0) begin
		ready_r <= ready;
	end
end
endmodule
