module encoderhamming(
    input logic enable,
    input logic [3:0] data_in,
    output logic [6:0] data_out
);
    
    logic p1, p2, p3;

    assign p1 = (data_in[0] ^ data_in[1] ^ data_in[3]);
    assign p2 = (data_in[0] ^ data_in[2] ^ data_in[3]);
    assign p3 = (data_in[1] ^ data_in[2] ^ data_in[3]);

    logic [6:0] data_out1;

    always_comb begin
        if (enable) begin
            data_out1[6:0] = {data_in[3], data_in[2], data_in[1], p3, data_in[0], p2, p1};
        end else begin
            data_out1[6:0] = 7'b0000000; 
        end
    end

    assign data_out = data_out1;
endmodule

