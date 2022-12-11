module TrueDPRam_tb();
reg clk_0,clk_1,re_0,re_1,we_1,we_0;
reg [3:0]Addr_0,Addr_1;
reg [7:0]temp_0,temp_1;
wire [7:0]Data_0,Data_1;
TrueDPRam DUT(clk_0,clk_1,re_0,we_0,we_1,re_1,Addr_0,Addr_1,Data_0,Data_1);
assign Data_0=(re_0 && !we_0)?temp_0:8'hzz;
assign Data_1=(re_1 && !we_1)?temp_1:8'hzz;
integer i,j;
always
begin
#5 clk_0=~clk_0;
end
always
begin
#5 clk_1=~clk_1;
end
task initialise;
 begin
   clk_0<=0;
   clk_1<=0;
   re_0<=0;
   re_1<=0;
   we_0<=0;
   we_1<=0;
   temp_0<=0;
   temp_1<=0;
   Addr_0<=0;
   Addr_1<=0;
 end
 endtask
task write_0(input [3:0]a,input [7:0]d);
begin
  @(negedge clk_0)
   we_0<=1;
   re_0<=0;
   Addr_0<=a;
   temp_0<=d;
 end
endtask
task write_1(input [3:0]b,input [7:0]da);
begin
  @(posedge clk_1)
   we_1<=1;
   re_1<=0;
   Addr_1<=b;
   temp_1<=da;
 end
endtask
task read_0(input [3:0]ar);
 begin
  @(negedge clk_0)
  we_0<=0;
  re_0<=1;
  Addr_0<=ar;
 end
endtask
task read_1(input [3:0]aa);
 begin
  @(posedge clk_1)
  we_1<=0;
  re_1<=1;
  Addr_1<=aa;
 end
endtask
initial
 begin
  initialise;
  for(i=0;i<16;i=i+2)
  begin
    write_0(i,$random);
  end
  for(i=1;i<16;i=i+2)
  begin
    write_1(i,$random);
  end
  for(j=0;j<16;j=j+2)
  begin
    read_0(j);
  end
  for(j=1;j<16;j=j+2)
  begin
    read_1(j);
  end
 end
endmodule
  
  


