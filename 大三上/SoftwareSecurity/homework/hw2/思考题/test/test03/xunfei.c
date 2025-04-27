#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <time.h>
#include <limits.h>
#include <string.h>
#include <stdint.h>


void printLine (const char * line)
{
    if(line != NULL)
    {
        printf("%s\n", line);
    }
}

void printHexCharLine (char charHex)
{
    printf("%02x\n", charHex);
}


const int GLOBAL_CONST_TRUE = 1; /* true */
const int GLOBAL_CONST_FALSE = 0; /* false */

void function()
{
    char data;
    data = ' ';

    if (GLOBAL_CONST_TRUE)
    {
        // 使用 fgets 代替 fscanf 以避免缓冲区溢出
        if (fgets(&data, sizeof(data), stdin) != NULL)
        {
            // 仅处理第一个字符
            data = data[0];
        }
    }

    if (GLOBAL_CONST_TRUE)
    {
        char result = data + 1;
        printHexCharLine(result);
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
