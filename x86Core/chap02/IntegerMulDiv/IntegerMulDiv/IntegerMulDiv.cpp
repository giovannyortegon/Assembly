#include<iostream>
#include<tchar.h>

using namespace std;

extern "C" int IntegerMulDiv_(int a, int b, int * prod, int * quo, int * rem);

int _tmain(int argc, _TCHAR* argv[])
{
	int a = 21, b = 9;
	int prod = 0, quo = 0, rem = 0;
	int rc;

	rc = IntegerMulDiv_(a, b, &prod, &quo, &rem);
	cout << "Input1	a: " <<a << " b: " <<b <<endl;
	cout << "Output1 rc: " << rc <<" prod: " << prod << endl;
	cout << "	 quo: " << quo <<" rem: " << rem << endl;

	a = -29;
	prod = quo = rem = 0;
	rc = IntegerMulDiv_(a, b, &prod, &quo, &rem);
	cout << "Input2  a: " << a << " b: " << b << endl;
	cout << "Output2 rc: " << rc << " prod: " << prod << endl;
	cout << "	 quo: " << quo << " rem: " << rem << endl;

	b = 0;
	prod = quo = rem = 0;
	rc = IntegerMulDiv_(a, b, &prod, &quo, &rem);
	cout << "Input3  a: " << a << " b: " << b << endl;
	cout << "Output3 rc: " << rc << " prod: " << prod << endl;
	cout << "	 quo: " << quo << " rem: " << rem << endl;

	return (0);
}