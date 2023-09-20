# Fixed-Point-Multiplications
Several methods are presented in this repository to multiply signed and unsigned operands, including the sequential add-shift method, the Booth algorithm, and an array multiplier.

The n-bit multiplicand A is multiplied by the n-bit multiplier B to produce a 2n-bit product, as shown below:

1. **Multiplicand**: A = an  – 1 an  – 2 an  – 3 . . . a1 a0
2. **Multiplier**:   B = bn  – 1 bn  – 2 bn  – 3 . . . b1 b0
3. **Product**:      P = p2n – 1 p2n – 2 p2n – 3 . . . p1 p0

Multiplication is multiplying the multiplicand by the multiplier to produce a product. The general procedure consists of scanning the multiplier from the low-order bit to the high-order bit. If the multiplier bit is a 1, the multiplicand becomes the partial product; if the multiplier bit is a 0, then 0s are entered as the partial product. Each partial product is then shifted left one bit relative to the previous one.

When all of the partial products are obtained, the partial products are then added to produce the 2n-bit product. The sign of the product is a function of the signs of the operands. If both operands have the same sign, then the sign of the product is positive. If the signs of the operands are different, then the sign of the product is negative.
