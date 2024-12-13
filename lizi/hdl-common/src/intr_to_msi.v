module intr_to_msi #(
	parameter INPUTS=32,
	parameter REPEAT_TIMEOUT=65535,
	parameter REPEAT_ENABLE="FALSE"
)
(
	input rst,
	input clk,
	input [INPUTS-1:0] intr_in,
	input [2:0] msi_width,
	input msi_enable,
	input msi_grant,
	output [4:0] msi_vector,
	output reg msi_request
);

function integer clogb2 (input integer size);
begin
	size = size - 1;
	for (clogb2=1; size>1; clogb2=clogb2+1)
		size = size >> 1;
end
endfunction
localparam TIMER_BITS = clogb2(REPEAT_TIMEOUT);

wire [INPUTS-1:0] intr_rise;
wire [INPUTS-1:0] intr_active;
wire intr_rise_a;
wire intr_active_a;
wire timeout_a;

reg [TIMER_BITS-1:0] timer;

assign msi_vector = 'b0;
assign intr_rise_a = |intr_rise;
assign intr_active_a = |intr_active;

generate
if(REPEAT_ENABLE=="TRUE") begin
	assign timeout_a = timer==REPEAT_TIMEOUT;
end
else begin
	assign timeout_a = 1'b0;
end
endgenerate

genvar i;
generate
for(i=0;i<INPUTS;i=i+1) begin:G0
	(* ASYNC_REG = "TRUE" *)
	reg [1:0] intr_sync; 
	always @(posedge clk, posedge intr_in[i])
	begin
		if(intr_in[i])
			intr_sync <= 2'b0;
		else
			intr_sync <= {intr_sync,1'b1};
	end
	(* ASYNC_REG = "TRUE" *)
	reg [1:0] intr_r;
	always @(posedge clk, posedge rst)
	begin
		if(rst)
			intr_r <= 'b0;
		else
			intr_r <= {intr_r, !intr_sync[1]};
	end
	assign intr_rise[i] = !intr_r[1] && intr_r[0];
	assign intr_active[i] = intr_r[0];
end
endgenerate

always @(posedge clk, posedge rst)
begin
	if(rst) begin
		timer <= 0;
	end
	else if(msi_request&&msi_grant) begin
		timer <= 0;
	end
	else if(intr_active_a && !timeout_a) begin
		timer <= timer+1;
	end
end

always @(posedge clk, posedge rst)
begin
	if(rst) begin
		msi_request <= 1'b0;
	end
	else if(msi_enable) begin
		if(msi_request && msi_grant) begin
			msi_request <= 1'b0;
		end
		else if(intr_rise_a || timeout_a) begin
			msi_request <= 1'b1;
		end
	end
	else begin /* legacy INTx mode */
		msi_request <= intr_active_a;
	end
end

endmodule
