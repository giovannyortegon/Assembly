#include<iostream>
#include<iomanip>

using namespace std;

extern "C" void callingConvention_(int, int , int , int *, int *, int *);

int main(int argc, char * argv[])
{
	int a = 3, b = 5, c = 8;
	int s1a, s2a, s3a;

	callingConvention_(a, b, c, &s1a, &s2a, &s3a);

	int s1b, s2b, s3b;

	s1b = a + b + c;
	s2b = a * a + b * b + c * c;
	s3b = a * a * a + b * b * b + c * c * c;

	cout <<"Input:  a: " <<a <<" b: " <<b <<" c: " <<c <<"\n";
	cout <<"Output: s1a: " <<s1a <<" s2a: " <<s2a <<" s3a: " <<s3a <<"\n";
	cout <<setw(14) <<"s1b: " <<s1b <<" s2b: " <<s2b <<" s3b:" <<s3b <<"\n";

	return (0);
}
