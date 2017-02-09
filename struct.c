#include<stdio.h>
struct student {
	char name[20];
	char sex[8];
	int age;
	
};
int main(){
	
	struct student stu={"lws","boy",17};//同时赋初值
	printf("名字%s\n性别%s\n年龄%d\n",stu.name,stu.sex,stu.age);
	return 0;
	
}