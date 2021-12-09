	.model flat,c

; These are defined in IntegerAddition.cpp
	extern GlChar:byte
	extern GlShort:word
	extern GlInt:dword
	extern GlLongLong:qword

	.code
IntegerAddition_ proc

; funtion prolog
	push ebp
	mov ebp, esp

; compute char += a
	mov al, [ebp + 8]
	add [GlChar], al

; compute GlShort += b, note offset of 'b' on stack
	mov ax, [ebp + 12]
	add [GlShort], ax

; compute GlInt += c, note of 'c' on stack
	mov eax, [ebp + 16]
	add [GlInt], eax

; compute GlLongLong += d, note use of dword operator and adc
	mov eax, [ebp + 20]
	mov edx, [ebp + 24]
	add dword ptr [GlLongLong], eax
	adc dword ptr [GlLongLong + 4], edx

; function epilog
	pop ebp
   	ret

IntegerAddition_ endp
	end