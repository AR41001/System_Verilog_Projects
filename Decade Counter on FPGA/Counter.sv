`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.11.2025 23:28:06
// Design Name: 
// Module Name: Counter
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


module Counter(
    input logic clk,
    input logic rst,
    output logic [3:0]Count
    );
    
   always_ff @(posedge clk or posedge rst) begin
            if (rst) begin
                Count <= 4'd0;
            end
            else if (Count == 4'd9) begin
                Count <= 4'd0;
            end
            else begin
                Count <= Count + 1;
            end
        end
    
endmodule
