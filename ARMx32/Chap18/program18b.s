/* Implement a single macro */
	.global _start
_start:

/* Building Macro */
.macro multtwo val1, val2
	mov r1, #\val1
	mov r2, #\val2
	mul r0, r1, r2
.endm

multtwo 2, 2
multtwo 3, 4

mov r7, #1 // exit through syscall
swi 0
