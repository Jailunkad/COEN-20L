//jai lunkad
//Coen 20L
//Lab 8A
.syntax		unified
.cpu		cortex-m4
.text
		
.global		Zeller1
.thumb_func
.align
Zeller1:
		ADD		R0, R0, R2			// add k and d
		ADD		R0, R0, R2, LSR 2	// divide d by 4
		ADD		R0, R0, R3, LSR 2	// divicde c by 4
		SUB		R0, R0, R3, LSL 1	// multiply 2c and sub
		LDR		R3, =13				// r3 = 13
		MUL		R2, R1, R3			// mult 13 and m
		SUB		R2, R2, 1			// subtract 1 from r2
		LDR		R3, =5				// r3 = 5
		UDIV	R2, R2, R3			// divide r2 by r3
		ADD		R0, R0, R2			// add r0 and r2
		LDR		R3, =7				// r3 = 7
		SDIV	R2, R0, R3			// divide f by 7
		MUL		R2, R2, R3			// multiply r2*7
		SUB		R2, R0, R2			// subtract from f
		CMP		R2, 0				// compare r2 to 0
		IT		LT					// if less than
		ADDLT	R2, R2, R3			// increment by 7
		MOV		R0, R2  			// move instructions
		BX 		LR
		
.global		Zeller2
.thumb_func
.align	
Zeller2:
		PUSH	{R4}				// push onto stack
		ADD		R0, R0, R2			// add k and d
		ADD		R0, R0, R2, LSR 2	// divide d by 4
		ADD		R0, R0, R3, LSR 2	//divide c by 4
		SUB		R0, R0, R3, LSL 1	// multiply 2c and sub
		ADD		R4, R1, R1, LSL 3	// add m and (m after lsl by 3) = 9m
		ADD		R2, R4, R1, LSL 2	// add 9m and (m after lsl by 2) = 13m 
		SUB		R2, R2, 1			// subtract 1
		LDR		R4, =5				// put 5 in r4
		UDIV	R2, R2, R4			// divide by 5
		ADD		R0, R0, R2			// increment
		LDR		R4, =7				// put 7 in r4
		SDIV	R2, R0, R4			// divide by 7
		LSL		R4, R2, 3			// mul by 2^3
		SUB		R2, R4, R2			// subtract 1 
		SUB		R2, R0, R2			// subtract from f
		CMP		R2, 0				// compare r2 to 0
		IT		LT					// if less than
		ADDLT	R2, R2, 7			// increment by 7
		MOV		R0, R2  			// move instructions
		POP		{R4}				// pop from stack
		BX 		LR

		.global		Zeller3
		.thumb_func
		.align
		//                           R0          R1          R2          R3
		// uint32_t Zeller2(uint32_t k, uint32_t m, uint32_t D, uint32_t C);
		// This function CANNOT use divide instructions (SDIV or UDIV).
Zeller3:
		PUSH	{R4}				// push onto stack
		ADD		R0, R0, R2			// add k and d
		ADD		R0, R0, R2, LSR 2	// divide d by 4
		ADD		R0, R0, R3, LSR 2	// divide c by 4
		SUB		R0, R0, R3, LSL 1	// multiply 2c and sub
		ADD		R4, R1, R1, LSL 3	// add m and (m after lsl by 3) = 9m
		ADD		R2, R4, R1, LSL 2	// add 9m and (m after lsl by 2) = 13m 
		SUB		R2, R2, 1			// 13 * m - 1
		LDR		R3, =858993459		// result of 2^32 / 5
		SMULL	R2, R3, R2, R3		// mul r2*r3
		ADD		R0, R0, R3			// add to f
		LDR		R3, =613566757		// result of 2^32 / 7
		SMULL	R2, R3, R0, R3		// f*613566757
		LDR		R4, =7				// put 7 in r4
		MUL		R3, R3, R4			// mul r3 by 7
		SUB		R3, R0, R3			// subtract val from f
		CMP		R3, 0				// compare f to 0
		IT		LT					// if less than
		ADDLT	R3, R3, 7			// add 7
		MOV		R0, R3 				// mov instr.	
		POP		{R4}				// pop from stack	
		BX 		LR		
		
		.end