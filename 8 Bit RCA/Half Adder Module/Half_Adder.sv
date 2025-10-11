module half_add ( Sum,Cout, A,B );
	input wire A,B;
	output wire Sum,Cout;

	xor a1(Sum,A,B);
	and a2(Cout,A,B);

endmodule