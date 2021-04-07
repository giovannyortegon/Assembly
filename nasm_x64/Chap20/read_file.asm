section .data
    NL equ 0xa
; message error
    error_Read		db "Error reading file", NL, 0
; message succss
	success_Read	db "Reading file", NL, 0
; syscall
    NR_read		equ 0
section .text
    global read_file
    extern printString
read_file:
    push rbp
    mov rbp, rsp

    mov rax, NR_read
    syscall

    cmp rax, 0
    jl readerror

    mov byte[rsi + rax],  0
    mov rax, rsi

    mov rdi, success_Read
    push rax
    call printString
    pop rax
    jmp Done

readerror:
    mov rdi, error_Read
    call printString

Done:
    leave
    ret