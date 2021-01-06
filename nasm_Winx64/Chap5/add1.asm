; add1.asm
section .data
    a dq    175
    b dq    4097
section .text
    global main
main:
    mov rbp, rsp; for correct debugging
    mov rax, a      ; mov address of a into rax
    mov rax, [a]    ; mov a (175) into rax
    add rax, [b]    ; add b to rax
    xor rax, rax    ; clear rax to 0
    ret

