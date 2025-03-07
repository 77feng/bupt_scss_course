#include "winmine_helper_by_debug.h"

#include <windows.h>
#include <winuser.h>
#include <commctrl.h>

#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <TlHelp32.h>

BYTE GameMap[32][32];
int MapSize[2];

HANDLE hWinmine;
HWND hWnd;
POINT pCursor;

int speed=0;
unsigned long count_reset = 0;

HANDLE OpenProcessWithName(const WCHAR *szProcessName) {
	HANDLE hSnapshot, hProcess;
	PROCESSENTRY32W process;
	BOOL currentW;

	hSnapshot = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);	// 进程快照：获取系统中正在运行的32位进程信息，如使用的堆和模块等
	if (INVALID_HANDLE_VALUE == hSnapshot) {
		printf("未能成功获取系统中正在运行的32位进程信息\n");
		exit(100876);
	}

	process.dwSize = sizeof(PROCESSENTRY32W);

	currentW = Process32FirstW(hSnapshot, &process);			// 进程快照中第一个进程在内存中的运行状态
	while(currentW) {
		if (!wcscmp(szProcessName, process.szExeFile)) {		// 检查扫雷进程是否在内存运行
			hProcess = OpenProcess(PROCESS_ALL_ACCESS, FALSE, process.th32ProcessID);	//获得进程快照中扫雷进程的句柄
			if (hProcess != NULL) {								// 成功获取扫雷进程的句柄
				return hProcess;
			}
		}
		currentW = Process32NextW(hSnapshot, &process);			// 进程快照中下一个进程在内存中的运行状态
	}

	CloseHandle(hSnapshot);										// 删除系统进程快照
	return NULL;												// 未能成功获取扫雷进程的句柄
}

void DetectWinmineAndCaptureCursor(){
	hWinmine = OpenProcessWithName(L"winmine.exe");	// 获取扫雷进程的句柄
	hWnd = FindWindowW(NULL, L"扫雷");				// 获取扫雷应用窗口的句柄

	if (INVALID_HANDLE_VALUE == hWinmine)			// 获取扫雷进程的句柄失败，则退出
	{
		printf("未能成功获取扫雷进程. (%lu)\n", GetLastError());

		system("pause");
		exit(1);
	}

	/* 根据进程句柄读入该进程的某个内存空间
						  扫雷进程句柄     虚拟内存地址  接收指针  读取的内存字节数 （空指针）读取到缓存区的字节数 */
	if(!ReadProcessMemory(hWinmine, (LPCVOID)0x01005361, GameMap,  MAP_MAX_SIZE, 	 nullptr) ||
	   !ReadProcessMemory(hWinmine, (LPCVOID)0x01005334, MapSize,  8,			 	 nullptr)) {

		printf("未能成功从扫雷进程中读取地雷数据. (%lu)\n", GetLastError());

		system("pause");
		exit(2);
	}
}

void LeftClickBlock(int i, int j)
{
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

void do_help()
{
	DetectWinmineAndCaptureCursor();

	LeftClickBlock(0, 0);
	for (int i = 0; i < MapSize[1]; i++)
	{
		for (int j = 0; j < MapSize[0]; j++)
		{
			if (0x8F != GameMap[i][j])	// 数值 0x8F 代表雷；这里判断是否有雷
			{
				LeftClickBlock(i, j);	// 没雷，则模拟鼠标左键点开
			}

			Sleep(speed);				// 毫秒
		}
	}

	CloseHandle(hWinmine);
	CloseHandle(hWnd);
}

void SetSpeed() {
	if(! count_reset++)		// 记录重设扫雷速度等级的次数
		printf("请设定扫雷速度等级：\n  [1]快(默认速度等级)\n  [2]中\n  [3]慢\n\n---> ");
	else					// 不是初次设置
		printf("请重新选定扫雷速度等级：\n  [1]快(默认速度等级)\n  [2]中\n  [3]慢\n\n---> ");
	scanf("%d", &speed);

	switch(speed){
		case 1:
			speed = 0;
			printf("\n===>扫雷速度等级为 [快]");
			break;
		case 2:
			speed = 10;
			printf("\n===>扫雷速度等级为 [中]");
			break;
		case 3:
			speed = 20;
			printf("\n===>扫雷速度等级为 [慢]");
			break;
		default:
			speed = 10;
			printf("\n===>采用默认的扫雷速度等级：[中]");
	}

	printf("\n\n***--------------操作说明如下--------------***\n（请将鼠标移出扫雷界面区域，并避免手触碰鼠标!）\
			\n\n按下[Y]键：开始自动扫雷\n按下[N]键：退出自动扫雷！\n按下[R]键：重新设置速度等级！\n\n");
}

void StartHelper(){
	SetSpeed();				// 设定自动扫雷速度；设置慢一点，方便观察分析

	while (1)
	{
		if(GetAsyncKeyState('Y')){					 	// 执行扫雷
			LeftClickBlock(-2, ceil(MapSize[0] /2));	// 模拟鼠标左键点击中间的 emoji 重置扫雷按钮图标
			Sleep(675);  	// 毫秒

			do_help();
		} else if (GetAsyncKeyState('N')) { 			// 退出扫雷
			break;
		} else if (GetAsyncKeyState('R')) {				// 重新设定扫雷速度
			system("cls");  // 清屏

			SetSpeed();
		}
	}

	system("pause");
	exit(0);
}
