module bin2dec_4(

    input logic  [4:0] Vin,    
    input logic        rst_a,
    input logic        KEY,
    
    output logic [6:0] HEX0, HEX1, HEX2
    
);
    
    logic [4:0] counter;
     
    always_comb begin
    if(~rst_a) counter = 0;    
    if(~KEY) counter = counter + 1;        
    end
    
    always_comb begin
        if(counter > 'd9 && counter < 'd13) HEX1 = 7'b1111_001;
        else HEX1 = 7'b1000_000;
    end
    
    always_comb begin
        if(counter < 'd13) HEX2 = 7'b1000_000;
        else HEX2 = 7'b1111_001;
    end
    
    always_comb begin
		case(counter)	
		
				5'b00000:   HEX0 = 7'b1000_000;
				5'b00001:	HEX0 = 7'b1111_001;
				5'b00010:	HEX0 = 7'b0100_100;
				5'b00011:	HEX0 = 7'b0110_000;
				5'b00100:	HEX0 = 7'b0011_001;
				5'b00101:	HEX0 = 7'b0010_010;
				5'b00110:   HEX0 = 7'b0000_010;
				5'b00111:	HEX0 = 7'b1111_000;
				5'b01000:	HEX0 = 7'b0000_000;
				5'b01001:	HEX0 = 7'b0010_000;				
				5'b01010:	HEX0 = 7'b1000_000;				            
                5'b01011:   HEX0 = 7'b1111_001;				            
                5'b01100:   HEX0 = 7'b0100_100;
                
                5'b01101:   HEX0 = 7'b1000_000;
				5'b01110:	HEX0 = 7'b1111_001;
				5'b01111:	HEX0 = 7'b0100_100;
				5'b10000:	HEX0 = 7'b0110_000;
				5'b10001:	HEX0 = 7'b0011_001;
				5'b10010:	HEX0 = 7'b0010_010;
				5'b10011:   HEX0 = 7'b0000_010;
                
					
				default:    HEX0 = 7'b1000_000;
				
			endcase
	
	end	
	
endmodule
