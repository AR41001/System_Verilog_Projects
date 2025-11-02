module memory #(parameter in_width = 8, out_width = 8, mem_size = 32, mem_width = 8, addr_width = 5)(clk, read, write, addr, data_in, data_out);

    	// PORTS
    	input clk; 
    	input read; 
    	input write;
    	input  [addr_width-1:0] addr;
    	input  [in_width-1:0] data_in;     
    	output reg [out_width-1:0] data_out;

    	// MEMORY
    	reg [mem_width-1:0] memory [0:mem_size-1];  

	

    	// WRITE
    	always @(posedge clk)
        	if (write && !read)
            		memory[addr] <= data_in[mem_width-1:0];  // store input data

   	// READ
    	always @(posedge clk)
        	if (!write && read)
            		data_out <= memory[addr][out_width-1:0]; // read from memory

endmodule

