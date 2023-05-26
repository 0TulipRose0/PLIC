module timer(KEY, HEX3, HEX2, HEX1, HEX0, CLOCK_50);

	input [1:0] KEY;
	input CLOCK_50;
	output logic [6:0] HEX3, HEX2, HEX1, HEX0;
	
	logic [3:0] counter_001;
	logic [3:0] counter_01;
	logic [3:0] counter_1;
	logic [3:0] counter_10;
	
	logic [2:0] sync_reg = 0;
	logic button_was_pressed = 0;
	logic device_running = 0;
	
	logic [18:0] pulse_counter;
	
	logic hundredth_of_second_passed;
	assign hundredth_of_second_passed = (pulse_counter == 19'd499999);
	
	logic tenth_of_second_passed;
	assign tenth_of_second_passed = ((counter_001 == 4'd9) & hundredth_of_second_passed);
	
	logic one_of_second_passed;
	assign one_of_second_passed = ((counter_01 == 4'd9) & tenth_of_second_passed);
	
	logic ten_of_second_passed;
	assign ten_of_second_passed = ((counter_1 == 4'd9) & one_of_second_passed);
	
	logic bin_1,bin_2,bin_3,bin_4;
	
	
	always @(posedge CLOCK_50) begin
	
		sync_reg[2] <= !KEY[0];
		sync_reg[1] <= sync_reg[2];
		sync_reg[0] <= sync_reg[1];
		
		button_was_pressed <= sync_reg[1]&(!sync_reg[0]);
		
	end
	

	always_ff @(posedge CLOCK_50 or negedge KEY[1]) begin
		
		if (!KEY[1]) begin
		
			counter_001 <= 4'd0;
			counter_01  <= 4'd0;
			counter_1   <= 4'd0;
			counter_10  <= 4'd0;
			device_running <= 0;
			pulse_counter <= 19'd0;
			
		end 
		else begin
		
			if (button_was_pressed)
			
				device_running <= !device_running;
			
			if (device_running | hundredth_of_second_passed) begin
			
				if (hundredth_of_second_passed) begin
				
					pulse_counter <= 0;
					counter_001 <= counter_001 + 1;
			
				end
				else pulse_counter <= pulse_counter + 1;
				 
				if (tenth_of_second_passed) begin
					counter_001 <= 0;		
					if (counter_01 <= 4'd9) counter_01 <= counter_01 + 1; end
					
									
				if (one_of_second_passed) begin
					counter_01 <= 0;
					if (counter_1 <= 4'd9)  counter_1 <= counter_1 + 1; end
													
				if (ten_of_second_passed) begin
					counter_1 <= 0;
					if (counter_10 <= 4'd9)  counter_10 <= counter_10 + 1; end
			end				
		end		
	end
	

endmodule
