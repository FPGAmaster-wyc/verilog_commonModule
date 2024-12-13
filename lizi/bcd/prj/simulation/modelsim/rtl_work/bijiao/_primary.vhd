library verilog;
use verilog.vl_types.all;
entity bijiao is
    port(
        bi_in           : in     vl_logic_vector(3 downto 0);
        bi_out          : out    vl_logic_vector(3 downto 0)
    );
end bijiao;
