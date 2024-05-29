#include<iostream>

extern "C" int IntegerMulA_(int a, int b);
extern "C" long long IntegerMulB_(int a, int b);
extern "C" unsigned long long IntegerMulC_(int a, int b);

template<typename T1, typename T2>
void PrintResult(const char * msg, T1 a, T1 b, T2 result);
int main() {
	int a1 = 50;
	int b1 = 25;
	int result1 = IntegerMulA_(a1, b1);
	PrintResult("Test #1", a1, b1, result1);


	int a2 = -300;
	int b2 = 7;
	int result2 = IntegerMulA_(a2, b2);
	PrintResult("Test #2", a2, b2, result2);

	int a3 = 4000;
	int b3 = 1000000;
	long long result3 = IntegerMulB_(a3, b3);
	PrintResult("Test #3", a3, b3, result3);

	int a4 = 100000;
	int b4 = -20000000;
	long long result4 = IntegerMulB_(a4, b4);
	PrintResult("Test #1", a4, b4, result4);

	unsigned int a5 = 0x80000000;
	unsigned int b5 = 0x80000000;
	unsigned long long result5 = IntegerMulC_(a5, b5);
	PrintResult("Test #1", a5, b5, result5);

	return (0);
}
template<typename T1, typename T2>
void PrintResult(const char * msg, T1 a, T1 b, T2 result) {
	const char nl = '\n';

	std::cout <<msg <<nl;
	std::cout <<"a = " <<a <<", b = " <<b;
	std::cout <<" result = " <<result <<nl <<nl;
}
