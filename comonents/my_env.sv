                 /////////////////////////////env////////////////

class my_env extends uvm_env;
`uvm_component_utils(my_env)
my_agent agent1;
my_subscriber subscriber1;
my_scoreboard scoreboard1;

virtual intf my_vif;
function void build_phase(uvm_phase phase);
super.build_phase(phase);
$display ("env build phase");
agent1=my_agent::type_id::create ("agent1",this);
subscriber1=my_subscriber::type_id::create ("subscriber1",this);
scoreboard1=my_scoreboard::type_id::create ("scoreboard1",this);

void'(uvm_config_db #(virtual intf)::get (this, "", "vif", my_vif));
uvm_config_db #(virtual intf)::set (this, "agent1","vif", my_vif);
endfunction

function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
$display ("env connect phase");
agent1.analysis_port.connect(scoreboard1.analysis_export);
agent1.analysis_port.connect(subscriber1.analysis_export);
endfunction

function new (string name="myenv",uvm_component parent);
super.new(name,parent);
endfunction

task run_phase(uvm_phase phase);
super.run_phase(phase);
$display ("env run phase");
endtask
endclass