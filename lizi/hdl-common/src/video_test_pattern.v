module video_test_pattern(
    input rst,
    input clk,
    input de,
    input hsync,
    input vsync,
    output [23:0] data
);

reg hsync_r;
reg [15:0] x,y;
reg [7:0] r,g,b;

always @(posedge clk, posedge rst)
begin
    if(rst)
        hsync_r <= 1'b0;
    else
        hsync_r <= hsync;
end

always @(posedge clk, posedge rst)
begin
    if(rst) begin
        x <= 0;
        y <= 0;
    end
    else if(vsync) begin
        x <= 0;
        y <= 0;
    end
    else if(!hsync_r && hsync) begin
        y <= y + 1;
        x <= 0;
    end
    else if(de) begin
        x <= x + 1;
    end
end
always @(*)
begin
    r = x[8] ? x : 0;
    g = y[8] ? y : 0;
    b = x[9] ? x : 0;
end

assign data = {r,g,b}; // RGB

endmodule
