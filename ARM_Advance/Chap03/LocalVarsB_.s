// extern "C" void LocalVarsB_(int a, int b, int c, int d, int e, int f, int * g, int * h);
    .equ ARG_E, 24
    .equ ARG_F, 28
    .equ ARG_G, 32
    .equ ARG_H, 36

    .equ TEMP0, -16
    .equ TEMP1, -12
    .equ TEMP2, -8
    .equ TEMP3, -4

    .text
    .global LocalVarsB_
LocalVarsB_:
    // Function prologue
    push {r4-r7, fp, lr}
    mov fp, sp
    sub sp, #16

// Loas e, f, g and h from stack
    ldr r4, [fp, #ARG_E]
    ldr r5, [fp, #ARG_F]
    ldr r6, [fp, #ARG_G]
    ldr r7, [fp, #ARG_H]

// Calculate and save temp0, temp1, temp2 and temp3
    add lr, r0, r1
    add lr, lr, r2
    str lr, [fp, #TEMP0]

    add lr, r3, r4
    add lr, lr, r5
    str lr, [fp, #TEMP1]

    add lr, r0, r2
    add lr, lr, r4
    str lr, [fp, #TEMP2]

    add lr, r1, r3
    add lr, lr, r5
    str lr, [fp, #TEMP3]

// Calculate and save g and h
    ldr r0, [fp, #TEMP0]
    ldr r1, [fp, #TEMP1]
    mul r0, r0, r1
    str r0, [r6]

    ldr r0, [fp, #TEMP2]
    ldr r1, [fp, #TEMP3]
    mul r0, r0, r1
    str r0, [r7]

// function epilogue
    add sp, #16
    pop {r4-r7, fp, pc}
