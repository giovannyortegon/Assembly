#include<iostream>
#include<tchar.h>

using namespace std;

extern "C" char GlChar = 10;
extern "C" short GlShort = 20;
extern "C" int GlInt = 30;
extern "C" long long GlLongLong = 0x000000000FFFFFFFE;

extern "C" void IntegerAddition_(char a, short b, int c, long long d);

int main(int argc, _TCHAR* argv[])
{
	cout << "Before GlChar: " << GlChar <<"\n";
	cout << "       GlChar: " << GlShort << "\n";
	cout << "       GlChar: " << GlInt << "\n";
	cout << "       GlChar: " << GlLongLong << "\n\n";

	IntegerAddition_(3, 5, -37, 11);

	cout << "After GlChar: " << GlChar << "\n";
	cout << "       GlChar: " << GlShort << "\n";
	cout << "       GlChar: " << GlInt << "\n";
	cout << "       GlChar: " << GlLongLong << "\n\n";

	return (0);
 }