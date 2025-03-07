#ifndef __MAIN_H__
#define __MAIN_H__

#include <windows.h>

HWND hWnd;
DWORD pid;
HANDLE hWinmine;

#ifdef __cplusplus
extern "C"
{
#endif

void LeftClickBlock(HWND hWnd, POINT pCursor, int i, int j);
void MinesSweepingHelper();

#ifdef __cplusplus
}
#endif

#endif // __MAIN_H__
