module axi_rdma #(
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

	output reg [3:0] axi_m_arid,
	output reg [ADDRESS_BITS-1:0] axi_m_araddr,
	output reg [7:0] axi_m_arlen,
	output reg [2:0] axi_m_arsize,
	output reg [1:0] axi_m_arburst,
	output reg axi_m_arvalid,
	input axi_m_arready,

	input [3:0] axi_m_rid,
	input [31:0] axi_m_rdata,
	input [1:0] axi_m_rresp,
	input axi_m_rlast,
	input axi_m_rvalid,
	output reg axi_m_rready,

	output  [31:0] dout_tdata,
	output  [3:0] dout_tkeep,
	output  dout_tlast,
	output  dout_tvalid,
	input dout_tready
);

reg [LENGTH_BITS-1:0] length;
reg [LENGTH_BITS-1:0] dout_dwords;
reg [LENGTH_BITS-1:0] length_dwords;
reg [LENGTH_BITS-1:0] remain_dwords;
reg [LENGTH_BITS-1:0] remain_dwords_init;
reg [LENGTH_BITS-1:0] fetch_dwords;
reg [LENGTH_BITS-1:0] fetch_dwords_next;
reg [3:0] first_wstrb;
reg [3:0] first_wstrb_set;
reg [3:0] last_wstrb;

reg [31:0] oa_s_tdata;
reg [3:0] oa_s_tkeep;
reg [1:0] oa_s_tuser;
reg oa_s_tlast;
reg oa_s_tvalid;
wire oa_s_tready;

wire [31:0] oa_m_tdata;
wire [3:0] oa_m_tkeep;
wire oa_m_tlast;
wire oa_m_tvalid;
wire oa_m_tready;

integer state, state_next;
localparam S_IDLE=0, S_INIT=1, S_CALC=2, S_ASTRB=3, S_INCR=4, S_WAIT=5;

assign dout_tdata = oa_m_tdata;
assign dout_tkeep = oa_m_tkeep;
assign dout_tlast = oa_m_tlast;
assign dout_tvalid = oa_m_tvalid;
assign oa_m_tready = dout_tready;

axis_realign #(
	.INPUT_BIG_ENDIAN(MEM_BIG_ENDIAN),
	.OUTPUT_BIG_ENDIAN(STREAM_BIG_ENDIAN)
)out_algn_i(
	.aclk(aclk),
	.aresetn(aresetn),
	.s_tdata(oa_s_tdata),
	.s_tkeep(oa_s_tkeep),
	.s_tuser(oa_s_tuser),
	.s_tlast(oa_s_tlast),
	.s_tvalid(oa_s_tvalid),
	.s_tready(oa_s_tready),
	.m_tdata(oa_m_tdata),
	.m_tkeep(oa_m_tkeep),
	.m_tlast(oa_m_tlast),
	.m_tvalid(oa_m_tvalid),
	.m_tready(oa_m_tready)
);

always @(*)
begin
	oa_s_tuser = 0;
	oa_s_tvalid = axi_m_rvalid;
	oa_s_tdata = axi_m_rdata;

	if(dout_dwords==0)
		oa_s_tkeep = first_wstrb|first_wstrb_set;
	else if(dout_dwords==length_dwords-1)
		oa_s_tkeep = last_wstrb;
	else
		oa_s_tkeep = 4'b1111;

	if(dout_dwords==length_dwords-1)
		oa_s_tlast = 1'b1;
	else
		oa_s_tlast = 1'b0;

	axi_m_arsize = 3'b010;
	axi_m_arburst = 2'b01;
	axi_m_rready = oa_s_tready;
end

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
			if(axi_m_arready)
				state_next = S_INCR;
			else
				state_next = S_ASTRB;
		end
		S_INCR: begin
			if(remain_dwords>0)
				state_next = S_CALC;
			else
				state_next = S_WAIT;
		end
		S_WAIT: begin
			if(dout_tvalid && dout_tlast && dout_tready)
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
		axi_m_araddr <= 'bx;
		first_wstrb <= 'bx;
		last_wstrb <= 'bx;
		first_wstrb_set <= 'bx;
		axi_m_arvalid <= 1'b0;
		axi_m_arlen <= 'bx;
		axi_m_arid <= 'b0;
		cmd_ready <= 1'b1;
		fetch_dwords <= 'bx;
	end
	else case(state_next)
		S_IDLE: begin
			cmd_ready <= 1'b1;
		end
		S_INIT: begin
			cmd_ready <= 1'b0;
			length_dwords <= remain_dwords_init;
			remain_dwords <= remain_dwords_init;
			axi_m_araddr <= {cmd_address[ADDRESS_BITS-1:2],2'b0};
			case({cmd_address[1:0],cmd_bytes[1:0]}) /* synthesis parallel_case */
				4'b0000: first_wstrb <= 4'b1111;
				4'b0001: first_wstrb <= 4'b0001;
				4'b0010: first_wstrb <= 4'b0011;
				4'b0011: first_wstrb <= 4'b0111;
				4'b0100: first_wstrb <= 4'b1110;
				4'b0101: first_wstrb <= 4'b0010;
				4'b0110: first_wstrb <= 4'b0110;
				4'b0111: first_wstrb <= 4'b1110;
				4'b1000: first_wstrb <= 4'b1100;
				4'b1001: first_wstrb <= 4'b0100;
				4'b1010: first_wstrb <= 4'b1100;
				4'b1011: first_wstrb <= 4'b1100;
				4'b1100: first_wstrb <= 4'b1000;
				4'b1101: first_wstrb <= 4'b1000;
				4'b1110: first_wstrb <= 4'b1000;
				4'b1111: first_wstrb <= 4'b1000;
			endcase
			case({cmd_address[1:0],cmd_bytes[1:0]}) /* synthesis parallel_case */
				4'b0000: last_wstrb <= 4'b1111;
				4'b0001: last_wstrb <= 4'b0001;
				4'b0010: last_wstrb <= 4'b0011;
				4'b0011: last_wstrb <= 4'b0111;
				4'b0100: last_wstrb <= 4'b0001;
				4'b0101: last_wstrb <= 4'b0011;
				4'b0110: last_wstrb <= 4'b0111;
				4'b0111: last_wstrb <= 4'b1111;
				4'b1000: last_wstrb <= 4'b0011;
				4'b1001: last_wstrb <= 4'b0111;
				4'b1010: last_wstrb <= 4'b1111;
				4'b1011: last_wstrb <= 4'b0001;
				4'b1100: last_wstrb <= 4'b0111;
				4'b1101: last_wstrb <= 4'b1111;
				4'b1110: last_wstrb <= 4'b0001;
				4'b1111: last_wstrb <= 4'b0011;
			endcase
			case(cmd_address[1:0])// synthesis full_case
				2'b00: first_wstrb_set <= 4'b1111;
				2'b01: first_wstrb_set <= 4'b1110;
				2'b10: first_wstrb_set <= 4'b1100;
				2'b11: first_wstrb_set <= 4'b1000;
			endcase
		end
		S_CALC: begin
			if(length_dwords==1)
				first_wstrb_set <= 4'b0;
			fetch_dwords <= fetch_dwords_next;
		end
		S_ASTRB: begin
			axi_m_arvalid <= 1'b1;
			axi_m_arlen <= fetch_dwords-1;
		end
		S_INCR: begin
			axi_m_arvalid <= 1'b0;
			axi_m_araddr[ADDRESS_BITS-1:2] <= axi_m_araddr[ADDRESS_BITS-1:2] + fetch_dwords;
			remain_dwords <= remain_dwords - fetch_dwords;
		end
		S_WAIT: begin
		end
	endcase
end

always @(posedge aclk, negedge aresetn)
begin
	if(!aresetn) begin
		dout_dwords <= 'b0;
	end
	else if(state_next == S_INIT) begin
		dout_dwords <= 'b0;
	end
	else if(oa_s_tvalid && oa_s_tready) begin
		dout_dwords <= dout_dwords+1;
	end
end

endmodule
