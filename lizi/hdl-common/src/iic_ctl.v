// A simple IIC transmitter
// NO SUPPORT for multiple masters
module iic_ctl(
    input clk,
    input rst,
    input [7:0] data_tx, // data for transmit
    output [7:0] data_rx, // data received
    input start, // generate start bit
    input stop, // generate stop bit
    input direction, // 0 for tx; 1 for rx 
    input do, // start transmitting
    output  ready, // ready for command
    output  error, // transmision failed
    input   scl_i,
    output  scl_o,
    output  scl_oe,
    input   sda_i,
    output  sda_o,
    output  sda_oe
);

parameter IIC_SPEED = 400000;
parameter CLOCK_PERIOD_NS = 10;
localparam UI_CLOCKS = 1_000_000_000/IIC_SPEED/CLOCK_PERIOD_NS;

reg busy;
reg scl_r, scl_oe_r,  sda_r, sda_oe_r;
reg start_r;
reg repeat_r;
reg stop_r;
reg direction_r;
reg [3:0] bits;
reg [7:0] data_tx_r;
reg [7:0] data_rx_r;
reg no_ack;

integer s1, s1_next;
localparam S1_IDLE=0, S1_SETUP=1, S1_START=2, S1_DATA=3, S1_ACK=4, S1_STOP=5;

assign ready = !busy;
assign scl_o = scl_r;
assign scl_oe = scl_oe_r;
assign sda_o = sda_r;
assign sda_oe = sda_oe_r;
assign error = no_ack;
assign data_rx = data_rx_r;

(* ASYNC_REG = "TRUE" *)
reg [1:0] sda_sync_r;
wire sda_sync = sda_sync_r[1];
always @(posedge clk)
begin
    sda_sync_r <= {sda_sync_r, sda_i};
end

reg [15:0] tmr;

wire clock_fall = tmr==0;
wire post_fall = tmr==1;
wire pre_rise = tmr==UI_CLOCKS/250*100;
wire clock_rise = tmr==UI_CLOCKS/250*130; // SCL dutycycle is 1300/2500
wire pre_fall = tmr==UI_CLOCKS/250*190; // SDA/SCL setup/hold is 600ns, which gives 1900/2500
always @(posedge clk, posedge rst)
begin
    if(rst) begin
        tmr <= 0;
    end
    else if(s1 == S1_IDLE) begin
        tmr <= 0;
    end
    else if(tmr==UI_CLOCKS-1) begin
        tmr <= 0;
    end
    else begin
        tmr <= tmr+1;
    end
end

always @(posedge clk, posedge rst)
begin
    if(rst)
        s1 <= S1_IDLE;
    else
        s1 <= s1_next;
end

always @(*)
begin
    case(s1)
        S1_IDLE: begin
            if(do)
                s1_next = S1_SETUP;
            else
                s1_next = S1_IDLE;
        end
        S1_SETUP: begin
            if(start_r)
                s1_next = S1_START;
            else
                s1_next = S1_DATA;
        end
        S1_START: begin
            if(clock_fall)
                s1_next = S1_DATA;
            else
                s1_next = S1_START;
        end
        S1_DATA: begin
            if(clock_fall)
                if(bits == 8)
                    s1_next = S1_ACK;
                else
                    s1_next = S1_DATA;
            else
                s1_next = S1_DATA;
        end
        S1_ACK: begin
            if(clock_fall)
                if(stop_r || no_ack) // must STOP if NO ACK
                    s1_next = S1_STOP;
                else
                    s1_next = S1_IDLE;
            else
                s1_next = S1_ACK;
        end
        S1_STOP: begin
            if(clock_fall)
                s1_next = S1_IDLE;
            else
                s1_next = S1_STOP;
        end
        default: begin
            s1_next = 'bx;
        end
    endcase
end

always @(posedge clk, posedge rst)
begin
    if(rst) begin
        scl_r <= 1'b1;
        scl_oe_r <= 1'b0;
        sda_r <= 1'b1;
        sda_oe_r <= 1'b0;
        busy <= 1'b0;
        start_r <= 1'bx;
        stop_r <= 1'bx;
        direction_r <= 1'bx;
        bits <= 'bx;
        data_tx_r <= 'bx;
        no_ack <= 'b0;
        data_rx_r <= 'bx;
        repeat_r <= 1'b0;
    end
    else case(s1_next)
        S1_IDLE: begin
            busy <= 1'b0;
        end
        S1_SETUP: begin
            busy <= 1'b1;
            start_r <= start;
            stop_r <= stop;
            direction_r <= direction;
            data_tx_r <= data_tx;
            bits <= 0;
        end
        S1_START: begin // START bit is a fall edge when SCL is high
            if(clock_fall) begin
                scl_oe_r <= 1'b1;
                scl_r <= !repeat_r; // if repeated start, send a fall-edge
            end
            else if(pre_rise) begin
                sda_oe_r <= 1'b1;
                sda_r <= 1'b1;
                repeat_r <= 1'b1; // preserve start state
            end
            else if(clock_rise) begin
                scl_r <= 1'b1;
            end
            else if(pre_fall) begin
                sda_r <= 1'b0;
            end
        end
        S1_DATA: begin // toggle output data at SCL fall, latch input data at SCL rise
            if(clock_fall) begin
                scl_r <= 1'b0;
            end
            else if(post_fall) begin
                sda_oe_r <= !direction_r;
                sda_r <= data_tx_r[7];
                data_tx_r <= {data_tx_r,1'bx};
                bits <= bits + 1;
            end
            else if(clock_rise) begin
                scl_r <= 1'b1;
                data_rx_r <= {data_rx_r, sda_sync};
            end
        end
        S1_ACK: begin // for tx, check ACK bit; for rx, set ACK bit
            if(clock_fall) begin
                scl_r <= 1'b0;
            end
            else if(post_fall) begin
                sda_oe_r <= direction_r;
                sda_r <= stop_r; // if stop bit is set, generate NO ACK.
            end
            else if(clock_rise) begin
                scl_r <= 1'b1;
                no_ack <= !direction_r & sda_sync; // for rx, if SDA is 1, there is a NO ACK condition
            end
        end
        S1_STOP: begin
            if(clock_fall) begin
                scl_r <= 1'b0;
            end
            else if(post_fall) begin
                sda_oe_r <= 1'b1;
                sda_r <= 1'b0;
                repeat_r <= 1'b0; // clear state
            end
            else if(clock_rise) begin
                scl_r <= 1'b1;
            end
            else if(pre_fall) begin
                sda_r <= 1'b1;
                scl_oe_r <= 1'b0;
                sda_oe_r <= 1'b0;
            end
        end
    endcase
end

endmodule
