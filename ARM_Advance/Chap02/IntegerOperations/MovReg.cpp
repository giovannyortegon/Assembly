#include<iostream>
#include "MovReg.h"

using namespace std;

extern "C" void MovRegA_(unsigned int, unsigned int *);
extern "C" void MovRegB_(unsigned int, unsigned int *, unsigned int );

//extern void PrintResultA(const char *, unsigned int, const unsigned int, size_t);
//extern void PrintResultB(const char *, unsigned int, const unsigned int, size_t);

int main() {
	// Exercise function MovRegA_
	const size_t n = 5;

	unsigned int a1 = 0x12345678;
	unsigned int b1[5];
	MovRegA_(a1, b1);
	PrintResultA("MovRegA_ Test Case #1: ", a1,b1,n);

	unsigned int a2 = 0xfedcba91;
	unsigned int b2[n];
	MovRegA_(a2, b2);
	PrintResultA("MovRegA_ Test Case #2: ", a2,b2,n);

	cout <<"\n";

	// Exercise functio MovRegB_
	const size_t nn = 4;
	const size_t count = 8;

	unsigned int a3 = 0x12345678;
	unsigned int b3[nn];
	MovRegB_(a3, b3, count);
	PrintResultB("MovRegB_ Test case #1: ", a3,b3,nn,count);


	unsigned int a4 = 0x12345678;
	unsigned int b4[nn];
	MovRegB_(a4, b4, count);
	PrintResultB("MovRegB_ Test case #2: ", a4,b4,nn,count);

	return (0);
}
