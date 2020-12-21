.model small

.data
    
num1 db 6
num2 db 3
sum  db 0
def  db 0
    
.code

main proc
         
    mov ax, @data
    mov ds, ax
    
    mov al, num1
    add al, num2
    
    mov sum, al
    
    mov al, num1
    sub al, num2
    mov def, al  
                
    
    
    main endp
end