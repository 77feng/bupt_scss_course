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
            hDesk = CreateDesktopA(
                        desktopName,
                        NULL,
                        NULL,
                        0,
                        GENERIC_READ,
                        NULL);
            if (hDesk == NULL)
            {
                printLine("Desktop could not be created");
            }
            else
            {
                printLine("Desktop created successfully");
                CloseDesktop(hDesk);
            }
        }
    }
}




int main(int argc, char * argv[])
{
    /* seed randomness */
    srand( (unsigned)time(NULL) );

    printLine("zhushou...");
    function();

    return 0;

}

