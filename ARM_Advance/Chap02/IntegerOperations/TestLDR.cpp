#include<iostream>

using namespace std;

extern "C" int TestLDR_(void);

int main(int argc,char * argv[]) {
	int result = TestLDR_();

	cout <<"Result: " <<result <<"\n";

	return (0);
}
