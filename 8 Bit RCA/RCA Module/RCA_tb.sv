`timescale 1ns/1ns

module rca8bit_tb;

	logic [0:7] a,b, sum;
	logic cin, cout;
	

	rca8bit my_rca ( sum, cout, a,b, cin);

	initial

	begin
		
		a = 8'd10;
		b = 8'd20;
		cin = 1'b1;
		#5

		a = 8'd36;
		b = 8'd21;
		cin = 1'b0;
		#5

		a = 8'd5;
		b = 8'd12;
		cin = 1'b1;
		#5

		a = 8'd17;
		b = 8'd19;
		cin = 1'b1;
	
	end
endmodule
