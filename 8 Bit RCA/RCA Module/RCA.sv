module rca8bit ( Sum, Cout, A,B, Cin );
	input [7:0] A, B;
	input Cin;
	output [7:0] Sum;
	output Cout;
	wire C1, C2, C3,C4,C5,C6,C7, C8;

	full_adder M0 (Sum[0], C1, A[0], B[0], Cin);
	full_adder M1 (Sum[1], C2, A[1], B[1], C1);
	full_adder M2 (Sum[2], C3, A[2], B[2], C2);
	full_adder M3 (Sum[3], C4, A[3], B[3], C3);
	full_adder M4 (Sum[4], C5, A[4], B[4], C4);
	full_adder M5 (Sum[5], C6, A[5], B[5], C5);
	full_adder M6 (Sum[6], C7, A[6], B[6], C6);
	full_adder M7 (Sum[7], Cout, A[7], B[7], C7);
	
endmodule
	
