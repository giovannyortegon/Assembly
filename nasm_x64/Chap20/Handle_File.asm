section .data
; syscall symbols
	
	NR_lseek	equ 8
; status flags
	O_CREAT equ 00000100q
	O_APPEND equ 00002000q
; access mode
	O_RDONLY equ 000000q
	O_WRONLY equ 000001q
	
; create mode (permissions)
	NL			equ		0xa
	bufferlen	equ		64
	fileName	db		"textfile.txt", 0
	FD			dq		0					; File description
; Message to write on file
	text1	db	"1. Hello…to everyone!",NL,0
	len1	dq	$-text1-1
	text2	db	"2. Here I am!",NL,0
	len2	dq	$-text2-1
	text3	db	"3. Alife and kicking!",NL,0
	len3	dq	$-text3-1
	text4	db	"Adios !!!",NL,0
	len4	dq	$-text4-1
; Message Error
	error_Append	db "Error appending to file", NL, 0
	error_Delete	db "Error deleting file", NL, 0
	error_Position	db "Error positioning in file", NL, 0
; Message Success
	success_Append	db "File opened for appending", NL, 0
	success_Delete	db "File deleted", NL, 0
	success_Position db "Position in file", NL, 0
section .bss
	buffer	resb bufferlen
section .text
	global main
;	extern create_file
;	extern write_file
	extern open_file
	extern read_file
	extern close_file
	extern printString
main:
	push rbp
	mov rbp, rsp

; create and open file
;	mov rdi, fileName
;	call create_file
;	mov qword[FD], rax			; file description
; write file
;	mov rdi, qword[FD]
;	mov rsi, text1
;	mov rdx, qword[len1]
;	call write_file
; open file
	mov rdi, fileName
	call open_file

	mov qword[FD], rax		; file descriptor
; read file
	mov rdi, qword[FD]
	mov rsi, buffer
	mov rdx, bufferlen
	call read_file

	mov rdi, rax
	call printString
	
; close file
	mov rdi, qword[FD]
	call close_file

	leave
	ret