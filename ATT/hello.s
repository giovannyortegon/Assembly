# hello.s
.section .data
data:
	.ascii "Hola\n"
.section .text
	.globl _start
_start:
	mov $4, %eax
	mov $1, %ebx
	mov $data, %ecx
	mov $5, %edx
	int $0x80

	mov $1, %eax
	mov $0, %ebx
	int $0x80
