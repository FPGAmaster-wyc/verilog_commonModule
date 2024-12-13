library verilog;
use verilog.vl_types.all;
entity page_wr is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        sda             : inout  vl_logic;
        scl             : out    vl_logic
    );
end page_wr;
