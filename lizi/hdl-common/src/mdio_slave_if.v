module mdio_slave_if(
	input clk,
	input rst,

	input mdc_i,
	input mdio_i,
	output mdio_o,
	output mdio_oe,

	output [4:0] read_addr,
	output read_enable,
	input [15:0] read_data,

	output [4:0] write_addr,
	output [15:0] write_data,
	output write_enable
);

parameter PHY_ADDR = 0; 

reg mdc_0;
reg mdio_o_r;
reg mdio_oe_r;
reg [4:0] read_addr_r;
reg read_enable_r;
reg [4:0] write_addr_r;
reg [15:0] write_data_r;
reg write_enable_r;
reg [5:0] shift_cnt;
reg [15:0] data_in;
reg [15:0] data_out;

integer state, state_next;

wire clk_rise;

assign clk_rise = !mdc_0 && mdc_i;
assign mdio_o = mdio_o_r;
assign mdio_oe = mdio_oe_r;
assign read_addr = read_addr_r;
assign read_enable = read_enable_r;
assign write_addr = write_addr_r;
assign write_data = write_data_r;
assign write_enable = write_enable_r;

localparam S_SYNC=0, S_IDLE=1, S_ADDRESS=2, S_READ_0=3, S_READ_1=4,
	S_WRITE_0=5, S_WRITE_1=6, S_WRITE_2=7, S_DUMB=8;

always @(posedge clk, posedge rst)
begin
	if(rst) begin
		mdc_0 <= 1'b0;
	end
	else begin
		mdc_0 <= mdc_i;
	end
end

always @(posedge clk, posedge rst)
begin
	if(rst) begin
		state <= S_SYNC;
	end
	else begin
		state <= state_next;
	end
end

always @(*)
begin
	case(state)
		S_SYNC: begin
			if(clk_rise && shift_cnt==32)
				state_next = S_IDLE;
			else
				state_next = S_SYNC;
		end
		S_IDLE: begin
			if(clk_rise && mdio_i==1'b0)
				state_next = S_ADDRESS;
			else
				state_next = S_IDLE;
		end
		S_ADDRESS: begin
			if(clk_rise && shift_cnt==14) begin
				if(data_in[13:12]==2'b01) begin
					if(data_in[9:5]!=PHY_ADDR) begin
						state_next = S_DUMB;
					end
					else if(data_in[11:10]==2'b10)begin
						state_next = S_READ_0;
					end
					else if(data_in[11:10]==2'b01) begin
						state_next = S_WRITE_0;
					end
					else begin
						state_next = S_SYNC;
					end
				end
				else begin
					state_next = S_SYNC;
				end
			end
			else begin
				state_next = S_ADDRESS;
			end
		end
		S_READ_0: begin
			if(clk_rise)
				state_next = S_READ_1;
			else
				state_next = S_READ_0;
		end
		S_READ_1: begin
			if(clk_rise && shift_cnt==31)
				state_next = S_IDLE;
			else
				state_next = S_READ_1;
		end
		S_WRITE_0: begin
			if(clk_rise)
				state_next = S_WRITE_1;
			else
				state_next = S_WRITE_0;
		end
		S_WRITE_1: begin
			if(clk_rise && shift_cnt==32)
				state_next = S_WRITE_2;
			else
				state_next = S_WRITE_1;
		end
		S_WRITE_2: begin
			state_next = S_IDLE;
		end
		S_DUMB: begin
			if(clk_rise && shift_cnt==32)
				state_next = S_IDLE;
			else
				state_next = S_DUMB;
		end
		default: begin
			state_next = 'bx;
		end
	endcase
end

always @(posedge clk)
begin
	if(clk_rise) begin
		data_in <= {data_in, mdio_i};
	end
end

always @(posedge clk, posedge rst)
begin
	if(rst) begin
		shift_cnt <= 'b0;
		mdio_oe_r <= 1'b0;
		read_enable_r <= 1'b0;
		write_enable_r <= 1'b0;
		read_addr_r <= 'bx;
		write_addr_r <= 'bx;
		data_out <= 'bx;
		mdio_o_r <= 1'bx;
		write_data_r <= 'bx;
	end
	else case(state_next)
		S_SYNC: begin
			if(clk_rise) begin
				if(mdio_i==1'b1)
					shift_cnt <= shift_cnt+1;
				else
					shift_cnt <= 'b0;
			end
		end
		S_IDLE: begin
			shift_cnt <= 'b0;
			mdio_oe_r <= 1'b0;
			write_enable_r <= 1'b0;
		end
		S_ADDRESS: begin
			if(clk_rise) begin
				shift_cnt <= shift_cnt+1;
			end
		end
		S_READ_0: begin
			if(clk_rise) begin
				shift_cnt <= shift_cnt+1;
				read_addr_r <= data_in[4:0];
			end
			read_enable_r <= 1'b1;
			mdio_oe_r <= 1'b1;
			mdio_o_r <= 1'b0;
			data_out <= read_data;
		end
		S_READ_1: begin
			read_enable_r <= 1'b0;
			if(clk_rise) begin
				shift_cnt <= shift_cnt+1;
				mdio_o_r <= data_out[15];
				data_out <= {data_out,1'b0};
			end
		end
		S_WRITE_0: begin
			if(clk_rise) begin
				shift_cnt <= shift_cnt+1;
				write_addr_r <= data_in[4:0];
			end
		end
		S_WRITE_1: begin
			if(clk_rise) begin
				shift_cnt <= shift_cnt+1;
			end
		end
		S_WRITE_2: begin
			write_enable_r <= 1'b1;
			write_data_r <= data_in[15:0];
		end
		S_DUMB: begin
			if(clk_rise) begin
				shift_cnt <= shift_cnt+1;
			end
		end
	endcase
end

endmodule
