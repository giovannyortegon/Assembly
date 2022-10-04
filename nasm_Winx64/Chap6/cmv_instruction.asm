; cmv_instruction.asm
section .data
    a dq 3
    b dq 4
section .text
    global main
main:
    push rbp
    mov rbp, rsp

    mov rax, [a]    ; save original value
    mov rbx, [b]
    neg rax         ; negate rax
    cmovl rax, rbx  ; replace rax if negative

    mov rbx, [b]      ; set rbx to 0
    mov rax, [a]    ; get x from memory
    sub rax, 100    ; subtract 100 from a
    cmovl rax, rbx  ; set rax to 0 if x-100 < 0

    xor rax, rax
    leave
    ret

