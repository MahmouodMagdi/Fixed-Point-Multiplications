# Array Multiplier


A hardware array multiplier that permits a very high speed multiply operation for unsigned operands and positive signed operands is presented in this section. 

* For signed operands, the multiplier must be **positive** — the multiplicand can be positive or negative. 

* The multiplication of two n-bit operands generates a product of 2n bits.

* The sequential add-shift technique requires **less hardware**, but is relatively **slow** when compared to the array multiplier method. 

In the sequential add-shift method:
1. multiplication of the multiplicand by a 1 bit in the multiplier simply copies the multiplicand.
2. If the multiplier bit is a 1, then the multiplicand is entered in the appropriately shifted position as a partial product to be added to other partial products to form the product.
3. If the multiplier bit is 0, then 0s are entered as a partial product

Although the array multiplier method is applicable to any size operands, an example will be presented that uses two 4-bit operands as shown in the following figure: 

![image](https://github.com/MahmouodMagdi/Fixed-Point-Multiplications/assets/72949261/e957f9b3-7955-4516-ac5e-f76948eb07a8)


The *multiplicand* is a [3:0] = a3 a2 a1 a0 and the *multiplier* is b[3:0] = b3 b2 b1 b0, where a0 and b0 are the low-order bits of A and B, respectively.

1. Each bit in the multiplicand is multiplied by the low-order bit, b0, of the multiplier. This is equivalent to the AND function and generates the first of three partial products.
2. Each bit in the multiplicand is then multiplied by bit b1 of the multiplier.
3. The resulting partial product is shifted left one bit position.
4. The process is repeated for bit b2 and bit b3 of the multiplier.
5. The partial products are then added together to form the product.
6. A carry-out of any column is added to the appropriate next higher-order column.



The array multiplier described in this repo assumes that the multiplier is positive, although multipliers can be designed that utilize both positive and negative operands based on a method proposed by Baugh and Wooley.


An example is shown in the following figure with a **positive multiplicand** and a **positive multiplier** using the paper-and pencil method. 
Since the multiplicand is positive, the partial products are zero extended to the left to accommodate the 2n bits. 

![image](https://github.com/MahmouodMagdi/Fixed-Point-Multiplications/assets/72949261/08eff3c6-b1d9-4a0f-9d46-082d91e54a19)


---


The following figure uses a **negative multiplicand** and a **positive multiplier**. In this example, the partial products extend the negative sign left to accommodate 2n bits: 

![image](https://github.com/MahmouodMagdi/Fixed-Point-Multiplications/assets/72949261/c46629e8-ecae-4abc-891b-f6c8e5c6f245)


The following full adder shown in will be used in the array multiplier as the planar array elements for two 4-bit operands.

![image](https://github.com/MahmouodMagdi/Fixed-Point-Multiplications/assets/72949261/4713d189-debc-475f-b80f-a1d942ecffbb)

---

## The Array Multiplication Algorithm Hardware Circuit:

![image](https://github.com/MahmouodMagdi/Fixed-Point-Multiplications/assets/72949261/e86b3663-6088-4c53-81d7-881370395279)

