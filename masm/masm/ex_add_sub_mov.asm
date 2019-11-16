.model small

.data

var1 db 5
var2 db 6

.code

main proc
    
   mov ax,@data
   mov ds, ax
   
   mov al, var1
   mov ah, var2
   add ah, al             
   
   mov al, var1
   mov ah, var2
   sub ah, al
   
    
    
    main endp
end




