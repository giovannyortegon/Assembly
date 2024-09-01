    _start:
.code 32
    mov r0, #8
    mov r2, #4095
    mov r5, r2
    mov r5, r2, ASR #3
    mov r5, r2, RRX
    mov r5, r2, ROR r0

    add r4, pc, #1
    bx r4

.code 16
    mov r5, r2
    mov r5, r2
    mov r5, r2, ASR #3
    mov r5, r2, RRX
    mov r5, r2 ROR r0
