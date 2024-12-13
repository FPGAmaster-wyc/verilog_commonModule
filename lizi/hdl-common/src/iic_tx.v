// A simple IIC transmitter
// NO SUPPORT for multiple masters
module iic_tx(
	input clk,
	input rst,
	input [7:0] data,
	input start,
	input stop,
	input tx_valid,
	output	tx_ready,
	input	scl_i,
	output	scl_o,
	output	scl_oe,
	input	sda_i,
	output	sda_o,
	output	sda_oe
);

parameter IIC_SPEED = 400000;
parameter CLOCK_PERIOD_NS = 10;
parameter UI_CLOCKS = 1_000_000_000/IIC_SPEED/CLOCK_PERIOD_NS;

reg busy;
reg scl_r, sda_r;
reg start_r;
reg stop_r;
reg [3:0] bits;
reg [7:0] data_r;

integer s1, s1_next;
localparam S1_IDLE=0, S1_SETUP=1, S1_START=2, S1_DATA=3, S1_ACK=4, S1_STOP=5;

assign tx_ready = !busy;
assign scl_o = scl_r;
assign scl_oe = !scl_r;
assign sda_o = sda_r;
assign sda_oe = !sda_r;

reg [15:0] tmr;
reg clock_flag;

// FIXME: if there are multiple masters, need to check bus status
wire bus_busy = 0;

wire clock_edge = tmr==UI_CLOCKS/2;
wire data_edge = tmr==0;
always @(posedge clk, posedge rst)
begin
	if(rst) begin
		tmr <= 0;
	end
	else if(s1 == S1_IDLE) begin
		tmr <= 0;
	end
	else if(tmr==UI_CLOCKS-1) begin
		tmr <= 0;
	end
	else if(!clock_flag || scl_i) begin
		// slave may insert wait cycles by pulling SCL low.
		// stop clock when this happens.
		tmr <= tmr+1;
	end
end

always @(posedge clk, posedge rst)
begin
	if(rst) begin
		clock_flag <= 1'b0;
	end
	else if(data_edge) begin
		clock_flag <= 1'b0;
	end
	else if(clock_edge) begin
		clock_flag <= 1'b1;
	end
end

always @(posedge clk, posedge rst)
begin
	if(rst)
		s1 <= S1_IDLE;
	else
		s1 <= s1_next;
end

always @(*)
begin
	case(s1)
		S1_IDLE: begin
			if(tx_valid)
				s1_next = S1_SETUP;
			else
				s1_next = S1_IDLE;
		end
		S1_SETUP: begin
			if(!bus_busy)
				if(start_r)
					s1_next = S1_START;
				else
					s1_next = S1_DATA;
			else
				s1_next = S1_SETUP;
		end
		S1_START: begin
			if(data_edge)
				s1_next = S1_DATA;
			else
				s1_next = S1_START;
		end
		S1_DATA: begin
			if(data_edge)
				if(bits == 8)
					s1_next = S1_ACK;
				else
					s1_next = S1_DATA;
			else
				s1_next = S1_DATA;
		end
		S1_ACK: begin
			if(data_edge)
				if(stop_r)
					s1_next = S1_STOP;
				else
					s1_next = S1_IDLE;
			else
				s1_next = S1_ACK;
		end
		S1_STOP: begin
			if(data_edge)
				s1_next = S1_IDLE;
			else
				s1_next = S1_STOP;
		end
		default: begin
			s1_next = 'bx;
		end
	endcase
end

always @(posedge clk, posedge rst)
begin
	if(rst) begin
		scl_r <= 1'b1;
		sda_r <= 1'b1;
		busy <= 1'b0;
		start_r <= 1'bx;
		stop_r <= 1'bx;
		bits <= 'bx;
		data_r <= 'bx;
	end
	else case(s1_next)
		S1_IDLE: begin
			scl_r <= 1'b1;
			sda_r <= 1'b1;
			busy <= 1'b0;
		end
		S1_SETUP: begin
			busy <= 1'b1;
			start_r <= start;
			stop_r <= stop;
			data_r <= data;
			bits <= 0;
		end
		S1_START: begin
			if(data_edge) begin
				sda_r <= 1'b1;
				scl_r <= 1'b1;
			end
			else if(clock_edge) begin
				sda_r <= 1'b0;
				scl_r <= 1'b1;
			end
		end
		S1_DATA: begin
			if(data_edge) begin
				sda_r <= data_r[7];
				data_r <= {data_r,1'bx};
				bits <= bits + 1;
				scl_r <= 1'b0;
			end
			else if(clock_edge) begin
				scl_r <= 1'b1;
			end
		end
		S1_ACK: begin
			sda_r <= 1'b1;
			if(data_edge) begin
				scl_r <= 1'b0;
			end
			else if(clock_edge) begin
				scl_r <= 1'b1;
			end
		end
		S1_STOP: begin
			if(data_edge) begin
				sda_r <= 1'b0;
			end
			else if(clock_edge) begin
				sda_r <= 1'b1;
			end
		end
	endcase
end

endmodule
