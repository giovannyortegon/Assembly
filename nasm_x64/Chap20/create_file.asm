section .data
	NL			equ	0xa
; error message
    error_Create	db "Error creating file", NL, 0
; success message 
    success_Create	db "File created and opened", NL, 0
; syscall
    NR_create	equ 85
; Permission
    S_IRUSR		equ 00400q  ;user read permission
    S_IWUSR		equ 00200q  ;user write permission
section .text 
    global create_file
    extern printString
create_file:
    push rbp
    mov rbp, rsp

	mov rax, NR_create
	mov rsi, S_IRUSR | S_IWUSR
	syscall
	cmp rax, 0
	jl createerror
    push rax					; caller saved
	mov rdi, success_Create
	call printString
	pop rax						; caller saved
    jmp Done

createerror:
	mov rdi, error_Create
	call printString

Done:    
    leave
	ret