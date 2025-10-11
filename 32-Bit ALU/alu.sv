module alu (
    output logic [63:0] Out,
    input  logic [31:0] A, B,
    input  logic [2:0]  opcode,
    input  logic        Cin
);

    always @ (A or B or Cin or Out or opcode)
	 begin
        case (opcode)
            3'b000: Out = A + B + Cin;
            3'b001: Out = A - B;
            3'b010: Out = A * B;
            3'b011: Out = A / B;
            3'b100: Out = A % B;
            3'b101: Out = A & B;
            3'b110: Out = A | B;
            3'b111: Out = A + B;   // redundant with 000
            default: Out = 64'b0;  // instead of $display
        endcase
    end

endmodule