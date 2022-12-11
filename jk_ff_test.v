module jk_ff_test();
reg j,k,clk,rst;
wire q;
jk_ff DUT(clk,rst,j,k,q);
always
begin
#5 clk=~clk;
end
task jk_in( input [1:0]i);
begin
  @(negedge clk)
  {j,k}=i;
end
endtask
task reset(input a);
begin
  @(negedge clk)
  rst=a;
end
endtask
initial
begin
   rst=0;
   j=0;
   k=0;
   clk=0;
   #5;
   jk_in(00);
   jk_in(01);
   jk_in(10);
   jk_in(11);
   reset(0);
   reset(1);
end
endmodule
   
