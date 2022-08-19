	.model flat, c
; These are defined in IntegerAddition.cpp
	extern GlChar:byte
	extern GlShort:word
	extern GlInt:dword
	extern GlLongLong:qword

	.code
IntegerAddition_ proc
; function prolog
	push ebp
	mov ebp, esp

; Compute GlChar += a
	mov al, [ebp+8]
	add [GlChar], al

; Compute GlShort += b, note offset of 'b' on stack
	mov ax, [ebp+12]
	add [GlShort], ax

; Compute GlInt += c, note offset of 'c' on stack
	mov eax, [ebp+16]
	add [GlInt], eax

; Compute GlLongLong += d, note use of dword ptr operator and adc
	mov eax, [ebp+20]
	mov edx, [ebP+24]
	add dword ptr [GlLongLong], eax
	adc dword ptr [GlLongLong + 4], edx

; function epilog
	pop ebp
	ret
IntegerAddition_ endp
	end