module display_controller (clk, rst, rstb, start, display_start, toggle, right);
                        
    input clk, rst, rstb;
	input start;
    input display_start;
    output reg toggle;
    output reg right;

	reg [4:0] state, next_state;
	
	integer count;
	



	parameter S0 = 0, S1 = 1 , S2 = 2, S3 = 3, S4 = 4, S5 = 5, S6 = 6, S7 = 7, S8 = 8, S9 = 9, S10 = 10, S11 = 11, S12 = 12, S13 = 13, S14 = 14, S15 = 15, S16 = 16, S17 = 17, S18 = 18, S19 = 19, S20 = 20, S21 = 21, S22 = 22, S23 = 23, S24 = 24, S25 = 25, S26 = 26, S27 = 27, S28 = 28, S29 = 29, S30 = 30 ; // Add more

	initial
	begin
	  state <= S0;
	  count <= 0;
	  end
    

	always @ (posedge clk or posedge rst) 
	begin
		if (rst)
			state <= S0;
        else begin
			state = next_state;
		end
    end
    
    always @ (posedge clk)
    begin
            case (state)
                S0:	    begin toggle = 1'b0; end 

                S1:	    begin toggle = 1'b1; end
                S2:     begin toggle = 1'b1; end
                S3:	    begin toggle = 1'b1; end
                S4:	    begin toggle = 1'b1; end

           
                default:	    begin toggle = 1'b0; end
              
           
            endcase
    end



	always @ (posedge clk)
	begin
        case (state)
            S0: begin 
                if (display_start == 1'b1)begin
                    next_state = S1; count <= 0;end// Ready state
                else begin
                    next_state = S0; count <= 0;end
            end

            S1:begin if(count == 99999999) 
               begin next_state <= S2; count <= 0; right = 1'b1;end
               else begin next_state <= S1; count <= count + 1; right = 1'b0; end end
            S2:begin if(count == 99999999) 
               begin next_state <= S3; count <= 0; right = 1'b1; end
               else begin next_state <= S2; count <= count + 1; right = 1'b0; end end
            S3:begin if(count == 99999999) 
               begin next_state <= S4; count <= 0; right = 1'b1; end
               else begin next_state <= S3; count <= count + 1; right = 1'b0; end end
            S4:begin if(count == 99999999) 
               begin next_state <= S0; count <= 0;right = 1'b1; end
               else begin next_state <= S4; count <= count + 1; right = 1'b0; end end
           
            default: next_state <= S0;
        endcase
        end



endmodule