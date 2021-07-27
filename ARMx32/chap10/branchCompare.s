	.global _start
_start:
//	mov r0, #100
	mov r0, #20
//	mov r1, #20
	mov r1, #100

loop:
	cmp r0, r1
	beq stop
	blt less
	sub r0, r0, r1
	bal loop

less:
	sub r1, r1, r0
	bal loop

stop:
	mov r7, #1
	swi 0
