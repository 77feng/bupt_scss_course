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
    char data = ' ';  // 初始化为一个有效字符
    if (GLOBAL_CONST_TRUE)
    {
        if (fscanf(stdin, "%c", &data) != 1)  // 确保 fscanf 成功
        {
            printLine("Input error or invalid format");
            return;  // 如果输入错误，则返回
        }
    }

    if (GLOBAL_CONST_TRUE)
    {
        // 如果 data 是一个有效字符，且不溢出，进行加法操作
        if (data >= 0 && data < 255)  // 确保数据有效
        {
            char result = data + 1;
            printHexCharLine(result);
        }
        else
        {
            printLine("Invalid character value");
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
