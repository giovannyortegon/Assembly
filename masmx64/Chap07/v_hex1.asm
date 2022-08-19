<<<<<<< HEAD
; Subroutine v_hex1 display one by in hexadecimal.
;   r12:    Points to the byte in memory
;   Registers preserved: rbx, rbp, rdi, rsi, rsp, r12 - r15
v_asc   proto       ; declare external subroutine
    .code
v_hex1  proc
    push rbx

    lea rdx, nib2       ; points to 2 byte memory buffer
    lea rbx, dig        ; pointer to list of hex digits
    mov al, [r12]       ; Load byte to be displayed
    shr al, 4           ; Right justify first nibble
    xlat                ; convert 4 bits nibble to hex digit
    mov [rdx], al       ; store high-order hex digit

    mov al, [r12]       ; reload byte to be display
    and al, 1111b       ; mask off all but second nibble
    xlat                ; convert 4 bit nibble to hex digit
    mov [rdx + 1], al   ; store low order hex digit

    mov r8, 2           ; number of characters to display
    call v_asc          ; subroutine tht display ASCII

    pop rbx
    ret

v_hex1 endp
    .data
dig     byte    "0123456789"    ; ascii string of digits 0 through 9
        byte    "ABCDEF"        ; ascci string of digits a through  f
nib2    byte    2 dup (?)       ; memory buffer for display
=======
; Subroutine v_hex1 display one by in hexadecimal.
;   r12:    Points to the byte in memory
;   Registers preserved: rbx, rbp, rdi, rsi, rsp, r12 - r15
v_asc   proto       ; declare external subroutine
    .code
v_hex1  proc
    push rbx

    lea rdx, nib2       ; points to 2 byte memory buffer
    lea rbx, dig        ; pointer to list of hex digits
    mov al, [r12]       ; Load byte to be displayed
    shr al, 4           ; Right justify first nibble
    xlat                ; convert 4 bits nibble to hex digit
    mov [rdx], al       ; store high-order hex digit

    mov al, [r12]       ; reload byte to be display
    and al, 1111b       ; mask off all but second nibble
    xlat                ; convert 4 bit nibble to hex digit
    mov [rdx + 1], al   ; store low order hex digit

    mov r8, 2           ; number of characters to display
    call v_asc          ; subroutine tht display ASCII

    pop rbx
    ret

v_hex1 endp
    .data
dig     byte    "0123456789"    ; ascii string of digits 0 through 9
        byte    "ABCDEF"        ; ascci string of digits a through  f
nib2    byte    2 dup (?)       ; memory buffer for display
>>>>>>> 27e6d01ab742ee419a449160db6f0a6e7337afcb
    end