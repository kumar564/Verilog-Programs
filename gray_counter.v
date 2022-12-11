module gray_counter(clk,rst,out);
input clk,rst;
output reg[3:0]out;
reg q0,q1,q2;
reg [3:0]count;
always@(posedge clk)
begin
 if(rst)
 begin
  count=4'b0;
  out=4'b0;
 end
 else
 begin
  count=count+1'b1;
  q2=count[3]^count[2];
  q1=count[2]^count[1];
  q0=count[1]^count[0];
  out={count[3],q2,q1,q0};
 end
end
endmodule
 
	  
	
   