# string_palindrome.s
.section .data
string1:
	.asciz "refer\n"
len: 
	.int 4
.section .bss
	.lcomm reverse, 4
.section .text
	.globl _start
_start:
	leal string1+4, %esi
	mov $0, %edi
	movl $4, %ecx
	std

L1:
	lodsb
	movb %al, reverse ( , %edi, 1)
	inc %edi
	cmp $0, %ecx
	dec %ecx
	je compare
	jmp L1

compare:
	leal string1, %esi
	leal reverse, %edi
	movl $4, %ecx
	cld
	repe cmpsb
	jb not_equal

	movl $1, %eax
	movl $0, %ebx
	int $0x80

not_equal:
	movl $1, %eax
	movl $1, %ebx
	int $0x80
