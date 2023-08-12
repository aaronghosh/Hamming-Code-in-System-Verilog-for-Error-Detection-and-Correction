module upcounterencoder(
    input logic clk,
    input logic reset,
    output logic [3:0] data
);
    logic [3:0] data_counter;

    always_ff @(posedge clk or posedge reset)
    begin
        if (reset)
            data_counter <= 4'b0000;
        else 
            data_counter <= data_counter + 1'b1;
    end

    assign data = data_counter;
endmodule
