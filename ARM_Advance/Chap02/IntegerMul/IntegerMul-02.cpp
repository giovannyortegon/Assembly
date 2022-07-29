#include<iostream>

extern "C" int IntegerMulA_(int, int);
extern "C" long long IntegerMulB_(int, int);
extern "C" unsigned long long IntegerMulC_(unsigned int, unsigned int);

template <typename T1, typename T2>
void PrintResult(const char *, T1, T1, T2);

int main(void) {
	int a1 = 50;
	int b1 = 25;
	int result1 = IntegerMulA_(a1, b1);
	PrintResult("Teste #1: ", a1, b1,result1);

	int a2 = -300;
	int b2 = 7;
	int result2 = IntegerMulA_(a2, b2);
	PrintResult("Teste #2: ", a2, b2, result2);

	int a3 = 4000;
	int b3 = 1000000;
	long long result3 = IntegerMulB_(a3, b3);
	PrintResult("Teste #3: ", a2, b2, result3);

	int a4 = 100000;
	int b4 = -20000000;
	long long result4 = IntegerMulB_(a4, b4);
	PrintResult("Teste #4: ", a4, b4, result4);

	unsigned int a5 = 0x80000000;
	unsigned int b5 = 0x80000000;
	unsigned long long result5 = IntegerMulC_(a5, b5);
	PrintResult("Test #5: ", a5, b5, result5);

	return (0);
}
template <typename T1, typename T2>
void PrintResult(const char * msg, T1 a, T1 b, T2 result) {
	std::cout <<msg <<std::endl;
	std::cout <<"a = " <<a <<", b = " <<b;
	std::cout <<" result = " <<result <<std::endl;
	std::cout <<std::endl;
}
