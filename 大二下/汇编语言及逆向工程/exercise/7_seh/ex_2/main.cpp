#include <stdio.h>
#include <stdlib.h>
#include <windows.h>

char pw[10] = "SEH";
char input[1024] = {0};

//异常处理函数； C++，文件后缀需为 .cpp
EXCEPTION_DISPOSITION __cdecl except_handler(
                                struct _EXCEPTION_RECORD *ExceptionRecord,
                                void * EstablisherFrame,
                                struct _CONTEXT *ContextRecord,
                                void * DispatcherContext )
{
	//异常处理函数逻辑
	if(strcmp(input, pw) == 0){
		printf("Ok, you are here. Congratulations!\n");
		system("pause");
	    exit(0);	/*完成口令匹配后结束进程——
					  否则会因没有对异常代码进行处理，
					  该进程会一直在触发异常和异常处理之间循环 */
	}
	else{
		printf("Ok, you are here. But your pw is wrong!\n");

		system("pause");
	    exit(0);	/*完成口令匹配后结束进程——
					  否则会因没有对异常代码进行处理，
					  该进程会一直在触发异常和异常处理之间循环 */
	}

	//返回，告知os继续执行异常代码
	return ExceptionContinueExecution;
}

int main(){

	int a = 1, c = 0;

	int res;

	printf("Please input password : ");
	scanf("%s", input);

	DWORD handler = (DWORD) except_handler;

	//注册异常处理函数
	__asm{
		push handler;
		push FS:[0];
		mov FS:[0], ESP;
	}

	//构造整数除零异常，程序将跳转调用上述注册的异常处理函数
	res = a / c;

	//如不处理异常，则会执行至此：xdbg调试时，可以修改c的值为非零，执行到此
	printf("What a pity! You found a wrong way.\n");

	system("pause");
	return -1;
}
