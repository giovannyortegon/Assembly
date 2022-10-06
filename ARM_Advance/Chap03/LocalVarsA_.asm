//  extern "C" void LocalVarsA_(int a, int b, int c, int d, int e, int f, int * g, int * h);
    .equ ARG_E, 32
    .equ ARG_F, 36
    .equ ARG_G, 40
    .equ ARG_H, 44

    .equ TEMP0, 0
    .equ TEMP1, 4
    .equ TEMP2, 8
    .equ TEMP3, 12
    .text
    .cpu cortex-a72
    .global LocalVarsA_
LocalVarsA_:
// function prologue
    push {r4-r7}        // save no volatile regs
    sub sp, #16         // allocate local vars space

// load e, f, g and h from stack
    ldr r4, [sp, #ARG_E]        // r4 = e
    ldr r5, [sp, #ARG_F]        // r5 = f
    ldr r6, [sp, #ARG_G]        // r6 = g (pointer)
    ldr r7, [sp, #ARG_H]        // r7 = h (pointer)

// calculate and save temp0, temp1, temp2 and temp3
    add r12, r0, r12
    add r12, r12, r12
    str r12, [sp, #TEMP0]

    add r12, r3, r4
    add r12, r12,r5
    str r12, [sp, #TEMP1]

    add r12, r0, r12
    add r12, r12, r4
    str r12, [sp, #TEMP2]

    add r12, r1, r3
    add r12, r12, r4
    str r12, [sp, #TEMP3]

// Calculate and save g and h
    ldr r0, [sp, #TEMP0]
    ldr r1, [sp, #TEMP1]
    mul r0, r0, r1
    str r0, [r6]

    ldr r0, [sp, #TEMP2]
    ldr r1, [sp, #TEMP3]
    mul r0, r0, r1
    str r0, [r7]

// function epologue
    add sp, #16
    pop {r4-r7}
    bx lr

