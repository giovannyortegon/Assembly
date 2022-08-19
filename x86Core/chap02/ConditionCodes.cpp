#include <stdio.h>
#include <tchar.h>

extern "C" int SignedMinA_(int a, int b, int c);
extern "C" int SignedMaxA_(int a, int b, int c);
extern "C" int SignedMinB_(int a, int b, int c);
extern "C" int SignedMaxB_(int a, int b, int c);
extern "C" bool SignedIsEq_(int a, int b);

int _tmain(int argc, _TCHAR * argv[]){
	int a, b, c;
	int smax_a, smax_b;
	int smin_a, smin_b;

	// SignedMin example
	a = 2; b = 15; c = 8;
	smin_a = SignedMinA_(a, b, c);
	smin_b = SignedMinB_(a, b, c);
	printf("SignedMinA_(%4d, %4d, %4d) = %4d\n", a, b, c, smin_a);
	printf("SignedMinB_(%4d, %4d, %4d) = %4d\n\n", a, b, c, smin_b);

	a = -3; b = -22; c = 28;
	smin_a = SignedMinA_(a, b, c);
	smin_b = SignedMinB_(a, b, c);
	printf("SignedMinA_(%4d, %4d, %4d) = %4d\n", a, b, c, smin_a);
	printf("SignedMinB_(%4d, %4d, %4d) = %4d\n\n", a, b, c, smin_b);

	a = 17; b = 37; c = -11;
	smin_a = SignedMinA_(a, b, c);
	smin_b = SignedMinB_(a, b, c);
	printf("SignedMinA_(%4d, %4d, %4d) = %4d\n", a, b, c, smin_a);
	printf("SignedMinB_(%4d, %4d, %4d) = %4d\n\n", a, b, c, smin_b);

	// SignedMax example
	a = 10; b = 5; c = 3;
	smax_a = SignedMaxA_(a, b, c);
	smax_b = SignedMaxB_(a, b, c);
	printf("SignedMaxA_(%4d, %4d, %4d) = %4d\n", a, b, c, smax_a);
	printf("SignedMaxB_(%4d, %4d, %4d) = %4d\n\n", a, b, c, smax_b);

	a = -3; b = 28; c = 15;
	smax_a = SignedMaxA_(a, b, c);
	smax_b = SignedMaxB_(a, b, c);
	printf("SignedMinA(%4d, %4d, %4d) = %4d\n", a, b, c, smax_a);
	printf("SignedMinB(%4d, %4d, %4d) = %4d\n\n", a, b, c, smax_b);

	a = -25; b = -37; c = -17;
	smax_a = SignedMaxA_(a, b, c);
	smax_b = SignedMaxB_(a, b, c);
	printf("SignedMinA(%4d, %4d, %4d) = %4d\n", a, b, c, smax_a);
	printf("SignedMinB(%4d, %4d, %4d) = %4d\n\n", a, b, c, smax_b);


	a = 5; b = 5;
	printf("SignedIsEq: %d\n", SignedIsEq_(a, b));

	return (0);
}	
