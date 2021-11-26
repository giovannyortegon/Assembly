/*
 * C program to call our Assembly
 * to upper routine.
 */
#include<stdio.h>

extern int mytoupper(char *, char *);

#define MAX_BUFFER 255

int main()
{
	char *str = "This is a test.";
	char outBuf[MAX_BUFFER];
	int len;

	len = mytoupper(str, outBuf);

	printf("Before str: %s\n", str);
	printf("After str: %s\n", outBuf);
	printf("Str len: %d\n", len);

	return (0);
}
