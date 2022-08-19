#include <iostream>
#include <stdlib.h>
#include <tchar.h>

void PrintResults(const int * x, int nrows, int ncols, int * row_sums, int * col_sums);
extern "C" int CalcMatrixRowColSums_(const int * x, int nrows, int ncols, int * row_sums, int * col_sums);
void CalcMatrixRowColSumsCpp(const int * x, int nrows, int ncols, int * row_sums, int * col_sums);

int _tmain(int argc, _TCHAR * argv[])
{
	const int nrows = 7, ncols = 5;
	int x[nrows][ncols];

	// Initialize the matrix
	srand(13);

	for (int i = 0; i < nrows; i++) {
		for (int j = 0; j < ncols; j++)
			x[i][j] = rand() % 100;
	}
   
	// calculate the row and columns sums
	int row_sums1[nrows], col_sums1[ncols];
	int row_sums2[nrows], col_sums2[ncols];

	CalcMatrixRowColSumsCpp((const int *)x, nrows, ncols, row_sums1, col_sums1);
	std::cout << "Result using CalcMatrixRowColSumsCpp()\n";
	PrintResults((const int *)x, nrows, ncols, row_sums1, col_sums1);

	CalcMatrixRowColSums_((const int *)x, nrows, ncols, row_sums2, col_sums2);
	std::cout << "\n\nResult using CalcMatrixRowColSums_()\n";
	PrintResults((const int *)x, nrows, ncols, row_sums2, col_sums2);


	return (0);
}

void CalcMatrixRowColSumsCpp(const int * x, int nrows, int ncols, int * row_sums, int * col_sums) {
	for (int j = 0; j < ncols; j++)
		col_sums[j] = 0;

	for (int i = 0; i < nrows; i++) {
		row_sums[i] = 0;
		int k = i * ncols;

		for (int j = 0; j < ncols; j++) {
			int temp = x[k + j];
			row_sums[i] += temp;
			col_sums[j] += temp;
		}
	}
}

void  PrintResults(const int * x, int nrows, int ncols, int * row_sums, int * col_sums) {
	std::cout << std::endl <<std::endl;
	for (int i = 0; i < nrows; i++) {
		int k = i * ncols;
		for (int j = 0; j < ncols; j++) {
			std::cout << x[k + j] << "\t";
		}
		std::cout << " -- " << row_sums[i] << std::endl;	
	}
	std::cout << std::endl;

	for (int i = 0; i < ncols; i++) {
		std::cout << col_sums[i] << "\t";
	}
}