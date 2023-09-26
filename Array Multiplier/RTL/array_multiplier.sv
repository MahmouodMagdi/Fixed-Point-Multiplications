`include "Full_adder.sv"

module array_multiplier #(

    parameter Operand_Width = 4,
              Product_Width = 8
              
) (
    
    input   wire logic [Operand_Width - 1 : 0] Multiplicand,                // a
    input   wire logic [Operand_Width - 1 : 0] Multiplier,                  // b
    output  wire logic [Product_Width - 1 : 0] Product

);


wire W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, 
     W14, W15, W16, W17, W18, W19, W20, W21, W22, W23, W24, W25, 
     W26, W27, W28, W29, W30, W31, W32, W33, W34, W35, W36, W37, 
     W38, W39;

// Multiplicand[0] * All Multiplier bits 
assign W0  = Multiplicand[0] && Multiplier[0];                              // a[0] * b[0] = Product[0]
assign W1  = Multiplicand[0] && Multiplier[1];                              // a[0] * b[1]
assign W2  = Multiplicand[0] && Multiplier[2];                              // a[0] * b[2]
assign W3  = Multiplicand[0] && Multiplier[3];                              // a[0] * b[3]


// Multiplicand[1] * All Multiplier bits 
assign W4  = Multiplicand[1] && Multiplier[0];                              // a[1] * b[0]
assign W5  = Multiplicand[1] && Multiplier[1];                              // a[1] * b[1]
assign W6  = Multiplicand[1] && Multiplier[2];                              // a[1] * b[2]
assign W7  = Multiplicand[1] && Multiplier[3];                              // a[1] * b[3]

// Multiplicand[2] * All Multiplier bits 
assign W8  = Multiplicand[2] && Multiplier[0];                              // a[2] * b[0]
assign W9  = Multiplicand[2] && Multiplier[1];                              // a[2] * b[1]
assign W10 = Multiplicand[2] && Multiplier[2];                              // a[2] * b[2]
assign W11 = Multiplicand[2] && Multiplier[3];                              // a[2] * b[3]


assign W12 = Multiplicand[3] && Multiplier[0];                              // a[3] * b[0]
assign W13 = Multiplicand[3] && Multiplier[1];                              // a[3] * b[1]
assign W14 = Multiplicand[3] && Multiplier[2];                              // a[3] * b[2]
assign W15 = Multiplicand[3] && Multiplier[3];                              // a[3] * b[3]





Full_adder FA0(
    
        .in_1 (W1)  ,                                                       // a[0] * b[1]
        .in_2 (W4)  ,                                                       // a[1] * b[0]
        .c_in (0)   ,
        .Sum  (W16) ,                                                       // Product[1] = (a[0] * b[1]) ^ (a[1] * b[0]) ^ 0
        .c_out(W17)                                                         

);

Full_adder FA1(
    
        .in_1 (W5)  ,                                                       // a[1] * b[1]                                                          
        .in_2 (W8)  ,                                                       // a[2] * b[0]
        .c_in (0)   ,
        .Sum  (W18) ,                                                       // (a[1] * b[1]) ^ (a[2] * b[0]) ^ 0
        .c_out(W19) 

);

Full_adder FA2(
    
        .in_1 (W2)  ,                                                       //  a[0] * b[2]         
        .in_2 (W18) ,                                                       // (a[1] * b[1]) ^ (a[2] * b[0]) ^ 0              
        .c_in (W17) ,                   
        .Sum  (W20) ,                                                       // Product[2] = (a[0] * b[2]) ^ ((a[1] * b[1]) ^ (a[2] * b[0]) ^ 0) ^ W17
        .c_out(W21) 

);


Full_adder FA3(
    
        .in_1 (W9)  ,                                                       // a[2] * b[1]
        .in_2 (W12) ,                                                       // a[3] * b[0]
        .c_in (0)   ,
        .Sum  (W22) ,                                                       // (a[2] * b[1]) ^ (a[3] * b[0]) ^ 0
        .c_out(W23) 

);


Full_adder FA4(
    
        .in_1 (W6)  ,                                                       // a[1] * b[2]
        .in_2 (W22) ,                                                       // (a[2] * b[1]) ^ (a[3] * b[0]) ^ 0
        .c_in (W19) ,
        .Sum  (W24) ,                                                       // (a[1] * b[2]) ^ ((a[2] * b[1]) ^ (a[3] * b[0]) ^ 0) ^ W19
        .c_out(W25) 

);


Full_adder FA5(
    
        .in_1 (W3)  ,                                                       // a[0] * b[3]
        .in_2 (W24) ,                                                       // (a[1] * b[2]) ^ (a[2] * b[1]) ^ (a[3] * b[0])
        .c_in (W21) ,                                                       
        .Sum  (W26) ,                                                       // Product[3] = (a[0] * b[3]) ^ (a[1] * b[2]) ^ (a[2] * b[1]) + (a[3] * b[0]) ^ W21
        .c_out(W27) 

);


Full_adder FA6(
    
        .in_1 (W10) ,                                                       // a[2] * b[2]                                           
        .in_2 (W13) ,                                                       // a[3] * b[1]
        .c_in (W23) ,                                                   
        .Sum  (W28) ,                                                       // (a[2] * b[2]) ^ (a[3] * b[1]) ^ W23
        .c_out(W29) 

);


Full_adder FA7(
    
        .in_1 (W7)  ,                                                       // a[1] * b[3]
        .in_2 (W28) ,                                                       // (a[2] * b[2]) ^ (a[3] * b[1]) ^ W23
        .c_in (W25) ,
        .Sum  (W30) ,                                                       // (a[1] * b[3]) ^ ((a[2] * b[2]) ^ (a[3] * b[1]) ^ W23) ^ W25
        .c_out(W31) 

);


Full_adder FA8(
    
        .in_1 (0)   ,
        .in_2 (W30) ,                                                       // (a[1] * b[3]) ^ (a[2] * b[2]) ^ (a[3] * b[1])
        .c_in (W27) ,
        .Sum  (W32) ,                                                       // Product[4] = (a[1] * b[3]) ^ (a[2] * b[2]) ^ (a[3] * b[1]) ^ 0 ^ W27 
        .c_out(W33) 

);


Full_adder FA9(
    
        .in_1 (W11) ,                                                       // a[2] * b[3]
        .in_2 (W14) ,                                                       // a[3] * b[2]
        .c_in (W29) ,
        .Sum  (W34) ,                                                       // (a[2] * b[3]) ^ (a[3] * b[2]) ^ W29
        .c_out(W35) 

);


Full_adder FA10(
    
        .in_1 (W33) ,
        .in_2 (W34) ,                                                       // (a[2] * b[3]) ^ (a[3] * b[2])
        .c_in (W31) ,
        .Sum  (W36) ,                                                       // Product[5] = (a[2] * b[3]) ^ (a[3] * b[2]) ^ W31
        .c_out(W37) 

);

Full_adder FA11(
    
        .in_1 (W15) ,                                                       // a[3] * b[3]
        .in_2 (W37) ,                                                       
        .c_in (W35) ,
        .Sum  (W38) ,                                                       // Product[6] = (a[3] * b[3]) ^ W15 ^ W35
        .c_out(W39)                                                         // Product[7]

);

assign Product = {W39, W38, W36, W32, W26, W20, W16, W0};

endmodule