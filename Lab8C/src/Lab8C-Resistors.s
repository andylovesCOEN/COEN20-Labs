/*
    This code was written to support the book, "ARM Assembly for Embedded Applications",
    by Daniel W. Lewis. Permission is granted to freely share this software provided
    that this notice is not removed. This software is intended to be used with a run-time
    library adapted by the author from the STM Cube Library for the 32F429IDISCOVERY 
    board and available for download from http://www.engr.scu.edu/~dlewis/book3.
*/
        .syntax     unified
        .cpu        cortex-m4
        .text

// uint32_t Mul32X10(uint32_t multiplicand) ;

        .global     Mul32X10
        .thumb_func
        .align
Mul32X10:           // R0 = multiplicand
        LSL         R1, R0, 3               //R1<-R0*8
        LSL         R0, R0, 1               //R0<-R0*2
        ADD         R0, R0, R1              //R0<-2R0+R0=10R0
        BX          LR

// uint32_t Mul64X10(uint32_t multiplicand) ;

        .global     Mul64X10
        .thumb_func
        .align
Mul64X10:           // R1.R0 = multiplicand
        LSLS.N      R3, R1, 2               //multiples U32 by 4
        ORR         R3, R3, R0, LSR 30      //adds high bits of R0 by 2
        LSLS.N      R2, R0, 2               //multiply L32 by 4
        ADDS.N      R2, R2, R0              //multiply L32 by 5 (4 done, 1 left ->add 1)
        ADCS.N      R3, R3, R1              //account for carry from the addition
        LSLS.N      R0, R2, 1               //multiply L32 by 2
        ADC         R1, R3, R3              //account for carry from the addition
        BX          LR

// uint32_t Div32X10(uint32_t dividend) ;

        .global     Div32X10
        .thumb_func
        .align
Div32X10:           // R0 = dividend
        LDR         R1,=3435973837         
        UMULL       R2,R1,R1,R0           
        LSRS.N      R0,R1,3
        BX          LR

        .end


