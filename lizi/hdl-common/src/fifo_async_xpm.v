// The following instructions describe how to prepare Vivado to use the XPM libraries:
// 1. Create or open a Vivado project
// 2. Set the property to enable XPMs:
//    set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY XPM_FIFO} [current_project]
//
// Note: This is a project property and as such you will need to specify it for each new project created.
module fifo_async(
	wr_rst,
	wr_clk,
	din,
	wr_en,
	full,
	wr_count,
	rd_rst,
	rd_clk,
	dout,
	rd_en,
	empty,
	rd_count
);
parameter DSIZE = 8;
parameter ASIZE = 4;
parameter MODE = "NORMAL";
localparam DEPTH = 2**ASIZE;
localparam READ_MODE = (MODE=="FWFT")?"fwft":"std";

output [DSIZE-1:0] dout;
output full;
output empty;
output [ASIZE:0] wr_count;
output [ASIZE:0] rd_count;
input [DSIZE-1:0] din;
input wr_en, wr_clk, wr_rst;
input rd_en, rd_clk, rd_rst;

xpm_fifo_async # (

  .FIFO_MEMORY_TYPE          ("auto"),           //string; "auto", "block", or "distributed";
  .ECC_MODE                  ("no_ecc"),         //string; "no_ecc" or "en_ecc";
  .RELATED_CLOCKS            (0),                //positive integer; 0 or 1
  .FIFO_WRITE_DEPTH          (DEPTH),             //positive integer
  .WRITE_DATA_WIDTH          (DSIZE),               //positive integer
  .WR_DATA_COUNT_WIDTH       (ASIZE+1),               //positive integer
  .PROG_FULL_THRESH          (DEPTH/2),               //positive integer
  .FULL_RESET_VALUE          (0),                //positive integer; 0 or 1
  .READ_MODE                 (READ_MODE),            //string; "std" or "fwft";
  .FIFO_READ_LATENCY         (0),                //positive integer;
  .READ_DATA_WIDTH           (DSIZE),               //positive integer
  .RD_DATA_COUNT_WIDTH       (ASIZE+1),               //positive integer
  .PROG_EMPTY_THRESH         (DEPTH/2),               //positive integer
  .DOUT_RESET_VALUE          ("0"),              //string
  .CDC_SYNC_STAGES           (2),                //positive integer
  .WAKEUP_TIME               (0)                 //positive integer; 0 or 2;

) xpm_fifo_async_inst (

  .rst              (wr_rst|rd_rst),
  .wr_clk           (wr_clk),
  .wr_en            (wr_en),
  .din              (din),
  .full             (full),
  .overflow         (overflow),
  .wr_rst_busy      (wr_rst_busy),
  .rd_clk           (rd_clk),
  .rd_en            (rd_en),
  .dout             (dout),
  .empty            (empty),
  .underflow        (underflow),
  .rd_rst_busy      (rd_rst_busy),
  .prog_full        (prog_full),
  .wr_data_count    (wr_count),
  .prog_empty       (prog_empty),
  .rd_data_count    (rd_count),
  .sleep            (1'b0),
  .injectsbiterr    (1'b0),
  .injectdbiterr    (1'b0),
  .sbiterr          (),
  .dbiterr          ()

);
endmodule
