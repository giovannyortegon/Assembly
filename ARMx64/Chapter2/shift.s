  .global _start
_start:
;  mov x2, #1
;  mov x1, x2, LSL #1
;  mov x2, x1, LSL #1
;  mov x1, x2, LSL #1

;  mov x2, x1, LSR #1

  mov x1, #0xF
  mov x0, x1, ASR #1
  mov x1, x0, ROL #1

  mov x0, x1

  mov x8, #93
  svc 0
