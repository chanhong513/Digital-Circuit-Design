// This is for buffer module

module buffer_module(
    input clk,
    input rst,
    input [1:0] buffer_read_addr_in,

    input [7:0] data_in_0,
    input [7:0] data_in_1,
    input [7:0] data_in_2,
    input [7:0] data_in_3,

    output [7:0] data_out
);

    wire [7:0] out0_wire, out1_wire, out2_wire, out3_wire;

    register_8bit register_buffer_0 (.clk(clk), .rst(rst), .in(data_in_0), .out(out0_wire));
    register_8bit register_buffer_1 (.clk(clk), .rst(rst), .in(data_in_1), .out(out1_wire));
    register_8bit register_buffer_2 (.clk(clk), .rst(rst), .in(data_in_2), .out(out2_wire));
    register_8bit register_buffer_3 (.clk(clk), .rst(rst), .in(data_in_3), .out(out3_wire));

    MUX_4bit MUX_4bit_buffer_0 (.i0(out0_wire), .i1(out1_wire), .i2(out2_wire), .i3(out3_wire), .sel(buffer_read_addr_in), .out(data_out));


endmodule
