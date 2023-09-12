//This is for the D flip flop module.

module d_flip_flop_behavioral_module (d, clk, rst, q);
	input d;
	input clk; // clock
  input rst;

	output reg q;
	
always @(posedge clk)
  if (rst == 1)
    q <= 1'b0;
  else 
    q <= d;
endmodule