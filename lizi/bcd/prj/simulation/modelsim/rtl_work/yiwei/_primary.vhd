library verilog;
use verilog.vl_types.all;
entity yiwei is
    port(
        yi_in           : in     vl_logic_vector(19 downto 0);
        yi_out          : out    vl_logic_vector(19 downto 0)
    );
end yiwei;
