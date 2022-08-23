/* Printing a string using libc */
/* entry requirement change */
/* and string must end with 0 */
/* when using printf function */
	.global main
	.func main
main:
	stmfd sp!, {lr}		// save lr
	ldr r0, =string		// r0 point to string
	bl printf			// call libc
	ldmfd sp!, {pc}		// restore pc

_exit:
	mov pc, lr			// simple exit

	.data
string:
	.asciz "Hello World String\n"
