library verilog;
use verilog.vl_types.all;
entity M24LC64 is
    port(
        A0              : in     vl_logic;
        A1              : in     vl_logic;
        A2              : in     vl_logic;
        WP              : in     vl_logic;
        SDA             : inout  vl_logic;
        SCL             : in     vl_logic;
        RESET           : in     vl_logic
    );
end M24LC64;
