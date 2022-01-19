/*
 * Reading a number using scanf
 * and printing it with printf
 */
	.global main
main:
	push {lr}				// use pseudo directive
	sub sp, sp, #4			// make a word on stack
	ldr r0, addr_msgin		// get addr of message in
	bl printf
	ldr r0, addr_format		// get addr of format
	mov r1, sp				// place SP in r1
	bl scanf				// and store entry on stack

	ldr r1, [sp]			// get addr of scanf input
	ldr r0, addr_msgout		// get addr of messageout
	bl printf

	add sp, sp, #4			// adjust stack
	pop {pc}				// restore pc

_exit:
	mov pc, lr				// simple exit

addr_msgin:	.word messagein
addr_format: .word scanformat
addr_msgout: .word messageout

	.data
messagein: .asciz "Enter your number: "
scanformat: .asciz "%d"
messageout: .asciz "Your number was 0x%X\n"
