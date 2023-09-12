
module seg7 (rstb, clk, hundreds, tens, ones, digit, seg_data);
  
  input rstb;
  input clk;
  input[6:0] hundreds, tens, ones;


  
  output reg[7:0] digit;
  output reg[6:0] seg_data;
  
  reg [26:0] clk_cnt;
  reg seg_clk;
  
  initial begin
    digit = 8'b10000000;
    seg_data = 7'b0000000;
    clk_cnt = 27'd0;
    seg_clk = 1'b0;
  end

  //generatinc clock for display position
  always @ (posedge clk or negedge rstb)
  begin
    if (!rstb) 
      begin
      clk_cnt <= 27'd0;
      seg_clk <= 0;
      end
    else
      begin
         if(clk_cnt == 27'd99999) begin
        //  if(clk_cnt == 27'd1) begin
            clk_cnt <= 27'd0;
            seg_clk <= ~seg_clk;
          end
        else begin
          clk_cnt <= clk_cnt + 1;
        end
      end   
  end
  
  always @(posedge seg_clk or negedge rstb)
  begin
    if(!rstb)
      begin
        digit <= 8'b10000000; 
      end
    else 
      begin
        digit <= {digit[0], digit[7:1]};
      end
    end
    
  always @ (posedge seg_clk or negedge rstb) 
  begin
    if(!rstb) 
      begin
        seg_data <= 7'd0; end
      else
        case(digit)
          8'b10000000 : seg_data <= 7'b0000000;
          8'b01000000 : seg_data <= 7'b0000000;
          8'b00100000 : seg_data <= 7'b0000000;
          8'b00010000 : seg_data <= 7'b0000000;
          8'b00001000 : seg_data <= 7'b0000000;
          8'b00000100 : seg_data <= hundreds;
          8'b00000010 : seg_data <= tens;
          8'b00000001 : seg_data <= ones;
          default : seg_data <= 7'd0;
        endcase
      end
    endmodule
  