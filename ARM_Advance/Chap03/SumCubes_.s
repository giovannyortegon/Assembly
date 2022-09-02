// extern "C" int SumCubes_(unsigned char a, short b, int c, int d, signed char e, short f, unsigned char g, unsigned short h, int i);
    .data
.equ ARG_E, 8
.equ ARG_F, 12
.equ ARG_G, 16
.equ ARG_H, 20
.equ ARG_I, 24

    .text
    .cpu cortex-a72
    .global SumCubes_
SumCubes_:
    push {r4, r5}

    mul r4, r0, r0      // r4 = a * a
    mul r0, r4, r0      // r0 = a * a * a

    mul r4, r1, r1      // r4 = b * b
    mla r0, r4, r1, r0  // r0 += b * b * b

    mul r4, r2, r2
    mla r0, r4, r2, r0  // r0 = (r4 * r1) + r0

    mul r4, r3, r3
    mla r0, r4, r3, r0

    ldrsb r1, [sp, #ARG_E]  // r1 = e (signed extend) char
    mul r4, r1, r1
    mla r0, r4, r1, r0

    ldrsh r1, [sp, #ARG_F]  // r1 = f (short)
    mul r4, r1, r1
    mla r0, r4, r1, r0

    ldrb r1, [sp, #ARG_G]   // r1 = g unsigned char
    mul r4, r1, r1
    mla r0, r4, r1, r0

    ldrh r1, [sp, #ARG_H]   // r1 = h unsigned short
    mul r4, r1, r1
    mla r0, r4, r1, r0      // r0 = (r4 * r1) + r0

    ldr r1, [sp, #ARG_I]    // r1 = i
    mul r4, r1, r1
    mla r0, r4, r1, r0

    pop {r4, r5}
    bx lr
