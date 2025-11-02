**System Verilog Projects**

- A portfolio of SystemVerilog projects demonstrating a range of modeling techniques and hardware design practices.
- These projects are done on **Questa Sim-64 10.7c**

**Notes for 8-Bit RCA Project**
  -  This design is based on hierarchical design
  -  The half adder and full adder are seperate modules within the same project and can be called as many times as needed
  -  Lastly, gate-level structural design concepts were used


**Notes for BCD to 7 Segment Decoder**
  -  This design is based on behavioral design, this doesnt it mean that it cannot be hierarchical.
  -  The difference from the 8-Bit RCA project is the difference of design as that was gate level modelling and this is behavioral

**Notes for 32-Bit ALU**
  -  This design is also based on behavioral design with the additional use of structured procedure statements such as "initial" and "always".
  -  In addition to this, the procedural assignments were understood such as blocking and non-blocking assignments ( used in the DFF ).
  -  The opcode truth table is present in the folder to understand how the ALU is functioning and it can be changed to follow any order

**Notes for Neg Edge Triggered DFF**
  -  The DFF has the following properties:
    -  Negative Edge Triggered with clock enable
    -  Active Low Asynchronous set and reset
    -  Active high and low outputs present
    -  Handling the race condition

  -  Non Blocking Assignment used in terms of the structured procedure assignments in addition to the behavioral modeling

**Notes for 3 Stage Sequential Circuit for Avg**
  -  This design is implementing a 3 stage pipeline to calculate AVG of the 3 input stream values
  -  The circuit is a sequential circuit hence the timing delays were taken into account

**Notes for 8-bit Synchronous Shift Register**
  -  This design is also based on behavioral design with the additional use of structured procedure statements such as "initial" and "always".
  -  It works on 4 modes which are selected depending on the input value

**Notes for Non-Overlapping State Machine**
  -  This machine will keep on checking an input stream and will signal the output to be "1" only when "1101" is detected as an input stream
  -  The state table as well as the state diagram is attached in the folder

**Notes for Cola Next Vending Machine**
  -  Machine dispenses a can of cola for Rs 15/- by opening the dispenser slot through 1-bit “OPEN” output signal.
  -  You can provide coins of either Rs. 10/- or Rs. 5/-, hence the input “COIN” can either be 5 or 10.
  -  The Machine returns back the change and it is demonstrated through a 1-bit “CHANGE” output signal.
  -  The Machine resets after a can has been dispensed.

**Notes for 4KB Memory**
  -  The first technique used for this project was the use of #PARAMETER which is similar to parameters in normal coding. Its a default constant value defined at the start of the design to make it more adaptable to change if needed.
  -  The design code is generic, the specific details for the memory was given in the testbench. For a 4096 size memory the mem_width => which is the size of data stored in one place of memory = 8 bits. The addr_width is 9 => used to address to all the locations of the memory. 2^9 = 512 | 512 x 8 ( mem_width) = 4096 ( memory size )
  -  The project works in a way that initially "zeros" are written to all the locations of the memory and then it is read
  -  After that, the memory address of each location is written on it and eventually read.

**Notes for reading data from file to memory**
  -  The same 4KB memory is used
  -  Data is read from "stimulus.txt"
  -  That read data is then written to "test_results.txt", the written data is basically a comparison but can be changed to any notation one wants
