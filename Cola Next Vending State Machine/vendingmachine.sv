module vending_machine (OPEN,CHANGE, COIN, reset, clk);

    
	input  logic clk;
    	input  logic reset;    // active-high synchronous reset
    	input  logic [1:0] COIN;   // 2-bit coin input: 01=Rs5, 10=Rs10
   	output logic OPEN;     // asserted 1 cycle to release can
   	output logic CHANGE;    // asserted 1 cycle to indicate change return (5 Rs)


    	// State encoding (binary)
    	typedef enum logic [2:0] {
        	S0   = 3'b000,   // 0  Rupees
        	S5   = 3'b001,   // 5
        	S10  = 3'b010,   // 10
        	S15  = 3'b011,   // dispense exact (15)  -> OPEN = 1
        	S20  = 3'b100    // dispense with change (20) -> OPEN=1, CHANGE=1
    		} state_t;

    	state_t state, next_state;

	// Sequential block
    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            state <= S0;
        else
            state <= next_state;
    end

   	 // Combinational next-state logic
    always_comb begin
        next_state = state;
        case (state)

            S0: begin
                case (COIN)
                    2'b01: next_state = S5;   // Rs5 inserted
                    2'b10: next_state = S10;  // Rs10 inserted
                    default: next_state = S0; // ignore invalid or none
                endcase
            end

            S5: begin
                case (COIN)
                    2'b01: next_state = S10;  // 5 + 5 = 10
                    2'b10: next_state = S15;  // 5 + 10 = 15 (dispense exact)
                    default: next_state = S5;
                endcase
            end

            S10: begin
                case (COIN)
                    2'b01: next_state = S15;  // 10 + 5 = 15
                    2'b10: next_state = S20;  // 10 + 10 = 20 (dispense + change)
                    default: next_state = S10;
                endcase
            end

            // Dispense states
            S15: next_state = S0;  // dispense exact, then reset
            S20: next_state = S0;  // dispense + change, then reset

            default: next_state = S0;
        endcase
    end

    // Moore output logic (depends only on state)
    always_comb begin
        OPEN   = 1'b0;
        CHANGE = 1'b0;

        case (state)
            S15: begin
                OPEN   = 1'b1;  // dispense only
                CHANGE = 1'b0;
            end
            S20: begin
                OPEN   = 1'b1;  // dispense + change
                CHANGE = 1'b1;
            end
            default: begin
                OPEN   = 1'b0;
                CHANGE = 1'b0;
            end
        endcase
    end

endmodule
