`timescale 1ns / 1ps

module decodermain (
    output logic [3:0] out,
    input logic [6:0] in,
    input logic enable,
    input logic clk,
    input logic pts_reset,
    input logic write,
    input logic shift,
    input logic reset 
);
    logic [3:0] data1;
    logic [3:0] data_reg;
    logic [3:0] data_counter;

    // Hamming Decoder
    always_ff @(posedge enable) begin
        if ((in[2] ^ in[4] ^ in[6]) == in[0] &&
            (in[2] ^ in[5] ^ in[6]) == in[1] &&
            (in[4] ^ in[5] ^ in[6]) == in[3]) begin
            data1[0] <= in[2];
            data1[1] <= in[4];
            data1[2] <= in[5];
            data1[3] <= in[6];
        end
    end

    // Parallel-to-Serial Converter
    always_ff @(posedge clk or posedge pts_reset) begin
        if (pts_reset)
            data_reg <= 4'b0000;
        else if (write)
            data_reg <= data1;
    end

    always_ff @(posedge clk) begin
        if (shift)
            data_reg <= {data_reg[2:0], 1'b0};
    end

    // Counter
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            data_counter <= 4'b0000;
        end else begin
            data_counter <= data_counter + 1'b1;
        end
    end

    // Output assignments
    assign out = data_counter;
    assign serial_out = data_reg[3];
endmodule
