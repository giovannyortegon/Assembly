
  .global _start
_start:
// Load the address of mynumber into X1
  ldr x1, =mynumber
// load the word stored at mynumber into X2
  ldr x2, [x1]

  mov x0, #0
  mov x8, #93
  svc 0

  .data
mynumber: .quad 0x123456789abcdef0
