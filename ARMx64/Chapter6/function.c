#include<stdio.h>

int func1(int a, int b);
int func2(int a, int b);

int main()
{
	int a, b, sum;

	a = 9;
	b = 1;

	sum = func1(a, b);
	printf("The result: %d", sum);

	return (0);
}
int func1(int a, int b)
{
	a = func2(a, b);

	return (a + b);
}
int func2(int a, int b)
{
	return (a - b);
}
