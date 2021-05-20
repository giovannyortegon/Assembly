    .global _start
_start:
    ldr x3, =arr    // load address of arr
    mov w4, #0

loop:
// print ascii
    mov x0, #1
    mov x1, x3      // addresss to x1
    mov x2, #1
    mov x8, #64i    // syscall write
    svc 0

    add x3, x3, #1  // increment in 1 address of x3
    cmp x4, #4      // compare length string
    add w4, w4, #1  // iterator
    b.le loop
// exit
    mov x0, #0
    mov x8, #93
    svc 0
.data
    arr: .ascii "12345\n"
