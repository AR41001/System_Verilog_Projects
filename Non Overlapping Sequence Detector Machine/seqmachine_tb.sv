`timescale 1ns/1ns

module sequencemachine_tb;

    // Testbench signals
    logic clk, reset, A;
    logic Z;

  	sequencemachine my_machine (Z, clk, reset, A);
  

    // Clock generator (period = 10 ns)
    initial clk = 0;
    always #5 clk = ~clk;   // 50% duty cycle

    // Stimulus process
   initial begin
    A = 0;
    reset = 1; #12; reset = 0;

    #1  A = 1;  // input settles before next posedge (at 5 ns)
    #9  A = 1;  // total 10 ns between input bits, offset preserved
    #8 A = 0;
    #8 A = 1;
    #8 A = 1;
    #8 A = 0;
    #8 A = 1;
    #8 A = 0;

    #8 reset = 1;
    #8 reset = 0 ;

    #8 A = 1;
    #8 A = 1;
    #8 A = 0;
    #8 A = 1;


end

  

endmodule

