<<<<<<< HEAD
#include <stdio.h>
#include <tchar.h>
#include "TestStruct.h"

extern "C" TestStruct * CreateStruct_(__int8, __int16, __int32, __int64);
extern "C" void ReleaseTestStruct_(TestStruct *);
void PrintTestStruct(const char *, const TestStruct *);

int _tmain(int argc, _TCHAR * argv[]) {
	TestStruct * ts = CreateStruct_(40, -401, 400002, -4000000003LL);

	PrintTestStruct("Content of TestStruct 'ts'", ts);
	ReleaseTestStruct_(ts);

	return (0);
}
void PrintTestStruct(const char * msg, const TestStruct * ts) {
	printf("%s\n", msg);
	printf("\tts->Val8: %d\n", ts->Val8);
	printf("\tts->Val16: %d\n", ts->Val16);
	printf("\tts->Val32: %d\n", ts->Val32);
	printf("\tts->Val64: %lld\n", ts->Val64);
}
=======
#include <stdio.h>
#include <tchar.h>
#include "TestStruct.h"

extern "C" TestStruct * CreateStruct_(__int8, __int16, __int32, __int64);
extern "C" void ReleaseTestStruct_(TestStruct *);
void PrintTestStruct(const char *, const TestStruct *);

int _tmain(int argc, _TCHAR * argv[]) {
	TestStruct * ts = CreateStruct_(40, -401, 400002, -4000000003LL);

	PrintTestStruct("Content of TestStruct 'ts'", ts);
	ReleaseTestStruct_(ts);

	return (0);
}
void PrintTestStruct(const char * msg, const TestStruct * ts) {
	printf("%s\n", msg);
	printf("\tts->Val8: %d\n", ts->Val8);
	printf("\tts->Val16: %d\n", ts->Val16);
	printf("\tts->Val32: %d\n", ts->Val32);
	printf("\tts->Val64: %lld\n", ts->Val64);
}
>>>>>>> 12f99e0939d0546bc7d3973165ffbb8826df7a8a
