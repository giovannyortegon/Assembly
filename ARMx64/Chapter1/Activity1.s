/* Activity1.s -  write an string */
	.global _start
_start:
// write syscall
	mov x0, #1
	ldr x1, =name
	mov x2, #35
	mov x8, #64
	svc 0
// exit syscall
	mov x0, #0
	mov x8, #93
	svc 0

.data
	name:
		.ascii "Im writing in Assembly for CPU ARM\n"
