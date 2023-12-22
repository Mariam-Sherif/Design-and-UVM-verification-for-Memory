//sequence//
class my_sequence extends uvm_sequence;
`uvm_object_utils(my_sequence)
my_seq_item seq_item;

task pre_body;
    seq_item=my_seq_item::type_id::create ("seq_item");
endtask 


task body; 

  
for (int i=0; i<16 ; i++)
begin
//data in
 

   start_item (seq_item);
  seq_item.rst         = 1'b1;
  seq_item.read_enable =1'b0;
  seq_item.write_enable=1'b1;
 void'( seq_item.randomize());

   finish_item (seq_item);
end

for (int i=0; i<16 ; i++)
begin
      start_item (seq_item);
  seq_item.rst         = 1'b1;
  seq_item.read_enable =1'b1;
  seq_item.write_enable=1'b0;
  void'(seq_item.randomize());
		
   finish_item (seq_item);
end
   
endtask

function new (string name="my_sequence");
super.new(name);

endfunction


endclass