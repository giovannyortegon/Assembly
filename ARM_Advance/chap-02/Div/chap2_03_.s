    .text
    .cpu cortex-a72
    .global CalcQuoRem_
CalcQuoRem_:
    //save volatile registers
    push {r4, r5}

    // load a and b
    ldr r4, [r0]
    ldr r5, [r1]

    //calculate quotient and remainder
    sdiv r0, r4, r5
    str r0, [r2]

    mul r1, r0, r5
    sub r2, r4, r1
    str r2, [r3]

    // retore non-volatile registers and return
    pop {r4, r5}
    bx lr
