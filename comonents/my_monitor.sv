//monitor//
class my_monitor extends uvm_monitor;
`uvm_component_utils(my_monitor)
my_seq_item seq_item;

uvm_analysis_port #(my_seq_item) analysis_port;

virtual intf my_vif;
function void build_phase(uvm_phase phase);
$display ("monitor build phase");
super.build_phase(phase);
seq_item=my_seq_item::type_id::create ("seq_item");

analysis_port = new ("analysis_port" ,this);

void'(uvm_config_db #(virtual intf)::get (this, "", "vif", my_vif));
endfunction

function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
$display ("monitor connect phase");
endfunction

function new (string name="my_monitor",uvm_component parent);
super.new(name,parent);
endfunction

task run_phase(uvm_phase phase);
super.run_phase(phase);
$display ("monitor run phase");
forever begin
@(posedge my_vif.clk)
seq_item.rst         <=my_vif.rst;
seq_item.read_enable <=my_vif.read_enable;
seq_item.write_enable<=my_vif.write_enable;
seq_item.addr        <=my_vif.addr;
seq_item.data_in     <=my_vif.data_in;
seq_item.data_out    <=my_vif.data_out;
seq_item.valid_out   <=my_vif.valid_out;
#1step$display ("monitor data_in = %p", seq_item.data_in);
$display ("monitor data_out = %p", seq_item.data_out);
analysis_port.write(seq_item);

end
endtask

endclass
