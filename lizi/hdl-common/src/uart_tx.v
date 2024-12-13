module uart_tx #(
	parameter START_BITS=1,
	parameter DATA_BITS=8,
	parameter PARITY="NONE",
	parameter STOP_BITS=1,
	parameter BAUD_DIVIDER=65535
)(
	input	reset,
	input	clk_in,
	input	[7:0] data,
	input	valid,
	output	ready,
	output  txd_out	
);
localparam PARITY_BITS=(PARITY=="NONE")?0:1;
localparam PARITY_INIT=(PARITY=="ODD")?1'b1:1'b0;

wire tx_en;

reg txd_r;
reg ready_r;
reg valid_r;
reg [7:0] data_r;
reg [2:0] bit_cnt;
reg par_r;
reg [15:0] div_cnt;

integer state, next_state;
localparam S_IDLE=0,S_START=1,S_DATA=2,S_PARITY=3,S_STOP=4;

assign ready = ready_r;
assign txd_out = txd_r;

assign tx_en=(div_cnt==BAUD_DIVIDER-1);

always @(posedge clk_in, posedge reset)
begin
	if(reset) begin
		div_cnt <= 'b0;
	end
	else if(tx_en) begin
		div_cnt <= 'b0;
	end
	else begin
		div_cnt <= div_cnt+1;
	end
end

always @(posedge clk_in, posedge reset)
begin
	if(reset) begin
		state <= S_IDLE;
	end
	else begin
		state <= next_state;
	end
end

always @(*)
begin
	case(state)
		S_IDLE: begin
			if(tx_en && valid_r)
				next_state = S_START;
			else
				next_state = S_IDLE;
		end
		S_START: begin
			if(tx_en && bit_cnt==START_BITS-1)
				next_state = S_DATA;
			else 
				next_state = S_START;
		end
		S_DATA: begin
			if(tx_en && bit_cnt==DATA_BITS-1)
				if(PARITY_BITS==1)
					next_state = S_PARITY;
				else
					next_state = S_STOP;
			else
				next_state = S_DATA;
		end
		S_PARITY: begin
			if(tx_en)
				next_state = S_STOP;
			else
				next_state = S_PARITY;
		end
		S_STOP: begin
		    if(bit_cnt==STOP_BITS-1)
				next_state = S_IDLE;
			else
				next_state = S_STOP;
		end
		default: begin
			next_state = 'bx;
		end
	endcase
end

always @(posedge clk_in)
begin
	if(state!=next_state) begin
		bit_cnt <= 'b0;
	end
	else if(tx_en) begin
		bit_cnt <= bit_cnt + 1;
	end
end

always @(posedge clk_in, posedge reset)
begin
	if(reset) begin
		txd_r <= 1'b1;
		ready_r <= 1'b0;
		valid_r <= 1'b0;
		data_r <= 'bx;
		par_r <= 'bx;
	end
	else begin
		case(next_state)
			S_IDLE: begin
				if(ready_r & valid) begin
					valid_r <= 1'b1;
					ready_r <= 1'b0;
					data_r <= data;
				end
				else begin
					ready_r <= !valid_r;
				end
			end
			S_START: begin
				txd_r <= 1'b0;
				par_r <= PARITY_INIT;
			end
			S_DATA: begin
				if(tx_en) begin
					{data_r,txd_r} <= data_r;
					par_r <= par_r^data_r[0];
				end
			end
			S_PARITY: begin
				txd_r <= par_r;
			end
			S_STOP: begin
				txd_r <= 1'b1;
				valid_r <= 1'b0;
			end
		endcase
	end
end
endmodule
