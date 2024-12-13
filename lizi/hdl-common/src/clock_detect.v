module clock_detect(
    input clk,
    input detect_clock,
    output reg active
);

reg [15:0] cnt;
always @(posedge detect_clock)
begin
    cnt <= cnt+1;
end

reg [7:0] tmr;
reg [15:0] prev;
always @(posedge clk)
begin
    if(tmr==0) begin
        if(prev==cnt)
            active <= 1'b0;
        else
            active <= 1'b1;
    end
    tmr <= tmr+1;
end

endmodule
