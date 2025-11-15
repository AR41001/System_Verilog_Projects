`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.11.2025 23:35:39
// Design Name: 
// Module Name: Counter_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Counter_tb();

    reg clk;
    reg rst;
    wire [3:0] Count;
    
    Counter dut (
        .clk(clk),
        .rst(rst),
        .Count(Count)
    );

    // Clock generator: 10ns period
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        rst = 1;

        // Hold reset for 20ns
        #20;
        rst = 0;

        // Run counter for 150ns
        #150;

        $stop;
    end

endmodule
