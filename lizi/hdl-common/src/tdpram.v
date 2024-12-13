module tdpram #(
	parameter ADDR_BITS=10,
	parameter DATA_BITS=36,
	parameter REG=0
)
(
	input	clka,
	input	[ADDR_BITS-1:0] addra,
	input	ena,
	input	wea,
	input	[DATA_BITS-1:0] dina,
	output	reg [DATA_BITS-1:0] douta,
	input	clkb,
	input	[ADDR_BITS-1:0] addrb,
	input	enb,
	input	web,
	input	[DATA_BITS-1:0] dinb,
	output	reg [DATA_BITS-1:0] doutb
);

parameter DEPTH = 2**ADDR_BITS;

reg [DATA_BITS-1:0] mem [0:DEPTH-1];

reg [DATA_BITS-1:0] douta_reg;
reg [DATA_BITS-1:0] doutb_reg;

generate
if(REG==1)
	always @(posedge clka) douta_reg <= mem[addra];
else
	always @(*) douta_reg <= mem[addra];
endgenerate

always @(posedge clka)
begin
	if(ena)
		douta <= douta_reg;
end

always @(posedge clka)
begin
	if(wea)
		mem[addra] <= dina;
end

////////////////////////////////////////////////////////////////////////////////

generate
if(REG==1)
	always @(posedge clkb) doutb_reg <= mem[addrb];
else
	always @(*) doutb_reg <= mem[addrb];
endgenerate

always @(posedge clkb)
begin
	if(enb)
		doutb <= doutb_reg;
end

always @(posedge clkb)
begin
	if(web)
		mem[addrb] <= dinb;
end

endmodule
