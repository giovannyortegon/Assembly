section .data
msj db 'Hello, Holberton',0xa	; message
msj_L equ $ - msj				; length message 

section .text
	global main		; Declare linker

main:				; linker entry point
	mov rax,1
	mov rdi,1
	mov rsi,msj		; message
	mov rdx,msj_L	; length message
	syscall			; Call kernel

	mov rax,60
	mov rdi,0
	syscall			; Call Kernel
