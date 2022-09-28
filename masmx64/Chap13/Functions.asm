; Subroutine thesum adds a variable number of integer.
;	rcx:	memory address of variable to receive the sum
;	rdx:	memory address of array of integer values
;	r8:		number of integer in the array.
;	Supports x64 Calling Convention.
	.code
thesum proc
	mov eax, [rdx]
	dec r8
	jle retsub

thelp:
	add eax, [rdx + 4 * r8]
	dec r8
	jnz thelp

retsub:
	mov [rcx], eax
	ret

thesum endp
; Function fcnsum adds a variable number of integer
;	rcx:	memory address  of array of integer values
;	rdx:	memory of integer in the array
;	rax:	return calculate sum to  calliing program.
;	Supports x64 Calling Convention.
fcnsum proc
	xchg rcx, rdx
	mov eax, [rdx]
	dec rcx
	jle retfcn

fcnlp:
	add eax, [rdx + 4 * rcx]
	loop fcnlp

retfcn:
	ret

fcnsum endp
	end