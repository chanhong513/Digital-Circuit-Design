module convolution_single_module (
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

    a00_output, a01_output, a02_output, a03_output, 
    a10_output, a11_output, a12_output, a13_output, 
    a20_output, a21_output, a22_output, a23_output, 
    a30_output, a31_output, a32_output, a33_output, 
    b00_output, b01_output, b02_output, 
    b10_output, b11_output, b12_output, 
    b20_output, b21_output, b22_output, 
    zero_input,

    // Outputs
    out_single_C11,
    out_single_C12,
    out_single_C21,
    out_single_C22,
    convolution_single_out
    );

    input clk;
    input rst;
    input [1:0] buffer_read_addr_in_single;
    input [4:0] input_array_addr_in_single, filter_ceiling_array_addr_in_single;
    input buffer_we_en_C11_single, buffer_we_en_C12_single, buffer_we_en_C21_single, buffer_we_en_C22_single;
    input sys_single_en;
    input [7:0] a00_output, a01_output, a02_output, a03_output, a10_output, a11_output, a12_output, a13_output, a20_output, a21_output, a22_output, a23_output, a30_output, a31_output, a32_output, a33_output, b00_output, b01_output, b02_output, b10_output, b11_output, b12_output, b20_output, b21_output, b22_output, zero_input;
    
    // output wire [5:0] state_output, next_state_output;
    output wire [7:0] convolution_single_out;
    output wire [7:0] out_single_C11, out_single_C12, out_single_C21, out_single_C22;

    // Instantiate the MUX
    wire [7:0] out_input;
    wire [7:0] out_buffer_0, out_buffer_1, out_buffer_2, out_buffer_3;
    // output wire [7:0] side_1, side_2, ceiling_1, ceiling_2;

    // output wire [4:0] sel_input;
    MUX_32bit mux_single_input (
        .i0(a00_output), .i1(a01_output), .i2(a02_output), .i3(a03_output), .i4(a10_output), .i5(a11_output), .i6(a12_output), .i7(a13_output),
        .i8(a20_output), .i9(a21_output), .i10(a22_output), .i11(a23_output), .i12(a30_output), .i13(a31_output), .i14(a32_output), .i15(a33_output),
        .i16(b00_output), .i17(b01_output), .i18(b02_output), .i19(b10_output), .i20(b11_output), .i21(b12_output), .i22(b20_output), .i23(b21_output), .i24(b22_output), 
        .i25(zero_input), .i26(8'b0), .i27(8'b0), .i28(8'b0), .i29(8'b0), .i30(8'b0), .i31(8'b0),
        .sel(input_array_addr_in_single),
        .out(out_input)
    );


    // Instantiate the MUX
    wire [7:0] out_filter;
    // output wire [4:0] filter_ceiling_array_addr_in_single;
    MUX_32bit mux_single_filter (
        .i0(a00_output), .i1(a01_output), .i2(a02_output), .i3(a03_output), .i4(a10_output), .i5(a11_output), .i6(a12_output), .i7(a13_output),
        .i8(a20_output), .i9(a21_output), .i10(a22_output), .i11(a23_output), .i12(a30_output), .i13(a31_output), .i14(a32_output), .i15(a33_output),
        .i16(b00_output), .i17(b01_output), .i18(b02_output), .i19(b10_output), .i20(b11_output), .i21(b12_output), .i22(b20_output), .i23(b21_output), .i24(b22_output), 
        .i25(zero_input), .i26(8'b0), .i27(8'b0), .i28(8'b0), .i29(8'b0), .i30(8'b0), .i31(8'b0),
        .sel(filter_ceiling_array_addr_in_single),
        .out(out_filter)
    );

    /////////////////////////////////////////////////////////////////////////////
    //////////////////////////// for fpga implement /////////////////////////////
    /////////////////////////////////////////////////////////////////////////////
    // Code written temporarily to avoid a Multidriven error. The implement does not need to include single, so you do not need to write the wrong code as below, but there are many connected ports, so I inevitably wrote it as below.

    wire [7:0] side_out, ceiling_out; // discard
    // Instantiate the Systolic_Array_2x2_module
    PE_single single_PE_0 (
        .clk(clk), 
        .rst(rst),
        .en(sys_single_en),
        .side(out_input),
        .ceiling(out_filter),
        .side_out(side_out),
        .ceiling_out(ceiling_out),
        .out(out_buffer_0)
    );

    PE_single single_PE_1 (
        .clk(clk), 
        .rst(rst),
        .en(sys_single_en),
        .side(out_input),
        .ceiling(out_filter),
        .side_out(side_out),
        .ceiling_out(ceiling_out),
        .out(out_buffer_1)
    );

    PE_single single_PE_2 (
        .clk(clk), 
        .rst(rst),
        .en(sys_single_en),
        .side(out_input),
        .ceiling(out_filter),
        .side_out(side_out),
        .ceiling_out(ceiling_out),
        .out(out_buffer_2)
    );

    PE_single single_PE_3 (
        .clk(clk), 
        .rst(rst),
        .en(sys_single_en),
        .side(out_input),
        .ceiling(out_filter),
        .side_out(side_out),
        .ceiling_out(ceiling_out),
        .out(out_buffer_3)
    );


    one_to_one_buffer_module single_PE_C11_buffer(
        .clk(clk),
        .rst(rst),
        .we_en(buffer_we_en_C11_single),
        .data_in(out_buffer_0), // 8bits
        .data_out(out_single_C11) // 8bits
    );

    one_to_one_buffer_module single_PE_C12_buffer(
        .clk(clk),
        .rst(rst),
        .we_en(buffer_we_en_C12_single),
        .data_in(out_buffer_1), // 8bits
        .data_out(out_single_C12) // 8bits
    );

    one_to_one_buffer_module single_PE_C21_buffer(
        .clk(clk),
        .rst(rst),
        .we_en(buffer_we_en_C21_single),
        .data_in(out_buffer_2), // 8bits
        .data_out(out_single_C21) // 8bits
    );

    one_to_one_buffer_module single_PE_C22_buffer(
        .clk(clk),
        .rst(rst),
        .we_en(buffer_we_en_C22_single),
        .data_in(out_buffer_3), // 8bits
        .data_out(out_single_C22) // 8bits
    );

    buffer_module buffer_single(
        .clk(clk),
        .rst(rst),
        .buffer_read_addr_in(buffer_read_addr_in_single), // 2bits
        .data_in_0(out_single_C11), // 8bits
        .data_in_1(out_single_C12), // 8bits
        .data_in_2(out_single_C21), // 8bits
        .data_in_3(out_single_C22), // 8bits
        .data_out(convolution_single_out) // 8bits
    );



    /////////////////////////////////////////////////////////////////////////////
    //////////////////////////// for silmulation ////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////
/*
    wire [7:0] out; // when we simluate the code, We need to annotate wire [7:0] out_buffer_0, out_buffer_1, out_buffer_2, out_buffer_3; code.
    // Instantiate the Systolic_Array_2x2_module
    PE_single single_PE_0 (
        .clk(clk), 
        .rst(rst),
        .en(sys_single_en),
        .side(out_input),
        .ceiling(out_filter),
        .side_out(side_out),
        .ceiling_out(ceiling_out),
        .out(out)
    );


    one_to_one_buffer_module single_PE_C11_buffer(
        .clk(clk),
        .rst(rst),
        .we_en(buffer_we_en_C11_single),
        .data_in(out), // 8bits
        .data_out(out_single_C11) // 8bits
    );

    one_to_one_buffer_module single_PE_C12_buffer(
        .clk(clk),
        .rst(rst),
        .we_en(buffer_we_en_C12_single),
        .data_in(out), // 8bits
        .data_out(out_single_C12) // 8bits
    );

    one_to_one_buffer_module single_PE_C21_buffer(
        .clk(clk),
        .rst(rst),
        .we_en(buffer_we_en_C21_single),
        .data_in(out), // 8bits
        .data_out(out_single_C21) // 8bits
    );

    one_to_one_buffer_module single_PE_C22_buffer(
        .clk(clk),
        .rst(rst),
        .we_en(buffer_we_en_C22_single),
        .data_in(out), // 8bits
        .data_out(out_single_C22) // 8bits
    );

    buffer_module buffer_single(
        .clk(clk),
        .rst(rst),
        .buffer_read_addr_in(buffer_read_addr_in_single), // 2bits
        .data_in_0(out_single_C11), // 8bits
        .data_in_1(out_single_C12), // 8bits
        .data_in_2(out_single_C21), // 8bits
        .data_in_3(out_single_C22), // 8bits
        .data_out(convolution_single_out) // 8bits
    );
*/
endmodule
