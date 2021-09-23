//
// Assembler program to convert a string to
// all upper case by calling a function.
//
// X0-X2, X8 - used by macros to call linux
// X11 - input file descriptor
// X9 - output file descriptor
// X10 - number of characters read
//
#include<asm/unistd.h>
#include"fileio.S"

.equ BUFFERLEN, 250

	.global _start
_start:
	openFile inFile, O_RDONLY
	adds x11, xzr, x0				// svae file descriptor
	b.pl nxtfill					// pos number file opened ok
	mov x1, #1						// stdout
	ldr x2, =inpErrsz
	ldr w2, [x2]
	writeFile x1, inpErr, x2			// print the error
	b exit

nxtfill:
	openFile outFile, O_CREAT+O_WRONLY
	adds x9, xzr, x0
	b.pl loop						// file open ok
	mov x1, #1
	ldr x2, =outErrsz
	ldr w2, [x2]
	writeFile x1, outErr, x2
	b exit

// loop throu file until done
loop:
	readFile x11, buffer, BUFFERLEN
	mov x10, x0					// keep the length read
	mov x1, #0					// null terminator for string

	// setup call to toupper and call function
	ldr x0, =buffer				// first param for toupper
	strb w1, [x0, x10]			// pit null at end of string

	ldr x1, =outBuf
	bl toupper

	writeFile x9, outBuf, x10
	cmp x10, #BUFFERLEN
	b.eq loop

	flushClose x11
	flushClose x9

// Setup the parameters to exit the program
// and then call Linux to do it.
exit:
	mov x0, #0
	mov x8, #__NR_exit
	svc 0						// call linux to terminate

.data
	inFile: .asciz "main.S"
	outFile: .asciz "upper.txt"
	buffer: .fill BUFFERLEN + 1, 1, 0
	outBuf: .fill BUFFERLEN + 1, 1, 0
	inpErr: .asciz "Failed to open input file.\n"
	inpErrsz: .word .-inpErr
	outErr: .asciz "Failed to open output file.\n"
	outErrsz: .word .-outErr
