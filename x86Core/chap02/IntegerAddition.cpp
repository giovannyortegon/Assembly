<<<<<<< HEAD
<<<<<<< HEAD
// #include <stdio.h>
#include<windows.h>
#include <tchar.h>

extern "C" char GlChar = 10;
extern "C" short GlShort = 20;
extern "C" int GlInt = 30;
extern "C" long long GlLongLong = 0x000000000FFFFFFFE;

extern "C" void IntegerAddition_(char a, short b, int c, long long d);

int _tmain(int argc, _TCHAR * argv[]) {
	printf("Before		GlChar:		%d\n", GlChar);
	printf("		GlShort:	%d\n", GlShort);
	printf("		GlInt:		%d\n", GlInt);
	printf("		GlLongLong:	%lld\n", GlLongLong);
	printf("\n");

	IntegerAddition_(3, 5, -37, 11);

	printf("After		GlChar:		%d\n", GlChar);
	printf("		GlShort:	%d\n", GlShort);
	printf("		GlInt:		%d\n", GlInt);
	printf("		GlLongLong:	%lld\n", GlLongLong);
	printf("\n");

	return (0);
}
=======
// #include <stdio.h>
#include<windows.h>
#include <tchar.h>

extern "C" char GlChar = 10;
extern "C" short GlShort = 20;
extern "C" int GlInt = 30;
extern "C" long long GlLongLong = 0x000000000FFFFFFFE;

extern "C" void IntegerAddition_(char a, short b, int c, long long d);

int _tmain(int argc, _TCHAR * argv[]) {
	printf("Before		GlChar:		%d\n", GlChar);
	printf("		GlShort:	%d\n", GlShort);
	printf("		GlInt:		%d\n", GlInt);
	printf("		GlLongLong:	%lld\n", GlLongLong);
	printf("\n");

	IntegerAddition_(3, 5, -37, 11);

	printf("After		GlChar:		%d\n", GlChar);
	printf("		GlShort:	%d\n", GlShort);
	printf("		GlInt:		%d\n", GlInt);
	printf("		GlLongLong:	%lld\n", GlLongLong);
	printf("\n");

	return (0);
}
>>>>>>> 95b7c91229f799dc2bb365ba4c047e0314176892
=======
// #include <stdio.h>
#include<windows.h>
#include <tchar.h>

extern "C" char GlChar = 10;
extern "C" short GlShort = 20;
extern "C" int GlInt = 30;
extern "C" long long GlLongLong = 0x000000000FFFFFFFE;

extern "C" void IntegerAddition_(char a, short b, int c, long long d);

int _tmain(int argc, _TCHAR * argv[]) {
	printf("Before		GlChar:		%d\n", GlChar);
	printf("		GlShort:	%d\n", GlShort);
	printf("		GlInt:		%d\n", GlInt);
	printf("		GlLongLong:	%lld\n", GlLongLong);
	printf("\n");

	IntegerAddition_(3, 5, -37, 11);

	printf("After		GlChar:		%d\n", GlChar);
	printf("		GlShort:	%d\n", GlShort);
	printf("		GlInt:		%d\n", GlInt);
	printf("		GlLongLong:	%lld\n", GlLongLong);
	printf("\n");

	return (0);
}
<<<<<<< HEAD
>>>>>>> 27e6d01ab742ee419a449160db6f0a6e7337afcb
=======
>>>>>>> 12f99e0939d0546bc7d3973165ffbb8826df7a8a
>>>>>>> 95b7c91229f799dc2bb365ba4c047e0314176892
