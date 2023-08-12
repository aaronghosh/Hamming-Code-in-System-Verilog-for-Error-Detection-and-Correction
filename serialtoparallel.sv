module serialtoparallel (
    input logic reset,
    input logic write,
    input logic data_in,
    input logic clk,
    output wire [3:0] data_out
);

    logic [3:0] mem;

    always_ff @(posedge clk or posedge reset)
    begin
        if (reset) begin
            mem <= 4'b0000;
        end else if (write) begin
            mem <= data_in;
        end
    end

    assign data_out = mem;

endmodule
