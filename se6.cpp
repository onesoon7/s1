#include<iostream>
#include<cmath>
using namespace std;
int main()
{
int c,s;//定义周长c与面积s 
float a,b,delta;//用于二次方程的计算 
cin>>c>>s;//输入面积与长度 
delta = (((c*c)/4)-4*s);

if (delta>=0)//判断语句 
{
	if(delta==0)
	{
		
		 a=b=((c/2)/2*a);
		
	}
	else
	{
		
	    b=(((c/2)+sqrt(delta))/2);
    	a=(((c/2)-sqrt(delta))/2);
	    	
	}
	cout<<"矩形的长和宽分别是"<<b<<"和"<<a; 
}

  else
  {
	
	cout<<"不能找到这样的矩形";
  }
return 0;
}
