//driver//
class my_driver extends uvm_driver #(my_seq_item);
`uvm_component_utils(my_driver)
my_seq_item seq_item;
 virtual intf my_vif;

function void build_phase(uvm_phase phase);
$display ("driver build phase");
super.build_phase(phase);
seq_item=my_seq_item::type_id::create ("seq_item");
void'(uvm_config_db #(virtual intf)::get (this, "", "vif", my_vif));
endfunction

function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
$display ("driver connect phase");
endfunction

function new (string name="my_driver",uvm_component parent);
super.new(name,parent);
endfunction

task run_phase(uvm_phase phase);
super.run_phase(phase);

forever begin
    seq_item_port.get_next_item(seq_item);
    $display ("driver item = %p", seq_item);
    drive(seq_item);
   
    seq_item_port.item_done();
end
$display ("driver run phase");
endtask

task drive (my_seq_item seq_item);
@(posedge my_vif.clk)
my_vif.rst         <=seq_item.rst;
my_vif.read_enable <=seq_item.read_enable;
my_vif.write_enable<=seq_item.write_enable;
my_vif.addr        <=seq_item.addr;
my_vif.data_in     <=seq_item.data_in;
#1step$display ("driver data = %p", my_vif.data_in);
endtask
endclass
