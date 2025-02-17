<<<<<<< HEAD
<<<<<<< HEAD
	.model flat, c
	.code

; extern "C" int CountChars_(const wchar_t *, wchar_t);
; Description: This fuction counts the number of occurrences
;				of 'c' in 'str1 or str2'
; Reutrn: Number of occurrences of 'c'
CountChars_	proc
	push ebp
	mov ebp, esp
	push esi

; Load parameters and initialize count registers
	mov esi, [ebp + 8]			; esi = 'str'
	mov cx, [ebp + 12]			; cx = 'c'
	xor edx, edx				; edx = Number of occurrences

; Repeate loop until the entire string has been scanned
@@:
	Lodsw						; load next char in ax
	or ax, ax					; test for end of string
	jz @F						; jump if end of string found
	cmp ax, cx					; test current char
	jne @B						; jump if no match
	inc edx						; update match count
	jmp @B

@@:
	mov eax, edx
	pop esi
	pop ebp
	ret

CountChars_ endp
=======
	.model flat, c
	.code

; extern "C" int CountChars_(const wchar_t *, wchar_t);
; Description: This fuction counts the number of occurrences
;				of 'c' in 'str1 or str2'
; Reutrn: Number of occurrences of 'c'
CountChars_	proc
	push ebp
	mov ebp, esp
	push esi

; Load parameters and initialize count registers
	mov esi, [ebp + 8]			; esi = 'str'
	mov cx, [ebp + 12]			; cx = 'c'
	xor edx, edx				; edx = Number of occurrences

; Repeate loop until the entire string has been scanned
@@:
	Lodsw						; load next char in ax
	or ax, ax					; test for end of string
	jz @F						; jump if end of string found
	cmp ax, cx					; test current char
	jne @B						; jump if no match
	inc edx						; update match count
	jmp @B

@@:
	mov eax, edx
	pop esi
	pop ebp
	ret

CountChars_ endp
>>>>>>> 95b7c91229f799dc2bb365ba4c047e0314176892
=======
	.model flat, c
	.code

; extern "C" int CountChars_(const wchar_t *, wchar_t);
; Description: This fuction counts the number of occurrences
;				of 'c' in 'str1 or str2'
; Reutrn: Number of occurrences of 'c'
CountChars_	proc
	push ebp
	mov ebp, esp
	push esi

; Load parameters and initialize count registers
	mov esi, [ebp + 8]			; esi = 'str'
	mov cx, [ebp + 12]			; cx = 'c'
	xor edx, edx				; edx = Number of occurrences

; Repeate loop until the entire string has been scanned
@@:
	Lodsw						; load next char in ax
	or ax, ax					; test for end of string
	jz @F						; jump if end of string found
	cmp ax, cx					; test current char
	jne @B						; jump if no match
	inc edx						; update match count
	jmp @B

@@:
	mov eax, edx
	pop esi
	pop ebp
	ret

CountChars_ endp
<<<<<<< HEAD
>>>>>>> 27e6d01ab742ee419a449160db6f0a6e7337afcb
=======
>>>>>>> 12f99e0939d0546bc7d3973165ffbb8826df7a8a
>>>>>>> 95b7c91229f799dc2bb365ba4c047e0314176892
	end