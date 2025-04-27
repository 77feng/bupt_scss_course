#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <time.h>
#include <limits.h>
#include <string.h>
#include <stdint.h>

#ifdef _WIN32
#define FULL_COMMAND L"dir "
#else
#include <unistd.h>
#define FULL_COMMAND L"ls "
#endif

#define ENV_VARIABLE L"ADD"

#ifdef _WIN32
#define GETENV _wgetenv
#else
#define GETENV getenv
#endif

#ifdef _WIN32
#define SYSTEM _wsystem
#else /* NOT _WIN32 */
#define SYSTEM system
#endif


void printLine (const char * line)
{
    if(line != NULL)
    {
        printf("%s\n", line);
    }
}

void function()
{
    wchar_t * data;
    wchar_t data_buf[100] = FULL_COMMAND;
    data = data_buf;
    if (5 == 5)
    {
        {
            size_t dataLen = wcslen(data);
            wchar_t * environment = GETENV(ENV_VARIABLE);
            if (environment!= NULL)
            {
                size_t envLen = wcslen(environment);
                size_t remainingSpace = 100 - dataLen - 1;
                if (envLen < remainingSpace)
                {
                    wcsncat(data + dataLen, environment, envLen);
                }
                else
                {
                    wcsncat(data + dataLen, environment, remainingSpace);
                }
            }
        }
    }
    if (SYSTEM(data)!= 0)
    {
        printLine("command execution failed!");
        exit(1);
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


