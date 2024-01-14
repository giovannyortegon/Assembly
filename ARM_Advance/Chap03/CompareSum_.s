
// extern "C" bool CompareSumA_(int, int, int, int * );
    .text
    .cpu cortex-a72
    .global CompareSumA_
CompareSumA_:
// Calculate a + b + c and save sum
    add r0, r0, r1
    add r0, r0, r2
    str r0, [r3]

// Is sum >= 100?
    cmp r0, #100
    bge SumGE100

    mov r0, #0
    bx lr
SumGE100:
    mov r0, #1
    bx lr

// extern "C" bool CompareSumB_(int, int, int, int * );
    .global CompareSumB_
CompareSumB_:
// Calculate a + b + c and save sum
    add r0, r0, r1
    adds r0, r0, r2
    str r0, [r3]
    bgt SumGTo

    mov r0, #0
    bx lr

SumGTo:
    mov r0, #1
    bx lr

// extern "C" bool CompareSumC_(int, int, int, int * );
    .global CompareSumC_
CompareSumC_:
    push {r4,r5}

    mov r4, r0
    mov r0, #0

    adds r4, r4, r1
    orrvs r0, #1

    adds r5, r4, r2
    orrvs r0, #1

    str r5, [r3]

    pop {r4,r5}
    bx lr
