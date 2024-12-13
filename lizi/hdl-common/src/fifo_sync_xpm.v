// The following instructions describe how to prepare Vivado to use the XPM libraries:
// 1. Create or open a Vivado project
// 2. Set the property to enable XPMs:
//    set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY XPM_FIFO} [current_project]
//
// Note: This is a project property and as such you will need to specify it for each new project created.
module fifo_sync(
	rst,
	clk,
	din,
	wr_en,
	full,
	wr_count,
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
input wr_en;
input rd_en;
input clk;
input rst;

xpm_fifo_sync # (

  .FIFO_MEMORY_TYPE          ("auto"),           //string; "auto", "block", "distributed", or "ultra";
  .ECC_MODE                  ("no_ecc"),         //string; "no_ecc" or "en_ecc";
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
  .WAKEUP_TIME               (0)                 //positive integer; 0 or 2;

) xpm_fifo_sync_inst (
  .sleep            (1'b0),
  .rst              (rst),
  .wr_clk           (clk),
  .wr_en            (wr_en),
  .din              (din),
  .full             (full),
  .prog_full        (prog_full),
  .wr_data_count    (wr_count),
  .overflow         (overflow),
  .wr_rst_busy      (wr_rst_busy),
  .rd_en            (rd_en),
  .dout             (dout),
  .empty            (empty),
  .prog_empty       (prog_empty),
  .rd_data_count    (rd_count),
  .underflow        (underflow),
  .rd_rst_busy      (rd_rst_busy),
  .injectsbiterr    (1'b0),
  .injectdbiterr    (1'b0),
  .sbiterr          (),
  .dbiterr          ()
);
endmodule
