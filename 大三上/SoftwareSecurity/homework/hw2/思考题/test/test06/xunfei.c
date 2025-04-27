#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <time.h>
#include <limits.h>
#include <string.h>
#include <stdint.h>
#include <wchar.h>
#include <windows.h>

const int GLOBAL_CONST_FIVE = 5;


void printLine (const char * line)
{
    if(line != NULL)
    {
        printf("%s\n", line);
    }
}



void function()
{
    if (GLOBAL_CONST_FIVE == 5)
    {
        char dataBuffer[100] = "";
        char *data = dataBuffer;
        printLine("Please enter a string: ");
        if (fgets(data, sizeof(dataBuffer), stdin) == NULL)
        {
            printLine("fgets failed!");
            exit(1);
        }

        // ÒÆ³ý»»ÐÐ·û
        size_t len = strlen(data);
        if (len > 0 && data[len - 1] == '\n')
        {
            data[len - 1] = '\0';
        }

        printLine(data);
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
