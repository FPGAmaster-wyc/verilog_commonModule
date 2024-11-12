module reset_sync(
	clk,
	rst_in,
	reset,
	resetn
);

parameter SYNC_CYCLES=2;
parameter IN_POLARITY=1;
parameter OUT_POLARITY=1;

(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input	clk;
input	rst_in;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 reset RST" *)
(* X_INTERFACE_PARAMETER = "POLARITY ACTIVE_HIGH, ASSOCIATED_CLOCK clk" *)
output	reset;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 resetn RST" *)
(* X_INTERFACE_PARAMETER = "POLARITY ACTIVE_LOW, ASSOCIATED_CLOCK clk" *)
output	resetn;

reg reset;
reg resetn;

wire rst_a;

(* ASYNC_REG = "TRUE" *)
reg [SYNC_CYCLES-1:0] rst_sync;

assign rst_a = IN_POLARITY ? rst_in : !rst_in;

always @(posedge clk, posedge rst_a)
begin
	if(rst_a)
		rst_sync <= 'b0;
	else
		rst_sync <= {rst_sync,1'b1};
end

always @(posedge clk, posedge rst_a)
begin
	if(rst_a) begin
		reset <= 1'b1;
		resetn <= 1'b0;
	end
	else begin
		reset <= !rst_sync[SYNC_CYCLES-1:0];
		resetn <= rst_sync[SYNC_CYCLES-1:0];
	end
end

endmodule
