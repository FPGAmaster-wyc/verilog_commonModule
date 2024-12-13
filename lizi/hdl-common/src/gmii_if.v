module gmii_if(
    input   aclk,
    input   aresetn,

    input   [7:0] tx_tdata,
    input   tx_tvalid,
    input   tx_tlast,
    output reg  tx_tready,

    output reg  [7:0] rx_tdata,
    output reg  rx_tvalid,
    output reg  rx_tlast,
    input   rx_tready,

    output reg  [7:0] gmii_txd,
    output reg  gmii_txen,
    output reg  gmii_txer,

    input   [7:0] gmii_rxd,
    input   gmii_rxdv,
    input   gmii_rxer
);

////////////////////////////////////////////////////////////////////////////////
// RX 
reg [7:0] rxd_0;
reg rxdv_0;

always @(posedge aclk, negedge aresetn)
begin
    if(!aresetn) begin
        rxd_0 <= 'bx;
        rxdv_0 <= 1'b0;
    end
    else begin
        rxd_0 <= gmii_rxd;
        rxdv_0 <= gmii_rxdv;
    end
end

integer s1, s1_next;
localparam S1_NORMAL=0, S1_OVERFLOW=2, S1_END_MARK=3, S1_RECOVER=4;

always @(posedge aclk, negedge aresetn)
begin
    if(!aresetn) 
        s1 <= S1_NORMAL;
    else
        s1 <= s1_next;
end

always @(*)
begin
    case(s1)
        S1_NORMAL: begin 
            if(rx_tvalid && !rx_tready) // oops!
                s1_next = S1_OVERFLOW;
            else
                s1_next = S1_NORMAL;
        end
        S1_OVERFLOW: begin
            if(rx_tready) // wait for previous write accepted
                if(rx_tlast) // if already end of packet, this frame is luckly valid
                    s1_next = S1_RECOVER; 
                else // append a last flag. This frame is contaminated but MAC will handle it.
                    s1_next = S1_END_MARK;
            else
                s1_next = S1_OVERFLOW;
        end
        S1_END_MARK: begin
            if(rx_tready) // end of packet
                s1_next = S1_RECOVER;
            else
                s1_next = S1_END_MARK;
        end
        S1_RECOVER: begin
            if(!rxdv_0) // wait until idle and jump in
                s1_next = S1_NORMAL;
            else
                s1_next = S1_RECOVER;
        end
        default: begin
            s1_next = 'bx;
        end
    endcase
end

always @(posedge aclk, negedge aresetn)
begin
    if(!aresetn) begin
        rx_tvalid <= 1'b0;
        rx_tdata <= 'b0;
        rx_tlast <= 1'b0;
    end
    else case(s1_next)
        S1_NORMAL: begin
            rx_tvalid <= rxdv_0;
            rx_tdata <= rxd_0;
            rx_tlast = rxdv_0 && !gmii_rxdv;
        end
        S1_OVERFLOW: begin
        end
        S1_END_MARK: begin
            rx_tdata <= 'b0;
            rx_tlast <= 1'b1;
        end
        S1_RECOVER: begin
            rx_tvalid <= 1'b0;
            rx_tlast <= 1'b0;
        end
    endcase
end

////////////////////////////////////////////////////////////////////////////////
// Tx
integer s2, s2_next;
localparam S2_PASS=0, S2_IFG=1;
reg [3:0] tx_timer;
parameter IFG_CYCLES=12;

always @(posedge aclk, negedge aresetn)
begin
    if(!aresetn)
        s2 <= S2_PASS;
    else
        s2 <= s2_next;
end

always @(*)
begin
    case(s2)
        S2_PASS: begin
            if(tx_tvalid && tx_tlast)
                s2_next = S2_IFG;
            else
                s2_next = S2_PASS;
        end
        S2_IFG: begin
            if(tx_timer==IFG_CYCLES)
                s2_next = S2_PASS;
            else
                s2_next = S2_IFG;
        end
        default: begin
            s2_next = 'bx;
        end
    endcase
end

always @(posedge aclk, negedge aresetn)
begin
    if(!aresetn) begin
        tx_tready <= 1'b0;
        tx_timer <= 'bx;
    end
    else case(s2_next)
        S2_PASS: begin
            tx_tready <= 1'b1;
            tx_timer <= 0;
        end
        S2_IFG: begin
            tx_tready <= 1'b0;
            tx_timer <= tx_timer+1;
        end
    endcase
end

always @(posedge aclk)
begin
    gmii_txd <= tx_tdata;
    gmii_txen <= tx_tvalid && tx_tready;
    gmii_txer <= 1'b0;
end

endmodule
