#include<stdio.h>
#include<string.h>
#include<windows.h>

BYTE pOrgByte[5] = {0}; // 这里保存的是原始WriteFile函数初始地址处的 5个字节的数据

typedef BOOL(WINAPI *PFWriteFile)(HANDLE hFile, LPCVOID lpBuffer, DWORD nNumberOfBytesToWrite,
								   LPDWORD lpNumberOfBytesWritten, LPOVERLAPPED lpOverlapped);

void unhook(); // 定义脱钩函数

BOOL __stdcall MyWriteFile(HANDLE hFile, LPCVOID lpBuffer, DWORD nNumberOfBytesToWrite,  // 定义hook函数
						   LPDWORD lpNumberOfBytesWritten, LPOVERLAPPED lpOverlapped);

int main()
{
	HMODULE hKernel32;
	FARPROC pWriteFile;
	PBYTE pEditFunc;
	DWORD dwOldProtect, dwWritenSize;
	ULONGLONG pOffset;
	HANDLE hFile;

	BYTE pJmpCode[6] = {0xE9,0}; /* 0xE9 是jmp指令的字节码; 其后4个字节将会被解析为待跳转的目标偏移地址 */
	char buf[] = "WriteFile";

	hKernel32 = GetModuleHandle("kernel32.dll"); // kernel32.dll 提供文件读写等基础服务的 WIN API
	pWriteFile = GetProcAddress(hKernel32, "WriteFile");
	pEditFunc = (PBYTE)pWriteFile;

	/* 钩取 WriteFile 函数；
	   VirtualProtect 函数能改变指定地址处，指定数量字节的可读可写可执行属性 */
	if (VirtualProtect(pEditFunc, 5, PAGE_EXECUTE_READWRITE, &dwOldProtect))
	{
		memcpy(pOrgByte, pEditFunc, 5);  /* 保存原始WriteFile函数的前5个字节 */
		pOffset = (ULONGLONG)MyWriteFile - (ULONGLONG)pWriteFile - 5;

		memcpy(&pJmpCode[1], &pOffset, 4);
		memcpy((void *)pWriteFile, &pJmpCode[0], 5); /* 修改为“jmp 自定义 WriteFile函数的起始地址”；(void *) 强制转换以兼容 gcc */

		VirtualProtect((void *)pWriteFile, 5, dwOldProtect, &dwOldProtect);
	}

	hFile = CreateFile("api_hook.txt", GENERIC_WRITE | GENERIC_READ, 0, NULL, CREATE_ALWAYS, 0x80, NULL);
	WriteFile(hFile, buf, strlen(buf), &dwWritenSize, NULL); /* WriteFile 函数已被钩取，
																将会跳转到自定义的MyWriteFile函数处执行 */
	CloseHandle(hFile);

	return 0;
}

void unhook() // 定义脱钩函数
{
	DWORD dwOldProtect;
	PBYTE pWriteFile;
	FARPROC pFunc;

	pFunc = GetProcAddress(GetModuleHandle("kernel32.dll"), "WriteFile");
	pWriteFile = (PBYTE)pFunc;

	/* 使用VirtualProtect函数，恢复已改掉的WriteFile函数地址处5字节数据的代码属性 */
	VirtualProtect(pWriteFile, 5, PAGE_EXECUTE_READWRITE, &dwOldProtect);
	memcpy(pWriteFile, pOrgByte, 5);
	VirtualProtect(pWriteFile, 5, dwOldProtect, &dwOldProtect);
}

BOOL __stdcall MyWriteFile(HANDLE hFile, LPCVOID lpBuffer, DWORD nNumberOfBytesToWrite,  // 定义hook函数
						   LPDWORD lpNumberOfBytesWritten, LPOVERLAPPED lpOverlapped)
{
	FARPROC pFunc;
	char buf[] = {"Ooops! Here you are, the WIN API Hook!"}; // 要替换的文件写入内容

	unhook(); // 执行脱钩

	pFunc = GetProcAddress(GetModuleHandle("kernel32.dll"), "WriteFile");
	((PFWriteFile)pFunc) (hFile, buf, strlen(buf), lpNumberOfBytesWritten, lpOverlapped);

	return TRUE;
}
