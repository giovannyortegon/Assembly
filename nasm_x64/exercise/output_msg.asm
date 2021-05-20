section .data
	STDOUT		equ 1
	sys_write	equ 1
	sys_exit	equ 60
	exit_ok		equ 0

section .text
;	rdi = 1er argumento (string)
	global print
print:
	push rdi
	mov rsi, rdi
	xor r8, r8

count_char:
	cmp byte[rsi], 0
	je done
	inc rsi
	inc r8
	jmp count_char

done:
	mov rcx, r8
	pop rsi

print_char:
	mov rdi, STDOUT
	cmp byte[rsi], 0
	je exit
	cmp rcx, 0
	je exit
	mov rdx, 1
	mov rax, sys_write
	syscall

	inc rsi
	loop print_char
exit:
	ret
