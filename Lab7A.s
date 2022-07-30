   //jai Lunkad
   //Coen 20L
   //Lab 7A
   //Reversing Bits & Bytes

    .syntax     unified
    .cpu        cortex-m4
    .text
    .thumb_func
    .align                      

    .global     ReverseBytes
ReverseBytes:       BFI         R1,R0,24,8      // shift bits 0-8 of r0 into bits 24-31 of R1 
                    LSR         R0,R0,8         // logical shift  8 times
                    BFI         R1,R0,16,8      // insert 0-8 of R0 into  16-23 of R1 
                    LSR         R0,R0,8         // logical shift  8 times
                    BFI         R1,R0,8,8       // insert 0-8 of R0 into  8-15 of R1 
                    LSR         R0,R0,8         // logical shift right 8 times
                    BFI         R1,R0,0,8       // insert 0-8 of R0 into  0-8 of R1 
                    MOV         R0,R1           // shift to r0
                    BX          LR
                    .end

    .global     ReverseBits
ReverseBits:        .rept       32			//when r0 =word
                    LSLS        R0,R0,1    	//shift msb into C
                    RRX         R1,R1       // push C into lsb of r1
                    .endr					//end
                    MOV         R0,R1       // move into r0
                    BX          LR