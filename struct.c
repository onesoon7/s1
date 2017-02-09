#include<stdio.h>
#include<string.h>//strcpy需要用到该函数
struct student {
	char name[20];
	char sex[8];
	int age;
	
};
int main(){
	
	struct student stu={"lws","boy",17};//同时赋初值
    struct student stus;	printf("名字%s\n性别%s\n年龄%d\n",stu.name,stu.sex,stu.age);
stus.age=15;
strcpy(stus.name,"lws");//字符不能直接用等号需要用到该函数
printf("名字%s年龄%d\n",stus.name,stus.age);
	return 0;
	
}