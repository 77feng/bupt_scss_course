#include<stdio.h>
#include<windows.h>

int main()
{
	LoadLibraryA("set_message_hook.dll");
	printf("set_message_hook.dll loaded ...\n");

    getchar(); // 触发键盘Hook

    return 0;
}
