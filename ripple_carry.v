module ripple_carry(in1,in2,cin,s,c);
input [3:0]in1,in2;
input cin;
output [3:0]s;
output c;
wire [2:0]w;
full_adder Fa1(in1[0],in2[0],cin,s[0],w[0]);
full_adder Fa2(in1[1],in2[1],w[0],s[1],w[1]);
full_adder Fa3(in1[2],in2[2],w[1],s[2],w[2]);
full_adder Fa4(in1[3],in2[3],w[2],s[3],c);
endmodule
module Half_adder(a,b,s,c);
input a,b;
output reg s,c;
always@(a or b)
begin
   s=a^b;
   c=a&b;
end
endmodule
module full_adder(a,b,c,s,cout);
input a,b,c;
output s,cout;
wire w1,w2,w3;
Half_adder HA1(a,b,w1,w2);
Half_adder HA2(w1,c,s,w3);
assign cout=w2|w3;
endmodule
