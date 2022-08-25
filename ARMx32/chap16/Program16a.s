/**** Block copy routine ****/
	.global _start
_start:
	ldr	r0, =start // load locations
	ldr r1, =end	// of both strings
	ldr r2, =dest	// addr of destination

_blockcopy:
	ldmia r0!, {r3 - r4}
	stmia r2!, {r3 - r4}
	cmp r0, r1
	bne _blockcopy

_exit:
	mov r7, #1
	swi 0

	.section .data
start:
	.word 0xFFFFFFFF
	.word 0xFFFFFFFF
end:
	.word 0
	.word 0
dest:
	.word 0
	.word 0
