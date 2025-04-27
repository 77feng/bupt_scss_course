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
    int globalFive = 5; // 假设 globalFive 被定义为 5
    if (globalFive == 5)
    {
        char string1[] = SOURCE_STRING;
        char *slashInString1;
        size_t indexOfSlashInString1;
        slashInString1 = strchr(string1, '/');
        if (slashInString1 == NULL)
        {
            fprintf(stderr, "Error: '/' not found in the source string.\n");
            exit(EXIT_FAILURE); // 使用标准退出码
        }
        indexOfSlashInString1 = (size_t)(slashInString1 - string1); // 修正为 string1
        printf("Index of '/': %zu\n", indexOfSlashInString1); // 使用 printf 代替 printUnsignedLine
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

