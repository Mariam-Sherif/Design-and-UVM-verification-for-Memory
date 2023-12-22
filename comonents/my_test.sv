///////////////////////////////////////////test/////////////////////////////////
class my_test extends uvm_test;
`uvm_component_utils(my_test)
my_sequence my_sequence1;
my_env my_env1;
virtual intf my_vif;

function void build_phase(uvm_phase phase);
super.build_phase(phase);
$display ("test build phase");
my_sequence1=my_sequence::type_id::create("my_sequence1");
my_env1=my_env::type_id::create ("my_env1",this);

void'(uvm_config_db #(virtual intf)::get (this, "", "vif", my_vif));
uvm_config_db #(virtual intf)::set (this, "my_env1", "vif", my_vif);
endfunction

function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
$display ("test connect phase");
endfunction

function new (string name="my_test",uvm_component parent);
super.new(name,parent);
endfunction

task run_phase(uvm_phase phase);
super.run_phase(phase);
phase.raise_objection (this);
my_vif.reset ();
my_sequence1.start(my_env1.agent1.sequencer1);

phase.drop_objection (this);
$display ("test run phase");
endtask

endclass
