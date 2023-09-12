module PE_single(
    input [7:0] side,
    input [7:0] ceiling,
    input clk,
    input rst,
    input en,
    output [7:0] out,
    output [7:0] side_out,
    output [7:0] ceiling_out
);

// wire [7:0] out0;
wire [7:0] out1;
wire [7:0] q_out;
wire rst_g;
wire cout;
wire not_en;

not_gate not_1 (.a(en), .out(not_en));
or_gate or_1(.a(not_en), .b(rst), .out(rst_g));

eight_bits_multiplier multiplier(.a(side), .b(ceiling), .product(out1)); // for convolution _ multiplier
// register_8bit Reg_0(.clk(clk), .rst(rst), .in(out0), .out(out1)); // for clock synchronous _ multiplier

eight_bit_full_adder_module eight_bits_adder_1(.a(out1), .b(q_out), .cin(1'b0), .sum(out), .cout(cout)); // for convolution _ adder
register_8bit Reg_1(.clk(clk), .rst(rst_g), .in(out), .out(q_out)); // for clock synchronous _ adder

register_8bit Reg_2(.clk(clk), .rst(rst_g), .in(side), .out(side_out)); // for transfer side input
register_8bit Reg_3(.clk(clk), .rst(rst_g), .in(ceiling), .out(ceiling_out)); // for transfer ceiling input

endmodule


// or_gate or_1(.a(en), .b(rst), .out(rst_g));

// eight_bits_multiplier multiplier(.a(side), .b(ceiling), .product(out0)); // for convolution _ multiplier
// register_8bit Reg_0(.clk(clk), .rst(rst), .in(out0), .out(out1)); // for clock synchronous _ multiplier

// eight_bit_full_adder_module eight_bits_adder_1(.a(out1), .b(q_out), .cin(1'b0), .sum(out), .cout()); // for convolution _ adder
// register_8bit Reg_1(.clk(clk), .rst(rst_g), .in(out), .out(q_out)); // for clock synchronous _ adder

// register_8bit Reg_2(.clk(clk), .rst(rst_g), .in(side), .out(side_out)); // for transfer side input
// register_8bit Reg_3(.clk(clk), .rst(rst_g), .in(ciling), .out(ceiling_out)); // for transfer ceiling input