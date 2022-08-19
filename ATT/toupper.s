# toupper.s - Read an input and convert output in uppercase
.section .data
# System call
.equ sys_open, 5
.equ sys_write, 4
.equ sys_read, 3
.equ sys_close, 6
.equ sys_exit, 1

# Options to open
.equ O_RONLY, 0
.equ O_CREATE_WRONLY_TRUNC, 03101

# File descriptors
.equ stdin, 0
.equ stdout, 1
.equ stderr, 2

# System call interrupt
.equ LINUX_SYSCALL, 0X80
.equ END_OF_FILE, 0

.equ NUMBER_ARGUMENTS, 2

.section .bss
# BUFFER
.equ BUFFER_SIZE, 500
.lcomm BUFFER_DATA, BUFFER_SIZE

.section .text

# Stack Positions
.equ ST_SIZE_RESERVE, 8
.equ ST_FD_IN, -4
.equ ST_FD_OUT, -8
.equ ST_ARGC, 0				# Number of arguments
.equ ST_ARGV_O, 4			# Name of program
.equ ST_ARGV_1, 8			# Input fie name
.equ ST_ARGV_2, 12			# Output file name

	.globl _start

_start:
# Save the stack pointer
	mov %esp, %ebp

# Allocate space for our file descriptors on the stack
	subl $ST_SIZE_RESERVE, %esp

open_files:
open_fd_in:
# OPEN INPUT FILE
# Open syscall
	movl $sys_open, %eax
# Input filename into %eax
	movl ST_ARGV_1(%ebp), %ebx
# Read-only flag
	movl $O_RONLY, %ecx
# this doesn't matter for reading
	movl $0666, %edx
# call Linux
	int $LINUX_SYSCALL

store_fd_in:
# Save the given file descriptor
	movl %eax, ST_FD_IN(%ebp)

open_fd_out:
# OPEN OUTPUT FILE
# Open the file
	movl $sys_open, %eax
# output filename into %ebx
	movl ST_ARGV_2(%ebp), %ebx
# Flags for writing to the file
	movl $O_CREATE_WRONLY_TRUNC, %ecx
# mode for new file (if it's created)
	movl $0666, %edx
# call linux
	int $LINUX_SYSCALL

store_fd_out:
# Store the file descriptor here
	movl %eax, ST_FD_OUT(%ebp)

# MAIN LOOP
read_loop_begin:
## Read in a block from the input file
	movl $sys_read, %eax
# get the input file descriptor
	movl ST_FD_IN(%ebp), %ebx
# the location to read into
	movl $BUFFER_DATA, %ecx
# the size of the buffer
	mov $BUFFER_SIZE, %edx
	int $LINUX_SYSCALL

# EXIT
# Check fir end of file
	cmpl $END_OF_FILE, %eax
# if found an Error, go to end
	jle end_loop

continue_read_loop:
# Convert the block to upper case
	pushl $BUFFER_DATA		# Locate Buffer
	pushl %eax				# size of the buffer
	call convert_to_upper
	pop %eax				# get the size back
	addl $4, %esp			# restore %esp

# OUTPUT FILE
# size of the buffer
	movl %eax, %edx
	movl $sys_write, %eax
# file to use
	movl ST_FD_OUT(%ebp), %ebx
# Location of the buffer
	movl $BUFFER_DATA, %ecx
	int $LINUX_SYSCALL

## continue loop
	jmp read_loop_begin

end_loop:
	# Close file
	movl $sys_close, %eax
	movl ST_FD_OUT(%ebp), %ebx
	int $LINUX_SYSCALL

	movl $sys_close, %eax
	movl ST_FD_IN(%ebp), %ebx
	int $LINUX_SYSCALL

## EXIT
	movl $sys_exit, %eax
	movl $0, %ebx
	int $LINUX_SYSCALL

## Constants
.equ LOWERCASE_A, 'a'
.equ LOWERCASE_Z, 'z'
.equ UPPER_CONVERSION, 'A' - 'a'
## Stack Buffer
.equ ST_BUFFER_LEN, 8		# Length of buffer
.equ ST_BUFFER, 12			# Actual buffer

convert_to_upper:
	pushl %ebp
	movl  %esp, %ebp

# Set up variables
	movl ST_BUFFER(%ebp), %eax
	movl ST_BUFFER_LEN(%ebp), %ebx
	movl $0, %edi
# if a buffer with zero length, just leave
	cmpl $0, %ebx
	je end_convert_loop

convert_loop:
	movb (%eax, %edi, 1), %cl
#go to the next byte unless it is between
	cmpb $LOWERCASE_A, %cl
	jl next_byte
	cmpb $LOWERCASE_Z, %cl
	jg next_byte
#otherwise convert the byte to uppercase
	addb $UPPER_CONVERSION, %cl
# and store it back
	movb %cl, (%eax, %edx, 1)
next_byte:
	incl %edi			# next byte
	cmpl %edi, %ebx		# continue unless

	jne convert_loop

end_convert_loop:
# No return value, just leave
	movl %ebp, %esp
	popl %ebp
	ret
