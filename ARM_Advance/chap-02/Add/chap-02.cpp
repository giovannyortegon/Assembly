#include<iostream>

extern "C" int IntegerAddSub_(int a, int b, int c, int d);

void PrintResult(const char * msg, int a, int b, int c, int d, int result);

int main() {
	int a, b, c, d, result;

	a = 10; b = 20; c = 30; d = 18;
	result = IntegerAddSub_(a, b, c, d);
	PrintResult("Test case #1", a, b, c, d, result);

	a = 101; b = 34; c = -190; d = 25;
	result = IntegerAddSub_(a, b, c, d);
	PrintResult("Test case #2", a, b, c, d, result);

	return(0);
}

void PrintResult(const char * msg, int a, int b, int c, int d, int result) {
	const char nl = '\n';

	std::cout <<"a = " << a <<nl;
	std::cout <<"b = " << b <<nl;
	std::cout <<"c = " << c <<nl;
	std::cout <<"d = " << d <<nl;
	std::cout <<"result = " << result <<nl;
	std::cout <<nl;
}

