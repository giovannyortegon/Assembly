/* csetest.c - An example of implementing cse optimization */
#include<stdio.h>

void func1(int a, int b)
{
	int c = a * b;
	int d = (a * b) / 5;
	int e = 500 / (a * b);

	printf("The result are c = %d d = %d e= %d\n", c, d, e);
}

int main()
{
	int a = 10;
	int b = 25;
	func1(a, b);
	func1(20, 10);

	return 0;
}
