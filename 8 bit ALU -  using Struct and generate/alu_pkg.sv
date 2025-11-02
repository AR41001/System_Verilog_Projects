package alu_pkg;

typedef enum logic [1:0] {
    AND_OP = 2'b00,
    OR_OP  = 2'b01,
    ADD_OP = 2'b10,
    SUB_OP = 2'b11
} ALU_Operation;

typedef struct {
    logic [7:0] A;
    logic [7:0] B;
    logic cin;
    ALU_Operation operation;
} ALU_IO;

endpackage

