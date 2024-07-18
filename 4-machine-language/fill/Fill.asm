// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

// if a key is pressed all rows must be filled with black pixels so -1 value, 16 bit 1s
// otherwise if none is pressed (code value is 0) turn all pixels white so 0, 16 bit 0s
//

(Start)     // start condition, reset counter to 8192 and set address to first pixel
  @SCREEN 
  D = A

  @addr
  M = D

  @8192     // (256 rows * 32 ~ total pixels in screen 16-bit)
  D = A
  
  @pixels
  M = D

(CHECK)    
  @pixels  // check if there are pixels left to paint 
  D = M
  @START
  D;JEQ

  @KBD     // get keyboard input RAM[24576]
  D = M

  @BLACKD
  D;JNE

  @BLANKD
  D;JEQ

  (BLACKD)
  @addr
  A = M
  M = -1

  @addr
  M = M + 1

  @pixels
  M = M - 1

  @CHECK
  0;JMP

  (BLANKD)
  @addr 
  A = M
  M = 0

  @addr
  M = M + 1

  @pixels
  M = M - 1
  
  @CHECK
  0;JMP


