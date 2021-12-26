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
do_while:
	inc rax			; a++ / a = a + 1
	cmp rax, 10
	jne do_while	; if a  == 0

_exit:
	mov rax, 60
	mov rdi, 0
	syscall



