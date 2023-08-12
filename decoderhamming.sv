module hamming_decoder(
    output logic [3:0] out,
    input logic [6:0] in,
    input logic enable
);
    logic [3:0] r;

    always_ff @(posedge enable)
    begin
        if ((in[2]^in[4]^in[6])==in[0]&&
            (in[2]^in[5]^in[6])==in[1]&&
            (in[4]^in[5]^in[6])==in[3])
        begin
            r[0] <= in[2];
            r[1] <= in[4];
            r[2] <= in[5];
            r[3] <= in[6];
        end
    end

    assign out = r;
endmodule
