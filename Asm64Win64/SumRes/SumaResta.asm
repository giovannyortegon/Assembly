TITLE Suma y Resta, Version 2
; Este el programa y resta enteros de 32 bits
; y almacena la suma en una varaible.
; Modo de direccionamiento real.

INCLUDE Irvine32.inc
.data
	val1 dword 10000h
	val2 dword 40000h
	val3 dword 20000h
	valFinal dword ?

.code
main PROC
	mov eax, val1
	add eax, val2
	sub eax, val3
	mov valFinal, eax
	call DumpRegs

	exit
main ENDP
END main