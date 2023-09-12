module controller_single (clk, rst, start, 
                        toggle_single, right, left, 
                        input_array_addr_in, filter_ceiling_array_addr_in,
                        // state_output, next_state_output, 
                        sys_single_en,
                        buffer_read_addr_in,
                        buffer_we_en_C11, buffer_we_en_C12, buffer_we_en_C21, buffer_we_en_C22);

	input clk, rst, start; 
    input toggle_single, right, left;

    output reg [4:0] input_array_addr_in;
    output reg [4:0] filter_ceiling_array_addr_in;
    // output reg [5:0] state_output, next_state_output; // 6bis!!
    output reg sys_single_en;
    output reg [1:0] buffer_read_addr_in;
    output reg buffer_we_en_C11, buffer_we_en_C12, buffer_we_en_C21, buffer_we_en_C22;


	reg [5:0] state, next_state;

	parameter S0 = 0, S1 = 1 , S2 = 2, S3 = 3, S4 = 4, S5 = 5, S6 = 6, S7 = 7, S8 = 8, S9 = 9, S10 = 10, S11 = 11, S12 = 12, S13 = 13, S14 = 14, S15 = 15, S16 = 16, S17 = 17, S18 = 18, S19 = 19, S20 = 20, S21 = 21, S22 = 22, S23 = 23, S24 = 24, S25 = 25, S26 = 26, S27 = 27, S28 = 28, S29 = 29, S30 = 30, S31 = 31, S32 = 32, S33 = 33, S34 = 34, S35 = 35, S36 = 36, S37 = 37, S38 = 38, S39 = 39, S40 = 40, S41 = 41, S42 = 42; // Add more


	always @ (posedge clk or posedge rst) 
	begin
		if (rst)
			state <= S0;
        else begin
			state <= next_state;
            input_array_addr_in = 5'b11111; filter_ceiling_array_addr_in = 5'b11111; sys_single_en = 1'b0; buffer_read_addr_in= 2'b00; buffer_we_en_C11 = 1'b0; buffer_we_en_C12 = 1'b0; buffer_we_en_C21 = 1'b0; buffer_we_en_C22 = 1'b0;
            // state_output = 0; next_state_output = 0; 
            case (state)
                S0:	    begin  end // Ready state

                ////////////////// convolution ////////////////
                // 36 cycles
                // 1 fiter  
                // 1 input 
                S1:	    begin input_array_addr_in = 5'b00000; filter_ceiling_array_addr_in = 5'b11000; sys_single_en = 1'b1; end
                S2:     begin input_array_addr_in = 5'b00001; filter_ceiling_array_addr_in = 5'b10111; sys_single_en = 1'b1; end
                S3:	    begin input_array_addr_in = 5'b00010; filter_ceiling_array_addr_in = 5'b10110; sys_single_en = 1'b1; end
                S4:	    begin input_array_addr_in = 5'b00100; filter_ceiling_array_addr_in = 5'b10101; sys_single_en = 1'b1; end
                S5:	    begin input_array_addr_in = 5'b00101; filter_ceiling_array_addr_in = 5'b10100; sys_single_en = 1'b1; end
                S6:	    begin input_array_addr_in = 5'b00110; filter_ceiling_array_addr_in = 5'b10011; sys_single_en = 1'b1; end
                S7:	    begin input_array_addr_in = 5'b01000; filter_ceiling_array_addr_in = 5'b10010; sys_single_en = 1'b1; end
                S8:	    begin input_array_addr_in = 5'b01001; filter_ceiling_array_addr_in = 5'b10001; sys_single_en = 1'b1; end
                S9: 	begin input_array_addr_in = 5'b01010; filter_ceiling_array_addr_in = 5'b10000; sys_single_en = 1'b0; buffer_we_en_C11 = 1'b1; end

                S10:	begin input_array_addr_in = 5'b00001; filter_ceiling_array_addr_in = 5'b11000; sys_single_en = 1'b1; buffer_we_en_C11 = 1'b0; end
                S11:    begin input_array_addr_in = 5'b00010; filter_ceiling_array_addr_in = 5'b10111; sys_single_en = 1'b1; end
                S12:	begin input_array_addr_in = 5'b00011; filter_ceiling_array_addr_in = 5'b10110; sys_single_en = 1'b1; end
                S13:	begin input_array_addr_in = 5'b00101; filter_ceiling_array_addr_in = 5'b10101; sys_single_en = 1'b1; end
                S14:	begin input_array_addr_in = 5'b00110; filter_ceiling_array_addr_in = 5'b10100; sys_single_en = 1'b1; end
                S15:	begin input_array_addr_in = 5'b00111; filter_ceiling_array_addr_in = 5'b10011; sys_single_en = 1'b1; end
                S16:	begin input_array_addr_in = 5'b01001; filter_ceiling_array_addr_in = 5'b10010; sys_single_en = 1'b1; end
                S17:	begin input_array_addr_in = 5'b01010; filter_ceiling_array_addr_in = 5'b10001; sys_single_en = 1'b1; end
                S18: 	begin input_array_addr_in = 5'b01011; filter_ceiling_array_addr_in = 5'b10000; sys_single_en = 1'b0; buffer_we_en_C12 = 1'b1; end

                S19:	begin input_array_addr_in = 5'b00100; filter_ceiling_array_addr_in = 5'b11000; sys_single_en = 1'b1; buffer_we_en_C12 = 1'b0; end
                S20:    begin input_array_addr_in = 5'b00101; filter_ceiling_array_addr_in = 5'b10111; sys_single_en = 1'b1; end
                S21:	begin input_array_addr_in = 5'b00110; filter_ceiling_array_addr_in = 5'b10110; sys_single_en = 1'b1; end
                S22:	begin input_array_addr_in = 5'b01000; filter_ceiling_array_addr_in = 5'b10101; sys_single_en = 1'b1; end
                S23:	begin input_array_addr_in = 5'b01001; filter_ceiling_array_addr_in = 5'b10100; sys_single_en = 1'b1; end
                S24:	begin input_array_addr_in = 5'b01010; filter_ceiling_array_addr_in = 5'b10011; sys_single_en = 1'b1; end
                S25:	begin input_array_addr_in = 5'b01100; filter_ceiling_array_addr_in = 5'b10010; sys_single_en = 1'b1; end
                S26:	begin input_array_addr_in = 5'b01101; filter_ceiling_array_addr_in = 5'b10001; sys_single_en = 1'b1; end
                S27: 	begin input_array_addr_in = 5'b01110; filter_ceiling_array_addr_in = 5'b10000; sys_single_en = 1'b0; buffer_we_en_C21 = 1'b1; end

                S28:	begin input_array_addr_in = 5'b00101; filter_ceiling_array_addr_in = 5'b11000; sys_single_en = 1'b1; buffer_we_en_C21 = 1'b0; end
                S29:    begin input_array_addr_in = 5'b00110; filter_ceiling_array_addr_in = 5'b10111; sys_single_en = 1'b1; end
                S30:	begin input_array_addr_in = 5'b00111; filter_ceiling_array_addr_in = 5'b10110; sys_single_en = 1'b1; end
                S31:	begin input_array_addr_in = 5'b01001; filter_ceiling_array_addr_in = 5'b10101; sys_single_en = 1'b1; end
                S32:	begin input_array_addr_in = 5'b01010; filter_ceiling_array_addr_in = 5'b10100; sys_single_en = 1'b1; end
                S33:	begin input_array_addr_in = 5'b01011; filter_ceiling_array_addr_in = 5'b10011; sys_single_en = 1'b1; end
                S34:	begin input_array_addr_in = 5'b01101; filter_ceiling_array_addr_in = 5'b10010; sys_single_en = 1'b1; end
                S35:	begin input_array_addr_in = 5'b01110; filter_ceiling_array_addr_in = 5'b10001; sys_single_en = 1'b1; end
                S36: 	begin input_array_addr_in = 5'b01111; filter_ceiling_array_addr_in = 5'b10000; sys_single_en = 1'b0; buffer_we_en_C22 = 1'b1; end



                ///////////////// maintain //////////////////
                S37:	begin input_array_addr_in = 5'b11111; filter_ceiling_array_addr_in = 5'b11111; sys_single_en = 1'b1; buffer_we_en_C22 = 1'b0; end
                S38:	begin end    


                /////////////// buffer read & display //////////////
                S39:    begin buffer_read_addr_in = 2'b00; input_array_addr_in = 5'b11111; filter_ceiling_array_addr_in = 5'b11111; sys_single_en = 1'b1; end // C11 print
                S40:    begin buffer_read_addr_in = 2'b01; input_array_addr_in = 5'b11111; filter_ceiling_array_addr_in = 5'b11111; sys_single_en = 1'b1; end // C12 print
                S41:    begin buffer_read_addr_in = 2'b10; input_array_addr_in = 5'b11111; filter_ceiling_array_addr_in = 5'b11111; sys_single_en = 1'b1; end // C21 print
                S42:    begin buffer_read_addr_in = 2'b11; input_array_addr_in = 5'b11111; filter_ceiling_array_addr_in = 5'b11111; sys_single_en = 1'b1; end // C22 print

                default:state = S0;
            endcase
            end
	end


    always @ (toggle_single or right or start) 
    begin
        if (toggle_single) begin
            case (state)
                S39: begin // C11 buffer read
                    if (right) next_state = S42;
                    // else if (left) next_state = S42;
                    else next_state = S39;            
                end

                S40: begin // C12 buffer read
                    if (right) next_state = S39;
                    // else if (left) next_state = S39;
                    else next_state = S40;            
                end

                S41: begin // C21 buffer read
                    if (right) next_state = S40;
                    // else if (left) next_state = S40;
                    else next_state = S41;            
                end

                S42: begin // C22 buffer read
                    if (right) next_state = S41;
                    // else if (left) next_state = S41;
                    else next_state = S42;            
                end
                default: next_state = S39;
            endcase
        end

        else begin
            case (state)
                S0: begin 
                    if (start == 1'b1)
                        next_state = S1; // Ready state
                    else
                        next_state = S0;
                end

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
                S13: next_state = S14;
                S14: next_state = S15;
                S15: next_state = S16;
                S16: next_state = S17;
                S17: next_state = S18;
                S18: next_state = S19;
                S19: next_state = S20;
                S20: next_state = S21;
                S21: next_state = S22;
                S22: next_state = S23;
                S23: next_state = S24;
                S24: next_state = S25;
                S25: next_state = S26;
                S26: next_state = S27;
                S27: next_state = S28;
                S28: next_state = S29;
                S29: next_state = S30;
                S30: next_state = S31;
                S31: next_state = S32;
                S32: next_state = S33;
                S33: next_state = S34;
                S34: next_state = S35;
                S35: next_state = S36;
                S36: next_state = S37;

                S37: next_state = S37;

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