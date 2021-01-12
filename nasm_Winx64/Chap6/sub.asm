; sub.asm
section .data
    a dq 100
    b dq 200
    diff dq 0
section .text
    global main
main:
    push rbp
    mov rbp, rsp
    sub rsp, 32
    
    mov rax, 10
    sub [a], rax    ; subtraction 10 from a
    sub [b], rax    ; subtraction 10 from b
    mov rax, [b]    ; mov b into rax
    sub rax, [a]    ; set rax to b - a
    mov [diff], rax ; move the different to diff

    xor rax, rax
    mov rsp, rbp
    pop rbp
    ret
