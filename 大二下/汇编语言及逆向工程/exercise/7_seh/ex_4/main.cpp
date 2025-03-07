#include <stdio.h>
#include <stdlib.h>
#include <windows.h>

char pw[10] = "SEH";     	// 正确的口令
char input[1024] = {0};

EXCEPTION_DISPOSITION __cdecl except_handler(	struct _EXCEPTION_RECORD *ExceptionRecord,
												void * EstablisherFrame,
												struct _CONTEXT *ContextRecord,
												void * DispatcherContext	) {
if(strcmp(input, pw) == 0){ // 验证输入的口令是否正确
	printf("Ok, you are here. Congratulations!\n");
} else {
	printf("Ok, you are here. But your pw is wrong!\n");
}
	system("pause");
	exit(0);

	return ExceptionContinueExecution;
}

int main(){

	int a = 1, c = 0;
	int res;

	printf("please input password : ");
	scanf("%s", input);

	// 注册异常处理函数，并基于UnhandledExceptionFilter实现反调功能
	SetUnhandledExceptionFilter((LPTOP_LEVEL_EXCEPTION_FILTER ) except_handler);

	res = a / c; 			// 触发整数除零异常，实现异常处理跳转

	printf("What a pity, you found a wrong way.\n");

	system("pause");
	return -1;
}

