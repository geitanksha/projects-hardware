module 4ripple (input		[3:0] A, B,
					input				c_in,
					output		[3;0] S,
					output		   	c_out);
					
endmodule;

logic		c1, c2, c3;

full_adder	FA0(	.p(A[0]), .q(B[0]), .r(c_in), .s(S[0]), .c(c1));
full_adder	FA1(	.p(A[1]), .q(B[1]), .r(c1),   .s(S[1]), .c(c2));
full_adder	FA2(	.p(A[2]), .q(B[2]), .r(c2),   .s(S[2]), .c(c3));
full_adder	FA0(	.p(A[3]), .q(B[3]), .r(c3),   .s(S[3]), .c(c_out));
	