//transaction
class my_seq_item extends uvm_sequence_item; 
`uvm_object_utils(my_seq_item)


      logic read_enable;
      logic write_enable;
      logic rst;
randc logic [3:0] addr;
rand  logic [31:0] data_in;
logic       [31:0] data_out;
logic             valid_out;

function new (string name="my_seq_item");
super.new(name);
endfunction

endclass
