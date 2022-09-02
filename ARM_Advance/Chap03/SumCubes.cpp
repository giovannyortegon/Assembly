#include<iostream>
#include<iomanip>

extern "C" int SumCubes_(unsigned char, short, int, int, signed char, short, unsigned char, unsigned short, int);
int SumCubes(unsigned char, short, int, int, signed char, short, unsigned char, unsigned short, int);
void PrintResult(const char *,unsigned char, short, int, int, signed char, short, unsigned char, unsigned short, int, int, int);

using namespace std;

int main() {
    unsigned char a;
    short b, f;
    int c, d, i, sum1, sum2;
    signed char e;
    unsigned char g;
    unsigned short h;

    a = 10; b = 20; c = 30; d = 40;
    e = -50; f = -60; g = 70; h = 80; i = 90;

    sum1 = SumCubes(a, b, c, d, e, f, g, h, i);
    sum2 = SumCubes_(a, b, c, d, e, f, g, h, i);
    PrintResult("SumCubes - Test Case #1 ", a, b, c, d, e, f, g, h, i,sum1, sum2);
    
    a = 10; b = -20; c = -30; d = 40;
    e = -50; f = -60; g = 70; h = 80; i = -90;

    sum1 = SumCubes(a, b, c, d, e, f, g, h, i);
    sum2 = SumCubes_(a, b, c, d, e, f, g, h, i);
    PrintResult("SumCubes - Test Case #2 ", a, b, c, d, e, f, g, h, i,sum1, sum2);

    a = -100; b = 200; c = 300; d = 400;
    e = 50; f = -600; g = 70; h = 800; i = -900;

    sum1 = SumCubes(a, b, c, d, e, f, g, h, i);
    sum2 = SumCubes_(a, b, c, d, e, f, g, h, i);
    PrintResult("SumCubes - Test Case #3 ", a, b, c, d, e, f, g, h, i,sum1, sum2);

    return (0);
}

int SumCubes_(unsigned char a, short b, int c, int d, signed char e, short f, unsigned char g, unsigned short h, int i) {
    int aa = (int) a * a * a;
    int bb = (int) b * b * b; 
    int cc = c * c * c;
    int dd = d * d * d;
    int ee = (int) e * e * e;
    int ff = (int) f * f * f;
    int gg = (int) g * g * g;
    int hh = (int) h * h * h;
    int ii = i * i * i;

    return (aa + bb + cc + dd + ee + ff + gg + hh + ii);
}
void PrintResult(const char * msg, unsigned char a, short b, int c, int d, signed char e, short f, unsigned char g, unsigned short h, int i, int sum1, int sum2) {
    const char nl = '\n';
    const char * sep = " | ";
    const size_t w = 6;

    cout <<msg <<nl;
    cout <<"a = " <<setw(w) <<a <<sep;
    cout <<"b = " <<setw(w) <<b <<sep;
    cout <<"c = " <<setw(w) <<c <<sep;
    cout <<"d = " <<setw(w) <<d <<sep;
    cout <<"e = " <<setw(w) <<e <<nl;
    cout <<"f = " <<setw(w) <<f <<sep;
    cout <<"g = " <<setw(w) <<g <<sep;
    cout <<"h = " <<setw(w) <<h <<sep;
    cout <<"i = " <<setw(w) <<i <<nl;

    cout <<"Sum 1 = " <<setw(w) <<sum1 <<nl;
    cout <<"Sum 2 = " <<setw(w) <<sum2 <<nl;

    if (sum1 != sum2)
        cout <<"Compare error!\n";

    cout <<nl;
}
