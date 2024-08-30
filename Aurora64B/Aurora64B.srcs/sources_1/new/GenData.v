/*
GenData u_GenData(
    .clk   ( clk   ),
    .rst_n ( rst_n ),
    .valid ( valid ),
    .last  ( last  ),
    .data  ( data  )        // data [63:0]
);

*/
module GenData (
  input wire clk,
  input wire rst_n,
  output reg valid,
  output reg last,
  output reg [63:0] data
);

  reg [31:0] count;

  always @(posedge clk or posedge rst_n) begin
    if (~rst_n) 
        count <= 0;
    else if (count < 60000 )
        count <= count + 1;
    else
        count <= 0;
    end
  

  
  always @(posedge clk)
  begin
    if (~rst_n)
        begin
            data <= 0;
            valid <= 0;
            last <= 0;
        end
    else
        case (count)
            0   :   data <= 0;

        /*
            //单数据
            121   :   begin
                        data <= 64'hFF00_5A5A_55AA_0F0F;
                        valid <= 1;
                    end
            122   :   begin
                        data <= 64'hBCBC_4400_0004_5741;
                        valid <= 1;
                    end

            123   :   begin  
                        data <= 64'h4E47_2E2E_2E2E_FCFC;
                        valid <= 1;
                        last <= 1;
                    end
            124   :   begin
                        data <= 0;
                        valid <= 0;
                        last <= 0;
                    end

            131   :   begin
                        data <= 64'hFF00_5A5A_55AA_0F0F;
                        valid <= 1;
                    end
            132   :   begin
                        data <= 64'hBCBC_4400_0004_7777;
                        valid <= 1;
                    end

            133   :   begin  
                        data <= 64'h8888_9999_AAAA_FCFC;
                        valid <= 1;
                        last <= 1;
                    end
            134   :   begin
                        data <= 0;
                        valid <= 0;
                        last <= 0;
                    end

    */


            
            //2数据
            221   :   begin
                        data <= 64'hFF00_5A5A_55AA_0F0F;
                        valid <= 1;
                    end
            222   :   begin
                        data <= 64'hBCBC_C001_0004_0000;
                        valid <= 0;
                    end

            223   :   begin
                        data <= 64'hBCBC_C001_0004_0000;
                        valid <= 1;
                    end

            224   :   begin  
                        data <= 64'h0000_C147_A1BA_FCFC;
                        valid <= 1;
                        last <= 1;
                    end
            225   :   begin
                        data <= 0;
                        valid <= 0;
                        last <= 0;
                    end

       

/*

            230   :   begin
                        data <= 64'hFF00_5A5A_55AA_0F0F;
                        valid <= 1;
                    end
            231   :   begin
                        data <= 64'hBCBC_4400_0004_6666;
                        valid <= 1;
                    end

            232   :   begin  
                        data <= 64'hFFFF_FFFF_FFFF_FFFF;
                        valid <= 1;
                    end

            233  :   begin  
                        data <= 64'h7777_8888_9999_AAAA;
                        valid <= 1;
                    end

            234  :   begin  
                        data <= 64'h7777_8888_9999_AAAA;
                        valid <= 1;
                    end

            235   :   begin  
                        data <= 64'hBBBB_CCCC_DDDD_FCFC;
                        valid <= 1;
                        last <= 1;
                    end

            236   :   begin
                        data <= 0;
                        valid <= 0;
                        last <= 0;
                    end
            
*/
            default :   ;
        endcase
  end

endmodule