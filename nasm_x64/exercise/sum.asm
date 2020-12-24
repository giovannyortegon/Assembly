section .data
	fm_print db "la suma es: %ld", 10, 0
	fm_scan db " %ld %ld", 0
section .bss
	result resq 1
	num1 resq 1
	num2 resq 1
section .text
	extern printf
	extern scanf
	global _start
_start:
; stack backup
	;mov rbp
	;mov rbp, rsp
; using scanf like C
	mov rdi, fm_scan
	mov rsi, num2
	mov rdx, num1
	call scanf
; doing operation
	mov rbx, [num1]
	mov rcx, [num2]
	add rbx, rcx

	xor rdi, rdi
	mov rdi, fm_print
	mov rsi, rbx
	mov rax, 0
	call printf 
; stack recover
;	mov rsp, rbp
;	pop rbp
; exit syscall
	xor rax, rax
	mov rax, 60
	mov rdi, 0
	syscall
