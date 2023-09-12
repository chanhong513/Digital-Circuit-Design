`timescale 1ns/1ps

module tb_Top_module;

    // Inputs
    reg clk;
    reg rst;
    reg rstb;
    reg start;
    reg left; // not used (default --> 0)
    reg display_start22;
    reg display_start33;

    // Outputs
    wire [7:0] digit;
    wire [6:0] seg_data;

    Top_module DUT (
        // Inputs
        .clk(clk),
        .rst(rst),
        .rstb(rstb),
        .start(start),
        .left(left),
        .display_start22(display_start22),
        .display_start33(display_start33),

        // Outputs
        .digit(digit),
        .seg_data(seg_data)

    );

    initial begin
        // Reset
        clk = 0;
        rst = 1;
        rstb = 0;
        start = 0;
        left = 0;
        display_start22 = 0;
        display_start33 = 0;


        #10;
        rst = 0;
        rstb = 1;



        #40 start = 1'b1;

        #1000 display_start22 = 1'b1;
        #1000 display_start33 = 1'b1;


    end

    always #10 clk = ~clk;

endmodule