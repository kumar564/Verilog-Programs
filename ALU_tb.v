module ALU_tb();
reg [7:0]a,b;
reg [3:0]cmd;
reg en;
wire [15:0]dout;
parameter 
Add=4'b0000,
Inc=4'b0001,
Sub=4'b0010,
Dec=4'b0011,
Mul=4'b0100,
Div=4'b0101,
Shl=4'b0110,
shr=4'b0111,
And=4'b1000,
Or=4'b1001,
Inv=4'b1010,
Nand=4'b1011,
Nor=4'b1100,
Xor=4'b1101,
Xnor=4'b1110,
Buf=4'b1111;
ALU DUT(a,b,cmd,en,dout);
task initialise;
 begin
   a=8'h00;
   b=8'h00;
   cmd=4'h0;
   en=1'b0;
 end
endtask
task en_ou(input i);
 begin
   en=i;
 end
endtask
task inputs(input [7:0]j,k);
 begin
   a=j;
   b=j;
 end
endtask
task command(input [3:0]c);
 begin
  cmd=c;
 end
endtask
initial 
 begin
  initialise;
  en_ou(1'b1);
  inputs(8'd10,8'd10);
  command(Add);
  #10;
  inputs(8'd20,8'd10);
  command(Sub);
  #10;
  inputs(8'd10,8'd10);
  command(Mul);
  #10;
  #100 $finish;
 end
initial
 $monitor("a=%b,b=%b,dout=%b",a,b,dout);
endmodule
 
 

 