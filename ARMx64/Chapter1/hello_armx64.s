/* hello_armx64.s - Show a message */
	.global _start
_start:
	mov X0, #1			// 1 = StdOut
	ldr X1, =string		// string to print
	mov X2, #14			// length of our string
	mov X8, #64			// Linux write system call
	svc 0				// Call Linux to output the string

_exit:
	mov     X0, #0		// Use 0 return code
	mov     X8, #93		// Service code 93 terminates
	svc     0			// Call Linux to terminate
	.data
string:
	.ascii  "Hello ARM x64\n"
