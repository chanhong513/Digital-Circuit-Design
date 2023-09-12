
module binary_to_7seg(
    binary_in, seg_output_hundreds, seg_output_tens, seg_output_ones
);
    input [7:0] binary_in;

    output [6:0] seg_output_hundreds, seg_output_tens, seg_output_ones;

    wire [3:0] bcd_out1, bcd_out2, bcd_out3;

    binary_to_bcd binary_to_bcd(
        .binary_in(binary_in), // 8bits
        .bcd_out1(bcd_out1), // 4bits
        .bcd_out2(bcd_out2), // 4bits
        .bcd_out3(bcd_out3) // 4bits
    );

    SevenSegment_Display SevenSegment_Display_hundreds (
        .bin_input(bcd_out1), // 4bits
        .seg_output(seg_output_hundreds) // 7bits
    );    

    SevenSegment_Display SevenSegment_Display_tens (
        .bin_input(bcd_out2), // 4bits
        .seg_output(seg_output_tens) // 7bits
    );    

    SevenSegment_Display SevenSegment_Display_ones (
        .bin_input(bcd_out3), // 4bits
        .seg_output(seg_output_ones) // 7bits
    );    


endmodule