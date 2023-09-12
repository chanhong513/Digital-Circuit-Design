module binary_to_bcd (
    input [7:0] binary_in,
    output reg [3:0] bcd_out1,
    output reg [3:0] bcd_out2,
    output reg [3:0] bcd_out3
);
    integer i;
    reg [11:0] bcd;
    reg [7:0] binary_temp;

    always @(*) begin
        bcd = 12'b0000_0000_0000;
        binary_temp = binary_in;

        for (i=0; i<8; i=i+1) begin
            bcd = bcd << 1;
            bcd[0] = binary_temp[7];
            binary_temp = binary_temp << 1;
            if (bcd[11:8] >= 5)
                bcd[11:8] = bcd[11:8] + 3;
            if (bcd[7:4] >= 5)
                bcd[7:4] = bcd[7:4] + 3;
            if (bcd[3:0] >= 5)
                bcd[3:0] = bcd[3:0] + 3;
        end

        bcd_out1 = (bcd[11:8] >= 5) ? bcd[11:8] - 3 : bcd[11:8];
        bcd_out2 = (bcd[7:4] >= 5) ? bcd[7:4] - 3 : bcd[7:4];
        bcd_out3 = (bcd[3:0] >= 5) ? bcd[3:0] - 3 : bcd[3:0];
    end
endmodule
