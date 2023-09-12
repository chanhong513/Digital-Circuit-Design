module memory(clk, rst,
              a00, a01, a02, a03,
              a10, a11, a12, a13,
              a20, a21, a22, a23,
              a30, a31, a32, a33,
              b00, b01, b02,
              b10, b11, b12,
              b20, b21, b22,
              zero);
              
  input clk, rst;
  
  output[7:0] a00, a01, a02, a03,
              a10, a11, a12, a13,
              a20, a21, a22, a23,
              a30, a31, a32, a33,
              b00, b01, b02,
              b10, b11, b12,
              b20, b21, b22;

  output[7:0] zero;
               
  
               
           
  reg[7:0] a00_in, a01_in, a02_in, a03_in,
           a10_in, a11_in, a12_in, a13_in,
           a20_in, a21_in, a22_in, a23_in,
           a30_in, a31_in, a32_in, a33_in,
           b00_in, b01_in, b02_in,
           b10_in, b11_in, b12_in,
           b20_in, b21_in, b22_in, 
           zero_in;   
           
  initial
    begin
      a00_in <= 8'd9;
      a01_in <= 8'd1;
      a02_in <= 8'd10;
      a03_in <= 8'd5;
      a10_in <= 8'd10;
      a11_in <= 8'd6;
      a12_in <= 8'd10;
      a13_in <= 8'd1;
      a20_in <= 8'd8;
      a21_in <= 8'd6;
      a22_in <= 8'd10;
      a23_in <= 8'd10;
      a30_in <= 8'd1;
      a31_in <= 8'd3;
      a32_in <= 8'd1;
      a33_in <= 8'd8;
      
      b00_in <= 8'd2;
      b01_in <= 8'd5;
      b02_in <= 8'd5;
      b10_in <= 8'd5;
      b11_in <= 8'd3;
      b12_in <= 8'd5;
      b20_in <= 8'd4;
      b21_in <= 8'd0;
      b22_in <= 8'd4;

      zero_in <= 8'd0;
    end  
           
  register_8bit A00 (.clk(clk), .rst(rst), .in(a00_in), .out(a00));
  register_8bit A01 (.clk(clk), .rst(rst), .in(a01_in), .out(a01));
  register_8bit A02 (.clk(clk), .rst(rst), .in(a02_in), .out(a02));
  register_8bit A03 (.clk(clk), .rst(rst), .in(a03_in), .out(a03));
  register_8bit A10 (.clk(clk), .rst(rst), .in(a10_in), .out(a10));
  register_8bit A11 (.clk(clk), .rst(rst), .in(a11_in), .out(a11));
  register_8bit A12 (.clk(clk), .rst(rst), .in(a12_in), .out(a12));
  register_8bit A13 (.clk(clk), .rst(rst), .in(a13_in), .out(a13));
  register_8bit A20 (.clk(clk), .rst(rst), .in(a20_in), .out(a20));
  register_8bit A21 (.clk(clk), .rst(rst), .in(a21_in), .out(a21));
  register_8bit A22 (.clk(clk), .rst(rst), .in(a22_in), .out(a22));
  register_8bit A23 (.clk(clk), .rst(rst), .in(a23_in), .out(a23));
  register_8bit A30 (.clk(clk), .rst(rst), .in(a30_in), .out(a30));
  register_8bit A31 (.clk(clk), .rst(rst), .in(a31_in), .out(a31));
  register_8bit A32 (.clk(clk), .rst(rst), .in(a32_in), .out(a32));
  register_8bit A33 (.clk(clk), .rst(rst), .in(a33_in), .out(a33));
  
  register_8bit B00 (.clk(clk), .rst(rst), .in(b00_in), .out(b00));
  register_8bit B01 (.clk(clk), .rst(rst), .in(b01_in), .out(b01));
  register_8bit B02 (.clk(clk), .rst(rst), .in(b02_in), .out(b02));
  register_8bit B10 (.clk(clk), .rst(rst), .in(b10_in), .out(b10));
  register_8bit B11 (.clk(clk), .rst(rst), .in(b11_in), .out(b11));
  register_8bit B12 (.clk(clk), .rst(rst), .in(b12_in), .out(b12));
  register_8bit B20 (.clk(clk), .rst(rst), .in(b20_in), .out(b20));
  register_8bit B21 (.clk(clk), .rst(rst), .in(b21_in), .out(b21));
  register_8bit B22 (.clk(clk), .rst(rst), .in(b22_in), .out(b22));

  register_8bit zero_reg (.clk(clk), .rst(rst), .in(zero_in), .out(zero));
  
  

endmodule



