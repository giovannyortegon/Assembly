#include<iostream>
#include<iomanip>

extern "C" void CalcMatrixSquares_(int *, const int *, int, int);
void CalcMatrixSquares(int * , const int * , int , int );

int main() {
    const int m = 6; 
    const int n = 3;
    int y1[m][n], y2[m][n];
    int x[n][m] {
        {1, 2, 3, 4, 5, 6},
        {7, 8, 9, 10, 11, 12},
        {13, 14, 15, 16, 17, 18}
    };

    CalcMatrixSquares(&y1[0][0], &x[0][0], m, n);
    CalcMatrixSquares_(&y2[0][0], &x[0][0], m, n);

    for(int i = 0; i < m; i++) {
        for(int j = 0; j < n; j++) {
            std::cout <<"y1[" <<std::setw(2) <<i <<"][" <<std::setw(2) <<j <<"] = ";
            std::cout <<std::setw(6) <<y1[i][j] <<" ";

            std::cout <<"\ty2[" <<std::setw(2) <<i <<"][" <<std::setw(2) <<j <<"] = ";
            std::cout <<std::setw(6) <<y2[i][j] <<" ";

            std::cout <<"\tx[" <<std::setw(2) <<j <<"][" <<std::setw(2) <<i <<"] = ";
            std::cout <<std::setw(6) <<x[j][i] <<"\n";

            if (y1[i][j] != y2[i][j])
                std::cout <<"Compare failed!\n";
        }
    }

    return (0);
}

void CalcMatrixSquares(int * y, const int * x, int m, int n) {
    for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
            int kx = j * m + i;
            int ky = i * n + j;
            y[ky] = x[kx] * x[kx];
        }
    }
}
