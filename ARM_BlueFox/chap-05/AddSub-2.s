    .global _start
_start:
    mov x1, #8
    mov x2, #4
    mov x3, #7

    add x4, x1, #8
    add x4, x1, #15, lsl #12

    sub x4, x1, x2
    sub x4, x1, x2, lsl #2

    add x4, x1, x3, uxtb #4
    sub x4, x1, x3, uxtb #4

    mov x0, #1
    mov x8, #93
    svc 0
