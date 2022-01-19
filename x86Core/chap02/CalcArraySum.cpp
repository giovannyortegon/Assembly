#include <iostream>
#include <tchar.h>

extern "C" int CalcArraySum_(const int * x, int n);

int CalcArraySumCpp(const int * x, int n);

int _tmain(int argc, _TCHAR * argvp[])
{
	int x[] = { 1, 7, -3, 5, 2, 9, -6, 12 };
	int n = sizeof(x) / sizeof(int);

	std::cout << "Elements of x[]\n";

	for (int i = 0; i < n; i++)
		std::cout <<' ' << x[i];

	std::cout << "\n\n";

	int sum1 = CalcArraySumCpp(x, n);
	int sum2 = CalcArraySum_(x, n);

	std::cout << "sum 1: " << sum1 <<'\n';
	std::cout << "sum 2: " << sum2 << '\n';

	return (0);
}

int CalcArraySumCpp(const int * x, int n) {
	int sum = 0;

	for (int i = 0; i < n; i++) {
		sum += *x++;
	}

	return sum;
}