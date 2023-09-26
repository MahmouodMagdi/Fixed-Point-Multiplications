module array_multiplier_tb #(    
    
    parameter Operand_Width = 4,
              Product_Width = 8 
              
)();


// Test Bench Pins
logic [Operand_Width - 1 : 0] Multiplicand_tb;
logic [Operand_Width - 1 : 0] Multiplier_tb; 
wire  [Product_Width - 1 : 0] Product_tb;


// Instantiate the module into the test bench
array_multiplier #(

    .Operand_Width (Operand_Width),
    .Product_Width (Product_Width)
              
) UUT (
    
    .Multiplicand (Multiplicand_tb),                // a
    .Multiplier   (Multiplier_tb),                  // b
    .Product      (Product_tb)  

);

// Apply input vectors
initial
begin
        logic [8:0] value;
        for (value = 0; value < 256; value = value + 1)
        begin
            {Multiplicand_tb, Multiplier_tb} = value [8:0];
            #10 $display ("a = %d, b = %d, Product = %d", Multiplicand_tb, Multiplier_tb, Product_tb);
        end
end

endmodule
