`timescale 1ns/1ns

module shiftregister_tb;

    logic clk;
    logic [1:0] mode;
    logic [7:0] data_in;
    logic [7:0] out;

    // Instantiate DUT
    shift_register my_register (out,clk,mode,data_in);

    // Clock generation: 10ns period
    initial clk = 0;
    always #5 clk = ~clk;

    // Stimulus
    initial begin
        // Initial conditions
        mode = 2'b00; data_in = 8'h00; #10; // Reset (all 0s)

        // Parallel Load
        mode = 2'b01; data_in = 8'b10101010; #10;

        // Shift Left (discard MSB, insert 0)
        mode = 2'b10; #10;
        mode = 2'b10; #10;
        mode = 2'b10; #10;

        // Shift Right (discard LSB, insert 0)
        mode = 2'b11; #10;
        mode = 2'b11; #10;
        mode = 2'b11; #10;

        // Reset again
        mode = 2'b00; #10;

    end

endmodule

