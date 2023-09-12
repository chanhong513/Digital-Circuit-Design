module SevenSegment_Display(
  input [3:0] bin_input,  // 4 bit binary input
  output reg [6:0] seg_output // 7 segment output
);

always @(*) begin
  case(bin_input)
    4'b0000: seg_output = 7'b0111111; // 0
    4'b0001: seg_output = 7'b0000110; // 1
    4'b0010: seg_output = 7'b1011011; // 2
    4'b0011: seg_output = 7'b1001111; // 3
    4'b0100: seg_output = 7'b1100110; // 4
    4'b0101: seg_output = 7'b1101101; // 5
    4'b0110: seg_output = 7'b1111101; // 6
    4'b0111: seg_output = 7'b0000111; // 7
    4'b1000: seg_output = 7'b1111111; // 8
    4'b1001: seg_output = 7'b1101111; // 9
    default: seg_output = 7'b0000000; // all segments off
  endcase
end

endmodule
