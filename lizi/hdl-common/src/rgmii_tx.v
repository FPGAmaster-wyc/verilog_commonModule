`timescale 1ns/1ps
module rgmii_tx(
    input reset,
    input speed, // 0 - 10/100M, 1 - 1000M

    // GMII interface
    input txclk,
    input [7:0] txd,
    input txen,
    input txer,

    // RGMII interface
    output rgmii_gtxclk, // 125M/25M/2.5M
    output [3:0] rgmii_txdat,
    output rgmii_txctl
);

parameter TXCLK_DELAY = 0;

(* ASYNC_REG = "TRUE" *)
reg [3:0] rst_sync;
wire rst_in;

reg [7:0] txd_0;
reg txen_0;
reg txer_0;

reg txctl_r;
reg txctl_f;

reg [3:0] data_r;
reg [3:0] data_f;

reg odd_flag;

assign rst_in = !rst_sync[3];

always @(posedge txclk, posedge reset)
begin
    if(reset)
        rst_sync <= 'b0;
    else
        rst_sync <= {rst_sync, 1'b1};
end

always @(posedge txclk)
begin
    txd_0 <= txd;
    txen_0 <= txen;
    txer_0 <= txer;
end


always @(posedge txclk, posedge rst_in)
begin
    if(rst_in) begin
        odd_flag <= 1'b0;
        data_r <= 'bx;
        data_f <= 'bx;
        txctl_r <= 1'b0;
        txctl_f <= 1'b0;
    end
    else if(speed) begin
        data_r <= txd_0[3:0];
        data_f <= txd_0[7:4];
        txctl_r = txen_0;
        txctl_f = txen_0^txer_0;
    end
    else begin
        if(!odd_flag) begin
            data_r <= txd_0[3:0];
            data_f <= txd_0[3:0];
            txctl_r <= txen_0;
            txctl_f <= txen_0;
            if(txen_0) begin
                odd_flag <= 1'b1;
            end
        end
        else begin
            data_r <= txd_0[3:0];
            data_f <= txd_0[3:0];
            txctl_r <= txen_0^txer_0;
            txctl_f <= txen_0^txer_0;
            odd_flag <= 1'b0;
        end
    end
end

wire [TXCLK_DELAY:0] txclk_dly;
genvar i;
generate
    assign txclk_dly[0] = txclk;
    for(i=0;i<TXCLK_DELAY;i=i+1) begin
        (* DONT_TOUCH = "TRUE" *)
        LUT1 #(.INIT(2'b10)) lut_i(.I0(txclk_dly[i]), .O(txclk_dly[i+1]));
    end
endgenerate

ODDR #(.DDR_CLK_EDGE("SAME_EDGE")) d0_oddr_i(
    .D1(data_r[0]), .D2(data_f[0]), .CE(1'b1), .C(txclk), .S(1'b0), .R(1'b0), .Q(rgmii_txdat[0]));

ODDR #(.DDR_CLK_EDGE("SAME_EDGE")) d1_oddr_i(
    .D1(data_r[1]), .D2(data_f[1]), .CE(1'b1), .C(txclk), .S(1'b0), .R(1'b0), .Q(rgmii_txdat[1]));

ODDR #(.DDR_CLK_EDGE("SAME_EDGE")) d2_oddr_i(
    .D1(data_r[2]), .D2(data_f[2]), .CE(1'b1), .C(txclk), .S(1'b0), .R(1'b0), .Q(rgmii_txdat[2]));

ODDR #(.DDR_CLK_EDGE("SAME_EDGE")) d3_oddr_i(
    .D1(data_r[3]), .D2(data_f[3]), .CE(1'b1), .C(txclk), .S(1'b0), .R(1'b0), .Q(rgmii_txdat[3]));

ODDR #(.DDR_CLK_EDGE("SAME_EDGE")) ctl_oddr_i(
    .D1(txctl_r), .D2(txctl_f), .CE(1'b1), .C(txclk), .S(1'b0), .R(1'b0), .Q(rgmii_txctl));

ODDR #(.DDR_CLK_EDGE("SAME_EDGE")) clk_oddr_i(
    .D1(1'b1), .D2(1'b0), .CE(1'b1), .C(txclk_dly[TXCLK_DELAY]), .S(1'b0), .R(1'b0), .Q(rgmii_gtxclk));

endmodule
