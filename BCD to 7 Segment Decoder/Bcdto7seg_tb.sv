`timescale 1ns/1ns

module bcdto7seg_tb;

	logic A,B,C,D,E;
	logic a,b,c,d,e,f,g;

	bcdto7segment my_segment (a,b,c,d,e,f,g,A,B,C,D,E);

	initial

	begin
	
		A = 1'b0;
		B = 1'b0;
		C = 1'b0;
		D = 1'b0;
		E = 1'b1; 		// apart from g all should be 1 to make a 0
		#5

		A = 1'b0;
		B = 1'b0;
		C = 1'b1;
		D = 1'b0;
		E = 1'b1;		// apart from c and f all should be 1 to make a 2
		#5

		A = 1'b0;
		B = 1'b0;
		C = 1'b1;
		D = 1'b1;
		E = 1'b1;		// apart from e and f all should be 1 to make a 3

		#5

		A = 1'b1;
		B = 1'b0;
		C = 1'b0;
		D = 1'b0;
		E = 1'b1;		// all 1 to make an 8
		#5

		A = 1'b1;
		B = 1'b0;
		C = 1'b0;
		D = 1'b1;
		E = 1'b1;		// all 1 except e to make a 9
		#5
		
		A = 1'b1;
		B = 1'b0;
		C = 1'b0;
		D = 1'b1;
		E = 1'b0;		// testing whether the enable 0 closes all inputs or not

		A = 1'b0;
		B = 1'b0;
		C = 1'b1;
		D = 1'b0;
		E = 1'b0;		// enable off no change should occur
		#5

		A = 1'b0;
		B = 1'b0;
		C = 1'b1;
		D = 1'b1;
		E = 1'b0;
	
	end
endmodule




