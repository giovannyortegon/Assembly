; adouble.asm
section .data
section .bss
section .text
	global adouble
adouble:
	mov rcx, rsi		; array length
	mov rbx, rdi		; address of array
	mov r12, 0

aloop:
	movsd xmm0, qword[rbx + r12 * 8]
	addsd xmm0, xmm0
	movsd qword[rbx + r12 * 8], xmm0
	inc r12
;	cmp rcx, r12
;	je done
	loop aloop

	leave
	ret
