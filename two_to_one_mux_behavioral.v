module mux_4to1 (
    input wire sel_1,
    input wire sel_0,
    input wire in_0,
    input wire in_1,
    input wire in_2,
    input wire in_3,
    output reg out
);

  always @*
    case ({sel_1, sel_0})
        2'b00: out = in_0;
        2'b01: out = in_1;
        2'b10: out = in_2;
        2'b11: out = in_3;
    endcase

endmodule
