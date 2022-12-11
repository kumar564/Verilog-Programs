module FIFO(clk,din,dout,wr_en,rd_en,rst,empty,full);
input clk,wr_en,rd_en,rst;
parameter width=8;
parameter depth=16;
parameter addr_width=4;
input [width-1:0]din;
output reg [width-1:0]dout;
output full,empty;
reg [addr_width-1:0]wr_ptr;
reg [addr_width-1:0]rd_ptr;
reg [addr_width:0]status_count;
reg [width-1:0] MEM [depth-1:0];
integer i;
//write pointer Logic
always@(posedge clk)
begin
 if(rst)
   wr_ptr<=0;
 else if(wr_en)
   wr_ptr<=wr_ptr+1;
end
// read pointer Logic
always@(posedge clk)
begin
 if(rst)
   rd_ptr<=0;
 else if(rd_en)
   rd_ptr<=rd_ptr+1;
end
// Status counter Logic
always@(posedge clk)
begin
 if(rst)
    status_count<=0;
 else if((wr_en && !full) && !(rd_en))
    status_count<=status_count+1;
 else if((rd_en && !empty) && !(wr_en))
    status_count<=status_count-1;
 else if((wr_en && !full)&&(rd_en && !empty))
    status_count<=status_count;
end
// full and empty logic
assign full=(status_count==depth)?1:0;
assign empty=(status_count==0)?1:0;
//array logic
always @(posedge clk)
begin
 if(rst)
 begin
    for(i=0;i<depth;i=i+1)
	 begin 
	   MEM[i]<=0;
	 end
 end
 else
  begin
    if(wr_en)
	  MEM[wr_ptr]<=din;
	if(rd_en)
	   dout<=MEM[rd_ptr];
  end
end 
endmodule


