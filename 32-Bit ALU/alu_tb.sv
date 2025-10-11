`timescale 1ns/1ns

module alu_tb;

    // Match sizes with ALU module
    logic [31:0] a, b;
    logic        cin;
    logic [2:0]  op;
    logic [63:0] out;

    // Instantiate ALU
    alu my_alu (
        .Out(out),
        .A(a),
        .B(b),
        .opcode(op),
        .Cin(cin)
    );

    initial begin

	a   = 32'h4E;
        b   = 32'h1E;
        cin = 1'b0;
        op  = 3'b000;		
        #5;

	a   = 32'h46;
        b   = 32'h3C;
        cin = 1'b0;
        op  = 3'b000;		
        #5;
       
	a   = 32'h4E;
        b   = 32'h1E;
        cin = 1'b0;
        op  = 3'b001;		
        #5;

	a   = 32'h46;
        b   = 32'h3C;
        cin = 1'b0;
        op  = 3'b001;		
        #5;

        a   = 32'h4E;
        b   = 32'h1E;
        cin = 1'b0;
        op  = 3'b010;		
        #5;

	a   = 32'h46;
        b   = 32'h3C;
        cin = 1'b0;
        op  = 3'b010;		
        #5;

	a   = 32'h4E;
        b   = 32'h1E;
        cin = 1'b0;
        op  = 3'b011;		
        #5;

	a   = 32'h46;
        b   = 32'h3C;
        cin = 1'b0;
        op  = 3'b011;		
        #5;
	
        a   = 32'h4E;
        b   = 32'h1E;
        cin = 1'b0;
        op  = 3'b100;		
        #5;

	a   = 32'h46;
        b   = 32'h3C;
        cin = 1'b0;
        op  = 3'b100;		
        #5;
	
        a   = 32'h4E;
        b   = 32'h1E;
        cin = 1'b0;
        op  = 3'b101;		
        #5;
	

	a   = 32'h46;
        b   = 32'h3C;
        cin = 1'b0;
        op  = 3'b101;		
        #5;
	
        a   = 32'h4E;
        b   = 32'h1E;
        cin = 1'b0;
        op  = 3'b110;		
        #5;

	a   = 32'h46;
        b   = 32'h3C;
        cin = 1'b0;
        op  = 3'b110;		
        #5;
	
        a   = 32'h4E;
        b   = 32'h1E;
        cin = 1'b0;
        op  = 3'b111;		
        #5;
        
        a   = 32'h46;
        b   = 32'h3C;
        cin = 1'b0;
        op  = 3'b111;		
  
    end
endmodule

