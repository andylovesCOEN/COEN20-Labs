        .syntax     unified
        .cpu        cortex-m4
        .text

// void PutNibble(void *nibbles, uint32_t index, uint32_t nibble) ;

        .global     PutNibble
        .thumb_func
        .align

PutNibble:
        LSR         R12, R1, 1          //R12<-which>>1
        LDRB        R3, [R0,R12]        //R0<--nibblePtr[byteOffset]
        AND         R1, R1, 1
        CMP         R1, 1               //checking if odd
        BNE         Else                //goto else if even
        //LSR       R3, 4
        //LSL       R3, 4
        AND         R3,R3,0xf
        AND         R2,R2,0b00001111
        LSL         R2,R2,4
        ORR         R3,R3,R2
        B           End
Else:
        AND         R3,R3,0b11110000
        AND         R2,R2,0b00001111
        ORR         R3,R3,R2
End:
        STRB        R3,[R0,R12]
        BX          LR
// uint32_t GetNibble(void *nibbles, uint32_t index) ;

        .global     GetNibble
        .thumb_func
        .align

GetNibble:
    LSR      R12, R1, 1
    LDRB            R0, [R0,R12]        //R0<--nibblePtr[byteOffset]
    AND             R3, R1, 1
    CMP             R3, 1               //checking if odd
    BNE             Else2               //goto else if even
    LSR             R0,R0,4             //if odd, R0>>4
    B               End2
Else2:  AND         R0,R0,0b00001111    //R0<<4?
End2:   BX          LR

        .end
