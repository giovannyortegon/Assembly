#include<stdio.h>

int main()
{
	int a = 10;
	int b = 20;
	int result;

	result = a * b;
	asm("nop");
	printf("The result is: %d\n", result);
	return (0);
}
