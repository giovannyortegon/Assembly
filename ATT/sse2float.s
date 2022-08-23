# sse2float.s - An example of movig SSE2 FP data type
.section .data
value1:
	.double 12.34, 2345.543
value2:
	.double -543.234, 32121.4
.section .bss
	.lcomm data, 16
.section .text
	.globl _start
_start:
	nop
	movupd value1, %xmm0
	movupd value2, %xmm1
	movupd %xmm0, %xmm2
	movupd %xmm0, data

	movl $1, %eax
	movl $0, %ebx
	int $0x80
