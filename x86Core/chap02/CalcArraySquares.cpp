<<<<<<< HEAD
#include <iostream>
#include <tchar.h>

extern "C" int CalcArraySquares_(int * y, const int * x, int n);
int CalcArraySquaresCpp(int * y, const int * x, int n);

int _tmain(int argc, _TCHAR * argv[]) {
	int x[] = {2, 3, 5, 7, 11, 13, 17, 19, 23, 29};
	const int n = sizeof(x) / sizeof(int);
	int y1[n];
	int y2[n];
	int sum_y1 = CalcArraySquaresCpp(y1, x, n);
	int sum_y2 = CalcArraySquares_(y2, x, n);

	for (int i = 0; i < n; i++) {
		std::cout << "i: " << i << "\tx: " << x[i] << "\ty1: " << y1[i] << "\ty2: " << y2[i] << std::endl;
	}
	std::cout << std::endl;

	std::cout << "sum_y1: " << sum_y1 << std::endl;
	std::cout << "sum_y2: " << sum_y2 << std::endl;

	return (0);
}

int CalcArraySquaresCpp(int * y, const int * x, int n) {
	int sum = 0;

	for (int i = 0; i < n; i++) {
		y[i] = x[i] * x[i];
		sum += y[i];
	}

	return sum;
=======
#include <iostream>
#include <tchar.h>

extern "C" int CalcArraySquares_(int * y, const int * x, int n);
int CalcArraySquaresCpp(int * y, const int * x, int n);

int _tmain(int argc, _TCHAR * argv[]) {
	int x[] = {2, 3, 5, 7, 11, 13, 17, 19, 23, 29};
	const int n = sizeof(x) / sizeof(int);
	int y1[n];
	int y2[n];
	int sum_y1 = CalcArraySquaresCpp(y1, x, n);
	int sum_y2 = CalcArraySquares_(y2, x, n);

	for (int i = 0; i < n; i++) {
		std::cout << "i: " << i << "\tx: " << x[i] << "\ty1: " << y1[i] << "\ty2: " << y2[i] << std::endl;
	}
	std::cout << std::endl;

	std::cout << "sum_y1: " << sum_y1 << std::endl;
	std::cout << "sum_y2: " << sum_y2 << std::endl;

	return (0);
}

int CalcArraySquaresCpp(int * y, const int * x, int n) {
	int sum = 0;

	for (int i = 0; i < n; i++) {
		y[i] = x[i] * x[i];
		sum += y[i];
	}

	return sum;
>>>>>>> 12f99e0939d0546bc7d3973165ffbb8826df7a8a
}