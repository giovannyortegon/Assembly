.text
    .global _start
_start:
    mov x0, #2
    mov x1, #11
    mov x2, #22
    mov x3, #33

    smaddl x5, w0, w1, x2
    smsubl x5, w0, w1, x2
    smnegl x5, w0, w1
    smull x5, w0, w1
    smulh x5, x0, x1
    umaddl x5, w0, w1, x2
    umsubl x5, w0, w1, x2
    umnegl x5, w0, w1
    umull x5, w0, w1
    umulh x5, x0, x1
