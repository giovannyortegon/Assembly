;       Subroutine v_dec1 display one byte in a selected base.
;           r11:    Contains the base (2 through 10)
;           r12:    Points to the byte in memory
;           Registers preesrved: rbx, rbp, rdi, rsi, rsp, r12-r15
v_asc   proto
    .code
v_dig1    proc
    push rbx
    mov al, [r12]
    lea rdx, dbuf + lengthof dbuf
    mov r8, rdx

; Calculate next digit to be displayed
modX:
    dec rdx             ; the position to hold next digit
    mov ah, 0           ; prepare a 16 bit number in AX
    div r11b            ; get quotient in AL, remainder in AH
    add ah, '0'         ; map 0 through 9 to '0' through '9'
    mov [rdx], ah       ; store in array of digits
    and al, al          ; test if any quotient left to process
    jnz modX            ; continue until all digit done

;   display all digits of current byte from memory buffer
    sub r8, rdx         ; number of characters to display
    call v_asc          ; subrutine that display ASCII

    pop rbx
    ret

v_dig1 endp
    .data
dbuf    byte    8 dup(?)
    end