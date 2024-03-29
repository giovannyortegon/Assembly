<<<<<<< HEAD
<<<<<<< HEAD
	.model flat, c
	include TestStruct_.inc
	.code
; extern "C" __int64 CalcStructSum_(const TestStruct * ts);
; Decription:	This function sums the members of a TestStruct.
; Return:		Sum of "ts" members as a 64 bit integer.
CalcStructSum_	proc
	push ebp
	mov ebp, esp

	push ebx
	push esi

; Compute ts->Val8 + ts->Val16, note sign extension to 32 bits
	mov esi, [ebp + 8]
	movsx eax, byte ptr [esi + TestStruct.Val8]
	movsx ecx, word ptr [esi + TestStruct.Val16]
	add eax, ecx

; Sign extend previous sum to 64 bits, save result to ebx:ecx 
	cdq
	mov ebx, eax
	mov ecx, edx

; Add ts->Val32 to Sum
	mov eax, [esi + TestStruct.Val32]
	;mov eax, [esi + TestStruct.Val32]
	cdq
	add eax, ebx
	adc edx, ecx

; Add ts->Val64 tos Sum
	add eax, dword ptr [esi + TestStruct.Val64]
	adc edx, dword ptr [esi + TestStruct.Val64 + 4]

	pop esi
	pop ebx
	pop ebp
	ret 

CalcStructSum_ endp
=======
	.model flat, c
	include TestStruct_.inc
	.code
; extern "C" __int64 CalcStructSum_(const TestStruct * ts);
; Decription:	This function sums the members of a TestStruct.
; Return:		Sum of "ts" members as a 64 bit integer.
CalcStructSum_	proc
	push ebp
	mov ebp, esp

	push ebx
	push esi

; Compute ts->Val8 + ts->Val16, note sign extension to 32 bits
	mov esi, [ebp + 8]
	movsx eax, byte ptr [esi + TestStruct.Val8]
	movsx ecx, word ptr [esi + TestStruct.Val16]
	add eax, ecx

; Sign extend previous sum to 64 bits, save result to ebx:ecx 
	cdq
	mov ebx, eax
	mov ecx, edx

; Add ts->Val32 to Sum
	mov eax, [esi + TestStruct.Val32]
	;mov eax, [esi + TestStruct.Val32]
	cdq
	add eax, ebx
	adc edx, ecx

; Add ts->Val64 tos Sum
	add eax, dword ptr [esi + TestStruct.Val64]
	adc edx, dword ptr [esi + TestStruct.Val64 + 4]

	pop esi
	pop ebx
	pop ebp
	ret 

CalcStructSum_ endp
>>>>>>> 95b7c91229f799dc2bb365ba4c047e0314176892
=======
	.model flat, c
	include TestStruct_.inc
	.code
; extern "C" __int64 CalcStructSum_(const TestStruct * ts);
; Decription:	This function sums the members of a TestStruct.
; Return:		Sum of "ts" members as a 64 bit integer.
CalcStructSum_	proc
	push ebp
	mov ebp, esp

	push ebx
	push esi

; Compute ts->Val8 + ts->Val16, note sign extension to 32 bits
	mov esi, [ebp + 8]
	movsx eax, byte ptr [esi + TestStruct.Val8]
	movsx ecx, word ptr [esi + TestStruct.Val16]
	add eax, ecx

; Sign extend previous sum to 64 bits, save result to ebx:ecx 
	cdq
	mov ebx, eax
	mov ecx, edx

; Add ts->Val32 to Sum
	mov eax, [esi + TestStruct.Val32]
	;mov eax, [esi + TestStruct.Val32]
	cdq
	add eax, ebx
	adc edx, ecx

; Add ts->Val64 tos Sum
	add eax, dword ptr [esi + TestStruct.Val64]
	adc edx, dword ptr [esi + TestStruct.Val64 + 4]

	pop esi
	pop ebx
	pop ebp
	ret 

CalcStructSum_ endp
<<<<<<< HEAD
>>>>>>> 27e6d01ab742ee419a449160db6f0a6e7337afcb
=======
>>>>>>> 12f99e0939d0546bc7d3973165ffbb8826df7a8a
>>>>>>> 95b7c91229f799dc2bb365ba4c047e0314176892
	end