#include<iostream>
#include<tchar.h>
#include"TestStruct.h"

extern "C" __int64 CalcStructSum_(const TestStruct * ts);
__int64 CalcStructSumCpp(const TestStruct * ts);

int _tmain(int argc, _TCHAR * argv[])
{
	TestStruct ts;

	ts.Val8 = -100;
	ts.Val16 = 2000;
	ts.Val32 = -300000;
	ts.Val64 = 40000000000;

	__int64 sum1 = CalcStructSumCpp(&ts);
	__int64 sum2 = CalcStructSum_(&ts);

    std::cout << "Input: " <<ts.Val8 <<" " <<ts.Val16;
	std::cout << " " << ts.Val32 << " " << ts.Val64 << std::endl;
	std::cout << "sum1: " << sum1;
	std::cout << "sum2: " << sum2;

	if (sum1 != sum2)
		std::cout << "Sum verify check failed!\n";

	return (0);
}
__int64 CalcStructSumCpp(const TestStruct * ts) {
	return ts->Val8 + ts->Val16 + ts->Val32 + ts->Val64;
}