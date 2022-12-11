module jk_ff(clk,reset,j,k,q);
input clk,reset,j,k;
output reg q;
always@(posedge clk)
begin
  if(reset)
    q<=0;
  else
  begin
   if(j==0&&k==0)
     q<=q;
   else if(j==0&&k==1)
     q<=0;
   else if(j==1&&k==0)
     q<=1;
   else if(j==1&&k==1)
     q<=~q;
  end
end
endmodule
