.model small

.data


.code

main proc
    ; inicialize value
    mov ax, 3
    mov bx, 5
    mov cx, 7
    ; move value from memory to another
    mov dx, ax
    mov ax, cx
    mov cx, bx
    mov bx, dx
    
    main endp
end