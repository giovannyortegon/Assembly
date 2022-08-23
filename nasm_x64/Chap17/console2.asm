; console2.asm
section .data
	msg1	db	"Hello, world!", 10, 0
	msg2	db	"Your turn (only a-z): ", 0
	msg3	db	"You answered: ", 0
	inputlen equ 10			; length input buffer
	NL		db	0xa

section .bss
	input resb inputlen+1	; provide space for ending 0
section .text
	global main
main:
	push rbp
	mov rbp, rsp

	mov rdi, msg1	; print first string
	call prints

	mov rdi, msg2	; print second string
	call prints

	mov rdi, input
	mov rsi, inputlen
	call reads

	mov rdi, msg3
	call prints

	mov rdi, input
	call prints

	mov rdi, NL
	call prints

	leave
	ret

; --------------------------------------------------

prints:
	push rbp
	mov rbp, rsp

	push r12		; callee saved
; count characters
	xor rdx, rdx
	mov r12, rdi

.lengthloop:
	cmp byte [r12], 0
	je .lengthfound
	inc rdx
	inc r12
	jmp .lengthloop

.lengthfound:			; print the string, length in rdx
	cmp rdx, 0
	je .done
	mov rsi, rdi		; rdi constains address of string
	mov rax, 1
	mov rdi, 1
	syscall 

.done:
	pop r12
	leave
	ret

; ------------------------------------------------------
reads:
section .data
section .bss
	.inputchar resb 1
section .text
	push rbp
	mov rbp, rsp

	push r12		; callee saved
	push r13		; callee saved
	push r14		; callee saved
	
	mov r12, rdi
	mov r13, rsi
	xor r14, r14

.readc:
	mov rax, 0		; read
	mov rdi, 1		; stdin
	lea rsi, [.inputchar]	; address of input
	mov rdx, 1			; # of characters to read
	syscall

	mov al, [.inputchar]

	cmp al, byte[NL]
	je .done			; NL end
	cmp al, 97			; lower than a?
	jl .readc			; ignore it
	cmp al, 122			; higher that z?
	jg .readc			; ignore it
	inc r14				; inc counter
	cmp r14, r13
	ja .readc			; buffer max reached , ignored
	mov byte[r12], al	; safe the char in the buffer
	inc r12				; point to next char in buffer
	jmp .readc
.done:
	inc r12
	mov byte[r12], 0	; add end 0 to input buffer
	pop r14
	pop r13
	pop r12

	leave
	ret
