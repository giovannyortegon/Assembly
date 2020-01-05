; array.asm
; The following example demonstrates the above concepts 
; by defining a 3-element array x, which stores three 
; values: 2, 3 and 4. 
; It adds the values in the array and displays the sum 9
section .data
	global x
	x:
		db 2
		db 4
		db 3
	sum:
		db 0

section .text
	global _start

_start:
	mov eax, 3		; number bytes to be sum
	mov ebx, 0		; EBX will store the sum
	mov ecx, x		; ECX will point to the current element to be summed

top:
	add ebx, [ecx]
	add ecx, 1		; MOV pointer to next elemnet
	dec eax			; decrement counter
	jnz top			; if counter not 0, then loop again

done:
	add ebx, '0'
	mov [sum], ebx	; Done, store result in "sum"

dispplay:
	mov eax, 4
	mov ebx, 1
	mov ecx, sum
	mov edx, 1
	int 0x80

# Exit
	mov eax, 1
	mov ebx, 0
	int 0x80
