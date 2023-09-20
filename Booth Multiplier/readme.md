# 2.  Booth Algorithm Multiplication

The Booth algorithm is an effective technique for multiplying operands that are in 2s complement representation, including the case where the multiplier is negative. Unlike the sequential add-shift method, it treats both positive and negative operands uniformly; that is, the multiplicand and multiplier can both be negative or positive or of 
opposite sign as shown below:

![image](https://github.com/MahmouodMagdi/Fixed-Point-Multiplications/assets/72949261/4a99b622-f4a7-4593-966b-170610d1c0df)


* In the sequential add-shift method, each multiplier bit generates a version of the multiplicand that is added to the partial product.
* For large operands, the delay to obtain the product can be significant.
* The Booth algorithm reduces the number of partial products by shifting over strings of zeros in a recoded version of the multiplier.
* This method is referred to as skipping over zeroes. The increase in speed is proportional to the number of zeroes in the recoded version of the multiplier.
