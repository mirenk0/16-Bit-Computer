// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

// Pseudo-Code
// i = R1
// while i>0
// R2 += R0
// i -= 1
// return R2

@R1
D = M   // load R1 into D

@i
M = D   // set counter to R1

@product
M=0     // set starting product as 0

(LOOP)  // while i > 0
@i
D = M

@END    // go to end if otherwise
D;JEQ

@R0           // set R0
D = M

@product      // add R0 and product
M = D + M

@i            // Subtract R1 or counter
M = M - 1

@LOOP         // Go back to loop 
0;JMP

(END)         // End label
@product      // load product to D
D = M

@R2           // R2 is equal to product, which is final result
M = D

@END         
0;JMP         // secured end of program

