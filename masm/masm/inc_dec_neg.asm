.model small 


.data

var db 6

.code

main proc
   
   mov ax, @data
   mov ds, ax
   
   mov ah, var
   
   inc ah
   dec var
    
   mov al, var
   neg var
   mov ah, var
    
    main endp

end





