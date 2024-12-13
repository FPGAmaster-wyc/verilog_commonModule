module dna(
	input clk,
	output reg [56:0] id,
	output reg valid
);

reg [5:0] state;
reg read;
reg shift_en;
wire shift_dout;
wire shift_din;

assign shift_din = shift_dout;

DNA_PORT #(
	.SIM_DNA_VALUE(57'h01edcba9_87654321)
) dna_port_i(
	.DOUT(shift_dout),
	.CLK(clk),
	.DIN(shift_din),
	.READ(read),
	.SHIFT(shift_en)
);

initial state=0;
always @(posedge clk)
begin
	if(state!=63)
		state <= state+1;
end

always @(posedge clk)
begin
	if(state==0)
		read <= 1'b0;
	else if(state==4)
		read <= 1'b1;
	else
		read <= 1'b0;
end

always @(posedge clk)
begin
	if(state==0)
		shift_en <= 1'b0;
	else if(state==5)
		shift_en <= 1'b1;
	else if(state==61)
		shift_en <= 1'b0;
end

always @(posedge clk)
begin
	if(state==0)
		valid <= 1'b0;
	else if(state==62)
		valid <= 1'b1;
end

always @(posedge clk)
begin
	if(state!=63)
		id <= {id, shift_dout};
end

endmodule
