; memory.asm
section .data
	bNum db 123
	wNum dw 12345
	wArray times 5 dw 0		; array of 5 word
; containing 0
	dNum dd 12345
	qNum1 dq 12345
	text1 db "abc", 0
	qNum2 dq 3.141502654
	text2 db "cde", 0
section .bss
	bvar resb 1
	dvar resd 1
	wvar resw 10
	qvar resq 3
section .text
	global main
main:
    push rbp
    mov rbp, rsp
    lea rax, [bNum]			; load address of bNum in rax
    mov rax, bNum			; load address of bNum in rax
    mov rax, [bNum]			; load value at bNum in rax
    mov [bvar], rax			; load from rax at address bvar

    lea rax, [bvar]			; load address of bvar in rax+
    lea rax, [wNum]			; load address of wNum in rax
    mov rax, [wNum]			; load content of wNum in rax
    lea rax, [text1]		; load address of text1 in rax
    mov rax, text1			; load address of text1 in rax
    mov rax, text1 + 1		; load address second character in rax
    lea rax, [text1 + 1]		; load second character in rax
    mov rax, [text1]		; load starting at text1 in rax
    mov rax, [text1 + 1]	; load starting at text1 + 1 in  rax

    mov rsp, rbp
    pop rbp
    ret
