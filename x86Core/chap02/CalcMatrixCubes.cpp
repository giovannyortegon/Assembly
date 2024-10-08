#include <iostream>

void  CalcMatrixCubes(int * y, int * x, int nrows, int ncols) {
	for (int i = 0; i < nrows; i++) {
		for (int j = 0; j < ncols; j++) {
			int k = i * ncols + j;
			y[k] = x[k] * x[k] * x[k];
		}
	}
}

int main()
{
	const int nrows = 4;
	const int ncols = 3;
	int x[nrows][ncols] = { {1, 2, 3}, {4, 5, 6}, {7, 8, 9}, {10, 11, 12} };
	int y[nrows][ncols];

	CalcMatrixCubes(&y[0][0], &x[0][0], nrows, ncols);

	for (int i = 0; i < nrows; i++) {
		for (int j = 0; j < ncols; j++) {
			std::cout << "( " << i << ", " << j << ") " << x[i][j] << ", " << y[i][j] << "\n";
		}
	}
	return (0);
}