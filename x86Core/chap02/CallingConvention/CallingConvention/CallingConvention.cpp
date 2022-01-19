#include<iostream>
#include<tchar.h>

using namespace std;

extern "C" void CalculateSums_(int a, int b, int c, int* s1, int* s2, int* s3);

int main(int argc, _TCHAR* argv[])
{
	int a = 3, b = 5, c = 8;
	int s1a, s2a, s3a;

	CalculateSums_(a, b, c, &s1a, &s2a, &s3a);

	// compute the sums again so we can verify the result
	// of CalculateSums_().
	int s1b = a + b + c;
	int s2b = a * a + b + c * c;
	int s3b = a * a * a + b * b * b + c * c * c;

	cout << "Input: a: " <<a <<" b: " <<b <<" c: " <<c <<"\n";
	cout << " Output: s1a: " <<s1a <<" s2a: " <<s2a <<" s3a: " <<s3a <<"\n";
	cout << " s1b: " << s1b << " s2b " << s2b << " s3b: " << s3b <<"\n";

	return (0);
}