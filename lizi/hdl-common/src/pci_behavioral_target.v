`timescale 1ns/10ps
`define BD #1
module pci_behavioral_target(
	// PCI Bus Signals
	inout  [31:0] AD,
	inout   [3:0] CBE,
	inout         PAR,
	inout         FRAME_N,
	inout         TRDY_N,
	inout         IRDY_N,
	inout         STOP_N,
	inout         DEVSEL_N,
	input         IDSEL,
	inout         PERR_N,
	inout         SERR_N,
	input         RST_N,
	input         PCLK
);

parameter DECODE_LATENCY=0;
parameter BAR0_BASE=32'h0000_0000;
parameter BAR0_SIZE=33'h0001_0000;
parameter INITIAL_LATENCY=1;
parameter DATA_LATENCY=1;
parameter DATA_LENGTH=(~0);
parameter DISCONNECT=(~0);
parameter MEMORY_SIZE=4096;

localparam 
	CMD_INTR_ACK = 4'h0,
	CMD_SPECIAL = 4'h1,
	CMD_IO_READ = 4'h2,
	CMD_IO_WRITE = 4'h3,
	CMD_MEM_READ = 4'h6,
	CMD_MEM_WRITE = 4'h7,
	CMD_CONF_READ = 4'hA,
	CMD_CONF_WRITE = 4'hB,
	CMD_MEM_READ_MUL = 4'hC,
	CMD_DUAL_ADDR_CYC = 4'hD,
	CMD_MEM_READ_LN = 4'hE,
	CMD_MEM_WRITE_INVAL = 4'hF;

function integer clogb2 (input integer size);
begin
	size = size - 1;
	for (clogb2=1; size>1; clogb2=clogb2+1)
		size = size >> 1;
end
endfunction

localparam MEM_ADDR_MSB = clogb2(MEMORY_SIZE)-1;

wire clk;
wire rst;

reg ctrl_oe;
reg data_oe;
reg par_oe;
reg trdy_r;
reg stop_r;
reg devsel_r;
reg perr_r;
reg serr_r;
reg [31:0] data_r;
reg par_r;

reg [31:0] addr_r;
reg [3:0] cmd_r;

reg [7:0] decode_cnt;
reg [7:0] decode_latency;

reg [7:0] data_cnt;
reg [7:0] data_length;
reg [7:0] data_latency_cnt;
reg [7:0] data_latency;
reg [7:0] disconnect;
reg [7:0] initial_latency_cnt;
reg [7:0] initial_latency;

reg [31:0] bar0_base;
reg [31:0] bar0_mask;
reg address_valid;

reg frame_r;
reg cmd_valid;
reg cmd_read_valid;
reg cmd_write_valid;

reg write_ready;
reg write_disconnect;

reg read_ready;
reg read_disconnect;

reg [31:0] addr_a;
reg [3:0] cmd_a;

reg [31:0] read_addr;
reg [31:0] write_addr;

reg [7:0] mem_b0 [0:2**(MEM_ADDR_MSB-1)-1];
reg [7:0] mem_b1 [0:2**(MEM_ADDR_MSB-1)-1];
reg [7:0] mem_b2 [0:2**(MEM_ADDR_MSB-1)-1];
reg [7:0] mem_b3 [0:2**(MEM_ADDR_MSB-1)-1];

reg busy_r;


integer state, state_next;
localparam S_IDLE=0, S_WRITE_WAIT=1, S_WRITE_ACK=2, S_WRITE_STOP_WITH_DATA=3,
	S_WRITE_STOP=4, S_READ_TA=5, S_READ_WAIT=6, S_READ_ACK=7, S_READ_STOP_WITH_DATA=8,
	S_READ_STOP=9, S_END_TA=10, S_OTHERS=11, S_BUSY=12;


assign clk = PCLK;
assign rst = ~RST_N;
assign `BD AD = data_oe?data_r:32'bz;
assign CBE = 4'bz;
assign `BD PAR = par_oe?par_r:1'bz;
assign FRAME_N = 1'bz;
assign `BD TRDY_N = ctrl_oe?(~trdy_r):1'bz;
assign IRDY_N = 1'bz;
assign `BD STOP_N = ctrl_oe?(~stop_r):1'bz;
assign `BD DEVSEL_N = ctrl_oe?(~devsel_r):1'bz;
assign `BD PERR_N = ctrl_oe?(~perr_r):1'bz;
assign `BD SERR_N = ctrl_oe?(~serr_r):1'bz;

initial
begin
	decode_latency = DECODE_LATENCY;
	bar0_base = BAR0_BASE;
	bar0_mask = BAR0_SIZE-1;
	initial_latency = INITIAL_LATENCY;
	data_latency = DATA_LATENCY;
	data_length = DATA_LENGTH;
	disconnect = DISCONNECT;
end

always @(posedge clk)
begin
	frame_r <= FRAME_N;
end

always @(posedge clk)
begin
	if(frame_r && !FRAME_N) begin
		addr_r <= AD;
		cmd_r <= CBE;
	end
end

always @(*)
begin
	if(frame_r && !FRAME_N) begin
		addr_a = AD;
		cmd_a = CBE;
	end
	else begin
		addr_a = addr_r;
		cmd_a = cmd_r;
	end
end

always @(posedge clk, posedge rst)
begin
	if(rst)
		decode_cnt <= 'b0;
	else if(FRAME_N && !busy_r)
		decode_cnt <= 'b0;
	else if(decode_cnt!=decode_latency)
		decode_cnt <= decode_cnt+1;
end

always @(*)
begin
	if(((addr_a^bar0_base)&(~bar0_mask))==32'h0)
		address_valid = 1;
	else
		address_valid = 0;
end

always @(posedge clk, posedge rst)
begin
	if(rst)
		busy_r <= 1'b0;
	else if(!busy_r && state==S_IDLE)
		busy_r <= !FRAME_N;
	else if(state!=S_IDLE && state_next==S_IDLE)
		busy_r <= 1'b0;
end

always @(*)
begin
	cmd_valid = (!FRAME_N||busy_r) && decode_cnt==decode_latency;
	case(cmd_a)
		CMD_IO_READ, CMD_MEM_READ, CMD_MEM_READ_MUL, CMD_MEM_READ_LN: begin
			cmd_read_valid = 1;
			cmd_write_valid = 0;
		end
		CMD_IO_WRITE, CMD_MEM_WRITE, CMD_MEM_WRITE, CMD_MEM_WRITE_INVAL: begin
			cmd_read_valid = 0;
			cmd_write_valid = 1;
		end
		CMD_CONF_READ: begin
			cmd_read_valid = IDSEL;
			cmd_write_valid = 0;
		end
		CMD_CONF_WRITE: begin
			cmd_read_valid = 0;
			cmd_write_valid = IDSEL;
		end
		default: begin
			cmd_read_valid = 0;
			cmd_write_valid = 0;
		end
	endcase
end

always @(posedge clk, posedge rst)
begin
	if(rst) begin
		data_cnt <= 0;
	end
	else if(frame_r && !FRAME_N)
		data_cnt <= 0;
	else if(!IRDY_N && !TRDY_N)
		data_cnt <= data_cnt+1;
end

always @(posedge clk, posedge rst)
begin
	if(rst) begin
		initial_latency_cnt <= 0;
	end
	else if(DEVSEL_N)
		initial_latency_cnt <= 0;
	else if(initial_latency_cnt!=initial_latency)
		initial_latency_cnt <= initial_latency_cnt+1;
end

always @(posedge clk, posedge rst, IRDY_N, TRDY_N)
begin
	if(rst) begin
		data_latency_cnt <= 0;
	end
	else if(DEVSEL_N || !IRDY_N && !TRDY_N)
		data_latency_cnt <= 0;
	else if(data_latency_cnt!=data_latency)
		data_latency_cnt <= data_latency_cnt+1;
end

always @(*)
begin
	if(initial_latency_cnt == initial_latency && data_latency_cnt == data_latency) begin
		if(data_cnt == data_length) begin
			write_ready = 1'b0;
			read_ready = 1'b0;
		end
		else begin
			write_ready = 1'b1;
			read_ready = 1'b1;
		end
	end
	else begin
		write_ready = 1'b0;
		read_ready = 1'b0;
	end
end

always @(*)
begin
	if(data_cnt == disconnect || data_cnt == data_length) begin
		write_disconnect = 1'b1;
		read_disconnect = 1'b1;
	end
	else begin
		write_disconnect = 1'b0;
		read_disconnect = 1'b0;
	end
end

always @(posedge clk, posedge rst)
begin
	if(rst)
		state <= S_IDLE;
	else
		state <= state_next;
end

always @(*)
begin
	case(state)
		S_IDLE: begin
			if(cmd_valid && (cmd_read_valid || cmd_write_valid))
				if(address_valid)
					if(cmd_read_valid) begin
						if(decode_cnt==0)
							state_next = S_READ_TA;
						else if(read_ready)
							if(read_disconnect)
								state_next = S_READ_STOP_WITH_DATA;
							else
								state_next = S_READ_ACK;
						else
							if(read_disconnect)
								state_next = S_READ_STOP;
							else
								state_next = S_READ_WAIT;
					end
					else begin // cmd_write_valid
						if(write_ready)
							if(write_disconnect)
								state_next = S_WRITE_STOP_WITH_DATA;
							else
								state_next = S_WRITE_ACK;
						else
							if(write_disconnect)
								state_next = S_WRITE_STOP;
							else
								state_next = S_WRITE_WAIT;
					end
				else
					state_next = S_OTHERS;
			else
				state_next = S_IDLE;
		end
		S_WRITE_WAIT: begin
			if(write_ready) 
				if(FRAME_N) // Last
					state_next = S_WRITE_ACK;
				else if(write_disconnect)
					state_next = S_WRITE_STOP_WITH_DATA;
				else
					state_next = S_WRITE_ACK;
			else
				if(write_disconnect)
					state_next = S_WRITE_STOP;
				else
					state_next = S_WRITE_WAIT;
		end
		S_WRITE_ACK: begin
			if(!IRDY_N)
				if(FRAME_N) // Last
					state_next = S_END_TA;
				else if(write_ready)
					if(write_disconnect)
						state_next = S_WRITE_STOP_WITH_DATA;
					else
						state_next = S_WRITE_ACK;
				else
					if(write_disconnect)
						state_next = S_WRITE_STOP;
					else
						state_next = S_WRITE_WAIT;
			else
				state_next = S_WRITE_ACK;
		end
		S_WRITE_STOP_WITH_DATA: begin
			if(!IRDY_N)
				if(FRAME_N) // Last
					state_next = S_END_TA;
				else
					state_next = S_WRITE_STOP;
			else
				state_next = S_WRITE_STOP_WITH_DATA;
		end
		S_WRITE_STOP: begin
			if(!IRDY_N && FRAME_N) // Last
				state_next = S_END_TA;
			else
				state_next = S_WRITE_STOP;
		end
		S_READ_TA: begin
			if(read_ready)
				if(read_disconnect)
					state_next = S_READ_STOP_WITH_DATA;
				else
					state_next = S_READ_ACK;
			else
				if(read_disconnect)
					state_next = S_READ_STOP;
				else
					state_next = S_READ_WAIT;
		end
		S_READ_WAIT: begin
			if(read_ready)
				if(FRAME_N) // Last
					state_next = S_READ_ACK;
				else if(read_disconnect)
					state_next = S_READ_STOP_WITH_DATA;
				else
					state_next = S_READ_ACK;
			else
				if(read_disconnect)
					state_next = S_READ_STOP;
				else
					state_next = S_READ_WAIT;
		end
		S_READ_ACK: begin
			if(!IRDY_N)
				if(FRAME_N) // last
					state_next = S_END_TA;
				else if(read_ready)
					if(read_disconnect)
						state_next = S_READ_STOP_WITH_DATA;
					else
						state_next = S_READ_ACK;
				else
					if(read_disconnect)
						state_next = S_READ_STOP;
					else
						state_next = S_READ_WAIT;
			else
				state_next = S_READ_ACK;
		end
		S_READ_STOP_WITH_DATA: begin
			if(!IRDY_N)
				if(FRAME_N) // Last
					state_next = S_END_TA;
				else
					state_next = S_READ_STOP;
			else
				state_next = S_READ_STOP_WITH_DATA;
		end
		S_READ_STOP: begin
			if(!IRDY_N && FRAME_N) // Last
				state_next = S_END_TA;
			else
				state_next = S_READ_STOP;
		end
		S_END_TA: begin
			state_next = S_IDLE;
		end
		S_OTHERS: begin
			if(!DEVSEL_N) // Target Ack
				state_next = S_BUSY;
			else if(FRAME_N) // Master abort
				state_next = S_IDLE;
			else
				state_next = S_OTHERS;
		end
		S_BUSY: begin
			if(DEVSEL_N && FRAME_N && IRDY_N)
				state_next = S_IDLE;
			else
				state_next = S_BUSY;
		end
		default: begin
			state_next = 'bx;
		end
	endcase
end

always @(posedge clk, posedge rst)
begin
	if(rst) begin
		ctrl_oe <= 1'b0;
		data_oe <= 1'b0;
		trdy_r <= 1'b0;
		stop_r <= 1'b0;
		devsel_r <= 1'b0;
		perr_r <= 1'b0;
		serr_r <= 1'b0;
	end
	else case(state_next)
		S_IDLE: begin
			ctrl_oe <= 1'b0;
			data_oe <= 1'b0;
			trdy_r <= 1'b0;
			stop_r <= 1'b0;
			devsel_r <= 1'b0;
			perr_r <= 1'b0;
			serr_r <= 1'b0;
		end
		S_WRITE_WAIT: begin
			ctrl_oe <= 1'b1;
			trdy_r <= 1'b0;
			stop_r <= 1'b0;
			devsel_r <= 1'b1;
		end
		S_WRITE_ACK: begin
			ctrl_oe <= 1'b1;
			trdy_r <= 1'b1;
			stop_r <= 1'b0;
			devsel_r <= 1'b1;
		end
		S_WRITE_STOP_WITH_DATA: begin
			ctrl_oe <= 1'b1;
			trdy_r <= 1'b1;
			stop_r <= 1'b1;
			devsel_r <= 1'b1;
		end
		S_WRITE_STOP: begin
			ctrl_oe <= 1'b1;
			trdy_r <= 1'b0;
			stop_r <= 1'b1;
			devsel_r <= 1'b1;
		end
		S_READ_TA: begin
			ctrl_oe <= 1'b1;
			devsel_r <= 1'b1;
			trdy_r <= 1'b0;
			stop_r <= 1'b0;
		end
		S_READ_WAIT: begin
			ctrl_oe <= 1'b1;
			devsel_r <= 1'b1;
			data_oe <= 1'b1;
			trdy_r <= 1'b0;
			stop_r <= 1'b0;
		end
		S_READ_ACK: begin
			ctrl_oe <= 1'b1;
			devsel_r <= 1'b1;
			data_oe <= 1'b1;
			trdy_r <= 1'b1;
			stop_r <= 1'b0;
		end
		S_READ_STOP_WITH_DATA: begin
			ctrl_oe <= 1'b1;
			devsel_r <= 1'b1;
			data_oe <= 1'b1;
			trdy_r <= 1'b1;
			stop_r <= 1'b1;
		end
		S_READ_STOP: begin
			ctrl_oe <= 1'b1;
			devsel_r <= 1'b1;
			data_oe <= 1'b1;
			trdy_r <= 1'b0;
			stop_r <= 1'b1;
		end
		S_END_TA: begin
			data_oe <= 1'b0;
			trdy_r <= 1'b0;
			stop_r <= 1'b0;
			devsel_r <= 1'b0;
		end
		S_OTHERS: begin
		end
		S_BUSY: begin
		end
	endcase
end

always @(posedge clk)
begin
	if(frame_r && !FRAME_N) begin
		write_addr <= AD & bar0_mask;
	end
	else if(!IRDY_N && !TRDY_N) begin
		write_addr <= (write_addr + 3'b100) & bar0_mask;
	end
end

always @(posedge clk)
begin
	if(frame_r && !FRAME_N) begin
		read_addr <= AD & bar0_mask;
	end
	else if(state_next==S_READ_ACK) begin
		read_addr <= (read_addr + 3'b100) & bar0_mask;
	end	
end

wire [31:0] wdata;
wire wstrobe;
wire [31:0] rdata;
wire rstrobe;

assign wstrobe = state==S_WRITE_ACK || state==S_WRITE_STOP_WITH_DATA;
assign rstrobe = state_next == S_READ_ACK || state_next==S_READ_STOP_WITH_DATA;
assign wdata = AD;
assign rdata = data_r;

always @(posedge clk)
begin
	if(wstrobe) begin
		if(!CBE[0]) mem_b0[write_addr[MEM_ADDR_MSB:2]] = AD[7:0];
		if(!CBE[1]) mem_b1[write_addr[MEM_ADDR_MSB:2]] = AD[15:8];
		if(!CBE[2]) mem_b2[write_addr[MEM_ADDR_MSB:2]] = AD[23:16];
		if(!CBE[3]) mem_b3[write_addr[MEM_ADDR_MSB:2]] = AD[31:24];
	end
end

always @(posedge clk)
begin
	if(rstrobe) begin
		data_r[7:0] <= mem_b0[read_addr[MEM_ADDR_MSB:2]];
		data_r[15:8] <= mem_b1[read_addr[MEM_ADDR_MSB:2]];
		data_r[23:16] <= mem_b2[read_addr[MEM_ADDR_MSB:2]];
		data_r[31:24] <= mem_b3[read_addr[MEM_ADDR_MSB:2]];
	end
end

always @(posedge clk, posedge rst)
begin
	if(rst) begin
		par_oe <= 1'b0;
		par_r <= 1'b0;
	end
	else begin
		par_oe <= data_oe;
		par_r <= ^data_r;
	end
end

task init(input [31:0] data);
	integer i;
begin
	for(i=0;i<MEMORY_SIZE/4;i=i+1) begin
		mem_b0[i] = data[7:0];
		mem_b1[i] = data[15:8];
		mem_b2[i] = data[23:16];
		mem_b3[i] = data[31:24];
	end
end
endtask

task write(input [31:0] addr, input [31:0] data);
begin
	mem_b0[addr[MEM_ADDR_MSB:2]] = data[7:0];
	mem_b1[addr[MEM_ADDR_MSB:2]] = data[15:8];
	mem_b2[addr[MEM_ADDR_MSB:2]] = data[23:16];
	mem_b3[addr[MEM_ADDR_MSB:2]] = data[31:24];
end
endtask

function [31:0] read(input [31:0] addr);
begin
	read = { 
		mem_b3[addr[MEM_ADDR_MSB:2]], 
		mem_b2[addr[MEM_ADDR_MSB:2]],
		mem_b1[addr[MEM_ADDR_MSB:2]],
		mem_b0[addr[MEM_ADDR_MSB:2]]
	};
end
endfunction
endmodule
