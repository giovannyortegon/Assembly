; calculate.asm
section .data
	gprice dq 40
	lprice dq 20
section .text
	global calculate
calculate:
	push rbp
	mov rbp, rsp
; local variables	
	mov word[rsp-4], 20
	mov word[rsp-12], 40
	
	cmp rdi, 1000

	jle LowPrice
;	mov rax, [gprice]	; variables on memory
	mov rax, [rsp-12]
	jmp end

LowPrice:
	mov rax, [rsp-4]
;	mov rax, [lprice]	; variables on memory
end:
	leave
	ret
