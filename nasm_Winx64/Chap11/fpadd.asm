section .data
    x   dd 3.25, 3.4
    y   dd 10.53, 4.4
section .bss
    z   resd 1
section .text
    global main

main:
    push rbp
    mov rbp, rsp; for correct debugging
    sub rsp, 32
    
    movsd xmm0, [x]     ; load x
    movsd xmm1, [y]     ; load y
    vaddsd xmm2, xmm0, xmm1     ; xmm2 = xmm0 + xmm1
    movss xmm0, [x]     ; load x
    addss xmm0, [y]     ; add y to x
    movss [z], xmm0     ; store sum in z
    movapd xmm0, [x]    ; load 2 double from x
    addpd xmm0, [y]     ; a[0] + b[0], a[1] + b[1]
    movapd [z], xmm0    ; store 2 sums in z
    vmovupd ymm0, [x]   ; load 2

    leave
    ret
