; hello.asm

section .data
	msg db "Hello, world", 0

section .bss
section .text
	global main
main:
	mov rax, 1		; 1 = write function
	mov rdi, 1		; 1 = to stdout
	mov rsi, msg	; string to display in rsi
	mov rdx, 12		; length of the sring without 0
	syscall			; display the string

	mov rax, 60		; 60 = exit function
	mov rdi, 0		; 0 = success exit code
	syscall			; quit
