#include<iostream>

extern "C" int IntegerAddSub_(int, int, int, int);

void PrintResult(const char *, int, int, int, int, int);
int main() {
	int a, b, c, d, result;

	a = 10; b = 20; c = 30; d = 18;
	result = IntegerAddSub_(a, b, c, d);
	PrintResult("Test case #1 ", a, b, c, d, result);

	a = 101; b = 34; c = -190; d = 25;
	result = IntegerAddSub_(a, b, c, d);
	PrintResult("Test case #2 ", a, b, c, d, result);

	return (0);
}
void PrintResult(const char * msg, int a, int b, int c, int d, int result) {
	std::cout <<"a = " <<a <<std::endl;
	std::cout <<"b = " <<b <<std::endl;
	std::cout <<"c = " <<c <<std::endl;
	std::cout <<"d = " <<d <<std::endl;
	std::cout <<"Result: " <<result <<std::endl;
	std::cout <<std::endl;
}
