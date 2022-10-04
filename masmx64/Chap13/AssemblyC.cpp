#include <cstdio>

extern "C" int fcnsum(int[], int);
extern "C" void thesum(int *, int [], int );

int main() {
	int count = 3, totalA, totalB, tstsdata[] = { 11, 45, 70 };
	thesum(&totalA, tstsdata, 3);
	totalB = fcnsum(tstsdata, count);

    printf("Sum from  subroutine = %d\n", totalA);
    printf("Sum from  function = %d\n", totalB);

	return (0);
}
