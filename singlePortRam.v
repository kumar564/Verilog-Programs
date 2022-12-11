module singlePortRam(clk,data,wr_en,rd_en,addr);
input clk,rd_en,wr_en;
input [3:0]addr;
inout [7:0]data;
reg [7:0]temp_data;
reg [7:0] MEM [15:0];
assign data=(rd_en && !wr_en)?temp_data:8'hzz;
always@(posedge clk)
begin
 if(wr_en && !rd_en)
   MEM[addr]<=data;
 else if(rd_en && !wr_en)
   temp_data<=MEM[addr];
end
endmodule