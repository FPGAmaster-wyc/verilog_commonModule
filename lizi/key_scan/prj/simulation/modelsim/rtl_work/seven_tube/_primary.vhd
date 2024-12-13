library verilog;
use verilog.vl_types.all;
entity seven_tube is
    generic(
        t               : integer := 24999
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        data_in         : in     vl_logic_vector(23 downto 0);
        seg             : out    vl_logic_vector(7 downto 0);
        sel             : out    vl_logic_vector(2 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of t : constant is 1;
end seven_tube;
