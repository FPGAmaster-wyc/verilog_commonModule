library verilog;
use verilog.vl_types.all;
entity beep_ctrl is
    generic(
        t1              : integer := 33332;
        t2              : integer := 4999999
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        key_valid       : in     vl_logic;
        beep            : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of t1 : constant is 1;
    attribute mti_svvh_generic_type of t2 : constant is 1;
end beep_ctrl;
