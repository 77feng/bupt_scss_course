#include "main.h"
#include<stdio.h>
#include <string.h>

#include<windows.h>
#include<winuser.h>
#include "tlhelp32.h"

void Get_PID_of_message_hook()    // 获取消息钩子示例程序的进程ID
{
    PROCESSENTRY32W pe32;
    pe32.dwSize = sizeof(pe32);
    HANDLE hpro = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS,0);

    BOOL nowRun=Process32FirstW(hpro,&pe32);
    while(nowRun)
    {
        if(!wcscmp(proName, pe32.szExeFile))
        {
            PID_message_hook = pe32.th32ProcessID;
        }
        nowRun = Process32NextW(hpro,&pe32);
    }
}

void CloseProcess_message_hook()  // 关闭消息钩子示例程序
{
    HANDLE hprocess = OpenProcess(PROCESS_ALL_ACCESS, FALSE, PID_message_hook);

    if(hprocess!=NULL)
    {
        TerminateProcess(hprocess,0);
        CloseHandle(hprocess);
    }
}

LRESULT __stdcall keyboard(int nCode,WPARAM wParam,LPARAM lParam)
{
	if(nCode >=0 && !(lParam & 0x80000000))
    {
			char tcKey[MAX_PATH] = {0};

			if( GetKeyNameTextA(lParam,tcKey,MAX_PATH) && ++cnt <= 3 ){
                MessageBoxA(NULL, tcKey, "Demo of KB-based message Hook: please enter C to exit!", MB_OK);
            } else {
                UnhookWindowsHookEx(mhook);  // 卸载消息钩子
                CloseProcess_message_hook(); // 关闭消息钩子示例进程
            }
    }

    return CallNextHookEx(mhook,nCode,wParam,lParam);
}

BOOL APIENTRY DllMain(HINSTANCE hinstDLL, DWORD fdwReason, LPVOID lpvReserved)
{
    switch (fdwReason)
    {
        case DLL_PROCESS_ATTACH:
            // attach to process
            Get_PID_of_message_hook(); // 获取消息钩子进程的进程ID
//            mhook = SetWindowsHookExA(WH_KEYBOARD,keyboard,hinstDLL,PID_message_hook); // 设置全局消息钩子
            mhook = SetWindowsHookEx(WH_KEYBOARD,keyboard,hinstDLL,0); // 设置全局消息钩子
            break;

        case DLL_PROCESS_DETACH:
            // detach from process
            break;

        case DLL_THREAD_ATTACH:
            // attach to thread
            break;

        case DLL_THREAD_DETACH:
            // detach from thread
            break;
    }
    return TRUE; // succesful
}
