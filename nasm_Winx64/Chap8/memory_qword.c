#include<stdio.h>

int main()
{
	long long data = 0xfedcba9876543210;
	long long sum = 0;
	int i = 0;

	while (i < 64)
	{
		sum += data & 1;
		data = data >> 1;
		i++;
	}

	printf("data: %ld\n", data);
	printf("sum: %ld\n", sum);
}
