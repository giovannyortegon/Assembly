.section .data
	value:
		.int 10
	value2:
		.int 20
.section .text
	.globl _start
_start:
	mov $7, %eax
	roll %eax
	rorl value

	mov $1, %eax
	mov $0, %ebx
	int $0x80
