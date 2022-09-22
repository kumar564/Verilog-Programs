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
