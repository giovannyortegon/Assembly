#include <iostream>
#include <tchar.h>
#include "TestStruct.h"

extern "C" TestStruct * CreateTestStruct_(__int8, __int16, __int32, __int64);
extern "C" void ReleaseTestStruct_(TestStruct * p);

void PrintTestStruct(const char * msg, const TestStruct * ts);

int _tmain(int args, _TCHAR * argv[])
{
	TestStruct * ts = CreateTestStruct_(40, -401, 400002, -4000000003LL);

	PrintTestStruct("Contents of TestStruct 'ts' ", ts);

	ReleaseTestStruct_(ts);

	return (0);
}

void PrintTestStruct(const char * msg, const TestStruct * ts) {
	std::cout << msg <<"\n";
	std::cout << "ts->Val8: " << ts->Val8 << "\n";
	std::cout << "ts->Val16: " << ts->Val16 << "\n";
	std::cout << "ts->Val32: " << ts->Val32 << "\n";
	std::cout << "ts->Val64: " << ts->Val64 << "\n";
}