module axi_wdma #(
	parameter ADDRESS_BITS=32,
	parameter LENGTH_BITS=32,
	parameter MAX_BURST=256,
	parameter STREAM_BIG_ENDIAN="TRUE",
	parameter MEM_BIG_ENDIAN="TRUE"
)
(
	input aclk,
	input aresetn,

	input [ADDRESS_BITS-1:0] cmd_address,
	input [LENGTH_BITS-1:0] cmd_bytes,
	input cmd_valid,
	output reg cmd_ready,

	output [3:0] axi_m_awid,
	output reg [ADDRESS_BITS-1:0] axi_m_awaddr,
	output reg [7:0] axi_m_awlen,
	output [2:0] axi_m_awsize,
	output [1:0] axi_m_awburst,
	output reg axi_m_awvalid,
	input axi_m_awready,

	output [3:0] axi_m_wid,
	output [31:0] axi_m_wdata,
	output [3:0] axi_m_wstrb,
	output axi_m_wlast,
	output axi_m_wvalid,
	input axi_m_wready,

	input [3:0] axi_m_bid,
	input [1:0] axi_m_bresp,
	input axi_m_bvalid,
	output reg axi_m_bready,

	input [31:0] din_tdata,
	input [3:0] din_tkeep,
	input din_tlast,
	input din_tvalid,
	output din_tready
);

reg [LENGTH_BITS-1:0] length;
reg [LENGTH_BITS-1:0] length_dwords;
reg [LENGTH_BITS-1:0] remain_dwords;
reg [LENGTH_BITS-1:0] remain_dwords_init;
reg [LENGTH_BITS-1:0] fetch_dwords;
reg [LENGTH_BITS-1:0] fetch_dwords_next;
reg [LENGTH_BITS-1:0] wr_dwords;

wire [31:0] ia_s_tdata;
wire [3:0] ia_s_tkeep;
reg [1:0] ia_s_tuser;
wire ia_s_tlast;
wire ia_s_tvalid;
wire ia_s_tready;

wire [31:0] ia_m_tdata;
wire [3:0] ia_m_tkeep;
wire ia_m_tlast;
wire ia_m_tvalid;
wire ia_m_tready;

reg s_ready;
reg m_ready;

integer state, state_next;
localparam S_IDLE=0, S_INIT=1, S_CALC=2, S_ASTRB=3, S_WSTRB=4, S_INCR=5, S_WAIT=6;

assign ia_s_tdata = din_tdata;
assign ia_s_tkeep = din_tkeep;
assign ia_s_tlast = din_tlast;
assign ia_s_tvalid = (s_ready&&m_ready)?din_tvalid:1'b0;
assign din_tready = (s_ready&&m_ready)?ia_s_tready:1'b0;

assign axi_m_wid = 'b0;
assign axi_m_wdata = ia_m_tdata;
assign axi_m_wstrb = ia_m_tkeep;
//assign axi_m_wlast = ia_m_tlast;
assign axi_m_wvalid = ia_m_tvalid & m_ready;
assign ia_m_tready = axi_m_wready & m_ready;

assign axi_m_awid = 'b0;
assign axi_m_awsize = 3'b010;
assign axi_m_awburst = 2'b01;

assign axi_m_wlast = wr_dwords==axi_m_awlen;

always @(posedge aclk, negedge aresetn)
begin
	if(!aresetn)
		s_ready <= 1'b0;
	else if(state_next == S_INIT)
		s_ready <= 1'b1;
	else if(ia_s_tvalid && ia_s_tready && ia_s_tlast)
		s_ready <= 1'b0;
end

axis_realign #(
	.INPUT_BIG_ENDIAN(STREAM_BIG_ENDIAN),
	.OUTPUT_BIG_ENDIAN(MEM_BIG_ENDIAN)
)in_algn_i(
	.aclk(aclk),
	.aresetn(aresetn),
	.s_tdata(ia_s_tdata),
	.s_tkeep(ia_s_tkeep),
	.s_tuser(ia_s_tuser),
	.s_tlast(ia_s_tlast),
	.s_tvalid(ia_s_tvalid),
	.s_tready(ia_s_tready),
	.m_tdata(ia_m_tdata),
	.m_tkeep(ia_m_tkeep),
	.m_tlast(ia_m_tlast),
	.m_tvalid(ia_m_tvalid),
	.m_tready(ia_m_tready)
);

always @(posedge aclk, negedge aresetn)
begin
	if(!aresetn)
		state <= S_IDLE;
	else
		state <= state_next;
end

always @(*)
begin
	case(state)
		S_IDLE: begin
			if(cmd_valid)
				state_next = S_INIT;
			else 
				state_next = S_IDLE;
		end
		S_INIT: begin
			if(remain_dwords>0)
				state_next = S_CALC;
			else
				state_next = S_IDLE;
		end
		S_CALC: begin
			state_next = S_ASTRB;
		end
		S_ASTRB: begin
			if(axi_m_awready)
				state_next = S_WSTRB;
			else
				state_next = S_ASTRB;
		end
		/*
		S_WSTRB_0: begin
			if(ia_s_tvalid && ia_s_tready && ia_s_tlast)
				state_next = S_WSTRB_1;
			else
				state_next = S_WSTRB_0;
		end
		*/
		S_WSTRB: begin
			if(axi_m_wvalid && axi_m_wready && axi_m_wlast)
				state_next = S_INCR;
			else
				state_next = S_WSTRB;
		end
		S_INCR, S_WAIT: begin
			if(axi_m_bvalid)
				if(remain_dwords>0)
					state_next = S_CALC;
				else
					state_next = S_IDLE;
			else
				state_next = S_WAIT;
		end
		default: begin
			state_next = 'bx;
		end
	endcase
end

always @(*)
begin
	if(cmd_bytes!=0)
		length = cmd_bytes+cmd_address[1:0];
	else
		length = 0;

	remain_dwords_init = length[LENGTH_BITS-1:2]+(|length[1:0]);
end

always @(*)
begin
	if(remain_dwords > MAX_BURST)
		fetch_dwords_next = MAX_BURST;
	else
		fetch_dwords_next = remain_dwords;
end

always @(posedge aclk, negedge aresetn)
begin
	if(!aresetn) begin
		length_dwords <= 'bx;
		remain_dwords <= 'bx;
		axi_m_awaddr <= 'bx;
		axi_m_awvalid <= 1'b0;
		axi_m_awlen <= 'bx;
		axi_m_bready <= 1'b0;
		cmd_ready <= 1'b1;
		m_ready <= 1'b0;
		ia_s_tuser <= 'bx;
		wr_dwords <= 'bx;
		fetch_dwords <= 'bx;
	end
	else case(state_next)
		S_IDLE: begin
			cmd_ready <= 1'b1;
			axi_m_bready <= 1'b0;
		end
		S_INIT: begin
			cmd_ready <= 1'b0;
			length_dwords <= remain_dwords_init;
			remain_dwords <= remain_dwords_init;
			axi_m_awaddr <= {cmd_address[ADDRESS_BITS-1:2],2'b0};
			ia_s_tuser <= cmd_address[1:0];
		end
		S_CALC: begin
			fetch_dwords <= fetch_dwords_next;
			axi_m_bready <= 1'b0;
		end
		S_ASTRB: begin
			axi_m_awvalid <= 1'b1;
			axi_m_awlen <= fetch_dwords-1;
			wr_dwords <= 0;
		end
		S_WSTRB: begin
			m_ready <= 1'b1;
			axi_m_awvalid <= 1'b0;
			if(axi_m_wvalid && axi_m_wready) begin
				wr_dwords <= wr_dwords+1;
			end
		end
		S_INCR: begin
			m_ready <= 1'b0;
			axi_m_awaddr[ADDRESS_BITS-1:2] <= axi_m_awaddr[ADDRESS_BITS-1:2] + fetch_dwords;
			remain_dwords <= remain_dwords - fetch_dwords;
			axi_m_bready <= 1'b1;
		end
		S_WAIT: begin
		end
	endcase
end
endmodule
