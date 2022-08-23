<<<<<<< HEAD
<<<<<<< HEAD
	.model flat, c
	.code

CalcArraySum_ proc

	push ebp
	mov ebp, esp

; Load arguments and initialize sum
	mov edx, [ebp + 8]
	mov ecx, [ebp + 12]
	xor eax, eax

; Make sure 'n' is greater than zero
	cmp ecx, 0
	jle InvalidCount

; Calculate the array element
@@:
	add eax, [edx]
	add edx, 4
	dec ecx
	jnz @B

InvalidCount:
	pop ebp
	ret

CalcArraySum_ endp
=======
	.model flat, c
	.code

CalcArraySum_ proc

	push ebp
	mov ebp, esp

; Load arguments and initialize sum
	mov edx, [ebp + 8]
	mov ecx, [ebp + 12]
	xor eax, eax

; Make sure 'n' is greater than zero
	cmp ecx, 0
	jle InvalidCount

; Calculate the array element
@@:
	add eax, [edx]
	add edx, 4
	dec ecx
	jnz @B

InvalidCount:
	pop ebp
	ret

CalcArraySum_ endp
>>>>>>> 95b7c91229f799dc2bb365ba4c047e0314176892
=======
	.model flat, c
	.code

CalcArraySum_ proc

	push ebp
	mov ebp, esp

; Load arguments and initialize sum
	mov edx, [ebp + 8]
	mov ecx, [ebp + 12]
	xor eax, eax

; Make sure 'n' is greater than zero
	cmp ecx, 0
	jle InvalidCount

; Calculate the array element
@@:
	add eax, [edx]
	add edx, 4
	dec ecx
	jnz @B

InvalidCount:
	pop ebp
	ret

CalcArraySum_ endp
<<<<<<< HEAD
>>>>>>> 27e6d01ab742ee419a449160db6f0a6e7337afcb
=======
>>>>>>> 12f99e0939d0546bc7d3973165ffbb8826df7a8a
>>>>>>> 95b7c91229f799dc2bb365ba4c047e0314176892
	end