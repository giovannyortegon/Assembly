# pythagorean_triple.s
.section .data
msg_not_equal:
	.ascii "Not is Pythagoran triple\n"
pt:
	.int 5, 12, 13
msg_equal:
	.ascii "Is Pythagoran triple\n"
.section .bss
	.lcomm buffer, 3
.section .text
	.globl _start
_start:
	movl $pt, %edi
	movl (%edi), %eax
	movl 4(%edi), %ebx
	movl 8(%edi), %ecx

	imull %eax, %eax
	imull %ebx, %ebx
	addl %eax, %ebx
	imull %ecx, %ecx

	cmp %ebx, %ecx
	je equal
not_equal:
	push $msg_not_equal
	call printf
	add $4, %esp
	jmp end
equal:
	push $msg_equal
	call printf
	add $4, %esp
end:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
