/*  Lab 1 Week 3 
 *	Programming Lab 2A
 *	8-Bit Binary Numbers
 *  Jai Lunkad
 */
#include <stdio.h>

/* Functions given */
int32_t Bits2Signed(int8_t bits[8]) ; 	   			// Convert array of bits to signed int.
uint32_t Bits2Unsigned(int8_t bits[8]) ; 			// Convert array of bits to unsigned int
void Increment(int8_t bits[8]) ; 				 	// Add 1 to value represented by bit pattern
void Unsigned2Bits(uint32_t n, int8_t bits[8]) ;    // Opposite of Bits2Unsigned.

/* Convert array of bits to signed int. */
int32_t Bits2Signed(int8_t bits[8]) {
    int32_t x = Bits2Unsigned(bits);				// Calls the Bits2Unsigned with bits as the argument, generating values of 2^8 = 0 to 255
    if(x > 127) {									// range of signed is halved. 
		x -= 256;									// new range is -128 to 127
	}
	return x;										// sign value output
}

/* Convert array of bits to unsigned int */
uint32_t Bits2Unsigned(int8_t bits[8]) {
    uint32_t n = 0;						
    int i;
    for(i = 7;i>=0;i--) {							// for i = 7 down to 0
        n = 2*n + bits[i];							// n <- 2 x n + bi
    }
    return n;						      		    // unsigned value outputted
}
/* Add 1 to value represented by bit pattern */
void Increment(int8_t bits[8]) {
    int i;
    for(i = 0; i < 8; i++) {						// loop going through the bits
        if(bits[i] == 0) {							// if val = 0
            bits[i] = 1;							// increment the value
            break;									// break
        }
        if(bits[i] == 1) {							// However, if its 1 
            bits[i] = 0;							// we will change to 0
        }
    }
	return;											
}

/* Opposite of Bits2Unsigned. */

void Unsigned2Bits(uint32_t n, int8_t bits[8]) {
    int i = 0;
    int a;
    while(i < 8) {									// we will basically do repeated division; looping through array bits
        a = n % 2;									// this will give the rem
        n = n / 2;									// this will give int val
        bits[i] = a;								// input the rem into bit value(in reverse order)
        i++;										
    }
    return;								
}
