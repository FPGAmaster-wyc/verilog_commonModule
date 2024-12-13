library verilog;
use verilog.vl_types.all;
entity page_rd is
    generic(
        S0              : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi0);
        CONTROL_BYTE    : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi1);
        ACK1            : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi0);
        ADDR_HIGH       : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi1);
        ACK2            : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi0, Hi0);
        ADDR_LOW        : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi0, Hi1);
        ACK3            : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi1, Hi0);
        START_READY     : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi1, Hi1);
        RD_START        : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi0, Hi0);
        RD_CTRL         : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi0, Hi1);
        ACK4            : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi1, Hi0);
        \RD_DATA\       : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi1, Hi1);
        RD_ACK          : vl_logic_vector(0 to 3) := (Hi1, Hi1, Hi0, Hi0);
        NO_ACK          : vl_logic_vector(0 to 3) := (Hi1, Hi1, Hi0, Hi1);
        STOP_READY      : vl_logic_vector(0 to 3) := (Hi1, Hi1, Hi1, Hi0);
        STOP            : vl_logic_vector(0 to 3) := (Hi1, Hi1, Hi1, Hi1);
        data_ctrl       : vl_logic_vector(0 to 7) := (Hi1, Hi0, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0);
        data_addr_high  : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        data_addr_low   : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        rd_ctrl_byte    : vl_logic_vector(0 to 7) := (Hi1, Hi0, Hi1, Hi0, Hi0, Hi0, Hi0, Hi1)
    );
    port(
        clk_400khz      : in     vl_logic;
        rst_n           : in     vl_logic;
        scl             : out    vl_logic;
        sda             : inout  vl_logic;
        rd_data         : out    vl_logic_vector(7 downto 0);
        rd_en           : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of S0 : constant is 1;
    attribute mti_svvh_generic_type of CONTROL_BYTE : constant is 1;
    attribute mti_svvh_generic_type of ACK1 : constant is 1;
    attribute mti_svvh_generic_type of ADDR_HIGH : constant is 1;
    attribute mti_svvh_generic_type of ACK2 : constant is 1;
    attribute mti_svvh_generic_type of ADDR_LOW : constant is 1;
    attribute mti_svvh_generic_type of ACK3 : constant is 1;
    attribute mti_svvh_generic_type of START_READY : constant is 1;
    attribute mti_svvh_generic_type of RD_START : constant is 1;
    attribute mti_svvh_generic_type of RD_CTRL : constant is 1;
    attribute mti_svvh_generic_type of ACK4 : constant is 1;
    attribute mti_svvh_generic_type of \RD_DATA\ : constant is 1;
    attribute mti_svvh_generic_type of RD_ACK : constant is 1;
    attribute mti_svvh_generic_type of NO_ACK : constant is 1;
    attribute mti_svvh_generic_type of STOP_READY : constant is 1;
    attribute mti_svvh_generic_type of STOP : constant is 1;
    attribute mti_svvh_generic_type of data_ctrl : constant is 1;
    attribute mti_svvh_generic_type of data_addr_high : constant is 1;
    attribute mti_svvh_generic_type of data_addr_low : constant is 1;
    attribute mti_svvh_generic_type of rd_ctrl_byte : constant is 1;
end page_rd;
