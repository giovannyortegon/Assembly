	
section .text
    global printString
printString:
    push rbp
    mov rbp, rsp
	
    mov r12, rdi
	mov rdx, 0
strLoop:
	cmp byte[r12], 0
	je strDone
	inc rdx
	inc r12
	jmp strLoop
strDone:
	cmp rdx, 0
	je prtDone
	mov rsi, rdi
	mov rax, 1
	mov rdi, 1
	syscall 
prtDone:
    leave
	ret