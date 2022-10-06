#include<iostream>
#include"PrintResult.h"

const int c_ArgnMin = 1;
const int c_ArgnMax = 1023;

extern "C" void CalcSum_(int, int *, int *);
// extern void PrintResult(const char *, int, int, int, int, int);
void CalcSum(int n, int * sum1, int * sum2);
static int CalcSum1(int n);
static int CalcSum2(int n);

int main(int argc, char **argv) {
    int n;
    int sum1_cpp, sum1_asm;
    int sum2_cpp, sum2_asm;

    n = 3;
    CalcSum(n, &sum1_cpp, &sum2_cpp);
    CalcSum_(n, &sum1_asm, &sum2_asm);
    PrintResult("CalcSum - Test Case #1", n, sum1_cpp, sum1_asm, sum2_cpp, sum2_asm);
    
    n = 7;
    CalcSum(n, &sum1_cpp, &sum2_cpp);
    CalcSum_(n, &sum1_asm, &sum2_asm);
    PrintResult("CalcSum - Test Case #2", n, sum1_cpp, sum1_asm, sum2_cpp, sum2_asm);

    n = 17;
    CalcSum(n, &sum1_cpp, &sum2_cpp);
    CalcSum_(n, &sum1_asm, &sum2_asm);
    PrintResult("CalcSum - Test Case #3", n, sum1_cpp, sum1_asm, sum2_cpp, sum2_asm);

    n = 40;
    CalcSum(n, &sum1_cpp, &sum2_cpp);
    CalcSum_(n, &sum1_asm, &sum2_asm);
    PrintResult("CalcSum - Test Case #4", n, sum1_cpp, sum1_asm, sum2_cpp, sum2_asm);

    return (0);
}

void CalcSum(int n, int * sum1, int * sum2) {
    * sum1 = * sum2 = 0;

    if (n < c_ArgnMin || n > c_ArgnMax)
        return;

    *sum1 = CalcSum1(n);
    *sum2 = CalcSum2(n);

    return;
}

static int CalcSum1(int n) {
    int sum = 0;

    for (int i = 1; i <= n; i++)
        sum += i * i;

    return (sum);
}

static int CalcSum2(int n) {
    int sum = ((n * (n + 1) * (2 * n + 1)) / 6);
    return (sum);
}
