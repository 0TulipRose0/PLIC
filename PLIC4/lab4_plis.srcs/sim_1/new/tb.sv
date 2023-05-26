`timescale 1ns / 1ps
module tb();

logic CLOCK_50;
	logic [9:0] SW;
	logic [1:0] KEY;
	logic [9:0] LEDR;

shift_reg reg0 (

.SW(SW), 
.KEY(KEY),  
.LEDR(LEDR), 
.HEX1(), 
.HEX0(), 
.CLOCK_50(CLOCK_50)
);

parameter PERIOD = 20.0;
initial forever begin
      #(PERIOD/2) CLOCK_50 = 1'b1;
      #(PERIOD/2) CLOCK_50= 1'b0;
end

initial begin
#10
KEY[1] = 0;
#10
KEY[1] = 1;
end

initial forever begin

SW = 10'd1;
KEY[0] = 1;
#100000
KEY[0] = 0;
#100000
KEY[0] = 1;
#100000
KEY[0] = 0;
#100000
KEY[0] = 1;
#100000
KEY[0] = 0;
#100000

SW = 10'd0;
KEY[0] = 1;
#100000
KEY[0] = 0;
#100000
KEY[0] = 1;
#100000
KEY[0] = 0;
#100000
KEY[0] = 1;
#100000
KEY[0] = 0;
end

endmodule
