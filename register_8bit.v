module register_8bit(clk, rst, in, out);
  
  input clk, rst;
  input[7:0] in;
  
  output[7:0] out;
  
  d_flip_flop_behavioral_module bit0 (.d(in[0]), .clk(clk), .rst(rst), .q(out[0]));
  d_flip_flop_behavioral_module bit1 (.d(in[1]), .clk(clk), .rst(rst), .q(out[1]));
  d_flip_flop_behavioral_module bit2 (.d(in[2]), .clk(clk), .rst(rst), .q(out[2]));
  d_flip_flop_behavioral_module bit3 (.d(in[3]), .clk(clk), .rst(rst), .q(out[3]));
  d_flip_flop_behavioral_module bit4 (.d(in[4]), .clk(clk), .rst(rst), .q(out[4]));
  d_flip_flop_behavioral_module bit5 (.d(in[5]), .clk(clk), .rst(rst), .q(out[5]));
  d_flip_flop_behavioral_module bit6 (.d(in[6]), .clk(clk), .rst(rst), .q(out[6]));
  d_flip_flop_behavioral_module bit7 (.d(in[7]), .clk(clk), .rst(rst), .q(out[7]));
  
endmodule  