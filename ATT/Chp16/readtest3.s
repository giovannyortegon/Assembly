# readtest3.s - An example of modifying data read from a file and output
.section .bss
	.lcomm buffer, 10
	.lcomm infilehandle, 4
	.lcomm outfilehandle, 4
	.lcomm size, 4
.section .text
	.globl _start
_start:
# open input file, specified by the first command line param
	movl %esp, %ebp
	movl $5, %eax
	movl 8(%ebp), %ebx
	movl $00, %ecx
	movl $0444, %edx
	int $0x80
	test %eax, %eax
	js badfile
	movl %eax, infilehandle
# open an output file, specified by the second command line param
	movl $5, %eax
	movl 12(%ebp), %ebx
	movl $01101, %ecx
	movl $0644, %edx
	int $0x80
	test %eax, %eax
	js badfile
	movl %eax, outfilehandle
# read one buffer's worth of data from input file
read_loop:
	movl $3, %eax
	movl infilehandle, %ebx
	movl $buffer, %ecx
	movl $10, %edx
	int $0x80
	test %eax, %eax
	jz done
	js badfile
	movl %eax, size
# send the buffer data to the conversion function
	pushl $buffer
	pushl size
	call convert
	addl $8, %esp
# write the converted data buffer to the output file
	movl $4, %eax
	movl outfilehandle, %ebx
	movl $buffer, %ecx
	movl size, %edx
	int $0x80
	test %eax, %eax
	js badfile
	jmp read_loop
# close files
done:
	# close the output file
	movl $6, %eax
	movl outfilehandle, %ebx
	int $0x80

	# close the input file
	movl $6, %eax
	movl infilehandle, %ebx
	int $0x80
badfile:
	movl %eax, %ebx
	movl $1, %eax
	int $0x80

# convert lower case letters to upper case
.type convert, @function
convert:
	pushl %ebp
	movl %esp, %ebp
	movl 12(%ebp), %esi
	movl %esi, %edi
	movl 8(%ebp), %ecx
convert_loop:
	lodsb
	cmpb $0x61, %al
	jl skip
	cmpb $0x7a, %al
	jg skip
	subb $0x20, %al
skip:
	stosb
	loop convert_loop
	movl %ebp, %esp
	popl %ebp
	ret
