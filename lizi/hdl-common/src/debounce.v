// remove small glitches from async input
module debounce #(
	parameter SYNC_STAGES=2,
	parameter HOLD_STAGES=2
)(
	input clk,
	input in,
	output out
);

function integer clogb2 (input integer size);
begin
	size = size - 1;
	for (clogb2=1; size>1; clogb2=clogb2+1)
		size = size >> 1;
end
endfunction
localparam TMR_BITS=clogb2(HOLD_STAGES);

(*ASYNC_REG="TRUE"*)
reg [SYNC_STAGES-1:0] sync;
always @(posedge clk)
begin
	sync <= {sync, in};
end

wire current = sync[SYNC_STAGES-1];
reg previous;
reg [TMR_BITS-1:0] timer;
initial begin
	previous = 0;
	timer = 0;
end
always @(posedge clk)
begin
	if(previous == current) begin
		timer <= 0;
	end
	else begin
		timer <= timer+1;
	end
end
always @(posedge clk)
begin
	if(timer == HOLD_STAGES-1) begin
		previous <= current;
	end
end
assign out = previous;

endmodule
