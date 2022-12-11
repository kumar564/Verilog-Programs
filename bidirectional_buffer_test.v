module bidirectional_buffer_test();
    reg C;
    wire A, B;
    reg tA, tB;
    bidirectional_buffer DUT(A,B,C);
    assign A = (C == 1)? tA : 1'bz;
    assign B = (C == 0)? tB : 1'bz;
	integer i;
    initial
        begin
            {C, tA, tB} = 0;
            for (i=0;i<=7;i=i+1)
			begin
                {C, tA, tB} = i;
                #10;
			end
        end
endmodule