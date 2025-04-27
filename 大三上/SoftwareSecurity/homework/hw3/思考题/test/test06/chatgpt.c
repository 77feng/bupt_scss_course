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
    if(GLOBAL_CONST_FIVE==5)
    {
        {
            char dataBuffer[100] = "";
            char * data = dataBuffer;
            printLine("Please enter a string: ");

            // 检查 fgets 返回值是否为 NULL
            if (fgets(data, 100, stdin) == NULL)
            {
                printLine("fgets failed!");
                exit(1);
            }

            // 移除 fgets 读取的字符串末尾换行符
            size_t dataLen = strlen(data);
            if (dataLen > 0 && data[dataLen - 1] == '\n')
            {
                data[dataLen - 1] = '\0';
            }

            // 使用安全的输出方式，避免格式字符串漏洞
            printf("%s\n", data);
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
