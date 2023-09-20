module Booth_Multiplier #(
    parameter Operand_Width = 8,
              Product_Width = 16
) (

    input  wire [Operand_Width - 1 : 0] Multiplicand,
    input  wire [Operand_Width - 1 : 0] Multiplier,
    output wire [Product_Width - 1 : 0] Product
);

wire [Operand_Width - 1 : 0] a_bar;                                                         // 1’s Complement of the multiplicand 
wire [Product_Width - 1 : 0] Extended_Positive, Extended_Negative;                          // Extended Sign  of the Multiplicand and Extended Sign Multiplicand Negation
reg  [Operand_Width - 1 : 0] a_negation;                                                    // 2’s Complement of the multiplicand 
reg  [Product_Width - 1 : 0] PP1, PP2, PP3, PP4, PP5, PP6, PP7, PP8;

// 1’s Complement of the multiplicand 
assign a_bar = ~Multiplicand;

// 2’s Complement of the multiplicand 
always @(a_bar) begin
    a_negation <= a_bar + 1;
end


// Extended Signs Multiplicand and its negation
assign Extended_Positive = {{8{Multiplicand[7]}}, Multiplicand};                          
assign Extended_Negative = {{8{a_negation[7]}}, a_negation};


// Behavioral Modelling of the Booth Algorithm 
always @(Multiplier or Extended_Positive or Extended_Negative) begin

    case (Multiplier[1:0])

        2'b00: begin
            PP1 = 16'b0;
            PP2 = 16'b0;
        end 

        2'b01: begin
            PP1 = Extended_Negative;
            PP2 = {{7{Multiplicand[7]}}, Multiplicand, 1'b0};
        end 

        2'b10: begin
            PP1 = 16'b0;
            PP2 = {Extended_Negative[14:0],1'b0};
        end 

        2'b11: begin
            PP1 = Extended_Negative;
            PP2 = 16'b0;
        end 
                
        default: begin  
                    PP1 = 16'b0;
                    PP2 = 16'b0; 
                 end
    endcase

    
    case (Multiplier[2:1])
        2'b00: PP3 = 16'b0;
        2'b01: PP3 = {Extended_Positive[13:0], 2'b00};
        2'b10: PP3 = {Extended_Negative[13:0], 2'b00};
        2'b11: PP3 = 16'b0;
        default: PP3 = 16'b0;
    endcase


    case (Multiplier[3:2])
        2'b00: PP4 = 16'b0;
        2'b01: PP4 = {Extended_Positive[12:0], 3'b000};
        2'b10: PP4 = {Extended_Negative[12:0], 3'b000};
        2'b11: PP4 = 16'b0;
        default: PP4 = 16'b0;
    endcase



    case (Multiplier[4:3])
        2'b00: PP5 = 16'b0;
        2'b01: PP5 = {Extended_Positive[11:0], 4'b0000};
        2'b10: PP5 = {Extended_Negative[11:0], 4'b0000};
        2'b11: PP5 = 16'b0;
        default: PP5 = 16'b0;
    endcase



    case (Multiplier[5:4])
        2'b00: PP6 = 16'b0;
        2'b01: PP6 = {Extended_Positive[10:0], 5'b00000};
        2'b10: PP6 = {Extended_Negative[10:0], 5'b00000};
        2'b11: PP6 = 16'b0;
        default: PP6 = 16'b0;
    endcase


    case (Multiplier[6:5])
        2'b00: PP7 = 16'b0;
        2'b01: PP7 = {Extended_Positive[9:0], 6'b000000};
        2'b10: PP7 = {Extended_Negative[9:0], 6'b000000};
        2'b11: PP7 = 16'b0;
        default: PP7 = 16'b0;
    endcase


    case (Multiplier[7:6])
        2'b00: PP8 = 16'b0;
        2'b01: PP8 = {Extended_Positive[8:0], 7'b000000};
        2'b10: PP8 = {Extended_Negative[8:0], 7'b000000};
        2'b11: PP8 = 16'b0;
        default: PP8 = 16'b0;
    endcase

end

assign Product = PP1 + PP2 + PP3 + PP4 + PP5 + PP6 + PP7 + PP8;
endmodule