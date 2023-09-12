module eight_bits_multiplier(a, b , product);
	input [7:0] a, b;
	output [7:0] product;

	wire [7:0] AND_0;
	wire [6:0] AND_1;
	wire [5:0] AND_2;
	wire [4:0] AND_3;
	wire [3:0] AND_4;
	wire [2:0] AND_5;
	wire [1:0] AND_6;
	wire AND_7;
	wire [27:0] cout, ADD;

  	and_gate a0_0(a[0], b[0], AND_0[0]);
	and_gate a0_1(a[1], b[0], AND_0[1]);
	and_gate a0_2(a[2], b[0], AND_0[2]);
	and_gate a0_3(a[3], b[0], AND_0[3]);   
	and_gate a0_4(a[4], b[0], AND_0[4]);
	and_gate a0_5(a[5], b[0], AND_0[5]);
	and_gate a0_6(a[6], b[0], AND_0[6]);
	and_gate a0_7(a[7], b[0], AND_0[7]);
	      
	and_gate a1_0(a[0], b[1], AND_1[0]);
	and_gate a1_1(a[1], b[1], AND_1[1]);
	and_gate a1_2(a[2], b[1], AND_1[2]);
	and_gate a1_3(a[3], b[1], AND_1[3]);
	and_gate a1_4(a[4], b[1], AND_1[4]);
	and_gate a1_5(a[5], b[1], AND_1[5]);
	and_gate a1_6(a[6], b[1], AND_1[6]);
	   
	      
	and_gate a2_0(a[0], b[2], AND_2[0]);
	and_gate a2_1(a[1], b[2], AND_2[1]);
	and_gate a2_2(a[2], b[2], AND_2[2]);
	and_gate a2_3(a[3], b[2], AND_2[3]);
	and_gate a2_4(a[4], b[2], AND_2[4]);
	and_gate a2_5(a[5], b[2], AND_2[5]);
    	
	      
	and_gate a3_0(a[0], b[3], AND_3[0]);
	and_gate a3_1(a[1], b[3], AND_3[1]);
	and_gate a3_2(a[2], b[3], AND_3[2]);
	and_gate a3_3(a[3], b[3], AND_3[3]);
	and_gate a3_4(a[4], b[3], AND_3[4]);
 
          
	and_gate a4_0(a[0], b[4], AND_4[0]);
	and_gate a4_1(a[1], b[4], AND_4[1]);
	and_gate a4_2(a[2], b[4], AND_4[2]);
	and_gate a4_3(a[3], b[4], AND_4[3]);

          
	and_gate a5_0(a[0], b[5], AND_5[0]);
	and_gate a5_1(a[1], b[5], AND_5[1]);
	and_gate a5_2(a[2], b[5], AND_5[2]);

          
	and_gate a6_0(a[0], b[6], AND_6[0]);
	and_gate a6_1(a[1], b[6], AND_6[1]);
   
          
	and_gate a7_0(a[0], b[7], AND_7);
	      
	      
	// ADD[0] -> product[1]
	full_adder_behavioral_module fa1(.a(AND_0[1]), .b(AND_1[0]), .cin(1'b0), .sum(ADD[0]), .cout(cout[0]));
	full_adder_behavioral_module fa2(.a(AND_0[2]), .b(AND_1[1]), .cin(cout[0]), .sum(ADD[1]), .cout(cout[1]));
	full_adder_behavioral_module fa3(.a(AND_0[3]), .b(AND_1[2]), .cin(cout[1]), .sum(ADD[2]), .cout(cout[2]));
	full_adder_behavioral_module fa4(.a(AND_0[4]), .b(AND_1[3]), .cin(cout[2]), .sum(ADD[3]), .cout(cout[3]));
	full_adder_behavioral_module fa5(.a(AND_0[5]), .b(AND_1[4]), .cin(cout[3]), .sum(ADD[4]), .cout(cout[4]));
	full_adder_behavioral_module fa6(.a(AND_0[6]), .b(AND_1[5]), .cin(cout[4]), .sum(ADD[5]), .cout(cout[5]));
	full_adder_behavioral_module fa7(.a(AND_0[7]), .b(AND_1[6]), .cin(cout[5]), .sum(ADD[6]), .cout(cout[6]));

	// ADD[7] -> product[2]
	full_adder_behavioral_module fa8(.a(ADD[1]), .b(AND_2[0]), .cin(1'b0), .sum(ADD[7]), .cout(cout[7]));
	full_adder_behavioral_module fa9(.a(ADD[2]), .b(AND_2[1]), .cin(cout[7]), .sum(ADD[8]), .cout(cout[8]));
	full_adder_behavioral_module fa10(.a(ADD[3]), .b(AND_2[2]), .cin(cout[8]), .sum(ADD[9]), .cout(cout[9]));
	full_adder_behavioral_module fa11(.a(ADD[4]), .b(AND_2[3]), .cin(cout[9]), .sum(ADD[10]), .cout(cout[10]));
	full_adder_behavioral_module fa12(.a(ADD[5]), .b(AND_2[4]), .cin(cout[10]), .sum(ADD[11]), .cout(cout[11]));
	full_adder_behavioral_module fa13(.a(ADD[6]), .b(AND_2[5]), .cin(cout[11]), .sum(ADD[12]), .cout(cout[12]));

	// ADD[13] -> product[3]
	full_adder_behavioral_module fa14(.a(ADD[8]), .b(AND_3[0]), .cin(1'b0), .sum(ADD[13]), .cout(cout[13]));
	full_adder_behavioral_module fa15(.a(ADD[9]), .b(AND_3[1]), .cin(cout[13]), .sum(ADD[14]), .cout(cout[14]));
	full_adder_behavioral_module fa16(.a(ADD[10]), .b(AND_3[2]), .cin(cout[14]), .sum(ADD[15]), .cout(cout[15]));
	full_adder_behavioral_module fa17(.a(ADD[11]), .b(AND_3[3]), .cin(cout[15]), .sum(ADD[16]), .cout(cout[16]));
	full_adder_behavioral_module fa18(.a(ADD[12]), .b(AND_3[4]), .cin(cout[16]), .sum(ADD[17]), .cout(cout[17]));

	// ADD[18] -> product[4]
	full_adder_behavioral_module fa19(.a(ADD[14]), .b(AND_4[0]), .cin(1'b0), .sum(ADD[18]), .cout(cout[18]));
	full_adder_behavioral_module fa20(.a(ADD[15]), .b(AND_4[1]), .cin(cout[18]), .sum(ADD[19]), .cout(cout[19]));
	full_adder_behavioral_module fa21(.a(ADD[16]), .b(AND_4[2]), .cin(cout[19]), .sum(ADD[20]), .cout(cout[20]));
	full_adder_behavioral_module fa22(.a(ADD[17]), .b(AND_4[3]), .cin(cout[20]), .sum(ADD[21]), .cout(cout[21]));

	// ADD[22] -> product[5]
	full_adder_behavioral_module fa23(.a(ADD[19]), .b(AND_5[0]), .cin(1'b0), .sum(ADD[22]), .cout(cout[22]));
	full_adder_behavioral_module fa24(.a(ADD[20]), .b(AND_5[1]), .cin(cout[22]), .sum(ADD[23]), .cout(cout[23]));
	full_adder_behavioral_module fa25(.a(ADD[21]), .b(AND_4[2]), .cin(cout[23]), .sum(ADD[24]), .cout(cout[24]));

	// ADD[25] -> product[6]
	full_adder_behavioral_module fa26(.a(ADD[23]), .b(AND_6[0]), .cin(1'b0), .sum(ADD[25]), .cout(cout[25]));
	full_adder_behavioral_module fa27(.a(ADD[24]), .b(AND_6[1]), .cin(cout[25]), .sum(ADD[26]), .cout(cout[26]));

	// ADD[27] -> product[7]
	full_adder_behavioral_module fa28(.a(ADD[26]), .b(AND_7), .cin(1'b0), .sum(ADD[27]), .cout(cout[27]));
	
	assign product[0] = AND_0[0];
	assign product[1] = ADD[0];
	assign product[2] = ADD[7];
	assign product[3] = ADD[13];
	assign product[4] = ADD[18];
	assign product[5] = ADD[22];
	assign product[6] = ADD[25];
	assign product[7] = ADD[27];
	
endmodule

