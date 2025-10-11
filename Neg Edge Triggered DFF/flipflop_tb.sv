`timescale 1ns/1ns

module flipflop_tb;

    logic d, clk, reset_n, set_n, ce;
    logic q, qbar;

    dff my_dff (q, qbar, clk, d, reset_n, set_n, ce);

    // Clock: 5ns period (2.5ns high, 2.5ns low)
    initial clk = 0;
    always #2.5 clk = ~clk;

    initial begin
        // Initialize
        d = 0;
        ce = 1;
        reset_n = 1;
        set_n = 1;

        #5;
        d = 1;  #5;

        // Active-low reset
        reset_n = 0;  #5;
        reset_n = 1;  #5;

        // Active-low set
        set_n = 0;  #5;
        set_n = 1;  #5;

        // Normal operation
        d = 0; ce = 1; #10;
        d = 1; ce = 1; #10;

        // CE disabled
        ce = 0;
        d = 0; #10;

        // Illegal condition: both set and reset active
        reset_n = 0;
        set_n   = 0;
        #10;

        // Release back to normal
        reset_n = 1;
        set_n   = 1;
        d = 1; ce = 1;
        #10;
    end

endmodule

