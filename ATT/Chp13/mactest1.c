/* mactests1.c - An example of a C macro fuction */
#include<stdio.h>

#define SUM(a, b, result) \
			((result) = (a) + (b))


int main()
{
	int data1 = 5, data2 = 10;
	int result;
	float fdata1 = 5.0, fdata2 = 10.0;
	float fresult;

	/* Integers */
	SUM(data1, data2, result);
	printf("The result is %d\n", result);
	SUM(1, 1, result);
	printf("The result is %d\n", result);

	/* Floats */
	SUM(fdata1, fdata2, fresult);
	printf("The floating result is %f\n", fresult);
	SUM(fdata1, fdata2, fresult);
	printf("The mixed result %d\n", result);

	return (0);
}
