.model small
 
.data

var1 db 5
var2 db 7

.code

main proc
    
    mov al, 5
    mov bl, 7
    
    xchg al, bl
    
    main endp

end