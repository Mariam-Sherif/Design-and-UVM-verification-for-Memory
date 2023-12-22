//sequencer//
class my_sequencer extends uvm_sequencer #(my_seq_item);
`uvm_component_utils(my_sequencer)


function void build_phase(uvm_phase phase);
$display ("sequencer build phase");
super.build_phase(phase);
endfunction

function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
$display ("sequencer connect phase");
endfunction

function new (string name="my_sequencer",uvm_component parent);
super.new(name,parent);
endfunction

task run_phase(uvm_phase phase);
super.run_phase(phase);
$display ("sequencer run phase");
endtask


endclass