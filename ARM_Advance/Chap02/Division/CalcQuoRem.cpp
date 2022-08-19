#include<iostream>

extern "C" void CalcQuoRem_(const int *, const int *, int *, int *);

void PrintResult(const char *, int, int, int, int);

int main() {
	int a, b, quo, rem;

	a = 100; b = 7;
	CalcQuoRem_(&a, &b, &quo, &rem);
	PrintResult("Test case #1 ", a, b, quo, rem);


	a = 200; b = 10;
	CalcQuoRem_(&a, &b, &quo, &rem);
	PrintResult("Test case #2 ",a, b, quo, rem);

	a = 300; b = -17;
	CalcQuoRem_(&a, &b, &quo, &rem);
	PrintResult("Test case #3 ",a, b, quo, rem);
}

void PrintResult(const char * msg, int a, int b, int quo, int rem) {
	const char nl = '\n';
	std::cout <<msg <<nl;
	std::cout <<"a = " <<a <<nl;
	std::cout <<"b = " <<b <<nl;
	std::cout <<"Quotient = " <<quo <<nl;
	std::cout <<"Remainder = " <<rem <<nl;
	std::cout <<nl;
}
