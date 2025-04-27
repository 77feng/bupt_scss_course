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
        if (fgets(data, 100, stdin) == NULL)
        {
            printLine("fgets failed!");
            exit(1);
        }

        // 检查输入字符串长度，如果包含换行符，去除换行符
        size_t len = strlen(data);
        if (len > 0 && data[len - 1] == '\n')
        {
            data[len - 1] = '\0';
        }
        else
        {
            // 处理输入过长的情况，可以清空输入缓冲区
            int c;
            while ((c = getchar())!= '\n' && c!= EOF)
                ;
        }

        printLine(data);
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
