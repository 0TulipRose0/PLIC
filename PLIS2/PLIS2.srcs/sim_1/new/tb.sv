`timescale 1ns / 1ps
module tb();

//enum logic {
//             KEY0 = 1'b0,
//             KEY1 = 1'b1,
//             KEY2 = 1'b0,
//             KEY3 = 1'b0,
//             KEY4 = 1'b0,
//             KEY5 = 1'b0,
//             KEY6 = 1'b0
//                 } switches;
                 
logic SW9, clkin;
logic KEY0;
logic KEY1;
logic KEY2;
logic KEY3;
logic KEY4;
logic KEY5;
logic KEY6;

lab2 diodiki(
 .SW9(SW9),  
 .clkin(clkin),                                 
 .KEY0(KEY0), 
 .KEY1(KEY1), 
 .KEY2(KEY2), 
 .KEY3(KEY3), 
 .KEY4(KEY4), 
 .KEY5(KEY5), 
 .KEY6(KEY6),
 .HEX0(), 
 .HEX1(), 
 .HEX2(), 
 .HEX3(), 
 .HEX4(), 
 .HEX5(), 
 .HEX6()
);

//инициализация тактирования в 40МГц
parameter PERIOD = 25.0;
initial forever begin
      #(PERIOD/2) clkin = 1'b1;
      #(PERIOD/2) clkin = 1'b0;
end

initial begin
KEY1 = 1'b0;
SW9 = 1'b1;
#100
SW9 = 1'b0;
#100
KEY1 = 1'b1;
KEY2 = 1'b0;
SW9 = 1'b1;
end

endmodule
