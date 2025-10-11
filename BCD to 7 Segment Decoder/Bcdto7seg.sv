module bcdto7segment (a,b,c,d,e,f,g,A,B,C,D,E);

	input  A,B,C,D,E;
	output a,b,c,d,e,f,g;


	assign a = E && ( (~B && ~D) || C || (B && D) || A );
	assign b = E && ( ~B || (~C && ~D) || (C && D) );
	assign c = E && ( ~C || D || B );
	assign d = E && ( (~B && ~D) || (~B && C) || (B && ~C && D) || (C && ~D) || A );
	assign e = E && ( (~B && ~D) || (C && ~D) );
	assign f = E && ( (~C && ~D) || (B && ~C) || (B && ~D) || A );
	assign g = E && ( (~B && C) || (B && ~C) || A || (B && ~D) );

endmodule
