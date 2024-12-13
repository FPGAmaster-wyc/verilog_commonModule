library verilog;
use verilog.vl_types.all;
entity key_scan_top is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        row             : in     vl_logic_vector(3 downto 0);
        col             : out    vl_logic_vector(3 downto 0);
        sel             : out    vl_logic_vector(2 downto 0);
        seg             : out    vl_logic_vector(7 downto 0);
        beep            : out    vl_logic
    );
end key_scan_top;
