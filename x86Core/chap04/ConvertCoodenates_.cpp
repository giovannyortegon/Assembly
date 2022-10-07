#include <cstdio>
#include <tchar.h>

extern "C" void RectToPolar_(double, double, double *, double *);
extern "C" void Polar_toRect_(double, double, double *, double *);

int _tmain(int argc, _TCHAR * argv[]) {

	double x1[] = { 1, 3, -3, 4, -4 };
	double y1[] = { 1, 3, -3, 4, -4 };
	const int nx = sizeof(x1) / sizeof(double);
	const int ny = sizeof(y1) / sizeof(double);

	for (int i = 0; i < ny; i++) {
		for (int j = 0; j < nx; j++) {
			double r, a, x2, y2;

			RectToPolar_(x1[i], y1[j], &r, &a);
			Polar_toRect_(r, a, &x2, &y2);

			printf("[%d, %d]: ", i, j);
			printf("(%8.4lf, %8.4lf) ", x1[i], y1[j]);
			printf("(%8.4lf, %10.4lf) ", r, a);
			printf("(%8.4lf, %8.4lf) \n", x2, y2);

		}
	}

	return (0);
}