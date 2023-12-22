class my_agent extends uvm_agent;
`uvm_component_utils(my_agent)
my_driver driver1;
my_monitor monitor1;
my_sequencer sequencer1;

virtual intf my_vif;


uvm_analysis_port #(my_seq_item) analysis_port;

function void build_phase(uvm_phase phase);
super.build_phase(phase);
$display ("agent build phase");
driver1=my_driver::type_id::create ("driver1",this);
monitor1=my_monitor::type_id::create ("monitor1",this);
sequencer1=my_sequencer::type_id::create ("sequencer1",this);

void'(uvm_config_db #(virtual intf)::get (this, "", "vif", my_vif));
uvm_config_db #(virtual intf)::set (this, "driver1","vif", my_vif);
uvm_config_db #(virtual intf)::set (this, "monitor1","vif", my_vif);

analysis_port = new ("analysis_port" ,this);

endfunction

function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
$display ("agent connect phase");
monitor1.analysis_port.connect(analysis_port);
driver1.seq_item_port.connect(sequencer1.seq_item_export);
endfunction

function new (string name="my_agent",uvm_component parent);
super.new(name,parent);
endfunction

task run_phase(uvm_phase phase);
super.run_phase(phase);
$display ("agent run phase");
endtask

endclass
