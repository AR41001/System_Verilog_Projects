module full_adder (Sum, Carryout, A,B,Cin);// Scalar Output wire C1, C2, C3;

	input wire A,B,Cin;
	output wire Sum,Carryout;
	wire x,y,z;
	half_add M1 (x, y , A, B);
	half_add M2 (Sum, z, x, Cin);

	or a3(Carryout, z, y );

endmodule




