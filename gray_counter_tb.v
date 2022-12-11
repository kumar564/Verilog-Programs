module gray_counter_tb();
reg clk,rst;
wire [3:0]out;
gray_counter DUT(clk,rst,out);
initial
begin
  clk=0;
  forever #5 clk=~clk;
end
task reset;
begin
  @(negedge clk)
   rst<=1;
  @(negedge clk)
   rst<=0;
end
endtask
initial 
begin
  reset;
  #10;
  repeat(20) @(posedge clk);
end
endmodule
 
