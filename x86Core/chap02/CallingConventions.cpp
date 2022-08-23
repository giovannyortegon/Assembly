#include <iostream>
#include <tchar.h>

extern "C" void CalculateSums_(int a, int b, int c, int *s1, int *s2, int *s3);

int _tmain(int argc, _TCHAR * argv[]) {
	int a = 3, b = 5, c = 8;
	int s1a, s2a, s3a;

	CalculateSums_(a, b, c, &s1a, &s2a, &s3a);

	int s1b = a + b + c;
	int s2b = a * a + b * b + c * c;
	int s3b = a * a * a + b * b * b + c * c * c;

	std::cout << "Input:  a: " << a << " b: " << b << " c: " << c <<std::endl;
	std::cout << "Output: s1a: " << s1a << " s2a: " << s2a << " s3a: " << s3a << std::endl;
	std::cout << "        s1b: " << s1b << " s2b: " << s2b << " s3b: " << s3b << std::endl;

	return (0);
}
