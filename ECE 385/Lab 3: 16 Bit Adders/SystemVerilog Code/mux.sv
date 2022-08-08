module mux( input logic [3:0] A_s, B_s,
            input logic S,
            output logic [3:0] S_out);

always_comb
begin
unique case (S)
  1'b0   : S_out[3:0] = A_s[3:0];
  1'b1   : S_out[3:0] = B_s[3:0];
  endcase
end
endmodule