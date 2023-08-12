`timescale 1ns / 1ps


module parallelserial(
input logic clk,
    input logic pts_reset,
    input logic write,
    input logic shift,
    input logic [3:0] data_in,
    output logic serial_out
);
    logic [3:0] data_reg;

    always_ff @(posedge clk or posedge pts_reset)
    begin
        if (pts_reset)
            data_reg <= 4'b0000;
        else if (write)
            data_reg <= data_in;
    end

    always_ff @(posedge clk)
    begin
        if (shift)
            data_reg <= {data_reg[2:0], 1'b0};
    end

    assign serial_out = data_reg[3];
endmodule
