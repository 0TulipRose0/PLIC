`timescale 1ns / 1ps

logic CLOCK_50;
logic [3:0] KEY;
module tb(  );
    
timer sec (
 
.KEY(KEY),  
.HEX1(), 
.HEX0(),
.HEX2(),
.HEX3(),

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
#100
KEY[0] = 0;
#100
KEY[0] = 1;
end

endmodule
