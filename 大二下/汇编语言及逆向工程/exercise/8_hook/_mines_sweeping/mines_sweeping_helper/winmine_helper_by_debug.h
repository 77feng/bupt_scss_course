#ifndef WINMINE_HELPER_BY_DEBUG_H
#define WINMINE_HELPER_BY_DEBUG_H
#define UNICODE

#define _WIN32_WINNT 0x0500

#define MAP_MAX_SIZE 32 * 32

#include <windows.h>

void DetectWinmineAndCaptureCursor();
void LeftClickBlock(int i, int j);
void SetSpeed();
void do_help();
void StartHelper();

#endif // WINMINE_HELPER_BY_DEBUG_H
