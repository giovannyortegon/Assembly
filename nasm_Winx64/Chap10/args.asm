section .data
    format db "%s", 0xa, 0
section .text
    global main
    extern printf

main:
    push rbp
    mov rbp, rsp
    sub rsp, 48

    mov r8, rdx
    mov rdx, [r8]

start_loop:
    lea rcx, [format]
    mov [rbp - 8], r8
    call printf

    mov r8, [rbp - 8]
    add r8, 8
    mov rdx, [r8]
    cmp rdx, 0
    jnz start_loop

end_loop:
    xor eax, eax
    leave
    ret
