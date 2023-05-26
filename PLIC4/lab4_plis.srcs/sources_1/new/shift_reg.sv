module shift_reg (SW, KEY,  LEDR, HEX1, HEX0, CLOCK_50);

	input logic [9:0] SW;
	input logic [1:0] KEY;
	input logic CLOCK_50;
	
	output logic [9:0] LEDR;
	output logic [6:0] HEX1, HEX0;
	
	logic [3:0] counter_1;
	logic [3:0] counter_2;
	logic [2:0] sync_reg = 0;
	logic key_press;
	
	
	always_ff @(posedge CLOCK_50) begin
	
		sync_reg[2] <= !KEY[0];
		sync_reg[1] <= sync_reg[2];
		sync_reg[0] <= sync_reg[1];
		
		
		
	end
	
	assign key_press = sync_reg[1]&(!sync_reg[0]);

	always_ff @(posedge CLOCK_50 or negedge KEY[1]) begin
		
		if (!KEY[1]) begin
		
			LEDR = 9'd0;
			counter_1 = 4'd0;
			counter_2 = 4'd0;
			
		end else begin
		
		if (key_press) begin
		
			if (^LEDR) begin
				
				if (counter_1 != 4'd9)
				
					counter_1 = counter_1 + 1;
					
				else
				
					if (counter_2 != 4'd9) begin
					
						counter_1 = 4'd0;
						counter_2 = counter_2 + 1;
						
					end else begin 
					
					counter_1 = 4'd0; 
					counter_2 = 4'd0;
					
				end
			end
			
			LEDR = {LEDR[8:0],SW[0]};
	
		end
		end
	end
    
always_ff @(posedge CLOCK_50) begin
	
		case(counter_1)	
		
				4'b0000:    HEX0 <= 7'b1000_000;
				4'b0001:	HEX0 <= 7'b1111_001;
				4'b0010:	HEX0 <= 7'b0100_100;
				4'b0011:	HEX0 <= 7'b0110_000;
				4'b0100:	HEX0 <= 7'b0011_001;
				4'b0101:	HEX0 <= 7'b0010_010;
				4'b0110:    HEX0 <= 7'b0000_010;
				4'b0111:	HEX0 <= 7'b1111_000;
				4'b1000:	HEX0 <= 7'b0000_000;
				4'b1001:	HEX0 <= 7'b0010_000;
				
				4'b1110:	HEX0 <= 7'b0000_110; //E
				4'b1111:	HEX0 <= 7'b0101_111; //r
					
				default:    HEX0 <= 7'b1111_111;
				
			endcase
	
	end

always_ff @(posedge CLOCK_50) begin
	
		case(counter_2)	
		
				4'b0000:    HEX1 <= 7'b1000_000;
				4'b0001:	HEX1 <= 7'b1111_001;
				4'b0010:	HEX1 <= 7'b0100_100;
				4'b0011:	HEX1 <= 7'b0110_000;
				4'b0100:	HEX1 <= 7'b0011_001;
				4'b0101:	HEX1 <= 7'b0010_010;
				4'b0110:    HEX1 <= 7'b0000_010;
				4'b0111:	HEX1 <= 7'b1111_000;
				4'b1000:	HEX1 <= 7'b0000_000;
				4'b1001:	HEX1 <= 7'b0010_000;
				
				4'b1110:	HEX1 <= 7'b0000_110; //E
				4'b1111:	HEX1 <= 7'b0101_111; //r
					
				default:    HEX1 <= 7'b1111_111;
				
			endcase
	
	end

endmodule