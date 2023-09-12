module Top_computation (
    // Inputs
    clk,
    rst,
    input_array_addr_in_single,
    filter_ceiling_array_addr_in_single,
    sys_single_en,
    buffer_read_addr_in_single,
    buffer_we_en_C11_single,
    buffer_we_en_C12_single,
    buffer_we_en_C21_single,
    buffer_we_en_C22_single,

    input_array_addr_in_2by2,
    filter_ceiling_first_array_addr_in_2by2,
    filter_ceiling_second_array_addr_in_2by2,
    buffer_read_addr_in_2by2,
    sys_2by2_en,

    buffer_read_addr_in_3by3,
    input_side_array_addr_in_3by3,
    input_ceiling_array_addr_in_3by3,
    filter_side_array_addr_in_3by3,
    filter_ceiling_array_addr_in_3by3,
    sys_3by3_en,
    
    a00_output, a01_output, a02_output, a03_output, 
    a10_output, a11_output, a12_output, a13_output, 
    a20_output, a21_output, a22_output, a23_output, 
    a30_output, a31_output, a32_output, a33_output, 
    b00_output, b01_output, b02_output, 
    b10_output, b11_output, b12_output, 
    b20_output, b21_output, b22_output, 
    zero_input,


    // Outputs
    // out_single_C11,
    // out_single_C12,
    // out_single_C21,
    // out_single_C22,
    convolution_single_out,

    // convolution_C11_2by2,
    // convolution_C12_2by2,
    // convolution_C21_2by2,
    // convolution_C22_2by2,

    // convolution_C11_3by3,
    // convolution_C12_3by3,
    // convolution_C21_3by3,
    // convolution_C22_3by3,

    convolution_2by2_out,
    convolution_3by3_out
);

    // Inputs
    input clk;
    input rst;
    input [1:0] buffer_read_addr_in_single;
    input [4:0] input_array_addr_in_single, filter_ceiling_array_addr_in_single;
    input buffer_we_en_C11_single, buffer_we_en_C12_single, buffer_we_en_C21_single, buffer_we_en_C22_single;
    input sys_single_en;
    
    input [4:0] input_array_addr_in_2by2, filter_ceiling_first_array_addr_in_2by2, filter_ceiling_second_array_addr_in_2by2;
    input [1:0] buffer_read_addr_in_2by2;
    input sys_2by2_en;

    input [1:0] buffer_read_addr_in_3by3;
    input [4:0] input_side_array_addr_in_3by3, input_ceiling_array_addr_in_3by3, filter_side_array_addr_in_3by3, filter_ceiling_array_addr_in_3by3;
    input sys_3by3_en;

    input [7:0] a00_output, a01_output, a02_output, a03_output, a10_output, a11_output, a12_output, a13_output, a20_output, a21_output, a22_output, a23_output, a30_output, a31_output, a32_output, a33_output, b00_output, b01_output, b02_output, b10_output, b11_output, b12_output, b20_output, b21_output, b22_output, zero_input;
    
    // Outputs

    output wire [7:0] convolution_single_out;
    output wire [7:0] convolution_2by2_out;
    output wire [7:0] convolution_3by3_out;

    wire [7:0] out_single_C11, out_single_C12, out_single_C21, out_single_C22;
    wire [7:0] convolution_C11_2by2, convolution_C12_2by2, convolution_C21_2by2, convolution_C22_2by2;
    wire [7:0] convolution_C11_3by3, convolution_C12_3by3, convolution_C21_3by3, convolution_C22_3by3;


    // Instantiate the sub-modules
    convolution_single_module single_convolution_inst (
        .clk(clk),
        .rst(rst),
        .buffer_read_addr_in_single(buffer_read_addr_in_single),
        .input_array_addr_in_single(input_array_addr_in_single),
        .filter_ceiling_array_addr_in_single(filter_ceiling_array_addr_in_single),
        .buffer_we_en_C11_single(buffer_we_en_C11_single),
        .buffer_we_en_C12_single(buffer_we_en_C12_single),
        .buffer_we_en_C21_single(buffer_we_en_C21_single),
        .buffer_we_en_C22_single(buffer_we_en_C22_single),
        .sys_single_en(sys_single_en),
        .out_single_C11(out_single_C11),
        .out_single_C12(out_single_C12),
        .out_single_C21(out_single_C21),
        .out_single_C22(out_single_C22),
        .convolution_single_out(convolution_single_out),

        .a00_output(a00_output),
        .a01_output(a01_output),
        .a02_output(a02_output),
        .a03_output(a03_output),
        .a10_output(a10_output),
        .a11_output(a11_output),
        .a12_output(a12_output),
        .a13_output(a13_output),
        .a20_output(a20_output),
        .a21_output(a21_output),
        .a22_output(a22_output),
        .a23_output(a23_output),
        .a30_output(a30_output),
        .a31_output(a31_output),
        .a32_output(a32_output),
        .a33_output(a33_output),
        .b00_output(b00_output),
        .b01_output(b01_output),
        .b02_output(b02_output),
        .b10_output(b10_output),
        .b11_output(b11_output),
        .b12_output(b12_output),
        .b20_output(b20_output),
        .b21_output(b21_output),
        .b22_output(b22_output),
        .zero_input(zero_input)
    );

    convolution_2by2_module twobytwo_convolution_inst (
        .clk(clk),
        .rst(rst),
        .input_array_addr_in_2by2(input_array_addr_in_2by2),
        .filter_ceiling_first_array_addr_in_2by2(filter_ceiling_first_array_addr_in_2by2),
        .filter_ceiling_second_array_addr_in_2by2(filter_ceiling_second_array_addr_in_2by2),
        .buffer_read_addr_in_2by2(buffer_read_addr_in_2by2),
        .sys_2by2_en(sys_2by2_en),
        .convolution_C11(convolution_C11_2by2),
        .convolution_C12(convolution_C12_2by2),
        .convolution_C21(convolution_C21_2by2),
        .convolution_C22(convolution_C22_2by2),
        .convolution_2by2_out(convolution_2by2_out),

        .a00_output(a00_output),
        .a01_output(a01_output),
        .a02_output(a02_output),
        .a03_output(a03_output),
        .a10_output(a10_output),
        .a11_output(a11_output),
        .a12_output(a12_output),
        .a13_output(a13_output),
        .a20_output(a20_output),
        .a21_output(a21_output),
        .a22_output(a22_output),
        .a23_output(a23_output),
        .a30_output(a30_output),
        .a31_output(a31_output),
        .a32_output(a32_output),
        .a33_output(a33_output),
        .b00_output(b00_output),
        .b01_output(b01_output),
        .b02_output(b02_output),
        .b10_output(b10_output),
        .b11_output(b11_output),
        .b12_output(b12_output),
        .b20_output(b20_output),
        .b21_output(b21_output),
        .b22_output(b22_output),
        .zero_input(zero_input)
    );

    convolution_3by3_module threebythree_convolution_inst (
        .clk(clk),
        .rst(rst),
        .buffer_read_addr_in_3by3(buffer_read_addr_in_3by3),
        .input_side_array_addr_in_3by3(input_side_array_addr_in_3by3),
        .input_ceiling_array_addr_in_3by3(input_ceiling_array_addr_in_3by3),
        .filter_side_array_addr_in_3by3(filter_side_array_addr_in_3by3),
        .filter_ceiling_array_addr_in_3by3(filter_ceiling_array_addr_in_3by3),
        .sys_3by3_en(sys_3by3_en),
        .convolution_C11(convolution_C11_3by3),
        .convolution_C12(convolution_C12_3by3),
        .convolution_C21(convolution_C21_3by3),
        .convolution_C22(convolution_C22_3by3),
        .convolution_3by3_out(convolution_3by3_out),
        
        .a00_output(a00_output),
        .a01_output(a01_output),
        .a02_output(a02_output),
        .a03_output(a03_output),
        .a10_output(a10_output),
        .a11_output(a11_output),
        .a12_output(a12_output),
        .a13_output(a13_output),
        .a20_output(a20_output),
        .a21_output(a21_output),
        .a22_output(a22_output),
        .a23_output(a23_output),
        .a30_output(a30_output),
        .a31_output(a31_output),
        .a32_output(a32_output),
        .a33_output(a33_output),
        .b00_output(b00_output),
        .b01_output(b01_output),
        .b02_output(b02_output),
        .b10_output(b10_output),
        .b11_output(b11_output),
        .b12_output(b12_output),
        .b20_output(b20_output),
        .b21_output(b21_output),
        .b22_output(b22_output),
        .zero_input(zero_input)
    );

endmodule
