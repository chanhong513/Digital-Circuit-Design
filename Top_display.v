module Top_display(
    clk, rstb,
    convolution,
    digit,
    seg_data
    );

    input clk, rstb;
    input [7:0] convolution;
    output [7:0] digit;
    output [6:0] seg_data;


    wire [6:0] seg_output_hundreds; 
    wire [6:0] seg_output_tens; 
    wire [6:0] seg_output_ones; 


    binary_to_7seg binary_to_7seg(
        .binary_in(convolution), // 8bits
        .seg_output_hundreds(seg_output_hundreds), // 7 bits
        .seg_output_tens(seg_output_tens), // 7 bits
        .seg_output_ones(seg_output_ones) // 7 bits
    );

    seg7 seg7 (
        .clk(clk),
        .rstb(rstb),
        .hundreds(seg_output_hundreds), // 7bits
        .tens(seg_output_tens), // 7bits
        .ones(seg_output_ones), // 7bits
        .digit(digit), // 8bits
        .seg_data(seg_data) // 7bits
    );


endmodule