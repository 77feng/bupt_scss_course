#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <time.h>
#include <limits.h>
#include <string.h>
#include <stdint.h>
#include <wchar.h>
#include <windows.h>
#pragma comment( lib, "user32" )

int globalReturnsTrue()
{
    return 1;
}

int globalReturnsFalse()
{
    return 0;
}

void printLine (const char * line)
{
    if(line != NULL)
    {
        printf("%s\n", line);
    }
}

void function()
{
    if(globalReturnsTrue())
    {
        {
            HDESK hDesk;
            char * desktopName = "DesktopExample";

            // 使用最小权限创建桌面
            hDesk = CreateDesktopA(
                        desktopName,
                        NULL,
                        NULL,
                        0,
                        DESKTOP_CREATEWINDOW | DESKTOP_SWITCHDESKTOP, // 最小必要权限
                        NULL);

            if (hDesk == NULL)
            {
                printLine("Desktop could not be created");
            }
            else
            {
                printLine("Desktop created successfully");

                // 确保句柄被正确关闭，避免泄漏
                if (!CloseDesktop(hDesk))
                {
                    printLine("Failed to close the desktop handle");
                }
            }
        }
    }
}


int main(int argc, char * argv[])
{
    /* seed randomness */
    srand( (unsigned)time(NULL) );

    printLine("xunfei...");
    function();

    return 0;

}

