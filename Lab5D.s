// Jai Lunkad
// COEN 20L 
// Programming Lab 5D
//Automobile Tire Sizes

		.syntax		unified
		.cpu		cortex-m4
		.text
		
.global		TireDiam
.thumb_func 
.align

TireDiam: //uint64_t TireDiam(uint32_t W, uint32_t A, uint32_t R) ;
		PUSH	{R5}
		MUL		R1, R0, R1		// A*W
		LDR 	R5,=1270
		UDIV	R3, R1,R5	// R3 = a*w/1270
		MLS		R0, R3, R5, R1// R0 = R1 - R3*R5 -> D31-00
		ADD		R1, R2, R3		// R + quotient ->D63-32
		POP		{R5}
		BX 		LR
		
.global		TireCirc
.thumb_func 
.align

TireCirc: //uint64_t TireCirc(uint32_t W, uint32_t A, uint32_t R) ;
		PUSH	{R4,R5,R6,R7,LR}
		BL 		TireDiam
		LDR		R4,=4987290
		LDR 	R5,=3927
		LDR 	R6,=1587500 //->dividend
		MUL 	R7,R4,R1	//4987290 × D63-32 
		MUL 	R3,R5,R0 		//3927 × D31-00
		ADD		R7, R7, R3		//4987290 × D63-32 +3927 × D31-00 -> dividend
		UDIV	R1,R7,R6 	//4987290 × D63-32 +3927 × D31-00 / 1587500 (divisor) //quotient
		MLS		R0,R6,R1,R7// R0 = Dividend - Divisor*quotient // remainder 
		POP		{R4,R5,R6,R7,PC}
		BX		LR
.end
