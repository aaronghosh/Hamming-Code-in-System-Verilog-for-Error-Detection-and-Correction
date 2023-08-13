module decodermainV2(
    output logic [3:0] out,
    input logic [6:0] in,
    input logic enable,
    input logic clk,
    input logic pts_reset,
    input logic write,
    input logic shift,
    input logic reset
);
    parallelserial a1(
        .clk(clk),
        .pts_reset(pts_reset),
        .write(write),
        .shift(shift),
        .data_in(data_reg),
        .serial_out(data1)
    );
    
    counter_decoder a2(
        .clk(clk),
        .reset(reset),
        .data(data_counter)
    );
    
    hamming_decoder a3(
        .out(out),
        .in(data1),
        .enable(enable_op)
    );
    
endmodule
