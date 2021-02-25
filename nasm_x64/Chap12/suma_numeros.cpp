#include<iostream>

using namespace std;

extern "C" {
	int suma(int, int);
}

int main()
{
	cout <<"La suma de dos numeros es: " <<suma(5, 10) <<endl;

	return 0;
}
