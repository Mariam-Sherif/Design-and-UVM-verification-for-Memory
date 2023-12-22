module top;
import uvm_pkg::*;
import pack_1::*;


intf intf1 ();

memory_16x32 DUT(
.clk(intf1.clk),
.read_enable(intf1.read_enable),
.write_enable(intf1.write_enable),  
.rst(intf1.rst),
.addr(intf1.addr),
.data_in(intf1.data_in),
.data_out(intf1.data_out),
.valid_out(intf1.valid_out)
);
initial
begin

uvm_config_db #(virtual intf)::set (null, "uvm_test_top", "vif", intf1);
run_test ("my_test");

end
endmodule