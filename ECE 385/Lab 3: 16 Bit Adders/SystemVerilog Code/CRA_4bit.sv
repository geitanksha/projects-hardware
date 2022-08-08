module ripple_4 (input	 logic	[3:0] A, B,
					input			c_in,
					output	 logic	[3:0] S,
					output		   	c_out);
					
logic		c1, c2, c3; //intermediate carry bits

full_adder	FA0(	.a(A[0]), .b(B[0]), .cin(c_in), .s(S[0]), .cout(c1));
full_adder	FA1(	.a(A[1]), .b(B[1]), .cin(c1),   .s(S[1]), .cout(c2));
full_adder	FA2(	.a(A[2]), .b(B[2]), .cin(c2),   .s(S[2]), .cout(c3));
full_adder	FA3(	.a(A[3]), .b(B[3]), .cin(c3),   .s(S[3]), .cout(c_out));

endmodule