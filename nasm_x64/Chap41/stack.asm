; stack.asm
section .data
	first		db "A", 0
	second	db "B", 0
	third		db "C", 0
	fourth	db "D", 0
	fifth		db "E", 0
	sixth		db "F", 0
	seventh	db "G", 0
	eighth	db "H", 0
	ninth		db "I", 0
	tenth		db "J", 0
	fmt		db "The string is: %s", 10, 0

section .bss
	flist resb 14			; length of string plus end 0
	
section .text
	global main
	extern printf

main:
	push rbp
	mov rbp, rsp
	sub rsp, 8

	mov rcx, flist
	mov rdx, first
	mov r8, second
	mov r9, third
	
; now start pushing in reverse order
	push tenth
	push ninth
	push eighth
	push seventh
	push sixth
	push fifth
	push fourth
	sub rsp, 32		; shadow space
	call lfunc
	add rsp, 32 + 8	; restore stack
	
; print the result
	mov rcx, fmt
	mov rdx, flist
	sub rsp, 32 + 8
	call printf
	add rsp, 32 + 8
	
	leave
	ret
	
; -----------------------------------------------------
lfunc:
	push rbp
	mov rbp, rsp
	xor rax, rax			; clear rax (especially higher bits)
	
	mov al, byte[rdx]	; move content argument to al
	mov [rcx], al			; store al to memory
	mov al, byte[r8]
	mov [rcx + 1], al
	mov al, byte[r9]
	mov [rcx + 2], al
	
	; arguments  on stack
	xor rbx, rbx
	mov rax, qword[rbp+8+8+32]  ; rsp + rbp + return address + shadow
	
	mov bl, [rax]
	mov [rcx+3], bl
	mov rax, qword[rbp+48+8]
	mov bl, [rax]
	mov [rcx +  4], bl
	mov rax, qword[rbp + 48 + 16]
	mov bl, [rax]
	mov [rcx+5], bl
	mov rax, qword[rbp+48+24]
	mov bl, [rax]
	mov [rcx+6], bl
	mov rax, qword[rbp+48+32]
	mov bl, [rax]
	mov [rcx+7], bl
	mov rax, qword[rbp+48+40]
	mov bl, [rax]
	mov [rcx+8], bl
	mov rax, qword[rbp+48+48]
	mov bl, [rax]
	mov [rcx+9], bl
	mov bl, 0							; terminaring zero
	mov [rcx+10], bl
	
	leave
	ret
	