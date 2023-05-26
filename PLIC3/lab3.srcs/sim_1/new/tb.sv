`timescale 1ns / 1ps
module tb();

    logic  [4:0] Vin;    
    logic        rst_a;
    logic        KEY;
    
    logic [6:0] HEX0, HEX1, HEX2;

bin2dec_4 mult(.*);


    initial begin
    
    rst_a <= 1;
    #10
    rst_a <= 0;
    #10 
    rst_a <= 1;
    
    #10
    KEY <= 1;
    #10 
    KEY <= 0;
    #10
    KEY <= 1;
    #10 
    KEY <= 0;
    #10
    KEY <= 1;
    #10 
    KEY <= 0;
    #10
    KEY <= 1;
    #10 
    KEY <= 0;
    #10
    KEY <= 1;
    #10 
    KEY <= 0;
    #10
    KEY <= 1;
    #10 
    KEY <= 0;
    #10
    KEY <= 1;
    #10 
    KEY <= 0;
    #10
    KEY <= 1;
    #10 
    KEY <= 0;
    #10
    KEY <= 1;
    #10 
    KEY <= 0;
    #10
    KEY <= 1;
    #10 
    KEY <= 0;
    #10
    KEY <= 1;
    #10 
    KEY <= 0;
    #10
    KEY <= 1;
    #10 
    KEY <= 0;
    #10
    KEY <= 1;
    #10 
    KEY <= 0;
    #10
    KEY <= 1;
    #10 
    KEY <= 0;
    #10
    KEY <= 1;
    #10 
    KEY <= 0;
    #10
    KEY <= 1;
    #10 
    KEY <= 0;
    #10
    KEY <= 1;
    #10 
    KEY <= 0;
    #10
    KEY <= 1;
    #10 
    KEY <= 0;
    #10
    KEY <= 1;
    #10 
    KEY <= 0;
    end 

endmodule
