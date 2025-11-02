module alu_1bit(input logic A, B,cin, input logic [1:0] op, output logic result,cout);
	
	logic B_complement;
	always_comb begin
		result=0;
		cout=0;
	case (op)
		2'b00: result = A & B;
		2'b01: result = A | B;
		2'b10: begin
			result = A ^ B ^ cin;
			cout = (A & B) | (cin & ( A ^ B ));
			end
		2'b11: begin
			B_complement = ~B;
			result = A ^ B_complement ^ cin;
			cout = (A & B_complement ) | (cin & (A ^ B_complement));
			end
	default: begin
 		result = 0;
		cout=0; end
 	endcase
	end

endmodule
