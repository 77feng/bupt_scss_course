#include<windows.h>
int main()
{
	HINSTANCE LibHandle;
	char dllbuf[11] = "user32.dll";
	LibHandle = LoadLibrary(dllbuf);
	_asm{
		sub sp,0x440
		xor ebx,ebx
		push ebx
		push 0x74707562		//bupt
		push 0x74707562		//bupt

		mov eax,esp
		push ebx
		push eax
		push eax
		push ebx

		mov eax,0x77E23D68	//messageboxA  入口地址
		call eax
		push ebx
		mov eax,0x77E7B0BB	//exitprocess  入口地址
		call eax
	}
	return 0;
}