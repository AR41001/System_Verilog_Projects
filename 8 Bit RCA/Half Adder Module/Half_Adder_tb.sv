`timescale 1ns/1ns

module halfadd_tb;

	logic a, b;
	logic sum, cout;

	half_add my_halfadd (sum, cout, a,b);

	initial

	begin
	
		a = 1'b0;
		b = 1'b0;
		#5

		a = 1'b0;
		b = 1'b1;
		#5

		a = 1'b1;
		b = 1'b0;
		#5

		a = 1'b1;
		b = 1'b1;
	end
endmodule