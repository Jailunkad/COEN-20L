//Jai Lunkad
//Coen 20 Lab 3A 

		.syntax		unified
		.cpu		cortex-m4
		.text					
		.global		Less1
		.thumb_func
		.align
Less1:					//int32_t Less1(int32_t a)
		SUB	R0,1		// a - 1 
		BX	LR			// branch extend to link register	

		.global		Square2x
		.thumb_func 
		.align
Square2x:				//int32_t Square2x(int32_t x)
		ADD	R0,R0,R0	// x+x
		B	Square		// Branch to Square() with the value of r0

		.global		Add
		.thumb_func	
		.align
Add: 	                
		ADD	R0,R0,R1	// a + b ;
		BX	LR			// branch extend to link register
				
		.global		Last
		.thumb_func
		.align
Last:					// int32_t Last(int32_t x)
		PUSH {R4, LR}	// push r4 and lr to stack
		MOV	R4, R0		// preserve value of r0 into r4
		BL	SquareRoot	// call sqaureroot on value of r0
		ADD	R0,R0,R4	// add sqrt(x) + x
		POP	{R4, PC}	// pop values on stack
.end