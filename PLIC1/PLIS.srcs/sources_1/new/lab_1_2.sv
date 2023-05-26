//В прикплённой фотографии будут лог выражения, которые я описал. Чисто случайные придумал
module lab_1_2(
    
    input [2:0] a,
    input [1:0] b,
    input [1:0] s,
    
    output      f1,
    output      f2
    
    
    );
    
    assign f1 = (a[0] & b[0]) & (a[1] & b[1]) + ((a[2] ^ s[0] ^ s[1])&(~s[0]));
    assign f2 = (a[1] & b[0]) & (a[0] & b[1]) + ((a[2] ^ b[0] ^ b[1])&(~s[0] ^ s[1]));
endmodule

    module lab_1_1(
    
    input dolgi,
    input nalichie_70_ballov,
    
    output zakrilsa_na_chetire
    
    );
    
    assign zakrilsa_na_chetire = nalichie_70_ballov & ~dolgi;
    
endmodule
