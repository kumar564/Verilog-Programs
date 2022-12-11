module FIFO_tb();
reg clk,wr_en,rd_en,rst;
parameter width=8;
parameter depth=16;
reg [width-1:0]din;
wire [width-1:0]dout;
wire full,empty;
FIFO DUT(clk,din,dout,wr_en,rd_en,rst,empty,full);
always
#5 clk=~clk;
integer i;
task initialise;
  begin
    din<=0;
    wr_en<=0;
    rd_en<=0;
    clk<=0;
  end
endtask
task reset;
  begin 
    @(negedge clk)
	  rst<=1;
	@(negedge clk)
	  rst<=0;
  end
endtask
task write(input [width-1:0]d);
  begin
    @(negedge clk)
	   din<=d;
  end
endtask
initial
  begin
    initialise;
	reset;
	#10;
	wr_en<=1;
	for(i=0;i<depth;i=i+1)
	   begin 
	     write($random);
	   end
	#10;
	wr_en<=0;
	#10;
	rd_en<=1;
	#500;
  end
endmodule
	
