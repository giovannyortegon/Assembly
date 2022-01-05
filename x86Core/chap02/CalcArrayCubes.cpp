#include <iostream>
#include<tchar.h>

void CalcArrayCubes(int *, int *, int);

int _tmain(int argc, _TCHAR * argv[])
{
	int x[] = {2, 7, -4, 6, -9, 12, 10};
	const int n = sizeof(x) / sizeof(int);
	int y[n];

	CalcArrayCubes(y, x, n);

	for (int i = 0; i < n; i++)
		std::cout <<"i: " <<i <<" x: "<<x[i] <<" y: " <<y[i] << "\n";
	std::cout << '\n';

	return (0);

}

void CalcArrayCubes(int * y, int * x, int n) {
	for (int i = 0; i < n; i++) {
		int temp = x[i];
		y[i] = temp * temp * temp;
	}
}