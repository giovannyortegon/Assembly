section .data
	val1 dw 1000h
	val2 dw 2000h
	arregloB db	10h, 20h, 30h, 40h, 50h
	arregloW dw 100h, 200h, 300h
	arregloD dd	10000h, 20000h

section .text
	global _start
_start:
	nop
; MOVZX
	mov		bx, 0A69Bh
	movzx	eax, bx			; EAX=0000A69Bh
	movzx	edx, bl			; EDX=0000009bh
	movzx	cx, bl			; CX = 009Bh
; MOVSX
	mov bx, 0A69Bh
	movsx eax, bx
	movsx edx, bl
	mov bl, 7Bh
	movsx cx, bl
; Intercambio de memoria a memoria
	mov ax, [val1]
	xchg ax, [val2]
	mov [val1], ax
; Direccionamento con desplazamients de directo (palabras)
	mov al, [arregloB]
	mov al, [arregloB+1]
	mov al, [arregloB+2]
; Direccionamiento directo con desplazamiento directo (dobles palabras)
	mov ax, [arregloW]
	mov ax, [arregloW+2]
; Direcionamiento directo con desplazamiento directo (dobles palabras)
	mov eax, [arregloD]
	mov eax, [arregloD+4]
	mov eax, [arregloD+4]

	mov eax, 1
	int 0x80
