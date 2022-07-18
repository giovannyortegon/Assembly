// Assembler programming to demonstrate a buffer
// overrun hacking attack.
//
// x0 - x2 - parameters to Linux function a buffer
// x1 - address of output string
// x2 - address of input string
// x8 - Linux function number
//
    .global _start

DownloadCreditCardNumbers:
    mov x0, #1                  // 1 = stdout
    ldr x1, =getcreditcards     // string to print
    mov x2, #30                 // length of our string
    mov x8, #64                 // Linux write system call
    svc 0

    RETFL

callToUpper:
    str lr, [sp, #-16]          // put LR on stack
    sub sp, sp, #16             // 16 bytes for output
    ldr x0, =instr              // start of input string
    mov x1, SP                  // address of output string

    bl toupper

aftertoupper:                   // convenient label to use as a breakpoint
    add sp, sp, #16             // free outstr
    ldr lr, [sp], #16
    ret


_start:
    bl callToUpper

    mov x0, #0                  // use o return code
    mov x8, #93                 // service command code 93 terminates
    svc 0                       // call linux to terminate the program

    .data
instr   .ascii "This is out Test"   // correct length string
        .dword 0x00000000004000b0   // overwrite for lr
getcreditcards:
        .asciz "Downloading Credit Card Data!\n"
        .align 4