module encodermain_tb;

    reg clk = 0;
    reg write = 0;
    reg data_in = 0;
    reg reset = 1;
    wire ready;
    wire [6:0] data_outp;
    
    encodermain uut (
        .clk(clk),
        .write(write),
        .data_inp(data_in),
        .reset(reset),
        .ready(ready),
        .data_out(data_outp)
    );
    
    parameter clk_period = 100;

    always begin
        # (clk_period / 2);
        clk = ~clk;
    end

    initial begin
        data_in = 0;
        write = 0;
        reset = 1;
        # (clk_period * 5);
        
        reset = 0;
        
        // Test 1: Encode '1010'
        data_in = 4'b1010;
        write = 1;
        # (clk_period);
        write = 0;
        # (clk_period);
        data_in = 0; 
        write = 1;
        # (clk_period);
        write = 0;
        # (clk_period);
        data_in = 1;
        write = 1;
        # (clk_period);
        write = 0;
        # (clk_period * 2); 
        
        $display("Encoded output for '1010': %b", data_outp);

        // Test 2: Encode '1001'
        data_in = 4'b1001;
        write = 1;
        # (clk_period);
        write = 0;
        # (clk_period);
        data_in = 0;
        write = 1;
        # (clk_period);
        write = 0;
        # (clk_period);
        data_in = 1;
        write = 1;
        # (clk_period);
        write = 0;
        # (clk_period * 2); 
        
        $display("Encoded output for '1001': %b", data_outp);

        // Test 3: Encode '0110'
        data_in = 4'b0110;
        write = 1;
        # (clk_period);
        write = 0;
        # (clk_period);
        data_in = 0; 
        write = 1;
        # (clk_period);
        write = 0;
        # (clk_period);
        data_in = 1;
        write = 1;
        # (clk_period);
        write = 0;
        # (clk_period * 2); 
        
        $display("Encoded output for '0110': %b", data_outp);
        
    
        $finish;
    end
    
endmodule
