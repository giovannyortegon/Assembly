/* Program8a.s - convert to lower case using logical operator */
.text
	.global _start
_start:

_read:			@ read syscall
	mov r0, #0		@ syscall number
	ldr r1, =string	@ string at string
	mov r2, #1		@ read one character only
	mov r7, #3		@ syscall number
	swi 0

_togglecase:
	ldr r1, =string		@ address of char
	ldr r0, [r1]		@ load it into r0
	orr r0, r0, #0x20	@ change case
	str r0, [r1]		@ wirte char back

_write:				@ write syscall
	mov r0, #1		@ stdout is monitor
	ldr r1, =string @ string at start
	mov r2, #1		@ string is 1 char long
	mov r7, #4		@ syscall number
	swi 0

_exit:
					@ exit syscall
	mov r7, #1
	swi 0

.data
	string: .ascii " "
