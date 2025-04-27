#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <time.h>
#include <limits.h>
#include <string.h>
#include <stdint.h>
#include <wchar.h>
#include <windows.h>
#include <wincrypt.h>

#ifdef _WIN32
#define UNLINK _unlink
#else
#include <unistd.h>
#define UNLINK unlink
#endif

#define COUNT_CHECK 20000

void printLine (const char * line)
{
    if(line != NULL)
    {
        printf("%s\n", line);
    }
}

void function()
{
    while(1)
    {
        {
            int count = 0;
            do
            {
                if (count == COUNT_CHECK)
                {
                    printLine("GOOD!");
                }
                count++;
            }
            while(1 == 1);
        }
        break;
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


