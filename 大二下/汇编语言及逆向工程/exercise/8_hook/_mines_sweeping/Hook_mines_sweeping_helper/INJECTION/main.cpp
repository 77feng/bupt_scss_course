#include "main.h"
#include <stdio.h>
#include <wchar.h>
#include <windows.h>
#include <winuser.h>
#include <commctrl.h>
#include <TlHelp32.h>

void LeftClickBlock(int i, int j)
{
	POINT pCursor; 						// 鼠标指针
	pCursor.x = j * 16 + 20;
	pCursor.y = i * 16 + 60;

	ClientToScreen(hWnd, &pCursor);		 /* 将打开的APP中客户区的坐标点信息转换为整个屏幕的坐标，
											无论是屏幕坐标还是客户区坐标，其原点均为左上角的（0，0）*/
	SetCursorPos(pCursor.x, pCursor.y);  // 移动光标到 (pCursor.x, pCursor.y) 坐标位置

	INPUT input = { 0 };
	input.type = INPUT_MOUSE;
	input.mi.dwFlags = MOUSEEVENTF_LEFTDOWN;

	SendInput(1, &input, sizeof(input));	// 发送鼠标左键按下的消息

	ZeroMemory(&input, sizeof(input));		// 清空光标信息

	input.type = INPUT_MOUSE;
	input.mi.dwFlags = MOUSEEVENTF_LEFTUP;

	SendInput(1, &input, sizeof(input));	// 发送鼠标左键弹起的消息
}

void MinesSweepingHelper()
{
	hWnd = FindWindowW(NULL, L"扫雷");
	GetWindowThreadProcessId(hWnd, &pid);
	hWinmine = OpenProcess(PROCESS_ALL_ACCESS, FALSE, pid);

	BYTE GameMap[32][32];
	ReadProcessMemory(hWinmine, (LPCVOID)0x01005361, GameMap,  sizeof(GameMap), nullptr);

	DWORD MapSize[2];
    ReadProcessMemory(hWinmine, (LPCVOID)0x01005334, MapSize,  8,			 nullptr);

	for (unsigned int i = 0; i < MapSize[1]; i++)
	{
		for (unsigned int j = 0; j < MapSize[0]; j++)
		{
			if (GameMap[i][j] != 0x8F)	// 数值 0x8F 代表雷；这里判断是否有雷
			{
				LeftClickBlock(i, j);	// 没雷，则模拟鼠标左键点开
			}
		}
	}

    CloseHandle(hWinmine);
	CloseHandle(hWnd);
}

BOOL APIENTRY DllMain(HANDLE hModule, DWORD ul_reason_for_call, LPVOID lpReserved)  // 动态链接库的 主函数
{
	switch (ul_reason_for_call)
	{
	case DLL_PROCESS_ATTACH:
		MessageBoxW( NULL, L"成功注入扫雷进程", L"提示", MB_ICONINFORMATION );
		MinesSweepingHelper();
		break;

	case DLL_PROCESS_DETACH:
		MessageBoxW( NULL, L"脱离扫雷进程", L"提示", MB_ICONINFORMATION );
		ExitThread(0);
		break;
	}

    return TRUE;
}
