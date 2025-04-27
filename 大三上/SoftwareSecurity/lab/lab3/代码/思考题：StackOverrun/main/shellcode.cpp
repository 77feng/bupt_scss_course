#include<windows.h>
int main(){
	HINSTANCE LibHandle;
	char dllbuf[11] = "user32.dll";
	LibHandle = LoadLibrary(dllbuf);
	_asm{
		sub sp,0x440 //开辟栈空间
		xor ebx,ebx //将ebx中的值变为0
		push ebx //将ebx压入栈中，这是字符串结束符
		push 0x747874
		push 0x2E65646F
		push 0x636C6C65
		push 0x68735C3A
		push 0x43206578
		push 0x652E6461
		push 0x7065746F
		push 0x6E206B2F
		push 0x20657865
		push 0x2E646D63
		mov eax,esp //由于刚刚一直在压入参数，此时esp指向的就是bupt的地址
		push ebx // 0
		push eax // bupt的地址
		mov eax,0x77e78601 //WinExec 入口地址
		call eax
	}
	return 0;
}
