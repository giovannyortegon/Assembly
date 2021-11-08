%include "win32n.inc"

extern printf
extern CreateFileA
extern WriteFile
extern SetFilePointer
extern ReadFile
extern CloseHandle

section .data
	msg db "Hello, Windows World!", 0
	nNumberOfBytesToWrite equ $-msg
	fileName db "mytext.txt", 0
	nNumberOfBytesToRead equ 30
	fmt db "The result of reading the file: %s", 10,0
	
section .bss
	fHandle	resq 1
	lpNumberOfBytesWritten	resq 1
	lpNumberOfBytesRead resq 1
	readBuffer resb 64
	
section .text
	global main
main:
	push rbp
	mov rbp, rsp
	
; HANDLE CreateFileA (
;		LPCSTR								lpFileName,
;		DWORD 							dwDesiredAccess,
;		DWORD 							dwShareMode,
;		LPSECURITY_ATTRIBUTES		lpSecurityAttributes,
;		DWORD								dwCreationDisposition,
;		DWORD								dwFlagAndAttributes,
;		HANDLE								hTemplateFile
; );
	sub rsp, 8
	lea rdx, [fileName]					; fileName
	mov rdx, GENERIC_READ | GENERIC_WRITE		; desired access
	mov r8, 0								; no sharing
	mov r9, 0								; default security
; push in reverse order
	push NULL								; flags and attributes
	push CREATE_ALWAYS			; disposition
	sub rsp, 32
	call CreateFileA
	add rsp, 40 							; 32 + 8

	mov [fHandle], rax
	
;BOOL WriteFile(
;		HANDLE 			hFile,
;		LPCVOID 			lpBuffer,
;		DWORD 			nNumberOfBytesToWrite,
;		LPDWORD			lpNumberOfBytesWritten,
;		LPOVERLAPPED	lpOverlapped
;);
	mov rcx, [fHandle]							; handle
	lea rdx, [msg]									; msg to write
	mov r8, nNumberOfBytesToWrite		; # bytes to write
	mov r9, [lpNumberOfBytesWritten]	; return # bytes written
	push NULL
	sub rsp, 32
	call WriteFile
	add rsp, 32
	
;DWORD SetFilePointer(
;		HANDLE		hFile,
;		LONG		lDistanceToMove,
;		PLONG		lpDistanceToMoveHigh,
;		DWORD		dwMoveMethod
;);
	mov rcx, [fHandle]							; handle
	mov rdx, 7										; low bits of position
	mov r8, 0										; no high order bits in position
	mov r9, FILE_BEGIN						; start from beginning
	call SetFilePointer
	
;BOOL ReadFile(
;		HANDLE		hFile,
;		LPCVOID	lpBuffer,
;		DWORD		nNumberOfBytesToRead,
;		LPDWORD	lpNumberOfBytesRead,
;		LPOVERLAPPED
;);
	sub rsp, 8										; align
	mov rcx, [fHandle]							; handle
	lea rdx, [readBuffer]						; buffer to read into
	mov r8, nNumberOfBytesToRead		; # bytes to read
	mov r9, [lpNumberOfBytesRead]		; # bytes read
	push NULL
	sub rsp, 32									; shadow
	call ReadFile
	add rsp, 40
	
; print result of ReadFile
	mov rcx, fmt
	mov rdx, readBuffer
	sub rsp, 40
	call printf
	add rsp, 40
	
;BOOL WINAPI CloseHandle(
;		_In_ HANDLE	hObject
;);
	mov rcx, [fHandle]
	sub rsp, 40
	call CloseHandle
	add rsp, 40
	
	leave
	ret
