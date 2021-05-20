#include<stdio.h>
#include<stdlib.h>
#include<string.h>

#define N 20

typedef struct customer
{
    int c_id;
    char c_name[N];
    char c_address[N];
    int c_balance;
    int c_rank;
} customers;

int main()
{
    customers *c1;

    c1 = (customers *) malloc(sizeof(customers));

    c1->c_id = 1;
    strcpy(c1->c_name, "Calvin");
    strcpy(c1->c_address, "12 Mockingbird Lane");
    c1->c_balance = 12500;
    c1->c_rank = 1;

    printf("\n%d %s %s %d %d\n", c1->c_id, c1->c_name, c1->c_address, c1->c_balance, c1->c_rank);

    free(c1);
    return (0);
}