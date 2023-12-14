        .syntax         unified
        .cpu            cortex-m4
        .text

// int32_t Return32Bits(void) ;
        .global         Return32Bits
        .thumb_func
        .align
Return32Bits:
		LDR     R0, = 10 // Loads 10 into the R0.
        BX      LR

// int64_t Return64Bits(void) ;
        .global         Return64Bits
        .thumb_func
        .align
Return64Bits:
		LDR     R0, = -10 // Stores magnitude of least significant bit as NEGATIVE 10.
		LDR     R1, = -1  // Since the number is signed this means that the most significant bit has to be negative.
        BX      LR

// uint8_t Add8Bits(uint8_t x, uint8_t y) ;
        .global         Add8Bits
        .thumb_func
        .align
Add8Bits:
		ADD     R0,R0,R1 // Adds parameters of x & y to R0 which creates new number.
		UXTB    R0,R0 // Since registries are 32 bits, we must 8 extend so registry is full.	
        BX      LR

// uint32_t FactSum32(uint32_t x, uint32_t y) ;
        .global         FactSum32
        .thumb_func
        .align
FactSum32:
		ADD	    R0,R0,R1 // Adds 32 bits together.
        B       Factorial // Transfers value of R0 to our Factorial function.

// uint32_t XPlusGCD(uint32_t x, uint32_t y, uint32_t z) ;
        .global         XPlusGCD
        .thumb_func
        .align
XPlusGCD:
	    PUSH    {R4, LR} // Preserves R4.
		MOV     R4,R0 // Transfers argument x into R4.
		MOV     R0,R1 // Transfers argument y to R0.
		MOV     R1,R2 // Transfers argument z to R1.
		BL 			   gcd  // Calls R0 and R1 to the gcd function and returns it as R0.
		ADD     R0,R0,R4 // Adds R0 and the previously stored R4.
		POP     {R4,PC} // This restores R4.
        BX      LR

        .end