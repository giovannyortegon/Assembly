; test.asm
section .text
    global main
main:
    mov rax, 0x0123456789ABCDEF
    mov eax, 100
    mov rax, 0
    ret

