#include<iostream>

extern "C" int SumSquares_(int ,int , int , int , int, int, int);
void PrintResult(const char *, int, int, int, int, int, int, int, int);

using namespace std;

int main() {
    int a, b, c, d, e, f, g, sum;

    a = 10; b = 20; c = 30; d = 40;
    e = 50; f = 60; g = 70;

    sum = SumSquares_(a, b, c, d, e, f, g);
    PrintResult("SumSquares - Test Case #1 ", a, b, c, d, e, f, g, sum);

    a = 10; b = -200; c = 30; d = 40;
    e = -500; f = 60; g = -700;
    sum = SumSquares_(a, b, c, d, e, f, g);
    PrintResult("SumSquares - Test Case #2 ", a, b, c, d, e, f, g, sum);
 
    return (0);
}

void PrintResult(const char * msg, int a, int b, int c, int d, int e, int f, int g, int sum) {
    const char nl = '\n';
    const char * sep = " | ";

    cout <<msg <<nl;
    cout <<"a = " <<a <<sep;
    cout <<"b = " <<b <<sep;
    cout <<"c = " <<c <<sep;
    cout <<"d = " <<d <<nl;
    cout <<"e = " <<e <<sep;
    cout <<"f = " <<f <<sep;
    cout <<"g = " <<g <<sep;
    cout <<"sum = " <<sum <<nl;
    cout <<nl;

}