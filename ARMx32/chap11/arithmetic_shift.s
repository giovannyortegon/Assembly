	.global _start
_start:
	mov r1, #255
	mov r2, #1
//	movs r0, r1, ASR r2
// mov cs s - move - carry flag - signed
	movcss r0, r1, ASR r2		// Execute if Carry Flag is set (1)

_exit:
	mov r7, #1
	swi 0
