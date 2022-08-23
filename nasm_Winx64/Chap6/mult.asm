; mult.asm
section .data
section .text
    global main
main:
    push rbp
    mov rbp, rsp

    mov rax, 0x7fffffffffffffff
    mov rbx, 256
    imul rbx        ; shift left 8 bits
    
    xor eax, eax    ; 0 for return
    leave
    ret
