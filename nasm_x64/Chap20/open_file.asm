section .data
    NL equ 0xa
; message success
    success_Open	db "File opened for R/W", NL, 0
; message error
    error_Open		db "Error opening file", NL, 0
; syscall
    NR_open equ 2
; access mode
    O_RDWR equ 000002q

section .text
    global open_file
    extern printString
open_file:
    push rbp
    mov rbp, rsp

    mov rax, NR_open
    mov rsi, O_RDWR
    syscall
    cmp rax, 0
    jl openerror
; success
    mov rdi, success_Open
    push rax
    call printString
    pop rax
    jmp Done
; error
openerror:
    mov rdi, success_Open
    call printString
Done:
    leave
    ret
