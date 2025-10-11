// shift_register.sv
module shift_register (out,clk,mode,data_in);
	

	input  logic  clk;
    	input  logic [1:0]  mode;     // control: 00=reset, 01=load, 10=left, 11=right
    	input  logic [7:0]  data_in;  // parallel load input
    	output logic [7:0]  out;         // register output   

 always_ff @(posedge clk) begin
        case (mode)
            2'b00:  out <= 8'b0;                // Reset
            2'b01:  out <= data_in;             // Parallel load
            2'b10:  out <= out << 1;      	// Shift left (discard MSB)
            2'b11:  out <= out >> 1;      // Shift right (discard LSB)
            default: out <= out;                  // Hold previous value
        endcase
    end

endmodule

