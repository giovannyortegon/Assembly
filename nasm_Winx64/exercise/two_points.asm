; two_points.asm
section .data
    x_1 dw 3
    x_2 dw 4
    y_1 dw 2
    y_2 dw 3
section .bss
    result resw 1
section .text
    global main
main:
    push rbp
    mov rbp, rsp

    mov rax, [x_1]
    sub rax, [x_2]
    imul rax, rax

    mov rbx, [y_1]
    sub rbx, [y_2]
    imul rbx, rbx

    add rax, rbx
    mov [result], rax
    leave
    ret
