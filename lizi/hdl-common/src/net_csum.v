module net_csum(
	input clk,
	input rst,

	input clear,

	input [31:0] data, // Big endian
	input [3:0] keep,
	input valid,

	output [15:0] csum,
	output csum_valid
);

function [15:0] cyclic_carry_add(input [15:0] a, input [15:0] b);
	reg [16:0] sum;
	begin
		sum = a + b;
		cyclic_carry_add = sum[15:0] + sum[16];
	end
endfunction

reg valid_0, valid_1, valid_2;
reg [31:0] data_0;
reg [15:0] sum_low_1;
reg [15:0] sum_high_1;
reg [15:0] sum_2;

assign csum = ~sum_2; // Checksum is one's complement of sum
assign csum_valid = valid_2;

// Pipline strobes
always @(posedge clk, posedge rst)
begin
	if(rst) begin
		valid_0 <= 1'b0;
		valid_1 <= 1'b0;
		valid_2 <= 1'b0;
	end
	else if(clear) begin
		valid_0 <= 1'b0;
		valid_1 <= 1'b0;
		valid_2 <= 1'b0;
	end
	else begin
		valid_0 <= valid;
		valid_1 <= valid_0;
		valid_2 <= valid_1;
	end
end

////////////////////////////////////////////////////////////////////////////////
// Step-1 
// Strip bytes not enabled
always @(posedge clk)
begin
	if(clear) begin
		data_0 <= 32'b0;
	end
	else if(valid) begin 
		data_0[31:24] <= keep[3]?data[31:24]:8'b0;
		data_0[23:16] <= keep[2]?data[23:16]:8'b0;
		data_0[15:8] <= keep[1]?data[15:8]:8'b0;
		data_0[7:0] <= keep[0]?data[7:0]:8'b0;
	end
end

////////////////////////////////////////////////////////////////////////////////
// Step-3
// Calculate respective sum for high and low words.
always @(posedge clk, posedge rst)
begin
	if(rst) begin
		sum_low_1 <= 'b0;
		sum_high_1 <= 'b0;
	end
	else if(clear) begin
		sum_low_1 <= 'b0;
		sum_high_1 <= 'b0;
	end
	else if(valid_0) begin
		sum_low_1 <= cyclic_carry_add(sum_low_1, data_0[15:0]);
		sum_high_1 <= cyclic_carry_add(sum_high_1, data_0[31:16]);
	end
end

////////////////////////////////////////////////////////////////////////////////
// Step-4
// Add two parts together.
always @(posedge clk)
begin
	if(clear) begin
		sum_2 <= 32'b0;
	end
	else if(valid_1) begin
		sum_2 <= cyclic_carry_add(sum_low_1, sum_high_1);
	end
end

endmodule
