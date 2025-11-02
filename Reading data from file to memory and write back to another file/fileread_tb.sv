`timescale 1ns/1ns

module file_read();

    // DUT signals
    logic clk, read, write;
    logic [8:0] addr;         // 9-bit for 512 locations
    logic [7:0] data_in;
    logic [7:0] data_out;

    // File handles and variables
    integer read_file, write_file;
    integer status;
    byte char;  // store ASCII character
    int addr_count = 0;

    // Instantiate the memory
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

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;

    // File-based test
    initial begin
        // Open files
        read_file  = $fopen("stimulus.txt", "r");
        write_file = $fopen("test_results.txt", "w");

        if (!read_file) begin
            $display("ERROR: Could not open stimulus.txt");
            $finish;
        end

        if (!write_file) begin
            $display("ERROR: Could not open test_results.txt");
            $finish;
        end

        // Initialize control signals
        read  = 0;
        write = 0;
        addr  = 0;
        data_in = 0;
        @(posedge clk);

        $display("\n--- Writing data from file to memory ---");
        $fwrite(write_file, "--- Writing data from file to memory ---\n");

        // Read characters from file and write to memory
        while (!$feof(read_file)) begin
            status = $fscanf(read_file, "%c", char); // read one character
            if (status != 1) break;

            @(posedge clk);
            write = 1;
            read  = 0;
            addr  = addr_count;
            data_in = char;

            $display("Writing: addr=%0d, data_in=%s (ASCII=%0d)", addr, char, char);
            $fwrite(write_file, "Wrote to addr=%0d: %s (ASCII=%0d)\n", addr, char, char);

            addr_count++;
        end

        // Stop writing
        @(posedge clk);
        write = 0;
        addr  = 0;

        // Read back and verify
        $display("\n--- Reading back and comparing ---");
        $fwrite(write_file, "\n--- Reading back and comparing ---\n");

        for (int i = 0; i < addr_count; i++) begin
            @(posedge clk);
            read  = 1;
            write = 0;
            addr  = i;

            @(posedge clk); // wait for read to settle
	    @(posedge clk); // wait for read to settle
            $display("Read: addr=%0d, data_out=%s (ASCII=%0d)", addr, data_out, data_out);
            if (data_out == my_memory.memory[i])
                $fwrite(write_file, "PASS: addr=%0d data=%s (ASCII=%0d)\n", i, data_out, data_out);
            else
                $fwrite(write_file, "FAIL: addr=%0d expected=%s got=%s\n", i, my_memory.memory[i], data_out);
        end

        // Close files
        $fclose(read_file);
        $fclose(write_file);

        $display("\n--- Test complete. Results written to test_results.txt ---");
        $finish;
    end

endmodule

