/*
 * Printing a string using libc and
 * passing parameters to function
 * for use in printf
 *
 */
	.global main
main:
	push {lr}		// use pseudo directive
	ldr r0, =string	// r0 points to string
	mov r1, #10		// first value in r1
	mov r2, #15		// second value in r2
	mov r3, #25		// result in r3
	bl printf		// call libc
	pop {pc}

_exit:
	mov pc, lr		// simple exit

	.data
string:
	.ascii "If you add %d and %d you get %d.\n"
