/*
 * C programm to embed our Assembly
 * toupper routine inline.
 */
#include<stdio.h>

extern int mytoupper(char *, char *);

#define MAX_BUFFSIZE 255

int main()
{
	char * str = "This is a test.";
	char outBuf[MAX_BUFFSIZE];
	int len;

	asm (
		"mov x4, %2\n"
		"loop: ldrb w5, [%1], #1\n"
		"cmp w5, #'z'\n"
		"bgt cont\n"
		"cmp w5, #'a'\n"
		"blt cont\n"
		"sub w5, w5, #('a' - 'A')\n"
		"cont: strb w5, [%2], #1\n"
		"cmp w5, #0\n"
		"b.ne loop\n"
		"sub %0, %2, x4\n"
		: "=r" (len)
		:"r" (str), "r"(outBuf)
		: "r4", "r5"
	);

	printf("Before str: %s\n", str);
	printf("After str: %s\n", outBuf);
	printf("Str len = %d\n", len);

	return (0);
}
