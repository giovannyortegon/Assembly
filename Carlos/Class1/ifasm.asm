section .data
	msg1 db "No es Cero", 10, 0
	len_msg1 equ $ - msg1
	msg2 db "Es Cero", 10, 0
	len_msg2 equ $ - msg2
section .bss
section .text
	global _start
_start:
	mov rax, 0
	cmp rax, 0
	jz _menor		; if a  == 0

	mov rax, 1
	mov rdi, 1
	mov rsi, msg1
	mov rdx, len_msg1
	syscall
	jmp _exit

_menor:
	mov rax, 1		; write
	mov rdi, 1		; stdout
	mov rsi, msg2
	mov rdx, len_msg2
	syscall
	jmp _exit

_exit:
	mov rax, 60
	mov rdi, 0
	syscall



