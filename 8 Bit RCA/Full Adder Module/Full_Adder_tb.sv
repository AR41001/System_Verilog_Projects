`timescale 1ns/1ns

module fulladd_tb;

	logic a, b,cin;
	logic sum, cout;

	full_adder my_fulladder ( sum, cout, a,b, cin);

	initial

	begin
	
		a = 1'b0;
		b = 1'b0;
		cin = 1'b0;
		#5

		a = 1'b0;
		b = 1'b1;
		cin = 1'b0;
		#5

		a = 1'b0;
		b = 1'b1;
		cin = 1'b1;
		#5

		a = 1'b1;
		b = 1'b1;
		cin = 1'b1;
	end
endmodule
