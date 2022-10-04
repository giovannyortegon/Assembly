/* vartest.c - An example of defining global and local C variable */
#include<stdio.h>

int global1 = 10;
float global2 = 20.25;

int main()
{
	int local1 = 100;
	float local2 = 200.25;
	int result1 = global1 + local1;
	float result2 = global2 + local2;

	printf("The result are %d and %f\n", result1, result2);

	return 0;
}
