/* externtest.cpp - An example of using assembly language functions with C++ */
#include <iostream>

extern "C"
{
	int square(int);
	float areafunc(int);
	char *cpuidfunc(void);
}

using namespace std;

int main()
{
	int radius = 10;
	int radsquare = square(radius);
	float result;

	cout << "The radius square is " << radsquare << endl;
	result = areafunc(radius);
	cout << "The area is " << result << endl;
	cout << "The CPUID is " << cpuidfunc() << endl;

	return 0;
}
