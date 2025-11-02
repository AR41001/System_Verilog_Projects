`timescale 1ns/1ns
import alu_pkg::*;

module alu_struct ();

	ALU_IO alu_objects;
	logic [7:0] result;
	logic carry_out;

	alu_8bit my_alu ( alu_objects, result, carry_out );

	initial begin
  $monitor("Time=%0t | A=%0d | B=%0d | cin=%0b | op=%b | result=%0d | carry_out=%0b",
            $time, alu_objects.A, alu_objects.B, alu_objects.cin,
            alu_objects.operation, result, carry_out);
	end



	initial begin

	
		//ADD Operation
		alu_objects.A = 8'd10;
		alu_objects.B = 8'd8;
		alu_objects.cin = 0;
		alu_objects.operation = ADD_OP;
		#5;

		// ADD Operation that overflows
		alu_objects.A = 8'd255;
		alu_objects.B = 8'd1;
		alu_objects.cin = 0;
		alu_objects.operation = ADD_OP;
		#5;

	 	//SUB Operation
		alu_objects.A = 8'd9;
		alu_objects.B = 8'd3;
		alu_objects.cin = 0;
		alu_objects.operation = SUB_OP;
		#5;

		//SUB Operation
		alu_objects.A = 8'd9;
		alu_objects.B = 8'd3;
		alu_objects.cin = 1;
		alu_objects.operation = SUB_OP;
		#5;

		//AND Operation
		alu_objects.A = 8'd4;
		alu_objects.B = 8'd7;
		alu_objects.operation = AND_OP;
		#5;
		
		//OR Operation
		alu_objects.A = 8'd8;
		alu_objects.B = 8'd6;
		alu_objects.operation = OR_OP;
		#5;

	end

endmodule