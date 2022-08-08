//full adder for bitwise addition, generates propagation and generation logic

module full_adder (input logic a, b, cin,
						output logic s, cout, p, g);
	assign s = a^b^cin;
	assign cout = (a&b)|(b&cin)|(a&cin);
	assign p = (a^b);
	assign g = (a&b);
endmodule

