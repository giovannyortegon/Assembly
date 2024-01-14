section .data
    a dq 175
    b dq 4097
    sum dq 0
section .text
        global main
main:
    mov rbp, rsp; for correct debugging
    push rbp
    mov rbp, rsp
    mov rax, [a]    ; mov a (175)
    add rax, [b]    ; add b to rax
    mov [sum], rax  ; save the sum
    xor rax, rax
    mov rsp, rbp
    pop rbp
    ret