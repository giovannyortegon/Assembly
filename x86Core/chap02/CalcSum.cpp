#include <iostream>
#include <tchar.h>

extern "C" int CalcSum_(int a, int b, int c);

int _tmain(int argc, _TCHAR * argv[]) {
	int a = 17, b = 11, c = 14;
	int sum = CalcSum_(a, b, c);

    std::cout << "a: " << a <<std::endl;
	std::cout << "b: " << b <<std::endl;
	std::cout << "c: " << c <<std::endl;
	std::cout << "sum: " << sum <<std::endl;

	return (0);
}