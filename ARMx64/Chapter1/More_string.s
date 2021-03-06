	.global _start
_start:
	mov x0, #1
	ldr x1, =msg
	mov x2, #28
	mov x8, #64
	svc 0
// Exit syscall
	mov x0, #0
	mov x8, #93
	svc 0

.data
	msg:
		.ascii "Practicando Assembly in ARM\n"
