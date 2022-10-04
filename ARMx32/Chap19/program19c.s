/*
 * Reading a number using scanf
 * via registers and the stack
 */
	.global main
	.func main
main:
	push {lr}
	sub sp, sp, #4
// scanf
	ldr r0, addr_format
	mov r1, sp
	bl scanf

	ldr r2, [sp]
	ldr r3, addr_number
	str r2, [r3]
	add sp, sp, #4
	pop {pc}

_exit:
	mov pc, lr

addr_format: .word scanformat
addr_number: .word number

	.data
number: .word 0
scanformat: .ascii "%d"
