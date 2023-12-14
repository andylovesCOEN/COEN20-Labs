        .syntax     unified
        .cpu        cortex-m4
        .text

// ----------------------------------------------------------
// unsigned HalfWordAccess(int16_t *src) ;
// ----------------------------------------------------------

        .global     HalfWordAccess
        .thumb_func
        .align
HalfWordAccess:
	//Implementation

// ----------------------------------------------------------
// unsigned FullWordAccess(int32_t *src) ;
// ----------------------------------------------------------

        .global     FullWordAccess
        .thumb_func
        .align
FullWordAccess:
	//Implementation

// ----------------------------------------------------------
// unsigned NoAddressDependency(uint32_t *src) ;
// ----------------------------------------------------------

        .global     NoAddressDependency
        .thumb_func
        .align
NoAddressDependency:
	//Implementation

// ----------------------------------------------------------
// unsigned AddressDependency(uint32_t *src) ;
// ----------------------------------------------------------

        .global     AddressDependency
        .thumb_func
        .align
AddressDependency:
	//Implementation

// ----------------------------------------------------------
// unsigned NoDataDependency(float f1) ;
// ----------------------------------------------------------

        .global     NoDataDependency
        .thumb_func
        .align
NoDataDependency:
	//Implementation

// ----------------------------------------------------------
// unsigned DataDependency(float f1) ;
// ----------------------------------------------------------

        .global     DataDependency
        .thumb_func
        .align
DataDependency:
	//Implementation

// ----------------------------------------------------------
// void VDIVOverlap(float dividend, float divisor) ;
// ----------------------------------------------------------

        .global     VDIVOverlap
        .thumb_func
        .align
VDIVOverlap:
	//Implementation

        .end
