    .global _start
_start:
    mov r1, #8
    mov r2, #4
    mov r3, #1

    add r4, r1, r2
    sub r4, r1, r2

    add r1, #10
    sub r1, #10

    add r4, r1, r2, RRX
    sub r4, r1, r2, RRX

    add r4, r1, r2, lsl #1
    sub r4, r1, r2, lsl #1

    add r4, r1, r2, lsl r3
    sub r4, r1, r2, lsl r3

    mov r0, r4

    eor r0, r0
    mov r7, #1
    swi 0
