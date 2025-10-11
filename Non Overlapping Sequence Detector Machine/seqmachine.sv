// Mealy Design

module sequencemachine (Z, clk, reset, A);

    
	input  logic clk;
    	input  logic reset;
    	input  logic A;         // 1-bit input stream
    	output logic Z;          // output = 1 when sequence detected


	logic [2:0] state, next_state;

    // Sequential state update
    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            state <= 3'b000;       // Start in initial state
        else
            state <= next_state;
    end

    // Combinational next-state + output logic
    always_comb begin
        Z = 1'b0;
        next_state = state;

        case (state)
            3'b000: begin // State S0
                if (A == 1'b1) next_state = 3'b010;  // go to S2
                else            next_state = 3'b001; // go to S1
            end

            3'b001: begin //State S1
                if (A == 1'b1 || A == 1'b0) next_state = 3'b100;  // regardless of input go to SB
                else            next_state = 3'b100;
            end

            3'b010: begin //State S2
                if (A == 1'b0) next_state = 3'b100;  // go to SB
                else            next_state = 3'b011;
            end

	    3'b011: begin //State S6
                if (A == 1'b1) next_state = 3'b101;  // go to SA
                else            next_state = 3'b110; // go to S13
            end

	    3'b100: begin //State SB
                if (A == 1'b1  ||  A == 1'b0) next_state = 3'b101;  // reegardless of input, go to SA
                else            next_state = 3'b101;
            end

	    3'b101: begin //State SA
                if (A == 1'b1  ||  A == 1'b0) next_state = 3'b000;  // reegardless of input, go back tro S0
                else            next_state = 3'b000;
            end

            3'b110: begin // State S13
                if (A == 1'b1) begin
                    next_state = 3'b000; // non-overlapping, reset
                    Z = 1'b1;            // recognized "1101"
                end else
                    next_state = 3'b000;
            end

            // other states could be merged or used if your 7-state reduction has more granularity
            default: next_state = 3'b000;
        endcase
    end

endmodule

//Moore Design
/*module sequencemachine (
    output logic Z,
    input  logic clk,
    input  logic reset,
    input  logic A
);

    logic [2:0] state, next_state;

    // Sequential state update
    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            state <= 3'b000;   // Initial state S0
        else
            state <= next_state;
    end

    // Combinational next-state logic
    always_comb begin
        next_state = state;

        case (state)
            3'b000: begin // State S0
                if (A == 1'b1) next_state = 3'b010;  // -> S2
                else            next_state = 3'b001;  // -> S1
            end

            3'b001: begin // State S1
                next_state = 3'b100;  // -> SB (regardless of input)
            end

            3'b010: begin // State S2
                if (A == 1'b0) next_state = 3'b100;  // -> SB
                else            next_state = 3'b011;  // -> S6
            end

            3'b011: begin // State S6
                if (A == 1'b1) next_state = 3'b101;  // -> SA
                else            next_state = 3'b110;  // -> S13
            end

            3'b100: begin // State SB
                next_state = 3'b101;  // -> SA
            end

            3'b101: begin // State SA
                next_state = 3'b000;  // -> S0
            end

            3'b110: begin // State S13 (detected 110)
                if (A == 1'b1)        // final 1 completes "1101"
                    next_state = 3'b111; // -> NEW output state
                else
                    next_state = 3'b000; // reset
            end

            3'b111: begin // NEW Output State
                next_state = 3'b000;  // Reset (non-overlapping)
            end

            default: next_state = 3'b000;
        endcase
    end

    // Moore output logic ? depends ONLY on state
    always_comb begin
        case (state)
            3'b111: Z = 1'b1;   // Assert output in final state
            default: Z = 1'b0;  // Otherwise, Z=0
        endcase
    end

endmodule*/

