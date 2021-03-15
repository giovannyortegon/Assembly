; file.asm
section .data
;expressions used for conditional assembly
CREATE		equ 1
OVERWRITE	equ 1
APPEND		equ 1
O_WRITE		equ 1
READ		equ 1
READ		equ 1
O_READ		equ 1
DELETE		equ 1
; syscall symbols
NR_read		equ 0
NR_write	equ 1
NR_open		equ 2
NR_close	equ 3
NR_lseek	equ 8
NR_create	equ 85
NR_unlink	equ 87
; creation and status flags
O_RDONLY	equ 000000q
O_WRONLY	equ 000001q
O_RDWR		equ 000002q
; create mode (permissions)
S_IRUSR		equ 00400q		; user read permission
S_IWUSR		equ 00200q		; user write permission

NL			equ 0xa
bufferlen	equ 64
fileName	db	"testfile.txt", 0
FD			dq	0			; file descriptor

text1		db	"1. Hello.. to everyone!", NL, 0
len1		dq	$-text1-1	; remove 0
text2		db	"2. Here I am!", NL, 0
len2		dq	$-text2-1	; remove 0
text3		db	"3. Alife and kicking!", NL, 0
len3		dq	$-test3-1	; remove 0
text4		db	"Adios !!!", NL, 0
len4		dq	$-text4-1
; Errors
error_Create	db "Error creating file", NL, 0
error_Close		db "Error closing file ", NL, 0
error_Write		db "Error writing to file", NL, 0
error_Open		db "Error opening file", NL, 0
error_Append	db "Error appending to file", NL, 0
error_Delete	db "Error deleting file", NL, 0
error_Read		db "Error reading file", NL, 0
error_Print		db "Error printing string", NL, 0
error_Position	db "Error positioning in file", NL, 0
; Success
success_Create	db "File created and opened", NL, 0
success_Close	db "File closed", Nl, NL, 0
success_Write	db "Written to file", NL, 0
success_Open	db "File opened for R/W", NL, 0
success_Append	db "File opened for appending", NL, 0
success_Delete	db "File deleted", NL, 0
success_Read	db "Reading file", NL, 0
success_Position db "Position in file", NL, 0

section .bss
	buffer resb bufferlen

section .text
	global main
main:
	push rbp
	mov rbp, rsp
%IF CREATE
; CREATAE AND OPEN A FILE, THEN CLOSE
; create and open file
	mov rdi, fileName
	call createFile
	mov qword[FD], rax		; save desriptor

; write  to file #1
	mov rdi, qword[FD]
	mov rsi, text1
	mov rdx, qword[len1]
	call writeFile

; close writeFile
	mov rdi, qword[FD]
	call closeFile
%ENDIF
%IF OVERWRITE
; OPEN AND OVERWRITE A FILE, THEN CLOSE
; open file
	mov rdi, fileName
	call openFile
	mov qword[FD], rax		; save file descriptor

; write to file #2 OVERWRITE
	mov rdi, qword[FD]
	mov rsi, text2
	mov rdx, qword[len2]
	call wirteFile
; close file
	mov rdi, qword[FD]
	call closeFile
%END IF
