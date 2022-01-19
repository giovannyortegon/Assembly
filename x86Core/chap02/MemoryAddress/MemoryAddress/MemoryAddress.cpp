#include<iostream>
#include<tchar.h>

using namespace std;

extern "C" int NumFibVals_;
extern "C" int MemoryAddress_(int i, int* v1, int* v2, int* v3, int* v4);

int main(int argc, _TCHAR* argv[])
{
	for (int i = -1; i < NumFibVals_ + 1; i++)
	{
		int v1 = -1, v2 = -1, v3 = -1, v4 = -1;
		int rc = MemoryAddress_(i, &v1, &v2, &v3, &v4);

		cout << "i: " << i << " rc: " << rc << "\n";
		cout << "v1: " << v1 << " v2: " << v2 << " v3: " << v3 << " v4: " << v4 << "\n";
	}

	return (0);
}
