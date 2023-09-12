module Systolic_Array_2x2_module (side_1, side_2, ceiling_1, ceiling_2, clk, rst, en, convolution_11, convolution_12, convolution_21, convolution_22);   
   input clk, rst, en;
   input [7:0] side_1, side_2;
   input [7:0] ceiling_1, ceiling_2;  
   
   output [7:0] convolution_11, convolution_12, convolution_21, convolution_22;       

   wire [7:0] shift_side_1, shift_side_2, shift_ceiling_1, shift_ceiling_2;
   wire [7:0] shift2_side_1, shift2_side_2, shift2_ceiling_1, shift2_ceiling_2;      
   
    PE_single PE_single_11 (.side(side_1), .ceiling(ceiling_1), .clk(clk), .rst(rst), .en(en), .side_out(shift_side_1), .ceiling_out(shift_ceiling_1), .out(convolution_11));    
    PE_single PE_single_12 (.side(shift_side_1), .ceiling(ceiling_2), .clk(clk), .rst(rst), .en(en), .side_out(shift2_side_1), .ceiling_out(shift_ceiling_2), .out(convolution_21));
    PE_single PE_single_21 (.side(side_2), .ceiling(shift_ceiling_1), .clk(clk), .rst(rst), .en(en), .side_out(shift_side_2), .ceiling_out(shift2_ceiling_1), .out(convolution_12));
    PE_single PE_single_22 (.side(shift_side_2), .ceiling(shift_ceiling_2), .clk(clk), .rst(rst), .en(en), .side_out(shift2_side_2), .ceiling_out(shift2_ceiling_2), .out(convolution_22));  
  
endmodule    
