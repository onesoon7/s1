#include<iostream>
#include<cmath>
using namespace std;
int main()
{
int n,x,y;
cin>>n>>x>>y;
double s;
s=(n-ceil((double)y/x));
if(s<0)
{
	s=0;
	
}
 cout<<s<<endl;
return 0;
}
