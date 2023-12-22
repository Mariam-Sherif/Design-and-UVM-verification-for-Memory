interface intf;

logic        clk;
logic        read_enable;
logic        write_enable;
logic        rst;
logic [3:0]  addr;
logic [31:0] data_in;
logic [31:0] data_out;
logic        valid_out;

task reset ();
rst =1'b0;
clk = 1'b0;
read_enable = 1'b0;
write_enable= 1'b0;
addr        = 4'b0;
data_in     = 32'b0;

repeat(2) @(posedge clk);
rst = 1'b1;
endtask

always #10 clk=~clk;
endinterface