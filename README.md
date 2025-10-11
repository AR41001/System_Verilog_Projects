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
