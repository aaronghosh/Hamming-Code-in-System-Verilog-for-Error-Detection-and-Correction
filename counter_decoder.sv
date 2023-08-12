`timescale 1ns / 1ps
module counter_decoder (
    input logic clk,
    input logic reset,
    output logic [3:0] data
);
    logic [3:0] data_counter;

    always_ff @(posedge clk or posedge reset)
    begin
        if (reset) begin
            data_counter <= 4'b0000;
        end
        else begin
            data_counter <= data_counter + 1'b1;
        end
    end

    assign data = data_counter;
endmodule


