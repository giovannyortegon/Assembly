; file.asm
section .data
;expressions used for conditional assembly
CREATE		equ 0
OVERWRITE	equ 0
APPEND		equ 0
O_WRITE		equ 1
READ		equ 1
O_READ		equ 1
DELETE		equ 0

; syscall symbols
NR_read		equ 0
NR_write	equ 1
NR_open		equ 2
NR_close	equ 3
NR_lseek	equ 8
NR_create	equ 85
NR_unlink	equ 87

; creation and status flags
O_CREAT		equ 00000100q
O_APPEND	equ 00002000q
; access mode
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
len3		dq	$-text3-1	; remove 0
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
success_Close	db "File closed",NL, NL, 0
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
	call writeFile
; close file
	mov rdi, qword[FD]
	call closeFile
%ENDIF
%IF APPEND
; OPEN AND APPEND TO A FILE, THEN CLOSE
; open file to append
	mov rdi, fileName
	call appendFile
	mov qword[FD], rax	; save file descriptor
; write to file #3 APPEND
	mov rdi, qword [FD]
	mov rsi, text3
	mov rdx, qword [len3]
	call writeFile
; close file
	mov rdi, qword[FD]
	call closeFile
%ENDIF
%IF O_WRITE
; OPEN AND OVER WRITE AT AN OFFSET IN A FILE THEN CLOSE
; open file to write
	mov rdi, fileName
	call openFile
	mov qword[FD], rax	; save file descriptor
; position file at offset
	mov rdi, qword[FD]
	mov rsi, qword[len2]	; offset at this location
	mov rdx, 0
	call positionFile
; write to file at offset
	mov rdi, qword[FD]
	mov rsi, text4
	mov rdx, qword[len4]
	call writeFile
; close file
	mov rdi, qword[FD]
	call closeFile
%ENDIF
%IF READ
; OPEN AND READ FROM A FILE THEN CLOSE
; open file to read
	mov rdi, fileName
	call openFile
	mov qword[FD], rax	; save file descriptor
; read from file
	mov rdi, qword[FD]
	mov rsi, buffer
	mov rdx, bufferlen
	call readFile
	mov rdi, rax
	call printString
; close file
	mov rdi, qword[FD]
	call closeFile
%ENDIF
%IF O_READ
; OPEN AND READ AT AN OFFSET FROM A FILE, THE CLOSE
; open file to read
	mov rdi, fileName
	call openFile
	mov qword[FD], rax		; save file descriptor
; position file at offset
	mov rdi, qword[FD]
	mov rsi, qword[len2]	; skip the first line
	mov rdx, 0
	call positionFile
;read from file
	mov rdi, qword[FD]
	mov rsi, buffer
	mov rdx, 10				; number of character to read
	call readFile
	mov rdi, rax
	call printString
; close file
	mov rdi, qword[FD]
	call closeFile
%ENDIF
%IF DELETE
; delete file 
	mov rdi, fileName
	call deleteFile
%ENDIF
leave
ret
; ----------------------------------------------------------------
; FILE MANIPULATION FUNCTIONS
	global readFile
readFile:
	mov rax, NR_read
	syscall				; rax contains # of charaters read
	cmp rax, 0
	jl readerror
	mov byte[rsi + rax], 0		; add a teminating zero
	mov rax, rsi
	mov rdi, success_Read
	push rax				; caller saved
	call printString
	pop rax					; caller saved
	ret

readerror:
	mov rdi, error_Read
	call printString
	ret
; ------------------------------------------------------------------
	global deleteFile
deleteFile:
	mov rax, NR_unlink
	syscall
	cmp rax, 0
	jl deleteerror
	mov rdi, success_Delete
	call printString
	ret
deleteerror:
	mov rdi, error_Delete
	call printString
	ret
; ------------------------------------------------------------------
	global appendFile
appendFile:
	mov rax, NR_open
	mov rsi, O_RDWR | O_APPEND
	syscall

	cmp rax, 0
	jl appenderror
	mov rdi, success_Append
	push rax					; caller saved
	call printString
	pop rax
	ret
appenderror:
	mov rdi, error_Append
	call printString
	ret
; -------------------------------------------------------------------
	global openFile
openFile:
	mov rax, NR_open
	mov rsi, O_RDWR
	syscall
	cmp rax, 0
	jl openerror
	mov rdi, success_Open
	push rax				; caller saved
	call printString
	pop rax					; caller saved
	ret
openerror:
	mov rdi, error_Open
	call printString
	ret
; ------------------------------------------------------------------
	global writeFile
writeFile:
	mov rax, NR_write
	syscall
	cmp rax, 0
	jl writeerror
	mov rdi, success_Write
	call printString
	ret
writeerror:
	mov rdi, error_Write
	call printString
	ret
; -----------------------------------------------------------------
	global positionFile
positionFile:
	mov rax, NR_lseek
	syscall
	cmp rax, 0
	jl positionerror
	mov rdi, success_Position
	call printString
	ret
positionerror:
	mov rdi, error_Position
	call printString
	ret
; -----------------------------------------------------------------
	global closrFile
closeFile:
	mov rax, NR_close
	syscall
	cmp rax, 0
	jl closeerror
	mov rdi, success_Close
	call printString
	ret
closeerror:
	mov rdi, error_Close
	call printString
	ret
;------------------------------------------------------------------
	global createFile
createFile:
	mov rax, NR_create
	mov rsi, S_IRUSR | S_IRUSR
	syscall
	cmp rax, 0
	jl creatorerror
	mov rdi, success_Create
	push rax					; caller saved
	call printString
	pop rax
	ret
creatorerror:
	mov rdi, error_Create
	call printString
	ret
; PRINT FEEDBACK
; --------------------------------
	 global printString
printString:
; count characters
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
prtDone:
	ret
