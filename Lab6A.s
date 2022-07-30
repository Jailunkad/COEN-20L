//Jai Lunkad 
//Lab 5
// COEN 20L
//Due Nov 11th
	.syntax		unified
	.cpu		cortex-m4
	.text
	.global		MatrixMultiply 
	.thumb_func
	.align		
MatrixMultiply: 					// as per function in C code
		PUSH	{R4-R9, LR}			// push onto stack
		LDR		R7, =0				// set r7 to 0
		MOV		R5, R1				// put b in R5
		MOV		R4, R0				// put r0 in r4
		MOV		R6, R2				// put c in R6
a1:		CMP		R7, 3				// compare  row
		BGE		b3					// branch if greater than 3, then go to btm3
		LDR		R8, =0				// col = 0
a2:		CMP		R8, 3				// compare coloumn
		BGE		b2					// branch if greater than 3, then go to btm2
		LDR		R3, =3				//set r3 to 3
		LDR		R1, =0				//set r1 to 0
		MLA		R3, R3, R7, R8		// multiply accumulate  sum of r+c *3
		STR		R1, [R4, R3, LSL 2]	// store val in r1
		LDR		R9, =0				// k  =  0
a3:		CMP		R9, 3				// compare r9 to 3
		BGE		b1					// if r9 is greater branch to btm1
		LDR		R3, =3				// set r3 = 3
		MLA		R3, R3, R7, R8		// multiply accumulate  sum of r+c *3
		LDR		R0, [R4, R3, LSL 2]	// store val in r0
		LDR		R3, =3				// set r3 = 3
		MLA		R3, R3, R7, R9		// multiply accumulate  sum of r+k *3
		LDR		R1, [R5, R3, LSL 2]	// store val in r1
		LDR		R3, =3				// set r3 = 3
		MLA		R3, R3, R9, R8		// multiply accumulate  sum of c+k *3
		LDR		R2, [R6, R3, LSL 2]	// store val in r2
		BL		MultAndAdd			// go to mult and add func
		LDR		R3, =3				//set r3 = 3
		MLA		R3, R3, R7, R8		// multiply accumulate  sum of c+k *3
		STR		R0, [R4, R3, LSL 2]	// store val in r0
		ADD		R9, R9, 1			// increment R9
		B		a3					// branch to a3
b3:	POP		{R4-R9, PC} 			// pop stack when done
b2:	ADD		R7, R7, 1				// increment row
		B		a1					//branch to a1
b1:	ADD		R8, R8, 1				//increment col
		B		a2					// branch to a2
		.end