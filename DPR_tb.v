module DPR_tb();
reg clk,wr_en,rd_en;
reg [3:0]Addr_rd,Addr_wr;
reg [7:0]Data_in;
wire [7:0]Data_out;
DualPR DUT(clk,Data_in,Addr_wr,wr_en,Data_out,Addr_rd,rd_en);
integer i,j;
always
begin
 #5 clk=~clk;
end
task initialise;
 begin
   Data_in<=0;
   Addr_wr<=0;
   Addr_rd<=0;
   wr_en<=0;
   rd_en<=0;
   clk<=0;
 end
endtask
task write(input [3:0]ad_wr, input [7:0]din);
begin 
  @(negedge clk)
    wr_en<=1;
	Addr_wr<=ad_wr;
	Data_in<=din;
end
endtask
task read(input [3:0]ad_rd);
begin 
  @(negedge clk)
    rd_en<=1;
	Addr_rd<=ad_rd;
end
endtask
initial
fork
   initialise;
   #5 for(i=0;i<16;i=i+1)
   begin
     write(i,$random);
   end
   #15 for(j=0;j<16;j=j+1)
   begin 
      read(j);
   end
join
endmodule
  
	