#include<stdio.h>
#include<stdlib.h>
#include<time.h>

long random_range(int low, int high);

int main()
{
	long r = 90;
	int x;

	/* seed the randomizer */
	srand((unsigned) time (NULL));

	/* test output */
	for (x = 0; x < 20; x++)
	{
		r = random_range(1, 100);
		printf("%ld\n", r);
	}

	return(0);
}
