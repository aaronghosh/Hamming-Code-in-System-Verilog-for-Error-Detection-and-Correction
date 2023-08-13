module hamming_code_tb();

    reg serial_in, clk, write;
    wire serial_out;

    hamming_code uut (
        .serial_in(serial_in),
        .clk(clk),
        .write(write),
        .serial_out(serial_out)
    );
    parameter clk_period = 100;

    always begin
        # (clk_period / 2);
        clk = ~clk;
    end

    initial begin
        serial_in = 0;
        clk = 0;
        write = 0;
        
        serial_in = 1;
        clk = 1;
        write = 1;
        # (clk_period * 2); 
		  
        serial_in = 0;
        write = 1;
        # (clk_period);
        write = 0;
        # (clk_period);
        serial_in = 1;
        write = 1;
        # (clk_period);
        write = 0;
        # (clk_period * 2); 
        $display("Encoded output: %b", serial_out);
        
        serial_in = serial_out;
        write = 1;
        # (clk_period);
        write = 0;
        # (clk_period * 2); 
		  
        $display("Decoded output: %b", serial_out);
        if (serial_out === serial_in)
            $display("Decoding successful!");
        else
            $display("Decoding failed!");
        
        $finish;
    end
    
endmodule
