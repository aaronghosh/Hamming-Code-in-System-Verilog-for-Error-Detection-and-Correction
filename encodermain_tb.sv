module encodermain_tb;

    // Declare signals for testbench
    reg clk = 0;
    reg write = 0;
    reg data_in = 0;
    reg reset = 1;
    wire ready;
    wire [6:0] data_outp;

    // Instantiate the encodermain module
    encodermain uut (
        .clk(clk),
        .write(write),
        .data_inp(data_in),
        .reset(reset),
        .ready(ready),
        .data_out(data_outp)
    );
    
    // Set the clock period
    parameter clk_period = 100;

    // Generate clock signal
    always begin
        # (clk_period / 2);
        clk = ~clk;
    end

    // Initialize signals and perform tests
    initial begin
        // Initialize inputs
        data_in = 0;
        write = 0;
        reset = 1;
        
        // Wait a few clock cycles
        # (clk_period * 5);
        
        // Release reset
        reset = 0;
        
        // Test 1: Encode '1010'
        data_in = 4'b1010;
        write = 1;
        # (clk_period);
        write = 0;
        # (clk_period);
        data_in = 0; // Reset data
        write = 1;
        # (clk_period);
        write = 0;
        # (clk_period);
        data_in = 1;
        write = 1;
        # (clk_period);
        write = 0;
        # (clk_period * 2); // Wait for encoding
        
        // Display encoded output
        $display("Encoded output for '1010': %b", data_outp);

        // Test 2: Encode '1001'
        data_in = 4'b1001;
        write = 1;
        # (clk_period);
        write = 0;
        # (clk_period);
        data_in = 0; // Reset data
        write = 1;
        # (clk_period);
        write = 0;
        # (clk_period);
        data_in = 1;
        write = 1;
        # (clk_period);
        write = 0;
        # (clk_period * 2); // Wait for encoding
        
        // Display encoded output
        $display("Encoded output for '1001': %b", data_outp);

        // Test 3: Encode '0110'
        data_in = 4'b0110;
        write = 1;
        # (clk_period);
        write = 0;
        # (clk_period);
        data_in = 0; // Reset data
        write = 1;
        # (clk_period);
        write = 0;
        # (clk_period);
        data_in = 1;
        write = 1;
        # (clk_period);
        write = 0;
        # (clk_period * 2); // Wait for encoding
        
        // Display encoded output
        $display("Encoded output for '0110': %b", data_outp);
        
        // Add more tests as needed
        
        // End simulation
        $finish;
    end
    
endmodule
