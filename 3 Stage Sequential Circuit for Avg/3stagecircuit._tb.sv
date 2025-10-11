`timescale 1ns/1ns

module pipeline_tb;

    logic clk;
    logic [7:0] a, b, c;
    logic [7:0] avg;

    // Instantiate DUT
    threestage_pipeline my_pipeline (avg,clk,a,b,c);

    // clock: 10 ns period (toggle every 5 ns)
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin

        // start with zeros
        //a = 8'd0; b = 8'd0; c = 8'd0;
        //#7; // wait a bit before first posedge

        // push first triple and hold for 3 cycles so pipeline fills
        a = 8'd3; b = 8'd6;  c = 8'd9;  #30; // hold for 3 clock cycles

        // push second triple, hold
        a = 8'd4; b = 8'd8;  c = 8'd12; #30;

        // push third triple
        a = 8'd9; b = 8'd9;  c = 8'd9;  #30;
    end

endmodule

