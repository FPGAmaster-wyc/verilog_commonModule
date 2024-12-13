////////////////////////////////////////////////////////////////////////////////
// File:	random_freq.v
// Author:	FPGA_master <1975670198@qq.com>
// Description:
//	Implement arbitrary integer frequency division. 
//
/*
random_freq#(
    .RATE0    ( 8'd1 ),
    .RATE1    ( 8'd2 ),
    .RATE2    ( 8'd3 ),
    .RATE3    ( 8'd4 )
)u_random_freq(
    .clk      ( clk      ),
    .rst      ( rst      ),
    .clk_out0 ( clk_out0 ),
    .clk_out1 ( clk_out1 ),
    .clk_out2 ( clk_out2 ),
    .clk_out3  ( clk_out3  )
);
*/
////////////////////////////////////////////////////////////////////////////////

module random_freq
#(
    parameter RATE0 = 8'd1,     //RATE range 2-255
    parameter RATE1 = 8'd2,
    parameter RATE2 = 8'd3,
    parameter RATE3 = 8'd4
)
(
    input clk,
    input rst,
    
    output reg clk_out0,
    output reg clk_out1,
    output reg clk_out2,
    output reg clk_out3  
);


reg [7:0] cnt0,cnt1,cnt2,cnt3;
reg clk_p0, clk_p1,clk_p2,clk_p3;
reg clk_n0, clk_n1,clk_n2,clk_n3;


////clkout_0
always@(posedge clk or posedge rst)begin
    if(rst)begin
        cnt0<=1'b0;
    end
    else if(cnt0== (RATE0 - 1))begin
        cnt0<='b0;
    end
    else
        cnt0<=cnt0+1'b1;
end    

always@(posedge clk or posedge rst)begin
    if(rst)begin
        clk_p0<='b0;
    end
    else if(cnt0<= (RATE0/ 2-1))begin
        clk_p0<=1'b1;
    end
    else begin
        clk_p0<=1'b0;
    end
end

always@(negedge clk )begin
    clk_n0<=clk_p0;
end

always @(*)
    if (RATE0[0] == 1)
        clk_out0 = clk_p0 | clk_n0;
    else
        clk_out0 = clk_p0;

//clkout_1
always@(posedge clk or posedge rst)begin
    if(rst)begin
        cnt1<=1'b0;
    end
    else if(cnt1== (RATE1 - 1))begin
        cnt1<='b0;
    end
    else
        cnt1<=cnt1+1'b1;
end    

always@(posedge clk or posedge rst)begin
    if(rst)begin
        clk_p1<='b0;
    end
    else if(cnt1<= (RATE1/ 2-1))begin
        clk_p1<=1'b1;
    end
    else begin
        clk_p1<=1'b0;
    end
end

always@(negedge clk )begin
    clk_n1<=clk_p1;
end

always @(*)
    if (RATE1[0] == 1)
        clk_out1 = clk_p1 | clk_n1;
    else
        clk_out1 = clk_p1;

//clkout_2
always@(posedge clk or posedge rst)begin
    if(rst)begin
        cnt2<=1'b0;
    end
    else if(cnt2== (RATE2 - 1))begin
        cnt2<='b0;
    end
    else
        cnt2<=cnt2+1'b1;
end
always@(posedge clk or posedge rst)begin
    if(rst)begin
        clk_p2<='b0;
    end
    else if(cnt2<= (RATE2/ 2-1))begin
        clk_p2<=1'b1;
    end
    else begin
        clk_p2<=1'b0;
    end
end

always@(negedge clk )begin
    clk_n2<=clk_p2;
end

always @(*) 
    if (RATE2[0] == 1)
        clk_out2 = clk_p2 | clk_n2;
    else
        clk_out2 = clk_p2;

//clkout_3
always@(posedge clk or posedge rst)begin
    if(rst)begin
        cnt3<=1'b0;
    end
    else if(cnt3== (RATE3 - 1))begin
        cnt3<='b0;
    end
    else
        cnt3<=cnt3+1'b1;
end

always@(posedge clk or posedge rst)begin
    if(rst)begin
        clk_p3<='b0;
    end
    else if(cnt3<= (RATE3/ 2-1))begin
        clk_p3<=1'b1;
    end
    else begin
        clk_p3<=1'b0;
    end
end

always@(negedge clk )begin
    clk_n3<=clk_p3;
end

always @(*) 
    if (RATE3[0] == 1)
        clk_out3 = clk_p3 | clk_n3;
    else
        clk_out3 = clk_p3;
    
endmodule

