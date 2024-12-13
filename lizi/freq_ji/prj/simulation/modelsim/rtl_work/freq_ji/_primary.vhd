library verilog;
use verilog.vl_types.all;
entity freq_ji is
    generic(
        t               : integer := 5
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        clk_out         : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of t : constant is 1;
end freq_ji;
