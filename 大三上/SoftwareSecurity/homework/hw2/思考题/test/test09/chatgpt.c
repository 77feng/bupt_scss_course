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

#define SOURCE_STRING "abc/opqrstu"

int globalFive = 5;

void printLine (const char * line)
{
    if(line != NULL)
    {
        printf("%s\n", line);
    }
}

void printUnsignedLine(unsigned unsignedNumber)
{
    printf("%u\n", unsignedNumber);
}

void function()
{
    if(globalFive == 5)
    {
        {
            char string1[] = SOURCE_STRING;
            char string2[] = SOURCE_STRING;
            char *slashInString1;
            size_t indexOfSlashInString1;
            slashInString1 = strchr(string1, '/');
            if (slashInString1 == NULL)
            {
                exit(1);
            }
            indexOfSlashInString1 = (size_t)(slashInString1 - string1);  // ÐÞ¸´ÐÐ
            printUnsignedLine(indexOfSlashInString1);
        }
    }
}



int main(int argc, char * argv[])
{
    /* seed randomness */
    srand( (unsigned)time(NULL) );

    printLine("chatgpt...");
    function();

    return 0;
}

