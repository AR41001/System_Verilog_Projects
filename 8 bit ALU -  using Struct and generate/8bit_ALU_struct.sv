import alu_pkg::*;

module alu_8bit #( parameter WIDTH = 8)(
 input ALU_IO alu_input, 
 output logic [WIDTH-1:0]result,
 output logic carry_out
);
 
	logic [WIDTH:0] carry; // to hold carry for all bits
 	assign carry[0] = alu_input.cin;
 	
	// Instantiate 1-bit ALUs in a generate loop
 	genvar i;
 		generate
 			for (i = 0; i < WIDTH; i++) begin : alu_bits
 			//instantiate 1 bit alu
			alu_1bit alu_inst (
            			.A(alu_input.A[i]),
            			.B(alu_input.B[i]),
            			.cin(carry[i]),
            			.op(alu_input.operation),
            			.result(result[i]),
            			.cout(carry[i+1])
 				);
 			end
 		endgenerate
 	assign carry_out = carry[WIDTH];
endmodule
