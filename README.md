# Fixed-Point-Multiplications
Several methods are presented in this repository to multiply signed and unsigned operands, including the sequential add-shift method, the Booth algorithm, and an array multiplier.

The n-bit multiplicand A is multiplied by the n-bit multiplier B to produce a 2n-bit product, as shown below:

a. **Multiplicand**: A = an  – 1 an  – 2 an  – 3 . . . a1 a0
b. **Multiplier**:   B = bn  – 1 bn  – 2 bn  – 3 . . . b1 b0
c. **Product**:      P = p2n – 1 p2n – 2 p2n – 3 . . . p1 p0

Multiplication is multiplying the multiplicand by the multiplier to produce a product. The general procedure consists of scanning the multiplier from the low-order bit to the high-order bit. If the multiplier bit is a 1, the multiplicand becomes the partial product; if the multiplier bit is a 0, then 0s are entered as the partial product. Each partial product is then shifted left one bit relative to the previous one.

When all of the partial products are obtained, the partial products are then added to produce the 2n-bit product. The sign of the product is a function of the signs of the operands. If both operands have the same sign, then the sign of the product is positive. If the signs of the operands are different, then the sign of the product is negative.

# 1. Sequential Add-Shift Multiplication
 **Example 1**: Let the multiplicand and multiplier be two positive 4-bit operands as shown below, where a[3:0] = 0111 (+7) and b[3:0] = 0101 (+5) to produce a product p[7:0] = 0010 0011 (+35). A multiplier bit of 1 copies the multiplicand to the partial product; a multiplier bit of 0 enters 0s in the partial product.
 
 ![image](https://github.com/MahmouodMagdi/Fixed-Point-Multiplications/assets/72949261/b8fad753-7c3d-4a60-b825-6dae91352614)

 
**Example 2**: The multiplicand is a[3:0] = 0101 (+5); the multiplier is b[3:0] = 1101 (–3). The product should be –15; however, since the multiplier is treated as an unsigned number (1101 = 13), the result is 01000001 (65).
![image](https://github.com/MahmouodMagdi/Fixed-Point-Multiplications/assets/72949261/ae1a4fa3-51b5-4e6d-ab95-162a5686da24)


# 1.1  Sequential Add-Shift Multiplication Hardware Algorithm
* In this method, the multiplier must be positive. If the multiplier is negative, then the purpose of the multiplier bits is not always the same during the generation of the partial products. Any low-order 0s and the first 1 bit are treated the same as for a positive multiplier; however, the remaining higher-order bits are complemented and have an inverse effect. If the multiplier is negative, then it can be 2s complemented, leaving the multiplicand either positive or negative. 

* An alternative approach is to 2s complement both the multiplicand and multiplier if the multiplier is negative. This is equivalent to multiplying both operands by –1 but does not change the sign of the product.

* The organization of a sequential add-shift multiplier is shown below:
  
![image](https://github.com/MahmouodMagdi/Fixed-Point-Multiplications/assets/72949261/5fa3d7e9-6453-4f86-8ebc-c2b70481dee9)

* Register A contains the n-bit multiplicand, register C contains the carry-out of the adder, register D contains the high-order half of the 2n-bit product, and register B contains the n-bit multiplier.
* Registers C, D, and B shift right one-bit position in concatenation per cycle.
* After the sum and carry have been loaded into their respective registers, the following right shift occurs, where the symbol (•) indicates concatenation:
  
  ![image](https://github.com/MahmouodMagdi/Fixed-Point-Multiplications/assets/72949261/f11e9b50-9abc-46c8-9598-77d19206f796)

* shifting each partial product right one-bit position is equivalent to shifting the partial product left one-bit position in the paper-and-pencil method.
* Operands of n-bits require n cycles. The adder is designed using the carry lookahead technique.
* There is also a sequence counter that determines when the multiplication is finished.
* During each cycle, the low-order bit b0 of the multiplier determines whether the multiplicand is added to the partial product. If b0 = 1, then the multiplicand is added to the partial product in register D; if b0 = 0, then 0s are added to the partial product.
* In both cases, the sum from the adder is loaded into the D register and the carry-out is loaded into the 1-bit C register. After the operation, the high-order half of the product resides in register D = dn–1 . . . d0 and the low-order half of the product resides in register B = bn–1 . . . b0.

**Example 1.2 a**: Multiplication algorithm for positive operands

![image](https://github.com/MahmouodMagdi/Fixed-Point-Multiplications/assets/72949261/ecd1a874-515b-4964-82c0-55574292c170)


**Example 1.2 b**: Multiplication algorithm for a negative multiplicand and a positive multiplier

![image](https://github.com/MahmouodMagdi/Fixed-Point-Multiplications/assets/72949261/041b8b99-923f-41ad-90d5-9cc2a8e1c160)

