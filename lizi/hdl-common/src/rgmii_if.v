module rgmii_if(
    input reset,

    // In-band Status
    // Optional in-band link status. 
    // Please read PHY datasheet to make sure if your PHY supports it.
    // If not supported, use MDIO to read link status instead.
    output ibs_up,
    output [1:0] ibs_spd,
    output ibs_dplx,
    output interrupt,

    // RGMII interface
    input rgmii_rxclk, // 125M/25M/2.5M
    input [3:0] rgmii_rxdat,
    input rgmii_rxctl,
    output rgmii_gtxclk, // 125M/25M/2.5M
    output [3:0] rgmii_txdat,
    output rgmii_txctl,

    // GMII interface
    input txclk, // 125M/25M/2.5M, used in 10M/100M mode
    input [7:0] txd,
    input txen,
    input txer,
    output rxclk,  // 125M/25M/2.5M
    output [7:0] rxd,
    output rxdv,
    output rxer,
    output crs,
    output col
);

parameter CLK_TYPE = "AUTO"; // Clock type: "AUTO" | "BUFG" | "BUFR"
parameter RXD_DELAY_TYPE = "ZHOLD"; // RXD zero hold delay: "NONE" | "ZHOLD"
parameter RXCLK_DELAY = 0; // RXCLK insert delay: 0 - N
parameter TXCLK_DELAY = 0; // TXCLK insert delay: 0 - N

rgmii_rx #(.CLK_TYPE(CLK_TYPE), .DELAY_TYPE(RXD_DELAY_TYPE),
    .RXCLK_DELAY(RXCLK_DELAY))
rx_i(
    .reset(reset),
    .ibs_up(ibs_up),
    .ibs_spd(ibs_spd),
    .ibs_dplx(ibs_dplx),
    .rgmii_rxclk(rgmii_rxclk),
    .rgmii_rxdat(rgmii_rxdat),
    .rgmii_rxctl(rgmii_rxctl),
    .rxclk(rxclk),
    .rxd(rxd),
    .rxdv(rxdv),
    .rxer(rxer),
    .crs(crs)
);

rgmii_tx #(.TXCLK_DELAY(TXCLK_DELAY)) tx_i(
    .reset(reset),
    .speed(ibs_spd[1]),
    .txclk(txclk),
    .txd(txd),
    .txen(txen),
    .txer(txer),
    .rgmii_gtxclk(rgmii_gtxclk),
    .rgmii_txdat(rgmii_txdat),
    .rgmii_txctl(rgmii_txctl)
);

// see RGMII v2.0 standard
assign col = txen && (crs || rxdv);

// emulate a link status interrupt from IBS
wire [3:0] ibs_new = {ibs_dplx, ibs_spd, ibs_up};
reg [3:0] ibs_prev;
always @(posedge rxclk)
begin
    ibs_prev <= ibs_new;
end
assign interrupt = ibs_new != ibs_prev;

endmodule
