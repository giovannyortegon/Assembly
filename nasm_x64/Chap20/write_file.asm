section .data
    NL equ 0xa
; message error
    error_Write		db "Error writing to file", NL, 0
; message success
    success_Write	db "Written to file", NL, 0
; syscall
    NR_write	equ 1
section .text
    global write_file
    extern printString
write_file:
    push rbp
    mov rbp, rsp

    mov rax, NR_write
    syscall

    cmp rax, 0
    jl writeerror
    mov rdi, success_Write
    call printString
    jmp Done

writeerror:
    mov rdi, error_Write
    call printString

Done:
    leave
    ret
