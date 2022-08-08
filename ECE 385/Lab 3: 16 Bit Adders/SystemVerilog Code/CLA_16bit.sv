module lookahead_adder (
	input  logic [15:0]  A, B,
	input         logic cin,
	output logic [15:0] S,
	output        logic cout
);

	logic pg4, pg8, pg0, pg12, gg0, gg4, gg8, gg12, c4, c8, c12;
	
	
	always_comb begin
	c4  = gg0 | (cin & pg0);
	c8  =	gg4 | (gg0 & pg4) | (cin & pg0 & pg4);
	c12 = gg8 | (gg4 & pg8) | (gg0 & pg8 & pg4) | (cin & pg8 & pg4 & pg0);
	end
	
 
	lookahead_4 LA0( .A(A[3:0]), .B(B[3:0]), .c_in(cin), .S(S[3:0]), .c_out(1'b0), .pg(pg0), .gg(gg0));
	lookahead_4 LA1( .A(A[7:4]), .B(B[7:4]), .c_in(c4), .S(S[7:4]), .c_out(1'b0), .pg(pg4), .gg(gg4));
	lookahead_4 LA2( .A(A[11:8]), .B(B[11:8]), .c_in(c8), .S(S[11:8]), .c_out(1'b0), .pg(pg8), .gg(gg8));
	lookahead_4 LA3( .A(A[15:12]), .B(B[15:12]), .c_in(c12), .S(S[15:12]), .c_out(cout), .pg(pg12), .gg(gg12));
	 
	 
	 
endmodule
