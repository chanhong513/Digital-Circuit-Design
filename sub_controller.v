module sub_controller (clk, rst, rstb,
                        toggle_2by2, toggle_3by3,
                        rst_total, display_selection);
                        
    input clk;
	input rst, rstb;
    input toggle_2by2, toggle_3by3;


    output reg rst_total;
    output reg [1:0] display_selection; // Mux selection bit // if toggle_single == 1 --> 00, toggle_2by2 == 1 --> 01, toggle_3by3 == 1 --> 10 



    initial begin
 
    end


    always @(*) begin
        if (rst == 0 && rstb == 1)
            rst_total = 0;
        else
            rst_total = 1;
    end

    always @ (*) begin 
        case ({toggle_2by2, toggle_3by3})
            2'b00 : display_selection = 2'b00;
            2'b10 : display_selection = 2'b01;
            2'b01 : display_selection = 2'b10; 
            default: display_selection = 2'b00;
        endcase 
    end


endmodule



 
  
