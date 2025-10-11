`timescale 1ns/1ns

module vending_tb;

    logic clk;
    logic reset;
    logic [1:0] COIN;
    logic OPEN, CHANGE;

    // Instantiate DUT
    vending_machine my_vending (OPEN, CHANGE, COIN, reset, clk);

    // Clock: 10ns period
    initial clk = 0;
    always #5 clk = ~clk;

    // Monitor: show activity every posedge
    always @(posedge clk) begin
        $display("%0t | COIN=%b | state=%b | OPEN=%b CHANGE=%b",
                 $time, COIN, my_vending.state, OPEN, CHANGE);
    end

    // Main test sequence
    initial begin
        $display("\n--- Vending Machine Testbench Start ---");
        $display("Time | COIN | state | OPEN CHANGE | Notes");

        // Initial reset
        reset = 1;
        COIN  = 2'b00;
        repeat (2) @(posedge clk); // wait 2 clocks
        reset = 0;

        // -------------------------------
        // Test 1: Rs10 + Rs5 => Rs15 exact -> OPEN only
        // -------------------------------
        @(posedge clk);
        COIN = 2'b10;  // insert Rs10
        @(posedge clk);
        COIN = 2'b01;  // insert Rs5 -> should cause OPEN
        @(posedge clk);
        COIN = 2'b00;  // no coin
        repeat (2) @(posedge clk);

        // -------------------------------
        // Test 2: Rs5 + Rs10 => Rs15 exact -> OPEN only
        // -------------------------------
        @(posedge clk);
        COIN = 2'b01;  // insert Rs5
        @(posedge clk);
        COIN = 2'b10;  // insert Rs10 -> should cause OPEN
        @(posedge clk);
        COIN = 2'b00;
        repeat (2) @(posedge clk);

        // -------------------------------
        // Test 3: Rs10 + Rs10 => Rs20 -> OPEN + CHANGE
        // -------------------------------
        @(posedge clk);
        COIN = 2'b10;  // insert Rs10
        @(posedge clk);
        COIN = 2'b10;  // insert Rs10 -> should cause OPEN + CHANGE
        @(posedge clk);
        COIN = 2'b00;
        repeat (2) @(posedge clk);

        // Done
        $display("--- Vending Machine Testbench Done ---\n");
        $finish;
    end

endmodule

