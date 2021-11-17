#include<iostream>
#include <bits/c++config.h>
/*
int CalcSumTest(int a, int b, int c)
{
	return a + b + c;
}
*/

extern "C" int CalcSum_(int val1,int val2, int val3);
// {} use for 2 or more functions

int main(int argc, char * argv[])
{
	int a = 12, b = 11, c = 14;
	int sum = CalcSum_(a, b, c);

	printf("a: %d ", a);
	printf("b: %d ", b);
	printf("c: %d ", c);
	printf("sum: %d\n", sum);

	return (0);
}
