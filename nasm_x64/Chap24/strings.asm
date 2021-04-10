; strings.asm
setion .data
	string1		db "This is the 1st string.", 0xa, 0
	string2		db "This is the 2nd string.", 0xa, 0
	strlen2		db equ $-strlen2 - 2
	string21	db "Comparing string: The strings do not differ.", 0xa, 0
	string22	db "Comparing string: The strings differ"
				db "starting at position: %d.", 0xa, 0
	string3		db "The quick brown fox jumps over the dog.", 0xa, 0
	strlen3		equ $-string3 - 2
	string4		db "z", 0
	string44	db "The character '%s' was found at pos: %d.", 0xa, 0
	string45	db "The character '%s' was not found.", 0xa, 0
	string46	db "Scanning for the character '%s'.", 0xa, 0

section .bss
section .text
	global main
	extern printf

main:
	push rbp
	mov rbp, rsp

	; print the 2 strings
	xor rax, rax
	mov rdi, string1
	call printf

	;compare 2 strings
	lea rdi, [string1]
	lea rsi, [string2]
	mov rdx, strlen2
	call compare1

	cmp rax, 0
	jnz not_equal1

	; strings are equal,print
	mov rdi, string21
	call printf
	jmp otherversion

	; strings are not equal, print
not_equal1:
	mov rdi, string22
	mov rsi, rax
	xor rax, rax
	call printf

	; compare 2 strings, other version --------
otherversion:
	lea rdi, [string1]
	lea rsi, [string2]
	mov rdx, strlen2
	call compare2
	jnz not_equal2

