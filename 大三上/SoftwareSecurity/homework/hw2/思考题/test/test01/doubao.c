#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <time.h>
#include <limits.h>
#include <string.h>
#include <stdint.h>


#define SNPRINTF snprintf

void printLine (const char * line)
{
    if(line != NULL)
    {
        printf("%s\n", line);
    }
}

void printWLine (const wchar_t * line)
{
    if(line != NULL)
    {
        printf("%s\n", line);
    }
}



static int staticTrue = 1; /* true */
static int staticFalse = 0; /* false */

void function()
{
    wchar_t * data;
    wchar_t dataBadBuffer[50];
    wchar_t dataGoodBuffer[100];
    if(staticTrue)
    {
        data = dataGoodBuffer; // 修改为指向 dataGoodBuffer
        data[0] = '\0';
    }
    {
        wchar_t source[100];
        memset(source, 'C', 100-1);
        source[100-1] = '\0';
        SNPRINTF(data, 100, "%s", source);
        printWLine(data);
    }
}


int main(int argc, char * argv[])
{
    /* seed randomness */
    srand( (unsigned)time(NULL) );

    printLine("doubao...");
    function();

    return 0;
}

