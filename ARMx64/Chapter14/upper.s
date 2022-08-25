// Assembler program to convert a string to
// all upper case.
  .global _start
_start:
  ldr x4, =instr      // start of input string
  ldr x3, =outstr     // output string

// loop is until byte pointed to non-zero
loop:
  ldrb w5, [x4], #1     // load character and incr pointer
// if w5 > 'z'
  sub w6, w5, #'a'
  cmp w6, #25
// else if w5 < 'a' then goto end if
  sub w6, w5, #('a'-'A')
  csel w5, w6, w5, ls
  strb w5, [x3], #1     // store character to output str
  cmp w5, #0            // stop on hitting a null character
  b.ne loop             // loop if character is not null

// setup to print
  mov x0, #1            // 1 = stdout
  ldr x1, =outstr       // string to print
  sub x2, x3, x1        // get the length by sub'ing the pointers
  mov x8, #64           // syscall
  svc 0

// exit
  mov x0, #0
  mov x8, #93           // syscall
  svc 0

  .data
instr:  .asciz "This is our Test String that we will convert.\n",
outstr: .fill 255, 1, 0
