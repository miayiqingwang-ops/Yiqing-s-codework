/*#include <iostream>
using namespace std;
int main()
{
	int a, b;
	cout << "Please enter a integer." << endl;
	cin >> a;
	if(a==1)cout <<  " You got the special one! 1 is neither prime nor composite (Can we say '1 is not a prime'? )" << endl;
	if (a == 1) return 0;
	for (int i = 2; i <= a-1; i++)
	{
		b = a % i;
		cout << "what left is "<<b << endl;
		if (b == 0)cout << a << " is not prime" << endl;
		if (b == 0)return 0;
		
	

	}
	cout << a<<" is prime" << endl;
	return 0;
}
*/