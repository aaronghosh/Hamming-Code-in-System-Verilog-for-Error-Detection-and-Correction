module hamming_code (
    input serial_in,
    input clk,
    input write,
    output serial_out
);

    wire en_decoder;
    wire [6:0] data1;

    encodermain c1 (
        .clk(clk),
        .data_inp(serial_in),
        .write(write),
        .ready(en_decoder),
        .data_out(data1)
    );

    decodermain c2 (
        .clk(clk),
        .enable(en_decoder),
        .in(data1),
        .out(serial_out),
        .ready()
    );

endmodule
