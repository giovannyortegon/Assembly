section .data
	scan_name db "%s",0
	scan_kw	  db "%d", 0
	fmt_name db "Insert your name: ", 10, 0
	fmt_kw db  "Kilowatt hour: ", 10, 0
	fmt_bill db "%s has consumed kilowatt %d to $%d hour",10 ,0
section .bss
	name resb 20
	kw	 resq 1
section .text
	global main
	extern printf
	extern scanf
	extern calculate
main:
	push rbp
	mov rbp, rsp
; scan name
	mov rdi, fmt_name
	xor rax, rax
	call printf

	mov rdi, scan_name
	mov rsi, name
	xor rax, rax
	call scanf
; scanf number kilowatts
	mov rdi, fmt_kw
	xor rax, rax
	call printf

	mov rdi, scan_kw
	mov rsi, kw
	xor rax, rax
	call scanf

	mov rdi, [kw]
	call calculate

; print information about customer
	mov rdi, fmt_bill
	mov rsi, name
	mov rdx, [kw]
	mov rcx, rax
	xor rax, rax
	call printf

	leave
	ret
