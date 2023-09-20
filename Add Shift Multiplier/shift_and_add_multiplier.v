module add_shift_mult #(

    parameter Operand_Width = 8,
              Product_Width = 16,
              Count_Value   = 8'h8

) (
    
    input   wire [Operand_Width - 1: 0] Operand_1,
    input   wire [Operand_Width - 1: 0] Operand_2,
    input   wire                        start,
    output  wire [Product_Width - 1: 0] product,
    output  reg                         Done

);

reg [Product_Width - 1 : 0] Product;
reg [Operand_Width - 1 : 0] Counter;


always @(posedge start) begin

    Product[Product_Width - 1 : Operand_Width] = 8'b00000000;
    Product[Operand_Width - 1 :0] = Operand_2;
    Counter      = Count_Value;

    if ( (Operand_1 != 0) && (Operand_2 != 0) ) begin

        while (Counter) begin

            if (Product[0] == 1'b0) begin

                Product = {Product[Product_Width - 1], Product[Product_Width - 1 : 1]};
                Counter = Counter - 1;
                Done    = 1'b0;

            end 
            
            else begin

                if (Operand_1[Operand_Width - 1] == 1)                                                  // Both Operands are negative numbers
                begin
                    Product = {1'b0, (Operand_1 + Product[Product_Width - 1 : Operand_Width]), Product[Operand_Width - 1 : 1]};
                    Counter = Counter - 1;
                    Done    = 1'b0; 
                end 

                else
                begin
                    Product = {Operand_1[Operand_Width - 1], (Operand_1 + Product[Product_Width - 1 : Operand_Width]), Product[Operand_Width - 1 : 1]};
                    Counter = Counter - 1;
                    Done    = 1'b0; 
                end

            end
        end

    end 
    else begin
        Product = 16'b0000000000000000;
        Done    = 1'b1;
    end

end
    assign product = Product;
endmodule