module threestage_pipeline (avg,clk,a,b,c);

 	input  logic        clk;          // clock
   	//input  logic        rst;        // active-high async reset
    	input  logic [7:0]  a, b, c;      // 8-bit inputs
    	output logic [7:0]  avg;           // 8-bit average output

	
	 // pipeline registers
    logic [8:0]  R1;   // a + b  -> fits up to 9 bits
    logic [7:0]  C1;   // registered c (to align with R1)
    logic [9:0]  R2;   // R1 + C1 -> up to 10 bits

    // single clocked pipeline: stage1 -> stage2 -> stage3
    always_ff @(posedge clk) begin
        // Stage 1: compute and register a+b
        R1 <= a + b;

        // Register c so it lines up with R1 in next stage
        C1 <= c;

        // Stage 2: compute and register (R1 + C1) (uses previous R1/C1)
        R2 <= R1 + C1;

        // Stage 3: compute average = R2 / 3 (integer division)
        avg <= R2 / 3;
    end

endmodule
