segment .data
	x				dq	0
	scanf_format:	db	"%d", 0
	printf_format:	db	"Fact(%ld) = %ld", 0x0a, 0

segment .text
	global main
	global fact
	extern scanf
	extern printf

main:
	push rbp
	mov rbp, rsp
;	frame 0, 0, 3
	sub rsp, 48

	lea rdi, [scanf_format] ; set arg 1
	lea rsi, [x]			; set arg 2
	call scanf

	mov rdi, [x]			; move x for fact call
	call fact

	lea rdi, [printf_format]	; set arg 1
	mov rsi, [x]				; set arg 2 for printf
	mov rdx, rax					; set arg 3 to be x!
	xor rax, rax
	call printf
; return 0
	xor eax, eax
	leave
	ret
; recursion function
fact:
;	n equ local1		; [rbp + 16]
	push rbp
	mov rbp, rsp
;	frame 1, 1, 1
	sub rsp, 32

	cmp rdi, 1			; compare n with 1
	jg	greater			; if n <= 1, return 1
; return 1 Error
	mov eax, 1
	leave
	ret
	
greater:
	mov [rbp+16], rdi	; save n
	dec rdi				; call fact with n - 1
	call fact
	mov rdi, [rbp + 16]	; restore original n
	imul rax, rdi		; multiply fact(n - 1) * n
	leave
	ret
