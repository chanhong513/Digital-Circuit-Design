module Top_module (
    // Inputs
    clk,
    rst,
    rstb,
    start,
    left, // not used(default = 0)
    display_start22,
    display_start33,

    // Outputs
    digit,
    seg_data
    );

    // Inputs
    input clk;
    input rst;
    input rstb;
    input start;
    input display_start33; // display select: 3by3 systolic
    input display_start22; // display select: 2by2 systolic
    input left; // not used --> default = 0

    // Outputs
    output [7:0] digit; 
    output [6:0] seg_data;


    // Wire Declarations
    wire rst_total;
    wire [1:0] display_selection;
    // wire toggle_single;
    wire toggle_2by2;
    wire toggle_3by3;

    wire [4:0] input_array_addr_in_single;
    wire [4:0] filter_ceiling_array_addr_in_single;
    wire sys_single_en;
    wire [1:0] buffer_read_addr_in_single;
    wire buffer_we_en_C11_single;
    wire buffer_we_en_C12_single;
    wire buffer_we_en_C21_single;
    wire buffer_we_en_C22_single;

    wire [4:0] input_array_addr_in_2by2;
    wire [4:0] filter_ceiling_first_array_addr_in_2by2;
    wire [4:0] filter_ceiling_second_array_addr_in_2by2;
    wire sys_2by2_en;
    wire [1:0] buffer_read_addr_in_2by2;

    wire [4:0] input_side_array_addr_in_3by3;
    wire [4:0] input_ceiling_array_addr_in_3by3;
    wire [4:0] filter_ceiling_array_addr_in_3by3;
    wire [4:0] filter_side_array_addr_in_3by3;
    wire sys_3by3_en;
    wire [1:0] buffer_read_addr_in_3by3;

    wire [7:0] a00_output, a01_output, a02_output, a03_output, a10_output, a11_output, a12_output, a13_output, a20_output, a21_output, a22_output, a23_output, a30_output, a31_output, a32_output, a33_output;
    wire [7:0] b00_output, b01_output, b02_output, b10_output, b11_output, b12_output, b20_output, b21_output, b22_output;
    wire [7:0] zero_input;
    wire [7:0] convolution_single_out;
    wire [7:0] convolution_2by2_out;
    wire [7:0] convolution_3by3_out;
    wire [7:0] convolution_display;

    // Instantiate Top_controller
    Top_controller top_controller_inst (
        // Inputs
        .clk(clk),
        .rst(rst),
        .rstb(rstb),
        .start(start),
        .display_start22(display_start22),
        .display_start33(display_start33),
        .left(left),
        // .toggle_single(toggle_2by2),
        // .toggle_2by2(toggle_2by2),
        // .toggle_3by3(toggle_3by3),

        // Outputs
        .rst_total(rst_total),
        .display_selection(display_selection),
        .input_array_addr_in_single(input_array_addr_in_single),
        .filter_ceiling_array_addr_in_single(filter_ceiling_array_addr_in_single),
        .sys_single_en(sys_single_en),
        .buffer_read_addr_in_single(buffer_read_addr_in_single),
        .buffer_we_en_C11_single(buffer_we_en_C11_single),
        .buffer_we_en_C12_single(buffer_we_en_C12_single),
        .buffer_we_en_C21_single(buffer_we_en_C21_single),
        .buffer_we_en_C22_single(buffer_we_en_C22_single),
        .input_array_addr_in_2by2(input_array_addr_in_2by2),
        .filter_ceiling_first_array_addr_in_2by2(filter_ceiling_first_array_addr_in_2by2),
        .filter_ceiling_second_array_addr_in_2by2(filter_ceiling_second_array_addr_in_2by2),
        .sys_2by2_en(sys_2by2_en),
        .buffer_read_addr_in_2by2(buffer_read_addr_in_2by2),
        .input_side_array_addr_in_3by3(input_side_array_addr_in_3by3),
        .input_ceiling_array_addr_in_3by3(input_ceiling_array_addr_in_3by3),
        .filter_ceiling_array_addr_in_3by3(filter_ceiling_array_addr_in_3by3),
        .filter_side_array_addr_in_3by3(filter_side_array_addr_in_3by3),
        .sys_3by3_en(sys_3by3_en),
        .buffer_read_addr_in_3by3(buffer_read_addr_in_3by3)
    );

    memory main_mem (
        .clk(clk), 
        .rst(rst),
        .a00(a00_output), .a01(a01_output), .a02(a02_output), .a03(a03_output),
        .a10(a10_output), .a11(a11_output), .a12(a12_output), .a13(a13_output),
        .a20(a20_output), .a21(a21_output), .a22(a22_output), .a23(a23_output),
        .a30(a30_output), .a31(a31_output), .a32(a32_output), .a33(a33_output),
        .b00(b00_output), .b01(b01_output), .b02(b02_output),
        .b10(b10_output), .b11(b11_output), .b12(b12_output),
        .b20(b20_output), .b21(b21_output), .b22(b22_output),
        .zero(zero_input)
    );

    // Instantiate Top_computation
    Top_computation top_computation_inst (
        // Inputs
        .clk(clk),
        .rst(rst),
        .input_array_addr_in_single(input_array_addr_in_single),
        .filter_ceiling_array_addr_in_single(filter_ceiling_array_addr_in_single),
        .sys_single_en(sys_single_en),
        .buffer_read_addr_in_single(buffer_read_addr_in_single),
        .buffer_we_en_C11_single(buffer_we_en_C11_single),
        .buffer_we_en_C12_single(buffer_we_en_C12_single),
        .buffer_we_en_C21_single(buffer_we_en_C21_single),
        .buffer_we_en_C22_single(buffer_we_en_C22_single),
        .input_array_addr_in_2by2(input_array_addr_in_2by2),
        .filter_ceiling_first_array_addr_in_2by2(filter_ceiling_first_array_addr_in_2by2),
        .filter_ceiling_second_array_addr_in_2by2(filter_ceiling_second_array_addr_in_2by2),
        .buffer_read_addr_in_2by2(buffer_read_addr_in_2by2),
        .sys_2by2_en(sys_2by2_en),
        .buffer_read_addr_in_3by3(buffer_read_addr_in_3by3),
        .input_side_array_addr_in_3by3(input_side_array_addr_in_3by3),
        .input_ceiling_array_addr_in_3by3(input_ceiling_array_addr_in_3by3),
        .filter_side_array_addr_in_3by3(filter_side_array_addr_in_3by3),
        .filter_ceiling_array_addr_in_3by3(filter_ceiling_array_addr_in_3by3),
        .sys_3by3_en(sys_3by3_en),

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
        .zero_input(zero_input),

        // Outputs
        .convolution_single_out(convolution_single_out),
        .convolution_2by2_out(convolution_2by2_out),
        .convolution_3by3_out(convolution_3by3_out)
    );

    Top_display Top_display(
        .clk(clk),
        .rstb(rstb),
        .convolution(convolution_display),
        .digit(digit),
        .seg_data(seg_data)
    );

    MUX_4bit MUX_display(
        .i0(8'b0),
        .i1(convolution_2by2_out),
        .i2(convolution_3by3_out),
        .i3(8'b0),
        .sel(display_selection),
        .out(convolution_display)
    );








endmodule

