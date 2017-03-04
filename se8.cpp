#include<iostream>
#include<cmath>
using namespace std;
int main()
{
float s;
float ti,bt,wt;
cin>>s;
bt=27+23+(s/3);
wt=(s/1.2);
if(bt<wt){
	
	cout<<"bike"; 
}
else if(bt>wt){
	
	cout<<"walk"; 
}
else{
	
	
	cout<<"the same";
}
return 0;
}
