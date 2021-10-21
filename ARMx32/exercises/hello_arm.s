/* hello_armx32.s - Display on screen a messge */
	.global _start
_start:
	mov r0, #1		@ stdout
	ldr r1, =string
	mov r2, #14		@ string length
	mov r7, #4		@ Syscall write number
	swi 0
/* exit */
_exit:
	mov r0, #0		@ return 0
	mov r7, #1		@ syscall
	swi 0

	.data
string:
	.ascii "Hello ARM x32\n"
