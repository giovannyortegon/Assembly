/* Implement a single macro #2 */
	.global _start
_start:
	mov r0, #0

/* building macro */
.macro multtwo val1, val2
	mov r1, #\val1
	mov r2, #\val2
	mla r0, r1, r2, r0
.endm

multtwo 2, 2
multtwo 3, 4
multtwo 5, 6

mov r7, #1
swi 0
