#include<stdio.h>
#include<windows.h>

int main()
{
	HMODULE hKernel32;
	FARPROC pWriteFile;

    /* 获取一个应用程序或动态链接库的模块句柄，即模块在当前进程空间的装入地址 */
	hKernel32 =GetModuleHandle("kernel32.dll");

	/* 检索指定的DLL中导出库函数的内存地址 */
	pWriteFile=GetProcAddress(hKernel32, "WriteFile");

	printf("the API address of \"WriteFile\": 0x%p\n\n", pWriteFile);

    system("pause");
	return 0;
}
