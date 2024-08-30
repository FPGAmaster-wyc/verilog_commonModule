`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
/*******Àı»¯Ä£°å*******

pma_init_get u_pma_init_get(
    .reset    ( reset    ),
    .init_clk ( init_clk ),
    .reset_pb ( reset_pb ),
    .pma_init ( pma_init )
);

********/

//////////////////////////////////////////////////////////////////////////////////
module pma_init_get(
    input   reset,
    input   init_clk,
    
    output  reg reset_pb,
    output  reg pma_init
);

    reg [31:0] cnt;
    
    always @ (posedge init_clk) begin
        if (reset)
            cnt <= 32'd0;
        else if (cnt == 32'd200_000_200) 
            cnt <= cnt;
        else
            cnt <= cnt + 32'd1;
    end
    
    always @ (posedge init_clk) begin
        case (cnt)
            32'd400 :
                pma_init <= 0;
            32'd500 :   
                reset_pb <= 0;
            32'd600 :
                reset_pb <= 1;
            32'd1000 :
                pma_init <= 1;
            32'd200_000_000 :
                pma_init <= 0;
            32'd200_000_200 :
                reset_pb <= 0;
            default :
                begin
                    reset_pb <= reset_pb;
                    pma_init <= pma_init;
                end
        endcase
    end
    
endmodule
