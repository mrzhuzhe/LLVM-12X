/*
    16688 = 0x4130 = 11 float format
    16816 = 0x41b0 = 22 float format
*/
#include "stdio.h"

int func1(int a, int b){
    return a*b;
}
int main(){

    int a = 11; 
    int b = 22;
    // int d = 33;
    // int e = 44;
    int c = func1(a, b);
    // d = c + e;
    printf("teststr %d", c);
    return 0;
}