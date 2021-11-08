  .global _start
_start:
  movn x2, #0x00000000345
  mov x4, #0x000000000034
  adcs x0, x2, x4

  movn x3, #0x000000000034
  mov x5, x0
  sbc x0, x3, x5
  subs x0, x3, x5
  sub x0, x3, x5

  mov x8, #93
  svc 0
