library verilog;
use verilog.vl_types.all;
entity edge_detection is
    generic(
        t               : integer := 49;
        s0              : vl_logic := Hi0;
        s1              : vl_logic := Hi1
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        key_in          : in     vl_logic;
        pos_edge        : out    vl_logic;
        neg_edge        : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of t : constant is 1;
    attribute mti_svvh_generic_type of s0 : constant is 1;
    attribute mti_svvh_generic_type of s1 : constant is 1;
end edge_detection;
