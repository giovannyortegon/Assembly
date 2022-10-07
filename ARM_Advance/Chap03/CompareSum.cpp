#include<iostream>

extern "C" bool CompareSumA_(int, int, int, int * );
extern "C" bool CompareSumB_(int, int, int, int * );
extern "C" bool CompareSumC_(int, int, int, int * );

void CompareSumA(void);
void CompareSumB(void);
void CompareSumC(void);
void PrintResult(const char *, int , int, int, int, bool);

int main() {

    const char nl = '\n';
    std::string sep(75, '-');

    CompareSumA();
    std::cout <<sep <<nl <<nl;
    CompareSumB();
    std::cout <<sep <<nl <<nl;
    CompareSumC();
    std::cout <<sep <<nl <<nl;

}

void PrintResult(const char * msg, int a, int b, int c, int sum, bool result) {

    const char nl = '\n';
    const char * sep = " | ";

    std::cout <<msg <<nl;
    std::cout <<"a = "<< a <<sep;
    std::cout <<"b = "<< b <<sep;
    std::cout <<"c = "<< c <<sep;
    std::cout <<"sum = " <<sum <<sep;
    std::cout <<"result = " << std::boolalpha <<result <<nl <<nl;

}
void CompareSumA(void) {

    bool result;
    int a, b, c, sum;

    a = 10; b = 20; c = 30;
    result = CompareSumA_(a,b,c, &sum);
    PrintResult("CompareSumA - Test Case #1", a, b, c, sum, result);

    a = 100; b = -200; c = 400;
    result = CompareSumA_(a, b, c, &sum);
    PrintResult("CompareSumA - Test Case #2", a, b, c, sum, result);

    a = 100; b = -200; c = 200;
    result = CompareSumA_(a, b, c, &sum);
    PrintResult("CompareSumA - Test Case #3", a, b, c, sum, result);

}
void CompareSumB(void) {

    bool result;
    int a, b, c, sum;

    a = 10; b = 20; c = 30;
    result = CompareSumB_(a,b,c, &sum);
    PrintResult("CompareSumB - Test Case #1", a, b, c, sum, result);

    a = 100; b = -200; c = 50;
    result = CompareSumB_(a, b, c, &sum);
    PrintResult("CompareSumB - Test Case #2", a, b, c, sum, result);

    a = 100; b = -200; c = 100;
    result = CompareSumB_(a, b, c, &sum);
    PrintResult("CompareSumB - Test Case #3", a, b, c, sum, result);

}
void CompareSumC(void) {

    bool result;
    int a, b, c, sum;

    a = 0x7ffffff0; b = 5; c = 10;
    result = CompareSumC_(a,b,c, &sum);
    PrintResult("CompareSumC - Test Case #1", a, b, c, sum, result);

    a = 0x7ffffff0; b = 5; c = 11;
    result = CompareSumC_(a, b, c, &sum);
    PrintResult("CompareSumC - Test Case #2", a, b, c, sum, result);

    a = 0x7ffffff0; b = 100; c = 200;
    result = CompareSumC_(a, b, c, &sum);
    PrintResult("CompareSumC - Test Case #3", a, b, c, sum, result);

    a = 0x8000000f; b = -5; c = -10;
    result = CompareSumC_(a, b, c, &sum);
    PrintResult("CompareSumC - Test Case #4", a, b, c, sum, result);

    a = 0x8000000f; b = 100; c = -200;
    result = CompareSumC_(a, b, c, &sum);
    PrintResult("CompareSumC - Test Case #5", a, b, c, sum, result);

}