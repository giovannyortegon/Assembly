
//  extern "C" void CalcMatrixSquares_(int * y, const int * x, int m, int n)
//  r0: y1 o y2
//  r1: x
//  r2: m
//  r3: n

    .text
    .cpu cortex-a72
    .global CalcMatrixSquares_
CalcMatrixSquares_:
    push {r4-r8}

    cmp r2, #0
    ble Done        // jump if m <= 0
    cmp r3, #0
    ble Done        // jump if n <= 0

    mov r4, #0      // i = 0

loop1:
    mov r5, #0      // j = 0

loop2:
    mov r6, r5                  // r6 = j
    mul r6, r6, r2              // r6 = j * m
    add r6, r6, r4              // r6 = j * m + i
    ldr r7, [r1, r6, lsl #2]    // r7 = x[kx] x[i][j]

    mul r7, r7, r7

    mov r8, r4                  // r8 = i
    mul r8, r8, r3              // r8 = i * n
    add r8, r8, r5              // ky = i * m + j
    str r7, [r0, r8, lsl #2]    // save y[ky] y[i][j]

    add r5, #1                  // j += 1
    cmp r5, r3
    blt loop2                   // jump if j < n

    add r4, #1                  // i += 1
    cmp r4, r2
    blt loop1                   // jump if i < m

Done:
    pop {r4-r8}
    bx lr
