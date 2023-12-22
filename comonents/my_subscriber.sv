//subscriber//
class my_subscriber extends uvm_subscriber #(my_seq_item);

`uvm_component_utils(my_subscriber)
my_seq_item seq_item;

covergroup group1;
RESET :coverpoint seq_item.rst;
ADDR  :coverpoint seq_item.addr;
READ  :coverpoint seq_item.read_enable;
WRITE :coverpoint seq_item.write_enable;
VALID :coverpoint seq_item.valid_out;
INPUT :coverpoint seq_item.data_in;
OUTPUT:coverpoint seq_item.data_out;
endgroup

function void build_phase(uvm_phase phase);
super.build_phase(phase);
seq_item= my_seq_item ::type_id::create("seq_item");
$display ("subscriber build phase");
endfunction

function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
$display ("subscriber connect phase");
endfunction

 function void write(my_seq_item t);
 seq_item =t;

 $display ("subscriber add = %p", t.addr);
group1.sample();
endfunction

function new (string name="my_subscriber",uvm_component parent);
super.new(name,parent);
group1= new();
endfunction

task run_phase(uvm_phase phase);
super.run_phase(phase);
$display ("subscriber run phase");
endtask

endclass
