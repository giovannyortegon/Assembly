#include <iostream>
#include <tchar.h>

extern "C" int IntegerMulDiv_(int a, int b, int * prod, int * quo, int * rem);

int _tmain(int argc, _TCHAR * argv[]) {
	int a = 21, b = 9;
	int prod = 0, quo = 0, rem = 0;
	int rc;

	rc = IntegerMulDiv_(a, b, &prod, &quo, &rem);

    std::cout << "Input1 - a: " <<a << " b: " << b << std::endl;
	std::cout << "Output1 - rc: " << rc << " prod: " << prod << std::endl;
	std::cout << "          quo: " << quo << " rem: " << rem << std::endl;

	a = -29;
	prod = quo = rem = 0;

	rc = IntegerMulDiv_(a, b, &prod, &quo, &rem);
	std::cout << "Input2 - a: " << a << " b: " << b << std::endl;
	std::cout << "Output2 - rc: " << rc << " prod: " << prod << std::endl;
	std::cout << "          quo: " << quo << " rem: " << rem << std::endl;

	b = 0;
	prod = quo = rem = 0;
	rc = IntegerMulDiv_(a, b, &prod, &quo, &rem);
	std::cout << "Input3 - a: " << a << " b: " << b << std::endl;
	std::cout << "Output3 - rc: " << rc << " prod: " << prod << std::endl;
	std::cout << "          quo: " << quo << " rem: " << rem << std::endl;

	return (0);
}
