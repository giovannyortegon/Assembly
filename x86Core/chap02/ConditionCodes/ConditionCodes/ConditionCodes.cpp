
#include<iostream>
#include<tchar.h>

using namespace std;

extern "C" int SignedMinA_(int a, int b, int c);
extern "C" int SignedMaxA_(int a, int b, int c);
extern "C" int SignedMinB_(int a, int b, int c);
extern "C" int SignedMaxB_(int a, int b, int c);

int main(int argc, _TCHAR * argv[])
{
	int a, b, c;
	int smin_a, smax_a;
	int smin_b, smax_b;

	// SignedMin examples
	a = 2; b = 15; c = 8;
	smin_a = SignedMinA_(a, b, c);
	smin_b = SignedMinB_(a, b, c);
	cout << "SignedMinA" << "(" << a <<", " << b << ", " << c << ") = " << smin_a << "\n";
	cout << "SignedMinB" << "(" << a <<", " << b << ", " << c << ") = " << smin_b << "\n";

	a = -3; b = -22; c = 28;
	smin_a = SignedMinA_(a, b, c);
	smin_b = SignedMinB_(a, b, c);
	cout << "SignedMinA" << "(" << a << ", " << b << ", " << c << ") = "  << smin_a << "\n";
	cout << "SignedMinB" << "(" << a << ", " << b << ", " << c << ") = "  << smin_b << "\n";

	a = 17; b = 37; c = -11;
	smin_a = SignedMinA_(a, b, c);
	smin_b = SignedMinB_(a, b, c);
	cout << "SignedMinA" << "(" << a << ", " << b << ", " << c << ") = "  << smin_a << "\n";
	cout << "SignedMinB" << "(" << a << ", " << b << ", " << c << ") = "  << smin_b << "\n";

	// SignedMax examples
	a = 10; b = 5; c = 3;
	smax_a = SignedMaxA_(a, b, c);
	smax_b = SignedMaxB_(a, b, c);
	cout << "SignedMaxA" << "(" << a << ", " << b << ", " << c << ") = "  << smax_a << "\n";
	cout << "SignedMaxB" << "(" << a << ", " << b << ", " << c << ") = "  << smax_b << "\n";
	a = -3; b = 28; c = 15;
	smax_a = SignedMaxA_(a, b, c);
	smax_b = SignedMaxB_(a, b, c);
	cout << "SignedMaxA" << "(" << a << ", " << b << ", " << c << ") = "  << smax_a << "\n";
	cout << "SignedMaxB" << "(" << a << ", " << b << ", " << c << ") = "  << smax_b << "\n";

	a = -25; b = -37; c = -17;
	smax_a = SignedMaxA_(a, b, c);
	smax_b = SignedMaxB_(a, b, c);
	cout << "SignedMaxA" << "(" << a << ", " << b << ", " << c << ") = "  << smax_a << "\n";
	cout << "SignedMaxB" << "(" << a << ", " << b << ", " << c << ") = "  << smax_b << "\n";

	return (0);
}