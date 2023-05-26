`timescale 1ns / 1ps
module test();


//воспользовался енамами, чтоб было проще менять параметры)
enum logic [2:0] {a = 3'b001,
                  b = 3'b011,
                  s = 3'b010
                       } zadanie1;

enum logic  {dolgi = 1'b0,
             nalichie_70_ballov = 1'b1
                       } zadanie2;

logic f1, f2, zakrilsa_na_chetire;

lab_1_2 laba11 (

    .a(a),
    .b(b),
    .s(s),
    
    .f1(f1),
    .f2(f2)
    );

lab_1_1 laba12(
    
    .dolgi(dolgi),
    .nalichie_70_ballov(nalichie_70_ballov),
    
    .zakrilsa_na_chetire(zakrilsa_na_chetire)
    );

initial begin
#100
if(zakrilsa_na_chetire) 
$display("Krasavchik"); else 
$display("Nado Staratsa(");
end

endmodule
