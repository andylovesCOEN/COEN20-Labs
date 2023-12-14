
#include <stdint.h>
#include <math.h>

/* These functions take in bit-related data,
*and converts into int/radix data.
*/
void Bits2RadixString(uint8_t, char[], int radix);
void ReverseString(char[], int);

/* This function handles data within the octal/8-bit range,
*and transfers into string data.
*/
void Bits2OctalString(uint8_t bits, char string[]) {
    Bits2RadixString(bits, string, 8);
    }

/* This function handles data within the 10 radix-range,
*and transfers into string data.
*/
void Bits2UnsignedString(uint8_t bits, char string[]) {
    Bits2RadixString(bits, string, 10);
    }

/* This function handles data within the 16 radix-range,
*and transfers into string data.
*/
void Bits2HexString(uint8_t bits, char string[]) {
    Bits2RadixString(bits, string, 16);
}
/* These function(s) transfers bit-data into the
* 2-component of binary and returns as string data.
*/
void Bits2TwosCompString(uint8_t bits, char string[]) {
    if (bits < pow(2, 7)) {
        string[0] = '+';
        Bits2UnsignedString(bits, &string[1]);
        return;
    }

    string[0] = '-';
    Bits2UnsignedString(~bits + 1, &string[1]);
}

/* Processes and calculates 2-sign magnitude data,
* and returns the information as string data. 
*/
void Bits2SignMagString(uint8_t bits, char string[]) {  
    if (bits < pow(2, 7)) {
        string[0] = '+';
        Bits2UnsignedString(bits, &string[1]);
        return;
    }

    string[0] = '-';
    bits -= pow(2, 7);
    Bits2UnsignedString(bits, &string[1]);
    }


//Alternative: create magnitude to string conversion function
//and use it in Bits2OctalString, Bits2UnsignedString and Bits2HexString
void Bits2RadixString(uint8_t bits, char string[], int radix) {
    if (bits == 0) {
        string[0] = '0';
        string[1] = '\0';
        return;
    }
    //Contains all possible hex values for reference.
    static const char hex[] = "0123456789ABCDEF";
    int place = 0;

    while (bits) {
        int digit = bits % radix;
        int code = hex[digit];

        string[place++] = code;
        bits /= radix;
    }

    ReverseString(string, place);
    string[place] = '\0';
}
/* This functions processes and returns the
*reverse of a binary number data.
*/
void ReverseString(char string[], int length) {
    char temp;
    int l = 0;
    int r = length - 1;

    while (l < r) {
        temp = string[l];
        string[l++] = string[r];
        string[r--] = temp;
    }
}