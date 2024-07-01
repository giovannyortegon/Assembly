.text
    .global _start
_start:
    mov x1, #-14
    mov x2, #16
    mov x3, #14
    mov x4, #56

    cmp x3, x2
    subs xzr, x3, x2
    cmp x3, #2
    subs xzr, x3, #2
    cmp x4, x3, lsl #2
    subs xzr, x4, x3, lsl #2

    cmn x2, #16
    adds xzr, x2, #16
    cmn x3, x1
    adds xzr, x3, x1
    cmn x4, x1, lsl #2
    adds xzr, x4, x1, lsl #2
    cmn x1, #14, lsl #0
    adds xzr, x1, #14, lsl #0
    cmn x4, #14, lsl #12
    adds xzr, x4, #14, lsl #12
