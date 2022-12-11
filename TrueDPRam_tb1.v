module TrueDPRam_tb1();
reg clk_0,clk_1,re_0,re_1,we_1,we_0;
reg [3:0]Addr_0,Addr_1;
reg [7:0]temp_0,temp_1;
wire [7:0]Data_0,Data_1;
TrueDPRam DUT(clk_0,clk_1,re_0,we_0,we_1,re_1,Addr_0,Addr_1,Data_0,Data_1);
assign Data_0=(we_0 && !re_0)?temp_0:8'hzz;
assign Data_1=(we_1 && !re_1)?temp_1:8'hzz;
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
task wr2;
  begin
   @(negedge clk_0)
      we_0<=1;
	  re_0<=0;
   @(posedge clk_1)
     we_1<=1;
	 re_1<=0;
  end
endtask
task rd2;
  begin
   @(negedge clk_0)
      we_0<=0;
	  re_0<=1;
   @(posedge clk_1)
     we_1<=0;
	 re_1<=1;
  end
endtask
task wr_rd;
  begin
   @(negedge clk_0)
      we_0<=1;
	  re_0<=0;
   @(posedge clk_1)
     we_1<=0;
	 re_1<=1;
  end
endtask
task stimulus_0(input[3:0]A0,input[7:0]D0);
 begin
  @(negedge clk_0)
     Addr_0<=A0;
	 temp_0<=D0;
 end
endtask
task stimulus_1(input[3:0]A1,input[7:0]D1);
 begin
  @(posedge clk_1)
    Addr_1<=A1;
	temp_1<=D1;
 end
endtask
initial 
 begin
  initialise;
  wr2;
 end
initial 
 fork
  #20 for(i=0;i<8;i=i+1)
       begin
	      stimulus_0(i,$random);
	   end
	   
  #20 for(j=8;j<16;j=j+1)
       begin
	      stimulus_1(j,$random);
	   end
 join
initial
 begin
  #200 rd2;
 end
initial 
 fork
  #220 for(i=0;i<8;i=i+1)
       begin
	      stimulus_0(i,0);
	   end
	   
  #220 for(j=8;j<16;j=j+1)
       begin
	      stimulus_1(j,0);
	   end
 join
 initial
 begin
  #400 wr_rd;
 end
initial 
 fork
  #420 for(i=0;i<16;i=i+1)
       begin
	      stimulus_0(i,$random);
	   end
	   
  #450 for(j=0;j<16;j=j+1)
       begin
	      stimulus_1(j,0);
	   end
 join
endmodule
 
 
 
