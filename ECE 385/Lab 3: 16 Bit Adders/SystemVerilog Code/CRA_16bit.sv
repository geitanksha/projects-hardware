module ripple_adder
(
	input  logic [15:0] A, B,
	input         logic cin,
	output logic [15:0] S,
	output        logic cout
);
	logic c1, c2, c3; //intermediate carry bits
	//can either do 16 of full adder units, or 4 of 4 cra units.
    ripple_4 RA0(	.A(A[3:0]), .B(B[3:0]), .c_in(cin), .S(S[3:0]), .c_out(c1));
	ripple_4 RA1(	.A(A[7:4]), .B(B[7:4]), .c_in(c1), .S(S[7:4]), .c_out(c2));
	ripple_4 RA2(	.A(A[11:8]), .B(B[11:8]), .c_in(c2), .S(S[11:8]), .c_out(c3));
	ripple_4 RA3(	.A(A[15:12]), .B(B[15:12]), .c_in(c3), .S(S[15:12]), .c_out(cout));
endmodule


