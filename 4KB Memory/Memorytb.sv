`timescale 1ns/1ns

module memory_tb ();

    // SIGNALS
    logic clk, read, write;
    logic [8:0] addr;          // 9-bit address for 512 locations
    logic [7:0] data_in;
    logic [7:0] data_out;

    // INSTANTIATE THE DESIGN MODULE
    memory #(
        .in_width(8),
        .out_width(8),
        .mem_size(512),
        .mem_width(8),
        .addr_width(9)
    ) my_memory (
        .clk(clk),
        .read(read),
        .write(write),
        .addr(addr),
        .data_in(data_in),
        .data_out(data_out)
    );

    // CLOCK GENERATION
    initial clk = 0;
    always #5 clk = ~clk;  // toggle every 5ns

    // DISPLAY FOR DEBUGGING
    initial begin
        $display("------Simulation Start------"); 
	$monitor("Time=%0t | Addr=%h | Data_in=%h | Data_out=%h | Read=%b | Write=%b",
                 $time, addr, data_in, data_out, read, write);
	end

    initial begin
        // INITIALIZE SIGNALS
        read = 0;
        write = 0;
        addr = 0;
        data_in = 0;

        @(posedge clk);

        // --------------------------------------------
        // 1. WRITE ZEROS TO ALL MEMORY LOCATIONS
        // --------------------------------------------
        $display("------Writing zeros to all memory locations------");
        for (int i = 0; i < 512; i++) begin
            @(posedge clk);
            write = 1; read = 0;
            addr = i;
            data_in = 8'd0;
        end
        @(posedge clk);
        write = 0;

        // --------------------------------------------
        // 2. READ AND VERIFY ZEROS
        // --------------------------------------------
        $display("------Reading zeros from all memory locations------");
        for (int j = 0; j < 512; j++) begin
            @(posedge clk);
            read = 1; write = 0;
            addr = j;
            @(posedge clk);  // wait one full cycle for stable output
            if (data_out !== 8'd0)
                $display("ERROR at addr=%0h: expected=00 got=%0h", j, data_out);
            else
                $display("Correct value read at addr=%0h -> %0h", j, data_out);
        end

        // --------------------------------------------
        // 3. WRITE ADDRESS VALUE TO EACH LOCATION
        // --------------------------------------------
        $display("------Writing address value to each memory location------");
        for (int k = 0; k < 512; k++) begin
            @(posedge clk);
            write = 1; read = 0;
            addr = k;
            data_in = k[7:0]; // store lower 8 bits of address
        end
        @(posedge clk);
        write = 0;

        // --------------------------------------------
        // 4. READ BACK AND VERIFY
        // --------------------------------------------
        $display("------Reading and verifying address values------");
        for (int m = 0; m < 513; m++) begin
            @(posedge clk);
            read = 1; write = 0;
            addr = m;
            @(posedge clk);  // wait one full cycle
	    @(posedge clk); 
            if (data_out !== m[7:0])
                $display("ERROR at addr=%0h: expected=%0h got=%0h", m, m[7:0], data_out);
            else
                $display("Correct value read at addr=%0h -> %0h", m, data_out);
        end

        $display("------FINISH------");
        $finish;
    end

endmodule

