#include<cstdio>
#include<tchar.h>
#include<math.h>

extern "C" int CalcMeanStdev_(const double *, int,  double *, double *);

bool CalcMeanStdevCpp(const double *, int, double *, double *);

int _tmain(int argc, _TCHAR * argv[]) {
	double a[] = { 10, 2, 33, 15, 41, 24, 75, 37, 18, 97 };
	const int n = sizeof(a) / sizeof(double);
	double mean1, stdev1;
	double mean2, stdev2;

	CalcMeanStdevCpp(a, n, &mean1, &stdev1);
	CalcMeanStdev_(a, n, &mean2, &stdev2);

	for (int i = 0; i < n; i++) {
		printf("a[%d] = %g\n", i, a[i]);
	}

	printf("\n");
	printf("mean 1: %g stdev 1: %g\n", mean1, stdev1);
	printf("mean 2: %g stdev 2: %g\n", mean2, stdev2);

	return (0);
}
bool CalcMeanStdevCpp(const double * a, int n, double * mean, double * stdev) {
	if (n <= 1)
		return false;

	double sum = 0.0;
	for (int i = 0; i < n; i++) {
		sum += a[i];
	}
	*mean = sum / n;

	sum = 0.0;
	for (int i = 0; i < n; i++) {
		double temp = a[i] - *mean;
		sum += temp * temp;
	}

	*stdev = sqrt(sum / (n - 1));

	return true;
}