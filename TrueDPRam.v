module TrueDPRam(clk_0,clk_1,re_0,we_0,we_1,re_1,Addr_0,Addr_1,Data_0,Data_1);
input clk_0,clk_1,re_0,re_1,we_1,we_0;
input [3:0]Addr_0,Addr_1;
inout [7:0]Data_0,Data_1;
reg [7:0]temp_0,temp_1;
reg [7:0] MEM [15:0];
assign Data_0=(re_0&&!we_0)?temp_0:8'hzz;
assign Data_1=(re_1&&!we_1)?temp_1:8'hzz;
always@(posedge clk_0)
begin
 if(we_0&&!re_0)
   MEM[Addr_0]<=Data_0;
 else if(re_0&&!we_0)
   temp_0<=MEM[Addr_0];
end
always@(negedge clk_1)
begin
  if(we_1&&!re_1)
   MEM[Addr_1]<=Data_1;
  else if(re_1&&!we_1)
    temp_1<=MEM[Addr_1];
end
endmodule