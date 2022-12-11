module bidirectional_buffer(a,b,c);
input c;
inout b,a;
assign b=(c==1)?a:1'bz;
assign a=(c==0)?b:1'bz;
endmodule
