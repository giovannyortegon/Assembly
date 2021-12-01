#include<asm/errno.h>
#include<iostream>


using namespace std;

extern "C" { int IntegerMulDiv_(int, int, int *, int *, int *); }

int main(int argc, char * argv[])
{
	int a = 21, b = 9;
	int prod = 0, quo = 0, rem = 0;
	int rc;

	rc = IntegerMulDiv_(a, b, &prod, &quo, &rem);
	cout <<"Input -	 a: " <<a <<" b: " <<b <<endl;
	cout <<"Output - rc: "<<rc <<" prod: " <<prod <<endl;
	cout <<"	quo: " <<quo <<" rem: " <<rem <<endl;

	a = -29;
	prod = quo = rem = 0;
	rc = IntegerMulDiv_(a, b, &prod, &quo, &rem);
	cout <<"Input -	 a: " <<a <<" b: " <<b <<endl;
	cout <<"Output - rc: "<<rc <<" prod: " <<prod <<endl;
	cout <<"	quo: " <<quo <<" rem: " <<rem <<endl;

	a = 0;
	prod = quo = rem = 0;
	rc = IntegerMulDiv_(a, b, &prod, &quo, &rem);
	cout <<"Input -	 a: " <<a <<" b: " <<b <<endl;
	cout <<"Output - rc: "<<rc <<" prod: " <<prod <<endl;
	cout <<"	quo: " <<quo <<" rem: " <<rem <<endl;

	return (0);
}
