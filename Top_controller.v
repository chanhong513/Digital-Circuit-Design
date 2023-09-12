module Top_controller(
    // input
    clk, rst, rstb, start, display_start22, display_start33, left,

    // output
    rst_total, display_selection,
    input_array_addr_in_single, filter_ceiling_array_addr_in_single, sys_single_en, buffer_read_addr_in_single, buffer_we_en_C11_single, buffer_we_en_C12_single, buffer_we_en_C21_single, buffer_we_en_C22_single,
    input_array_addr_in_2by2, filter_ceiling_first_array_addr_in_2by2, filter_ceiling_second_array_addr_in_2by2, sys_2by2_en, buffer_read_addr_in_2by2,
    input_side_array_addr_in_3by3, input_ceiling_array_addr_in_3by3, filter_ceiling_array_addr_in_3by3, filter_side_array_addr_in_3by3, sys_3by3_en, buffer_read_addr_in_3by3
    );

    // Common
    input clk, rst, rstb, start;
    input display_start22, display_start33;
    input left;

    // sub_controller
    output wire rst_total;
    output wire [1:0] display_selection; 

    // controller_single
    output wire [4:0] input_array_addr_in_single;
    output wire [4:0] filter_ceiling_array_addr_in_single;
    output wire sys_single_en;
    output wire [1:0] buffer_read_addr_in_single;
    output wire buffer_we_en_C11_single, buffer_we_en_C12_single, buffer_we_en_C21_single, buffer_we_en_C22_single;

    // controller_3by3	
    output wire [4:0] input_side_array_addr_in_3by3;
    output wire [4:0] input_ceiling_array_addr_in_3by3;
    output wire [4:0] filter_ceiling_array_addr_in_3by3;
    output wire [4:0] filter_side_array_addr_in_3by3;
    output wire sys_3by3_en;
    output wire [1:0] buffer_read_addr_in_3by3;

    // controller_2by2
    output wire [4:0] input_array_addr_in_2by2;
    output wire [4:0] filter_ceiling_first_array_addr_in_2by2;
    output wire [4:0] filter_ceiling_second_array_addr_in_2by2;
    output wire sys_2by2_en;
    output wire [1:0] buffer_read_addr_in_2by2;
    wire right22, right33;
    wire toggle_2by2, toggle_3by3;


    display_controller display_inst_2by2 (
        .clk(clk),
        .rst(rst),
        .rstb(rstb),
        .start(start),
        .display_start(display_start22),
        .toggle(toggle_2by2),
        .right(right22)
    );

    display_controller display_inst_3by3 (
        .clk(clk),
        .rst(rst),
        .rstb(rstb),
        .start(start),
        .display_start(display_start33),
        .toggle(toggle_3by3),
        .right(right33)
    );

    controller_single controller_single_inst (
        .clk(clk),
        .rst(rst),
        .start(start),
        .toggle_single(),
        .right(),
        .left(left),
        .input_array_addr_in(input_array_addr_in_single),
        .filter_ceiling_array_addr_in(filter_ceiling_array_addr_in_single),
        .sys_single_en(sys_single_en),
        .buffer_read_addr_in(buffer_read_addr_in_single),
        .buffer_we_en_C11(buffer_we_en_C11_single),
        .buffer_we_en_C12(buffer_we_en_C12_single),
        .buffer_we_en_C21(buffer_we_en_C21_single),
        .buffer_we_en_C22(buffer_we_en_C22_single)
    );

    controller_2by2 controller_2by2_inst (
        .clk(clk),
        .rst(rst),
        .start(start),
        .toggle_2by2(toggle_2by2),
        .right(right22),
        .left(left),
        .input_array_addr_in(input_array_addr_in_2by2),
        .filter_ceiling_first_array_addr_in(filter_ceiling_first_array_addr_in_2by2),
        .filter_ceiling_second_array_addr_in(filter_ceiling_second_array_addr_in_2by2),
        .sys_2by2_en(sys_2by2_en),
        .buffer_read_addr_in(buffer_read_addr_in_2by2)
    );

    
    controller_3by3 controller_3by3_inst (
        .clk(clk),
        .rst(rst),
        .start(start),
        .toggle_3by3(toggle_3by3),
        .right(right33),
        .left(left),
        .input_side_array_addr_in(input_side_array_addr_in_3by3),
        .input_ceiling_array_addr_in(input_ceiling_array_addr_in_3by3),     
        .filter_ceiling_array_addr_in(filter_ceiling_array_addr_in_3by3),
        .filter_side_array_addr_in(filter_side_array_addr_in_3by3),
        .sys_3by3_en(sys_3by3_en),
        .buffer_read_addr_in(buffer_read_addr_in_3by3)
    );

    sub_controller sub_controller_inst (
        .clk(clk),
        .rst(rst),
        .rstb(rstb),
        .toggle_2by2(toggle_2by2),
        .toggle_3by3(toggle_3by3),
        .rst_total(rst_total),
        .display_selection(display_selection)
    );

endmodule










