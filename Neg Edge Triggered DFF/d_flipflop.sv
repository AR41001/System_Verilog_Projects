module dff (Q, QBAR, CLK, D, RESET_N, SET_N, CE);
    input  logic CLK;        // clock
    input  logic D;          // data input
    input  logic RESET_N;    // active-low async reset
    input  logic SET_N;      // active-low async set
    input  logic CE;         // clock enable
    output logic Q;          // active-high output
    output logic QBAR;       // active-low output

    always @(negedge CLK or negedge RESET_N or negedge SET_N) begin
        // illegal condition: both set and reset active
        if (!RESET_N && !SET_N)
            Q <= 1'bx;

        // async reset (active low)
        else if (!RESET_N)
            Q <= 1'b0;

        // async set (active low)
        else if (!SET_N)
            Q <= 1'b1;

        // normal operation (on negedge clock, if enabled)
        else if (CE)
            Q <= D;

        // else hold value (no change)
    end

    assign QBAR = ~Q;

endmodule

