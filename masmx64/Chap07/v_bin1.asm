; Subroutine v_bn1 sisplay byte from memeory in binary
; r12: points to the byte in memory
; registers preserved: rbx, rbp, rdi, rsi, rsp r12 - r15

v_asc proto             ; Declare external subroutine
    .code
v_bn1 proc
    push rdi            ; Save rdi and decrement by 8

    mov dl, [r12]       ; Load byte to be display buffer
    lea rdi, bits8      ; Pointer to ascii display buffer
    cld                 ; String instructions will increment
    mov cl, 7           ; Bit 7 will be output first.

; Loop through bits 7 to 0 converting them to ASCII
nxtbit:
    mov al, dl          ; Copy byte to be display
    shr al, cl          ; Shift current but to bit '0'
    ; and al, 1           ; Mask off all bits except bit 0.
    and al, 1           ; Mask off all bits except bit 0.
    ; add al, '0'         
    ; Map binary 0, 1 to ASCII '0', '1'
    add al, 30h         ; Map binary 0, 1 to ASCII '0', '1'
    stosb               ; Store in array of 8 bits
    dec cl              ; Numbers of bits left to process
    jge nxtbit

; Display all 8 bits of current byte from memory buffer
    lea rdx, bits8      ; points to 8 byte memory buffer
    mov r8, 8           ; number of characters to display
    call v_asc

    pop rdi
    ret 

v_bn1 endp
    .data
bits8 byte 8 dup(?)      ; Memory buffer for display
    end
