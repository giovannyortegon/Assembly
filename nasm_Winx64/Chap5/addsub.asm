section .data
    a dq 175
    b dq 4097
    sum dq 0
    diff dq 0
section .text
    global main
main:
    mov rbp, rsp; for correct debugging
    push rbp
    mov rbp, rsp
    mov rax, [a]    ; mov a (175) into rax
    mov rbx, rax    ; mov rax to rbx
    add rax, [b]    ; add b to rax
    mov [sum], rax  ; save the sum
    sub rbx, [b]    ; subtact b from rax
    mov [diff], rbx
    xor rax, rax
    mov rsp, rbp
    pop rbp
    ret