module Booth_Multiplier_tb #(parameter  Operand_Width = 8,
                                        Product_Width = 16
)();

// Test-Bench Signals 
reg  [Operand_Width - 1 : 0] Multiplicand_tb;
reg  [Operand_Width - 1 : 0] Multiplier_tb;
wire [Product_Width - 1 : 0] Product_tb;

Booth_Multiplier #(

    .Operand_Width(Operand_Width),
    .Product_Width(Product_Width)

) UUT (

    .Multiplicand(Multiplicand_tb),
    .Multiplier  (Multiplier_tb)  ,
    .Product     (Product_tb)  
);


//display operands Multiplicand_tb, Multiplier_tb, and product
initial
begin

$monitor ("Multiplicand_tb = %b, Multiplier_tb = %b, Product_tb = %h", Multiplicand_tb, Multiplier_tb, Product_tb);

    Multiplicand_tb = 8'b0001_1011;
    Multiplier_tb   = 8'b0111_1000;


#10 Multiplicand_tb = 8'b1010_1101;
    Multiplier_tb   = 8'b0011_1110;


#10 Multiplicand_tb = 8'b0100_1010;
    Multiplier_tb   = 8'b1101_1100;


#10 Multiplicand_tb = 8'b1010_0010;
    Multiplier_tb   = 8'b1101_1100;


#10 Multiplicand_tb = 8'b0100_1110;
    Multiplier_tb   = 8'b0010_1011;

//--------------------------------------- Test Multiplier[1:0] ---------------------------------------
#10 Multiplicand_tb = 8'b1100_1100;
    Multiplier_tb   = 8'b1100_1100;


#10 Multiplicand_tb = 8'b1100_1100;
    Multiplier_tb   = 8'b1100_1101;


#10 Multiplicand_tb = 8'b1100_1100;
    Multiplier_tb   = 8'b1100_1110;


#10 Multiplicand_tb = 8'b1100_1100;
    Multiplier_tb   = 8'b1100_1111;



//--------------------------------------- Test Multiplier[2:1] ---------------------------------------
#10 Multiplicand_tb = 8'b0111_1111;
    Multiplier_tb   = 8'b1011_1000;


#10 Multiplicand_tb = 8'b1011_0011;
    Multiplier_tb   = 8'b1100_1011;


#10 Multiplicand_tb = 8'b0111_0000;
    Multiplier_tb   = 8'b0111_0100;


#10 Multiplicand_tb = 8'b0111_0000;
    Multiplier_tb   = 8'b0111_0110;


//--------------------------------------- Test Multiplier[3:2] ---------------------------------------
#10 Multiplicand_tb = 8'b0111_1111;
    Multiplier_tb   = 8'b1011_0000;


#10 Multiplicand_tb = 8'b1011_0011;
    Multiplier_tb   = 8'b1100_0111;


#10 Multiplicand_tb = 8'b0111_0000;
    Multiplier_tb   = 8'b0111_1000;


#10 Multiplicand_tb = 8'b0111_0000;
    Multiplier_tb   = 8'b0111_1110;


//--------------------------------------- Test Multiplier[4:3] ---------------------------------------
#10 Multiplicand_tb = 8'b0111_1111;
    Multiplier_tb   = 8'b1010_0000;


#10 Multiplicand_tb = 8'b1011_0011;
    Multiplier_tb   = 8'b1100_1111;


#10 Multiplicand_tb = 8'b0111_0000;
    Multiplier_tb   = 8'b0111_0000;


#10 Multiplicand_tb = 8'b0111_0000;
    Multiplier_tb   = 8'b0111_1110;


//--------------------------------------- Test Multiplier[5:4] ---------------------------------------
#10 Multiplicand_tb = 8'b0111_1111;
    Multiplier_tb   = 8'b1000_0000;


#10 Multiplicand_tb = 8'b1011_0011;
    Multiplier_tb   = 8'b1101_1111;


#10 Multiplicand_tb = 8'b0111_0000;
    Multiplier_tb   = 8'b0110_0000;

#10 Multiplicand_tb = 8'b0111_0000;
    Multiplier_tb   = 8'b0111_1110;


//--------------------------------------- Test Multiplier[6:5] ---------------------------------------
#10 Multiplicand_tb = 8'b0111_1111;
    Multiplier_tb   = 8'b1000_0000;


#10 Multiplicand_tb = 8'b1011_0011;
    Multiplier_tb   = 8'b1010_1111;


#10 Multiplicand_tb = 8'b0111_0000;
    Multiplier_tb   = 8'b0101_0000;


#10 Multiplicand_tb = 8'b0111_0000;
    Multiplier_tb   = 8'b0111_1110;


//--------------------------------------- Test Multiplier_tb[7:6] ---------------------------------------
#10 Multiplicand_tb = 8'b0111_1111;
    Multiplier_tb   = 8'b0010_0000;


#10 Multiplicand_tb = 8'b1011_0011;
    Multiplier_tb   = 8'b0100_1111;


#10 Multiplicand_tb = 8'b0111_0000;
    Multiplier_tb   = 8'b1011_0000;


#10 Multiplicand_tb = 8'b0111_0000;
    Multiplier_tb   = 8'b1111_1110;

#10 $stop;
end

endmodule