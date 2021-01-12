section .data
    x  dq 9       ; dividend
    y  dq 2        ; divisor
;    x  dq 325       ; dividend
;    y  dq 16        ; divisor
    quot  dq 0      ; quotient
    rem dq 0        ; remainder
section .text
    global main
main:
    push rbp
    mov rbp, rsp

    mov rax, [x]    ; move a into rax
    mov rdx, 0      ; rdx:rax is dividend
    idiv qword [y]  ; divide x by y
    mov [quot], rax ; save the quoter
    mov [rem], rdx  ; save the remainder

    xor rax, rax
    leave
    ret
