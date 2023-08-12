module encodermain(
    input logic clk,
    input logic write,
    input logic data_inp,
    output logic ready,
    output logic data_outp
);
    
    wire [3:0] stpout;
    wire [3:0] cntout;  
    reg enable_op;
    
    serialtoparallel a1(
        .reset(enable_op),
        .write(write),
        .clk(clk),
        .data_in(data_inp),
        .data_out(stpout)
    );
    
    upcounterencoder a2(
        .reset(enable_op),
        .clk(clk),
        .data(cntout) 
    );
    
    encoderhamming a3(
        .enable(enable_op),
        .data_in(stpout),
        .data_out(data_outp)
    );
    
    reg r;
    
    always_ff @(posedge clk)
    begin 
        if (cntout <= 3'd4) begin
            enable_op = 1;
            r = 1;
        end else begin
            enable_op = 0;
            r = 0;
        end
    end
    
    assign ready = r;
    
endmodule
