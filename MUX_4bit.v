module MUX_4bit(i0, i1, i2, i3, sel, out);


    input [7:0] i0, i1, i2, i3;
    input [1:0] sel;
    output reg [7:0] out;

    always @(*) begin
        case(sel)
            2'b00: out = i0;
            2'b01: out = i1;
            2'b10: out = i2;
            2'b11: out = i3;
            default: out = 2'b00;
        endcase
    end
endmodule
