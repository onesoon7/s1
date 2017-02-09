#include<stdio.h>
int main(){
	int i=5;
	if (true){
	printf("hello world");
	}
	int *p;//指针
	p=&i;//&代表取地址符
	printf("%d",p);
	return 0;
}