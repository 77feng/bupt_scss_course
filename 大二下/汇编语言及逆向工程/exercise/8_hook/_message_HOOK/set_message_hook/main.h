#ifndef __MAIN_H__
#define __MAIN_H__

#include <windows.h>
#include <wchar.h>


//// GCC：共享内存
//__attribute__((section(".shared_data"))) int cnt = 0;
//__attribute__((section(".shared_data"))) HHOOK mhook = NULL;

#pragma data_seg(".shared")
int cnt = 0;
wchar_t proName[] = L"_message_HOOK.exe";
HHOOK mhook = NULL;
DWORD PID_message_hook = 0;
#pragma data_seg()
#pragma comment(linker,"/SECTION:.shared,RWS")


LRESULT __stdcall keyboard(int nCode,WPARAM wParam,LPARAM lParam);
void CloseProcess_message_hook();
void Get_PID_of_message_hook();

#endif // __MAIN_H__
