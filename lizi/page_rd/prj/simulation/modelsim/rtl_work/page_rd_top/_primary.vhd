library verilog;
use verilog.vl_types.all;
entity page_rd_top is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        sda             : inout  vl_logic;
        scl             : out    vl_logic;
        q               : out    vl_logic_vector(7 downto 0)
    );
end page_rd_top;
