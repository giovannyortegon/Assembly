#include<iostream>
#include<tchar.h>

extern "C" int CalcArraySquares_(int * y, const int * x, int n);
int CalcArraySquaresCpp(int * y, const int * x, int n);

using namespace std;

int _tmain(int argc, _TCHAR * argv[])
{
	int x[] = {2, 3, 5, 7, 11, 13, 17, 19, 23, 29};
	const int n = sizeof(x) / sizeof(int);
	int y1[n];
	int y2[n];

	int sum_y1 = CalcArraySquaresCpp(y1, x, n);
	int sum_y2 = CalcArraySquares_(y2, x, n);

	for (int i = 0; i < n; i++) {
		cout << "i: " << i << " x: " << x << " y1: " << y1;
		cout << x << " y2: " << y2 << "\n";
	}
	cout << "\n";

	return (0);
}

int CalcArraySquaresCpp(int * y, const int * x, int n) {
	int sum = 0;

	for (int i = 0; i < n; i++) {
		y[i] = x[i] * x[i];
		sum += y[i];
	}
	return sum;
}