module convolution_2by2_module (
    // Inputs
    clk,
    rst,
    input_array_addr_in_2by2, filter_ceiling_first_array_addr_in_2by2, filter_ceiling_second_array_addr_in_2by2,
    buffer_read_addr_in_2by2,
    sys_2by2_en,
    a00_output, a01_output, a02_output, a03_output, 
    a10_output, a11_output, a12_output, a13_output, 
    a20_output, a21_output, a22_output, a23_output, 
    a30_output, a31_output, a32_output, a33_output, 
    b00_output, b01_output, b02_output, 
    b10_output, b11_output, b12_output, 
    b20_output, b21_output, b22_output, 
    zero_input,

    // Outputs
    convolution_C11,
    convolution_C12,
    convolution_C21,
    convolution_C22,
    convolution_2by2_out
    );


    input clk;
    input rst;
    input [4:0] input_array_addr_in_2by2, filter_ceiling_first_array_addr_in_2by2, filter_ceiling_second_array_addr_in_2by2;
    input [1:0] buffer_read_addr_in_2by2;
    input sys_2by2_en;
    input [7:0] a00_output, a01_output, a02_output, a03_output, a10_output, a11_output, a12_output, a13_output, a20_output, a21_output, a22_output, a23_output, a30_output, a31_output, a32_output, a33_output, b00_output, b01_output, b02_output, b10_output, b11_output, b12_output, b20_output, b21_output, b22_output, zero_input;
    
    // output wire [4:0] state_output, next_state_output;
    output wire [7:0] convolution_2by2_out;
    output wire [7:0] convolution_C11, convolution_C12, convolution_C21, convolution_C22;


    // Instantiate the MUX
    wire [7:0] out_input;
    // output wire [4:0] sel_input;
    MUX_32bit mux_2by2_input (
        .i0(a00_output), .i1(a01_output), .i2(a02_output), .i3(a03_output), .i4(a10_output), .i5(a11_output), .i6(a12_output), .i7(a13_output),
        .i8(a20_output), .i9(a21_output), .i10(a22_output), .i11(a23_output), .i12(a30_output), .i13(a31_output), .i14(a32_output), .i15(a33_output),
        .i16(b00_output), .i17(b01_output), .i18(b02_output), .i19(b10_output), .i20(b11_output), .i21(b12_output), .i22(b20_output), .i23(b21_output), .i24(b22_output), 
        .i25(8'b0), .i26(8'b0), .i27(8'b0), .i28(8'b0), .i29(8'b0), .i30(8'b0), .i31(8'b0),
        .sel(input_array_addr_in_2by2),
        .out(out_input)
    );


    // Instantiate the MUX
    wire [7:0] out_first_filter;
    // output wire [4:0] filter_ceiling_array_addr_in;
    MUX_32bit mux_2by2_first_filter (
        .i0(a00_output), .i1(a01_output), .i2(a02_output), .i3(a03_output), .i4(a10_output), .i5(a11_output), .i6(a12_output), .i7(a13_output),
        .i8(a20_output), .i9(a21_output), .i10(a22_output), .i11(a23_output), .i12(a30_output), .i13(a31_output), .i14(a32_output), .i15(a33_output),
        .i16(b00_output), .i17(b01_output), .i18(b02_output), .i19(b10_output), .i20(b11_output), .i21(b12_output), .i22(b20_output), .i23(b21_output), .i24(b22_output), 
        .i25(8'b0), .i26(8'b0), .i27(8'b0), .i28(8'b0), .i29(8'b0), .i30(8'b0), .i31(8'b0),
        .sel(filter_ceiling_first_array_addr_in_2by2),
        .out(out_first_filter)
    );

    // Instantiate the MUX
    wire [7:0] out_second_filter;
    // output wire [4:0] filter_ceiling_array_addr_in;
    MUX_32bit mux_2by2_second_filter (
        .i0(a00_output), .i1(a01_output), .i2(a02_output), .i3(a03_output), .i4(a10_output), .i5(a11_output), .i6(a12_output), .i7(a13_output),
        .i8(a20_output), .i9(a21_output), .i10(a22_output), .i11(a23_output), .i12(a30_output), .i13(a31_output), .i14(a32_output), .i15(a33_output),
        .i16(b00_output), .i17(b01_output), .i18(b02_output), .i19(b10_output), .i20(b11_output), .i21(b12_output), .i22(b20_output), .i23(b21_output), .i24(b22_output), 
        .i25(8'b0), .i26(8'b0), .i27(8'b0), .i28(8'b0), .i29(8'b0), .i30(8'b0), .i31(8'b0),
        .sel(filter_ceiling_second_array_addr_in_2by2),
        .out(out_second_filter)
    );


    // output wire [7:0] side_1, side_2, ceiling_1, ceiling_2;
    // Instantiate the Systolic_Array_2x2_module
    Systolic_Array_2x2_module systolic_array_2x2 (
        .clk(clk), 
        .rst(rst),
        .en(sys_2by2_en),
        .side_1(out_input),
        .side_2(out_input),
        .ceiling_1(out_first_filter),
        .ceiling_2(out_second_filter),
        .convolution_11(convolution_C11),
        .convolution_12(convolution_C21),
        .convolution_21(convolution_C12),
        .convolution_22(convolution_C22)
    );


    // This is for buffer module

    buffer_module buffer_2by2(
        .clk(clk),
        .rst(rst),
        .buffer_read_addr_in(buffer_read_addr_in_2by2), // 2bits
        .data_in_0(convolution_C11), // 8bits
        .data_in_1(convolution_C12), // 8bits
        .data_in_2(convolution_C21), // 8bits
        .data_in_3(convolution_C22), // 8bits
        .data_out(convolution_2by2_out) // 8bits
    );


endmodule
