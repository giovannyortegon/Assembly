#include <iostream>
#include <tchar.h>

extern "C" int CalcArraySum_(const int * x, int n);
int CalcArraySumCpp(const int * x, int n);

int main()
{
	int x[] = { 1, 7, -3, 5, 2, 9, -6, 12 };
	int n = sizeof(x) / sizeof(int);
	
	std::cout << "Elements of x[]\n";

	for (int i = 0; i < n; i++) {
		std::cout <<" " << x[i]; 
	}

	std::cout << std::endl;

	int sum1 = CalcArraySumCpp(x, n);
	int sum2 = CalcArraySum_(x, n);

	std::cout << "sum1: " << sum1 << std::endl;
	std::cout << "sum2: " << sum2 << std::endl;

	return (0);
}

int CalcArraySumCpp(const int * x, int n) {
	int sum = 0;

	for (int i = 0; i < n; i++) {
		sum += x[i];			// sum = *x++;
	}

	return sum;
}
