// This is for buffer module

module one_to_one_buffer_module(
    input clk,
    input rst,
    input we_en,
    input [7:0] data_in,

    output reg [7:0] data_out
);

    reg [7:0] stored_data;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            stored_data <= 8'b0;
        end else if (we_en) begin
            stored_data <= data_in;
        end
    end

    always @(posedge clk) begin
        if (!we_en) begin
            data_out <= stored_data;
        end
    end

endmodule
