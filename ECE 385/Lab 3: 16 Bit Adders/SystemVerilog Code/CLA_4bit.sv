module lookahead_4 (input		 logic [3:0] A, B,
							input		 logic c_in,
							output		 logic [3:0] S,
							output		 logic c_out,
							output		 logic pg,
							output		 logic gg);
logic	c2, c1, c3;
logic [3:0] p, g;

always_comb begin
	
	c1 = (c_in & p[0]) | g[0];
	c2 = (c_in & p[0] & p[1]) | (g[0] & p[1]) | g[1]  ;
	c3 = (c_in & p[0] & p[1] & p[2]) | (g[0] & p[1] & p[2]) | (g[1] & p[2]) | g[2];
	pg = p[0] & p[1] & p[2] & p[3];
	gg = g[3] | (g[2] & p[3]) | (g[1] & p[3] & p[2]) | (g[0] & p[3] & p[2] & p[1]);
	
end

full_adder	FA0(	.a(A[0]), .b(B[0]), .cin(c_in), .s(S[0]), .cout(1'b0),  .p(p[0]), .g(g[0]));
full_adder	FA1(	.a(A[1]), .b(B[1]), .cin(c1),   .s(S[1]), .cout(1'b0),  .p(p[1]), .g(g[1]));
full_adder	FA2(	.a(A[2]), .b(B[2]), .cin(c2),   .s(S[2]), .cout(1'b0),  .p(p[2]), .g(g[2]));
full_adder	FA3(	.a(A[3]), .b(B[3]), .cin(c3),   .s(S[3]), .cout(1'b0),  .p(p[3]), .g(g[3]));

endmodule
