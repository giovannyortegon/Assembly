// CalcSum.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include<tchar.h>

// function in assembly
extern "C" int CalcSum_(int a, int b, int c);

int main(int argc, _TCHAR * argv[])
{
	int a = 17, b = 11, c = 14;
	int sum = 0;
	
	sum = CalcSum_(a, b, c);

	std::cout <<" a: " <<a <<"\n";
	std::cout <<" b: " <<b <<"\n";
	std::cout <<" c: " <<c <<"\n";
	std::cout <<" sum: " <<sum <<"\n";

	return 0;
}

