#include <iostream>
#include <tchar.h>

extern "C" int NumFibVals_;
extern "C" int MemoryAddressing_(int i, int *v1, int *v2, int *v3, int *v4);

int _tmain(int argc, _TCHAR * argv[]) {
	for (int i = -1; i < NumFibVals_ + 1; i++) {
		int v1 = -1, v2 = -1, v3 = -1, v4 = -1;
		int rc = MemoryAddressing_(i, &v1, &v2, &v3, &v4);

		std::cout << "i: " << i << " rc: " << rc << " - ";
		std::cout << "v1: " << v1 << " v2: " << v3 << " v3: " << v3 << " v4: " << v4 << std::endl;
	}
	return (0);
}
