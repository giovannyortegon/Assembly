/* cfunction,c - An example of functions in C */
#include <stdio.h>

float circumf(int a)
{
	return 2 * a * 3.141516;
}
float area(int a)
{
	return a * a * 3.141516;
}
int main()
{
	int x = 10;
	printf("Radius: %d\n", x);
	printf("Circumference: %f\n", circumf(x));
	printf("Area: %f\n", area(x));

	return (0);
}
