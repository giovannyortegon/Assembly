section .data
    NL			equ	0xa
; message error
    error_Close		db "Error closing file ",NL, 0
; message success
    success_Close	db "File closed",NL, 0
; syscall
    NR_close	equ 3
section .text
    global close_file
    extern printString
close_file:
    push rbp
    mov rbp, rsp

	mov rax, NR_close
	syscall
	cmp rax, 0					; file description
	jl closeerror
	mov rdi, success_Close
	call printString
    jmp Done

closeerror:
	mov rdi, error_Close
	call printString

Done:
    leave
	ret