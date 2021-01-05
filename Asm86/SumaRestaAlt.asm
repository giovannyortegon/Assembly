TITLE Suma y resta
; Este programa suma y resta enteros de 32 bits.
.386
.model flat, stdcall
option casemap :none
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO

;include Irvine32.inc
;include C:\masm32\include\kernel32.inc
;include C:\masm32\include\masm32.inc
;includelib C:\masm32\lib\kernel32.lib
;includelib C:\masm32\lib\masm32.lib


	.code
main proc
	mov eax, 10000h
	mov eax, 40000h
	sub eax, 20000h
	call DumpRegs
	
;	exit	
	invoke ExitProcess, 0
main endp
end main
