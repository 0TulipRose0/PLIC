module bin2dec(
    input [3:0] SW,
	output logic [6:0] HEX3,HEX2,HEX1,HEX0
	);
	logic z;
	assign z = SW > 4'b1001;
	
	always @(*)
	begin
		if (z == 1) begin
			HEX0 <= 7'b1000_000;
			HEX1 <= 7'b1000_000;
			HEX2 <= 7'b1000_000;
			HEX3 <= 7'b1000_000;
			end
		else
			case (SW)
			
				4'b0000: begin	
				HEX0 <= 7'b1000_000; 
				HEX1 <= 7'b1000_000; 
				HEX2 <= 7'b1000_000; 
				HEX3 <= 7'b1000_000;
				end
				4'b0001:	begin 
				HEX0 <= 7'b1111_001; 
				HEX1 <= 7'b1000_000;	
				HEX2 <= 7'b1000_000; 
				HEX3 <= 7'b1000_000; 
				end
				4'b0010: begin	
				HEX0 <= 7'b1000_000; 
				HEX1 <= 7'b1111_001; 
				HEX2 <= 7'b1000_000; 
				HEX3 <= 7'b1000_000;
				end
			   4'b0011: begin	
				HEX0 <= 7'b1111_001; 
				HEX1 <= 7'b1111_001; 
				HEX2 <= 7'b1000_000; 
				HEX3 <= 7'b1000_000;
				end
				
				4'b0100: begin	
				HEX0 <= 7'b1000_000; 
				HEX1 <= 7'b1000_000; 
				HEX2 <= 7'b1111_001; 
				HEX3 <= 7'b1000_000;
				end
				4'b0101: begin	
				HEX0 <= 7'b1111_001; 
				HEX1 <= 7'b1000_000; 
				HEX2 <= 7'b1111_001; 
				HEX3 <= 7'b1000_000;
				end
				4'b0110: begin	
				HEX0 <= 7'b1000_000; 
				HEX1 <= 7'b1111_001; 
				HEX2 <= 7'b1111_001; 
				HEX3 <= 7'b1000_000;
				end
				4'b0111: begin	
				HEX0 <= 7'b1111_001; 
				HEX1 <= 7'b1111_001; 
				HEX2 <= 7'b1111_001; 
				HEX3 <= 7'b1000_000;
				end
				4'b1000: begin	
				HEX0 <= 7'b1000_000; 
				HEX1 <= 7'b1000_000; 
				HEX2 <= 7'b1000_000; 
				HEX3 <= 7'b1111_001;
				end
				
				4'b1001: begin	
				HEX0 <= 7'b1111_001; 
				HEX1 <= 7'b1000_000; 
				HEX2 <= 7'b1000_000; 
				HEX3 <= 7'b1111_001;
				end
				
				default: 
				begin
				HEX0 <= 7'b1000_000;
				HEX1 <= 7'b1000_000;
				HEX2 <= 7'b1000_000;
				HEX3 <= 7'b1000_000;
				end
			
			endcase
		
		
	end
	
endmodule