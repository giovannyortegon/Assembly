	.model flat, c
	.code
CalcSum_ proc
; Initialize a stack frame pointer
	push ebp
	mov ebp, esp

; Load the argument values
	mov eax, [ebp+8]
	mov ecx, [ebp+12]
	mov edx, [ebp+16]

; calculate the sum
	add eax, ecx
	add eax, edx

; restore the caller's stack frame pointer
	pop ebp
	ret

CalcSum_ endp
	end