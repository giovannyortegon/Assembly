/** conver to binary
**
** Register:
** r6 = number, r8 = perserve, r9 = mask
** r7 = needed for syscall, r1 = points to string
**
**/

.global _start
_start:
	mov r6, #15
	mov r10, #1				@ set up mask
	mov r9, r10, lsl #31
	ldr r1, =string			// point to string

_bits:
	tst r6, r9
	moveq r0, #48
	movne r0, #49
	str r0, [r1]
	mov r8, r6
	bl _write
	mov r6, r8

	movs r9, r9, lsr #1  @ shuffle mask bits
	bne _bits

_exit:
	mov r7, #1
	swi 0

_write:
	mov r0, #1
	mov r2, #1
	mov r7, #4
	swi 0
	bx lr

.data
	string:
	.ascii " "
