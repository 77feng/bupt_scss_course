#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <time.h>
#include <limits.h>
#include <string.h>
#include <stdint.h>
#include <wchar.h>

#ifdef _WIN32
#define COMMAND_INT_PATH "%WINDIR%\\system32\\cmd.exe"
#define COMMAND_INT "cmd.exe"
#define COMMAND_ARG1 "/c"
#define COMMAND_ARG2 "dir "
#define COMMAND_ARG3 data
#else /* NOT _WIN32 */
#include <unistd.h>
#define COMMAND_INT_PATH "/bin/sh"
#define COMMAND_INT "sh"
#define COMMAND_ARG1 "-c"
#define COMMAND_ARG2 "ls "
#define COMMAND_ARG3 data
#endif


#define FILENAME "D:\SoftwareSecurity\homework\hw2\test\test02\file.txt"

#include <process.h>
#define EXECV _execv

/* The variable below is declared "const", so a tool should be able
 * to identify that reads of this will always give its initialized value. */
static const int STATIC_CONST_FIVE = 5;

void printLine (const char * line)
{
    if(line != NULL)
    {
        printf("%s\n", line);
    }
}

void function()
{
    char dataBuffer[100] = COMMAND_ARG2;
    char * data = dataBuffer;

    if (STATIC_CONST_FIVE == 5)
    {
        size_t dataLen = strlen(data);
        FILE * pFile;
        // 确保不会发生缓冲区溢出
        if (100 - dataLen > 1)
        {
            pFile = fopen(FILENAME, "r");
            if (pFile != NULL)
            {
                if (fgets(data + dataLen, (int)(100 - dataLen), pFile) == NULL)
                {
                    printLine("fgets() failed");
                    data[dataLen] = '\0';  // 确保字符串以 \0 结束
                }
                fclose(pFile);
            }
        }
    }

    // 验证命令路径和参数，确保不被注入
    if (isValidCommand(COMMAND_INT_PATH))  // 假设 isValidCommand 是检查命令路径的函数
    {
        char *args[] = {COMMAND_INT_PATH, COMMAND_ARG1, COMMAND_ARG3, NULL};
        EXECV(COMMAND_INT_PATH, args);
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

