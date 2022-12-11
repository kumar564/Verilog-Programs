module DualPR(clk,Data_in,Addr_wr,wr_en,Data_out,Addr_rd,rd_en);
input clk,wr_en,rd_en;
input [7:0]Data_in;
input [3:0]Addr_wr,Addr_rd;
output reg [7:0]Data_out;
reg [7:0] MEM [15:0];
always@(posedge clk)
begin
 if(wr_en)
 begin
 MEM[Addr_wr]<=Data_in;
 end
 if(rd_en)
 begin
 Data_out<=MEM[Addr_rd];
 end
end
endmodule


  
