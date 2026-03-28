#include <cmath>
#include <iostream>
#include <iomanip>
#include <typeinfo>
//#include "cpgplot.h"
//#include <math.h>

using namespace std;

bool checkPalin(string s)
{
    int L = s.size();
    for (int i = 0; i<L/2; ++i) {
        if (s[i] != s[L - i - 1])
            return false;
    }
    return true;
}

int foo(float M, float m, const float G, double r, int N) {
    return N * G * M * m / (pow(r, 2));
}


int main()
    {
    bool x = true;
    int y = 1;
    if (x == y)cout << "yes!\n";
    else cout << "no...\n";

     }