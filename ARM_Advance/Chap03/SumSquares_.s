// extern "C" int SumSquares_(int ,int , int , int , int, int, int);
    .data
.equ ARG_E, 0
.equ ARG_F, 4
.equ ARG_G, 8

    .text
    .cpu cortex-a72
    .global SumSquares_
SumSquares_:
    mul r0, r0, r0      // r0 = a * a
    mul r1, r1, r1      // r1 = b * b
    add r0, r0, r1      // r0 = a * a + b * b

    mul r2, r2, r2      // r2 = c * c
    mul r3, r3, r3      // r3 = d * d
    add r2, r2, r3

    add r0, r0, r2

    ldr r1, [sp, #ARG_E]    // r1 = e
    mul r1, r1, r1
    add r0, r0, r1

    ldr r1, [sp, #ARG_F]    // r1 = f
    mul r1, r1, r1
    add r0, r0, r1

    ldr r1, [sp, #ARG_G]   // r1 = g
    mul r1, r1, r1
    add r0, r0, r1

    bx lr
