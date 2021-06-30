/* How to use syscall 4 to write a string */

.text
	.global _start
_start:
	mov r0, #1		@ Stdout is monitor
	ldr r1, =string @ string located at string
	mov r2, #19		@ sting is 19 chars long
	mov r7, #4		@ Syscall number
	swi 0

_exit:		@ exit syscall
	mov r0, #0
	mov r7, #1
	swi 0

.data
string: .ascii "Hello World String\n"
