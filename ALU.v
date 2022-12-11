module ALU(a,b,cmd,en,dout);
input [7:0]a,b;
input [3:0]cmd;
input en;
output [15:0]dout;
parameter 
Add=4'b0000,
Inc=4'b0001,
Sub=4'b0010,
Dec=4'b0011,
Mul=4'b0100,
Div=4'b0101,
Shl=4'b0110,
Shr=4'b0111,
And=4'b1000,
Or=4'b1001,
Inv=4'b1010,
Nand=4'b1011,
Nor=4'b1100,
Xor=4'b1101,
Xnor=4'b1110,
Buf=4'b1111;
reg [15:0]out;
always@(*)
 begin
   case(cmd)
	  Add:out=a+b;
	  Inc:out=a+1;
	  Sub:out=a-b;
	  Dec:out=a-1;
	  Mul:out=a*b;
	  Div:out=a/b;
	  Shl:out=a<<b;
	  Shr:out=a>>b;
	  And:out=a&b;
	  Or:out=a|b;
	  Inv:out=~a;
	  Nand:out=~(a&b);
	  Nor:out=~(a|b);
	  Xor:out=a^b;
	  Xnor:out=~(a^b);
	  Buf:out=a;
	 default:out=16'h0000;
	endcase
  end
  assign dout=(en)?out:16'h0000;
endmodule
	
	  
	  
 
