/*
    16688 = 0x4130 = 11 float format
    16816 = 0x41b0 = 22 float format
    
    calling convention
    https://en.wikipedia.org/wiki/X86_calling_conventions
*/

int main(){
    float a = 11; 
    float b = 22;
    float c = a * b;

    // unsigned short a = 11; 
    // unsigned short b = 22;
    // unsigned short c = a * b;

    return 0;
}