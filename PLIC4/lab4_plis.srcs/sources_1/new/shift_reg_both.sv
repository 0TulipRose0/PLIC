module shift_reg_both (CLK, RST, ISb, EN, OSb, DIR, shift_rg);

	input CLK, RST, EN, DIR, ISb;
	output logic OSb;
	output logic [3:0] shift_rg;
	
	initial shift_rg = 4'b0;
	
	always @(posedge CLK or posedge RST) begin
	
		if (RST) begin shift_rg <= 4'b0; OSb = 1'b0; end
		else
			if (EN) begin
				if (DIR) begin OSb <= shift_rg[3]; shift_rg <= {shift_rg[2:0], ISb}; end
				else begin OSb <= shift_rg[0]; shift_rg <= {ISb,shift_rg[2:0]}; end
			end
			else begin
				OSb <= 1'b0; shift_rg <= shift_rg;
			end
	end
	
endmodule
