; avergae.asm
extern printf
section .data
    n1 dq 3
    n2 dq 2
    n3 dq 3
    n4 dq 4
    n dq 4
section .bss
    result resq 1
section .text
    global main
main:
    push rbp
    mov rbp, rsp

    mov rax, [n1]
    add rax, [n2]
    add rax, [n3]
    add rax, [n4]
    xor rdx, rdx
    idiv qword [n]
    mov [result], rax

    leave
    ret
