module decoder_1to4 (
    input [7:0] in,  // 32-bit input
    input [1:0] sel,  // 2-bit selection
    output reg [7:0] out0, out1, out2, out3 // 32-bit outputs
);

    initial begin
        out0 = 8'b0;
        out1 = 8'b0;
        out2 = 8'b0;
        out3 = 8'b0;
    end

    always @ (*) begin
        case(sel)
            2'b00: out0 = in;
            2'b01: out1 = in;
            2'b10: out2 = in;
            2'b11: out3 = in;
            default: ; // No action
        endcase
    end
    
endmodule