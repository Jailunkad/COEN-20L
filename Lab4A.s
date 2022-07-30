// Jai Lunkad
// Lab 3(week 5)

		.syntax		unified
		.cpu		cortex-m4
		.text
////////////////////////////////////////////////////////////////////
		.global	UseLDRB
		.thumb_func
		.align
UseLDRB:					//Load Register Byte (register).					
		.rept 512			//run loop 512 times
		LDRB R2,[R1],1		// read and add 1
		STRB R2,[R0],1		// store R2 into R0 and add 1
		.endr				// stop loop
		BX LR				
////////////////////////////////////////////////////////////////////
		.global	UseLDRH
		.thumb_func
		.align
UseLDRH:					//Load Register Halfword 					
		.rept 256			// 512/2 = 256
		LDRH R2,[R1],2		// read value of r1 and increment by 2 bytes
		STRH R2,[R0],2		// store and add 2 bytes
		.endr				//end loop	
		BX LR				
////////////////////////////////////////////////////////////////////
		.global	UseLDR
		.thumb_func
		.align
UseLDR:						//load register
		.rept 128			// 256/2 = 128
		LDR R2,[R1],4		//read value of r1 and increment by 4 bytes
		STR	R2,[R0],4		//store and add 4 bytes
		.endr				//end loop	
		BX LR				
////////////////////////////////////////////////////////////////////		
		.global	UseLDRD
		.thumb_func
		.align
UseLDRD:					//Load Register Dual
		.rept 64			//128/2 = 64
		LDRD R2,R3,[R1],8	//load r2 and r3 and then add 8 bytes
		STRD R2,R3,[R0],8	//store and add 8 bytes
		.endr				//end loop	
		BX		LR				
////////////////////////////////////////////////////////////////////		
		.global	UseLDM
		.thumb_func
		.align
UseLDM:							
		PUSH {R4-R11}		//push register r4,r5,r6,r7,r8,r19,r10,r11,r12 on stack
		.rept 16			//512/32 = 16
		LDMIA R1!,{R4-R11}	//Load r1 into r4 - r11
		STMIA R0!,{R4-R11}	//Store data from R4-R11 
		.endr				//end loop	
		POP {R4-R11}		//pop registers previously stored on 
		BX LR						
		.end