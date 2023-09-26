module Full_adder (
    
        input   wire logic in_1,
        input   wire logic in_2,
        input   wire logic c_in,
        output  wire logic Sum,
        output  wire logic c_out

);

assign Sum   = in_1 ^ in_2 ^ c_in;
assign c_out = (in_1 ^ in_2) & c_in | (in_1 & in_2);
    
endmodule 