module tb_2by2_2D_convolution_module;
    reg clk;
    reg rst;
    reg [7:0] input_array_addr_in_2by2; reg [7:0] filter_ceiling_first_array_addr_in_2by2; reg [7:0] filter_ceiling_second_array_addr_in_2by2;
    reg [1:0] buffer_read_addr_in_2by2;
    reg sys_2by2_en;
    reg [7:0] a00_output; reg [7:0] a01_output; reg [7:0] a02_output; reg [7:0] a03_output; 
    reg [7:0] a10_output; reg [7:0] a11_output; reg [7:0] a12_output; reg [7:0] a13_output; 
    reg [7:0] a20_output; reg [7:0] a21_output; reg [7:0] a22_output; reg [7:0] a23_output; 
    reg [7:0] a30_output; reg [7:0] a31_output; reg [7:0] a32_output; reg [7:0] a33_output; 
    reg [7:0] b00_output; reg [7:0] b01_output; reg [7:0] b02_output; 
    reg [7:0] b10_output; reg [7:0] b11_output; reg [7:0] b12_output; 
    reg [7:0] b20_output; reg [7:0] b21_output; reg [7:0] b22_output; 
    reg [7:0] zero_input;
    

    // Your outputs might have different widths
    wire [7:0] convolution_C11;
    wire [7:0] convolution_C12;
    wire [7:0] convolution_C21;
    wire [7:0] convolution_C22;
    wire [7:0] convolution_2by2_out;

    // Instantiate 
    convolution_2by2_module Systolic_Array_2by2 (
        .clk(clk),
        .rst(rst),
        .input_array_addr_in_2by2(input_array_addr_in_2by2), .filter_ceiling_first_array_addr_in_2by2(filter_ceiling_first_array_addr_in_2by2), .filter_ceiling_second_array_addr_in_2by2(filter_ceiling_second_array_addr_in_2by2),
        .buffer_read_addr_in_2by2(buffer_read_addr_in_2by2),
        .sys_2by2_en(sys_2by2_en),
        .a00_output(a00_output), .a01_output(a01_output), .a02_output(a02_output), .a03_output(a03_output), 
        .a10_output(a10_output), .a11_output(a11_output), .a12_output(a12_output), .a13_output(a13_output), 
        .a20_output(a20_output), .a21_output(a21_output), .a22_output(a22_output), .a23_output(a23_output), 
        .a30_output(a30_output), .a31_output(a31_output), .a32_output(a32_output), .a33_output(a33_output), 
        .b00_output(b00_output), .b01_output(b01_output), .b02_output(b02_output), 
        .b10_output(b10_output), .b11_output(b11_output), .b12_output(b12_output), 
        .b20_output(b20_output), .b21_output(b21_output), .b22_output(b22_output), 
        .zero_input(zero_input),
        
        .convolution_C11(convolution_C11),
        .convolution_C12(convolution_C12),
        .convolution_C21(convolution_C21),
        .convolution_C22(convolution_C22),
        .convolution_2by2_out(convolution_2by2_out)
    );

    initial begin
        // Reset
        clk = 0;
        rst = 1;
        sys_2by2_en = 0;
        a00_output = 8'd1; a01_output = 8'd2; a02_output = 8'd3; a03_output = 8'd4; 
        a10_output = 8'd5; a11_output = 8'd6; a12_output = 8'd7; a13_output = 8'd8; 
        a20_output = 8'd1; a21_output = 8'd2; a22_output = 8'd1; a23_output = 8'd2; 
        a30_output = 8'd1; a31_output = 8'd2; a32_output = 8'd1; a33_output = 8'd2; 
        b00_output = 8'd1; b01_output = 8'd2; b02_output = 8'd3; 
        b10_output = 8'd4; b11_output = 8'd5; b12_output = 8'd6; 
        b20_output = 8'd7; b21_output = 8'd8; b22_output = 8'd9; 
        zero_input = 8'd25;
        
        #15;
        rst = 0;
        sys_2by2_en = 1;
        input_array_addr_in_2by2 = 0;
        filter_ceiling_first_array_addr_in_2by2 = 8'd24;
        filter_ceiling_second_array_addr_in_2by2 = zero_input;
        
        #10;
        filter_ceiling_first_array_addr_in_2by2 = 8'd23;
        input_array_addr_in_2by2 = 1;
        
        #10;
        filter_ceiling_first_array_addr_in_2by2 = 8'd22;
        input_array_addr_in_2by2 = 8'd2;
        
        #10;
        filter_ceiling_first_array_addr_in_2by2 = zero_input;
        input_array_addr_in_2by2 = 8'd3;
        
        #10;
        filter_ceiling_first_array_addr_in_2by2 = 8'd21;
        input_array_addr_in_2by2 = 8'd4;
        
        #10;
        filter_ceiling_first_array_addr_in_2by2 = 8'd20;
        input_array_addr_in_2by2 = 8'd5;
        
        #10;
        filter_ceiling_first_array_addr_in_2by2 = 8'd19;
        input_array_addr_in_2by2 = 8'd6;
        
        #10;
        filter_ceiling_first_array_addr_in_2by2 = zero_input;
        input_array_addr_in_2by2 = 8'd7;
        
        #10;
        filter_ceiling_first_array_addr_in_2by2 = 8'd18;
        input_array_addr_in_2by2 = 8'd8;
        
        #10;
        filter_ceiling_first_array_addr_in_2by2 = 8'd17;
        input_array_addr_in_2by2 = 8'd9;
        
        #10;
        filter_ceiling_first_array_addr_in_2by2 = 8'd16;
        input_array_addr_in_2by2 = 8'd10;
        buffer_read_addr_in_2by2 = 0;

        #10;
        filter_ceiling_first_array_addr_in_2by2 = zero_input;
        input_array_addr_in_2by2 = 8'd11;
        buffer_read_addr_in_2by2 = 1;
        
        #10;
        input_array_addr_in_2by2 = 8'd4;
        
        #10;
        filter_ceiling_second_array_addr_in_2by2 = 8'd24;  
        input_array_addr_in_2by2 = 8'd5;
        
        #10;
        filter_ceiling_second_array_addr_in_2by2 = 8'd23;
        input_array_addr_in_2by2 = 8'd6;
        
        #10;
        filter_ceiling_second_array_addr_in_2by2 = 8'd22;
        input_array_addr_in_2by2 = 8'd7;
        
        #10;
        filter_ceiling_second_array_addr_in_2by2 = zero_input;
        input_array_addr_in_2by2 = 8'd8;
        
        #10;
        filter_ceiling_second_array_addr_in_2by2 = 8'd21;
        input_array_addr_in_2by2 = 8'd9;
        
        #10;
        filter_ceiling_second_array_addr_in_2by2 = 8'd20;
        input_array_addr_in_2by2 = 8'd10;
        
        #10;
        filter_ceiling_second_array_addr_in_2by2 = 8'd19;
        input_array_addr_in_2by2 = 8'd11;
        
        #10;
        filter_ceiling_second_array_addr_in_2by2 = zero_input;
        input_array_addr_in_2by2 = 8'd12;
        
        #10;
        filter_ceiling_second_array_addr_in_2by2 = 8'd18;
        input_array_addr_in_2by2 = 8'd13;
        
        #10;
        filter_ceiling_second_array_addr_in_2by2 = 8'd17;
        input_array_addr_in_2by2 = 8'd14;
        
        #10;
        filter_ceiling_second_array_addr_in_2by2 = 8'd16;
        input_array_addr_in_2by2 = 8'd15;      
        buffer_read_addr_in_2by2 = 2'b10;
        
        #10;
        input_array_addr_in_2by2 = zero_input;
        filter_ceiling_second_array_addr_in_2by2 = zero_input;
        buffer_read_addr_in_2by2 = 2'b11;
        
        
    end

    // Generate clock
    always #5 clk = ~clk;
endmodule
