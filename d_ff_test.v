module d_ff_test();
reg clk,rst,d;
wire q;
d_ff DUT(q,rst,clk,d);
always
begin
#5 clk=~clk;
end
task d_in(input a);
 begin
  @(negedge clk) 
    d=a;
 end
endtask
task reset(input b); 
  begin
   @(negedge clk)
     rst=b;
  end
endtask
initial
 begin
   rst=0;
   d=0;
   clk=0;
   #10;
   d_in(0);
   d_in(1);
   d_in(0);
   d_in(1);
   reset(0);
   reset(1);
 end
 initial
  $monitor("d=%b,q=%b",d,q);
endmodule

