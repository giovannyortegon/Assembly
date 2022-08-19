#include <stdio.h>

int main()
{
	int i = 0;
	int sum = 0;

	while (i < 10)
	{
		sum = sum + i;
		i++;
	}
	printf("Sum: %d\n", sum);
	return (0);
}
