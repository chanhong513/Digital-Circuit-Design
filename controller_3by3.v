module controller_3by3 (clk, rst, start,
                        toggle_3by3, right, left, 
                        
                        input_side_array_addr_in, input_ceiling_array_addr_in, filter_ceiling_array_addr_in, filter_side_array_addr_in, 
                        // state_output, next_state_output, 
                        sys_3by3_en,
                        buffer_read_addr_in);

	input clk, rst, start;
    input toggle_3by3, right, left;

    output reg [4:0] input_side_array_addr_in;
    output reg [4:0] input_ceiling_array_addr_in;
    output reg [4:0] filter_ceiling_array_addr_in;
    output reg [4:0] filter_side_array_addr_in;
    // output reg [4:0] state_output, next_state_output;
    output reg sys_3by3_en;
    output reg [1:0] buffer_read_addr_in;


	reg [4:0] state, next_state;
	integer count; 
	
	initial begin count <= 0; end

	parameter S0 = 0, S1 = 1 , S2 = 2, S3 = 3, S4 = 4, S5 = 5, S6 = 6, S7 = 7, S8 = 8, S9 = 9, S10 = 10, S11 = 11, S12 = 12, S13 = 13, S14 = 14, S15 = 15, S16 = 16, S17 = 17, S18 = 18; // Add more


	always @ (posedge clk or posedge rst) 
	begin
		if (rst)
			state <= S0;
		// else if (toggle_3by3)
        //     state <= S19;
        else begin
			state = next_state;
            input_side_array_addr_in = 5'b11111; input_ceiling_array_addr_in = 5'b11111; filter_ceiling_array_addr_in = 5'b11111; filter_side_array_addr_in = 5'b11111; sys_3by3_en = 0; buffer_read_addr_in = 2'b00;
            // state_output = 0; next_state_output = 0; 
            case (state)
                S0:	    begin  end // Ready state

                ////////////////// convolution ////////////////
                // 12 cycles
                // 2 filter
                // 1 input
                S1:	    begin input_side_array_addr_in = 5'b00000; input_ceiling_array_addr_in = 5'b00100; filter_ceiling_array_addr_in = 5'b11000; filter_side_array_addr_in = 5'b11111; sys_3by3_en = 1; end
                S2:     begin input_side_array_addr_in = 5'b00001; input_ceiling_array_addr_in = 5'b00101; filter_ceiling_array_addr_in = 5'b10111; filter_side_array_addr_in = 5'b11000; sys_3by3_en = 1; end
                S3:	    begin input_side_array_addr_in = 5'b00010; input_ceiling_array_addr_in = 5'b00110; filter_ceiling_array_addr_in = 5'b10110; filter_side_array_addr_in = 5'b10111; sys_3by3_en = 1; end
                S4:	    begin input_side_array_addr_in = 5'b00011; input_ceiling_array_addr_in = 5'b00111; filter_ceiling_array_addr_in = 5'b11111; filter_side_array_addr_in = 5'b10110; sys_3by3_en = 1; end
                S5:	    begin input_side_array_addr_in = 5'b00100; input_ceiling_array_addr_in = 5'b01000; filter_ceiling_array_addr_in = 5'b10101; filter_side_array_addr_in = 5'b11111; sys_3by3_en = 1; end
                S6:	    begin input_side_array_addr_in = 5'b00101; input_ceiling_array_addr_in = 5'b01001; filter_ceiling_array_addr_in = 5'b10100; filter_side_array_addr_in = 5'b10101; sys_3by3_en = 1; end
                S7:	    begin input_side_array_addr_in = 5'b00110; input_ceiling_array_addr_in = 5'b01010; filter_ceiling_array_addr_in = 5'b10011; filter_side_array_addr_in = 5'b10100; sys_3by3_en = 1; end
                S8:	    begin input_side_array_addr_in = 5'b00111; input_ceiling_array_addr_in = 5'b01011; filter_ceiling_array_addr_in = 5'b11111; filter_side_array_addr_in = 5'b10011; sys_3by3_en = 1; end
                S9: 	begin input_side_array_addr_in = 5'b01000; input_ceiling_array_addr_in = 5'b01100; filter_ceiling_array_addr_in = 5'b10010; filter_side_array_addr_in = 5'b11111; sys_3by3_en = 1; end
                S10:	begin input_side_array_addr_in = 5'b01001; input_ceiling_array_addr_in = 5'b01101; filter_ceiling_array_addr_in = 5'b10001; filter_side_array_addr_in = 5'b10010; sys_3by3_en = 1; end
                S11:	begin input_side_array_addr_in = 5'b01010; input_ceiling_array_addr_in = 5'b01110; filter_ceiling_array_addr_in = 5'b10000; filter_side_array_addr_in = 5'b10001; sys_3by3_en = 1; end
                S12:	begin input_side_array_addr_in = 5'b01011; input_ceiling_array_addr_in = 5'b01111; filter_ceiling_array_addr_in = 5'b11111; filter_side_array_addr_in = 5'b10000; sys_3by3_en = 1; end
                // S13:	begin input_side_array_addr_in = 5'b01100; input_ceiling_array_addr_in = 5'b00101; filter_ceiling_array_addr_in = 5'b11111; filter_side_array_addr_in = 5'b11111; sys_3by3_en = 1; end
                // S14:	begin input_side_array_addr_in = 5'b01101; input_ceiling_array_addr_in = 5'b00101; filter_ceiling_array_addr_in = 5'b11111; filter_side_array_addr_in = 5'b11111; sys_3by3_en = 1; end
                // S15:	begin input_side_array_addr_in = 5'b01110; input_ceiling_array_addr_in = 5'b00101; filter_ceiling_array_addr_in = 5'b11111; filter_side_array_addr_in = 5'b11111; sys_3by3_en = 1; end
                // S16:	begin input_side_array_addr_in = 5'b01111; input_ceiling_array_addr_in = 5'b00101; filter_ceiling_array_addr_in = 5'b11111; filter_side_array_addr_in = 5'b11111; sys_3by3_en = 1; end

                ///////////////// maintain //////////////////
                S13:	begin input_side_array_addr_in = 5'b11111; input_ceiling_array_addr_in = 5'b11111; filter_ceiling_array_addr_in = 5'b11111; filter_side_array_addr_in = 5'b11111; sys_3by3_en = 1; end
                S14:	begin end

                /////////////// buffer read & display //////////////
                S15:    begin buffer_read_addr_in = 2'b00; input_side_array_addr_in = 5'b11111; input_ceiling_array_addr_in = 5'b11111; filter_ceiling_array_addr_in = 5'b11111; filter_side_array_addr_in = 5'b11111; sys_3by3_en = 1; end // C11 print
                S16:    begin buffer_read_addr_in = 2'b01; input_side_array_addr_in = 5'b11111; input_ceiling_array_addr_in = 5'b11111; filter_ceiling_array_addr_in = 5'b11111; filter_side_array_addr_in = 5'b11111; sys_3by3_en = 1; end // C12 print
                S17:    begin buffer_read_addr_in = 2'b10; input_side_array_addr_in = 5'b11111; input_ceiling_array_addr_in = 5'b11111; filter_ceiling_array_addr_in = 5'b11111; filter_side_array_addr_in = 5'b11111; sys_3by3_en = 1; end // C21 print
                S18:    begin buffer_read_addr_in = 2'b11; input_side_array_addr_in = 5'b11111; input_ceiling_array_addr_in = 5'b11111; filter_ceiling_array_addr_in = 5'b11111; filter_side_array_addr_in = 5'b11111; sys_3by3_en = 1; end // C22 print

                default:state = S0;

            endcase
        end
	end

	always @ (toggle_3by3 or right or left or input_side_array_addr_in or input_ceiling_array_addr_in or filter_ceiling_array_addr_in or filter_side_array_addr_in or sys_3by3_en or  buffer_read_addr_in)
	begin
        if (toggle_3by3) begin
            case(state)
                S15: begin // C11 buffer read
                    if (right == 1'b1) begin next_state = S16;  end
                    //else if (left) next_state = S28;
                    else begin next_state = S15; end            
                end

                S16: begin // C12 buffer read
                     if (right == 1'b1) begin next_state = S17; end
                    //else if (left) next_state = S28;
                    else begin next_state = S16;  end     
                end

                S17: begin // C21 buffer read
                     if (right == 1'b1) begin next_state = S18;  end
                    //else if (left) next_state = S28;
                    else begin next_state = S17; end 
                end

                S18: begin // C22 buffer read
                     if (right == 1'b1) begin next_state = S0;  end
                    //else if (left) next_state = S28;
                    else begin next_state = S18;  end
                end
                default: next_state = S15;
            endcase
            

        end

        else begin
            case (state)
                S0: begin // Ready state
                    if (start == 1'b1)
                        next_state = S1; 
                    else
                        next_state = S0;
                end
                // 16 cycles
                S1: next_state = S2;
                S2: next_state = S3;
                S3: next_state = S4;
                S4: next_state = S5;
                S5: next_state = S6;
                S6: next_state = S7;
                S7: next_state = S8;
                S8: next_state = S9;
                S9: next_state = S10;
                S10: next_state = S11;
                S11: next_state = S12;
                S12: next_state = S13;
                // S13: next_state = S14;
                // S14: next_state = S15;
                // S15: next_state = S16;
                // S16: next_state = S17;

                S13: next_state = S13;
                default: next_state = S0;
            endcase
        end
	end

	// always @ (state or next_state) 
    // begin
    //     state_output <= state;
    //     next_state_output <= next_state;
    // end


endmodule