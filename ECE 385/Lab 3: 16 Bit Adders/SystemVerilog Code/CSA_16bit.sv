module select_adder (
input  logic [15:0] A, B,
input         logic cin,
output logic [15:0] S,
output        logic cout
);




logic c4,c8,c12, c21, c22, c31, c32, c41, c42;
logic [3:0] as2, bs2, as3, bs3, as4, bs4;


    ripple_4 SA1( .A(A[3:0]), .B(B[3:0]), .c_in(cin), .S(S[3:0]), .c_out(c4));
    ripple_4 SA21( .A(A[7:4]), .B(B[7:4]), .c_in(1'b0), .S(as2), .c_out(c21));
    ripple_4 SA22( .A(A[7:4]), .B(B[7:4]), .c_in(1'b1), .S(bs2), .c_out(c22));
    ripple_4 SA31( .A(A[11:8]), .B(B[11:8]), .c_in(1'b0), .S(as3), .c_out(c31));
    ripple_4 SA32( .A(A[11:8]), .B(B[11:8]), .c_in(1'b1), .S(bs3), .c_out(c32));
    ripple_4 SA41( .A(A[15:12]), .B(B[15:12]), .c_in(1'b0), .S(as4), .c_out(c41));
    ripple_4 SA42( .A(A[15:12]), .B(B[15:12]), .c_in(1'b1), .S(bs4), .c_out(c42));

always_comb begin

c8 = (c4 & c22) | (c21);
c12 = (c8 & c32) | c31;
cout = (c12 & c42) | c41;

end

	mux M1 (.A_s(as2), .B_s(bs2), .S(c4),  .S_out(S[7:4]));
	mux M2 (.A_s(as3), .B_s(bs3), .S(c8),  .S_out(S[11:8]));
	mux M3 (.A_s(as4), .B_s(bs4), .S(c12), .S_out(S[15:12]));
		

endmodule
