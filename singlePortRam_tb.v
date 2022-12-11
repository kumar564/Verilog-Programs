module singlePortRam_tb();
reg clk,rd_en,wr_en;
reg [3:0]addr;
wire [7:0]data;
reg [7:0]temp;
singlePortRam DUT(clk,data,wr_en,rd_en,addr);
assign data=(wr_en && !rd_en)?temp:8'hzz;
integer i,j;
always
begin
 #5 clk=~clk;
end
task initialise;
 begin
   addr<=0;
   wr_en<=0;
   rd_en<=0;
   clk<=0;
   temp<=0;
  end
 endtask
task write(input [3:0]a,input [7:0]d);
begin
  @(negedge clk)
   wr_en<=1;
   rd_en<=0;
   addr<=a;
   temp<=d;
 end
endtask
task read(input [3:0]ar);
 begin
  @(negedge clk)
  wr_en<=0;
  rd_en<=1;
  addr<=ar;
 end
endtask
initial
begin
  initialise;
  for(i=0;i<16;i=i+1)
  begin
    write(i,$random);
  end
  for(j=0;j<16;j=j+1)
  begin
    read(j);
  end
end
endmodule
 
  