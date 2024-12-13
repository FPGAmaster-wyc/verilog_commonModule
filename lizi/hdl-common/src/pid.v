/*
* e(n) = measured(n)-expected(n)
* sigma = Ki*e(n)+sigma
* control(n) = (Kp+Kd)*e(n)+sigma-Kd*e(n-1)
* 1LSB = 1/(2**SCALE_BITS) for Kp, Ki, Kd
*/
module pid #(
    parameter DATA_BITS=16,
    parameter SCALE_BITS=16
)(
    input clk,
    input rst,
    input update,
    input signed [DATA_BITS-1:0] measured,
    input signed [DATA_BITS-1:0] expected,
    input [DATA_BITS-1:0] Kp,
    input [DATA_BITS-1:0] Ki,
    input [DATA_BITS-1:0] Kd,
    output reg signed [DATA_BITS-1:0] control,
    output reg valid
);
localparam ERR_BITS = DATA_BITS+1;
localparam PROD_BITS = 2*ERR_BITS;
localparam SIGMA_BITS = PROD_BITS+1;
localparam SUM_BITS = SIGMA_BITS+2;
localparam signed [SIGMA_BITS-1:0] SIGMA_MAX = 2**(DATA_BITS+SCALE_BITS-1)-1;
localparam signed [SIGMA_BITS-1:0] SIGMA_MIN = -(2**(DATA_BITS+SCALE_BITS-1));
localparam signed [DATA_BITS-1:0] DATA_MAX = 2**(DATA_BITS-1)-1;
localparam signed [DATA_BITS-1:0] DATA_MIN = -(2**(DATA_BITS-1));

reg signed [ERR_BITS-1:0] En;
reg signed [PROD_BITS-1:0] KiEn;
reg signed [PROD_BITS-1:0] KdEnp;
reg signed [ERR_BITS-1:0] KpPlusKd;
reg signed [PROD_BITS-1:0] KpPlusKdEn;
reg signed [SIGMA_BITS-1:0] Sigma;
reg signed [SUM_BITS-1:0] Sum;

reg signed [SIGMA_BITS:0] Sigma_next;
reg signed [SIGMA_BITS-1:0] Sigma_clamped;
always @(*)
begin
    Sigma_next = KiEn+Sigma;
    if(Sigma_next > SIGMA_MAX) // overflow
        Sigma_clamped = SIGMA_MAX;
    else if(Sigma_next < SIGMA_MIN) // underflow
        Sigma_clamped = SIGMA_MIN;
    else
        Sigma_clamped = Sigma_next;
end

reg signed [SUM_BITS-SCALE_BITS-1:0] control_next;
reg signed [DATA_BITS-1:0] control_clamped;
always @(*)
begin
    control_next = Sum[SUM_BITS-1:SCALE_BITS];
    if(control_next > DATA_MAX)
        control_clamped = DATA_MAX;
    else if(control_next < DATA_MIN)
        control_clamped = DATA_MIN;
    else
        control_clamped = control_next;
end

reg signed [ERR_BITS-1:0] mult_a;
reg signed [ERR_BITS-1:0] mult_b;
reg signed [2*ERR_BITS-1:0] mult_p;
always @(*)
begin
    mult_p = mult_a*mult_b;
end

integer s1, s1_next;
localparam S1_IDLE=0, S1_0=1, S1_1=2, S1_2=3, S1_3=4, S1_4=5, S1_5=6;

always @(posedge clk)
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
            if(update)
                s1_next = S1_0;
            else
                s1_next = S1_IDLE;
        end
        S1_0: begin
            s1_next = S1_1;
        end
        S1_1: begin
            s1_next = S1_2;
        end
        S1_2: begin
            s1_next = S1_3;
        end
        S1_3: begin
            s1_next = S1_4;
        end
        S1_4: begin
            s1_next = S1_5;
        end
        S1_5: begin
            s1_next = S1_IDLE;
        end
        default: begin
            s1_next = 'bx;
        end
    endcase
end

always @(posedge clk)
begin
    if(rst) begin
        Sigma <= 'b0;
        En <= 'b0;
        valid <= 1'b0;
        control <= 'b0;
    end case(s1_next)
        S1_IDLE: begin
            valid <= 1'b0;
        end
        S1_0: begin
            mult_a <= Kd;
            mult_b <= En; // En is e(n-1)
            KpPlusKd <= Kp+Kd;
            En <= measured - expected;
        end
        S1_1: begin
            KdEnp <= mult_p;
            mult_a <= Ki;
            mult_b <= En;
        end
        S1_2: begin
            KiEn <= mult_p;
            mult_a <= KpPlusKd;
            mult_b <= En;
        end
        S1_3: begin
            KpPlusKdEn <= mult_p;
            Sigma <= Sigma_clamped;
        end
        S1_4: begin
            Sum <= KpPlusKdEn + Sigma - KdEnp;
        end
        S1_5: begin
            control <= control_clamped;
            valid <= 1'b1;
        end
    endcase
end

endmodule
