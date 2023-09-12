module Systolic_Array_3x3_module (side_1, side_2, side_3, ceiling_1, ceiling_2, ceiling_3, clk, rst, en, convolution_11, convolution_12, convolution_21, convolution_22);   
   input clk, rst, en;
   input [7:0] side_1, side_2, side_3;
   input [7:0] ceiling_1, ceiling_2, ceiling_3;  

   output [7:0] convolution_11, convolution_12, convolution_21, convolution_22;         
                        
   wire [7:0] pe_12, pe_13, pe_22, pe_23, pe_31; 
   wire [7:0] shift_side_1, shift_side_2, shift_side_3, shift_ceiling_1, shift_ceiling_2, shift_ceiling_3; 
   wire [7:0] shift2_side_1, shift2_side_2, shift2_side_3, shift2_ceiling_1, shift2_ceiling_2, shift2_ceiling_3;
   wire [7:0] shift3_side_1, shift3_side_2, shift3_side_3, shift3_ceiling_1, shift3_ceiling_2, shift3_ceiling_3; 
        
   
    PE_single PE_single_3by3_11 (.side(side_1), .ceiling(ceiling_1), .clk(clk), .rst(rst), .en(en), .side_out(shift_side_1), .ceiling_out(shift_ceiling_1), .out(convolution_11));//convolution_11
    PE_single PE_single_3by3_12 (.side(shift_side_1), .ceiling(ceiling_2), .clk(clk), .rst(rst), .en(en), .side_out(shift2_side_1), .ceiling_out(shift_ceiling_2), .out(pe_12));
    PE_single PE_single_3by3_13 (.side(shift2_side_1), .ceiling(ceiling_3), .clk(clk), .rst(rst), .en(en), .side_out(shift3_side_1), .ceiling_out(shift_ceiling_3), .out(pe_13));
    
    PE_single PE_single_3by3_21 (.side(side_2), .ceiling(shift_ceiling_1), .clk(clk), .rst(rst), .en(en), .side_out(shift_side_2), .ceiling_out(shift2_ceiling_1), .out(convolution_12));//convolution_12
    PE_single PE_single_3by3_22 (.side(shift_side_2), .ceiling(shift_ceiling_2), .clk(clk), .rst(rst), .en(en), .side_out(shift2_side_2), .ceiling_out(shift2_ceiling_2), .out(pe_22));
    PE_single PE_single_3by3_23 (.side(shift2_side_2), .ceiling(shift_ceiling_3), .clk(clk), .rst(rst), .en(en), .side_out(shift3_side_2), .ceiling_out(shift2_ceiling_3), .out(pe_23));
    
    PE_single PE_single_3by3_31 (.side(side_3), .ceiling(shift2_ceiling_1), .clk(clk), .rst(rst), .en(en), .side_out(shift_side_3), .ceiling_out(shift3_ceiling_1), .out(pe_31));          
    PE_single PE_single_3by3_32 (.side(shift_side_3), .ceiling(shift2_ceiling_2), .clk(clk), .rst(rst), .en(en), .side_out(shift2_side_3), .ceiling_out(shift3_ceiling_2), .out(convolution_21));//convolution_21    
    PE_single PE_single_3by3_33 (.side(shift2_side_3), .ceiling(shift2_ceiling_3), .clk(clk), .rst(rst), .en(en), .side_out(shift3_side_3), .ceiling_out(shift3_ceiling_3), .out(convolution_22));//convolution_22  

endmodule