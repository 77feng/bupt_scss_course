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

#define FULL_COMMAND L"initial command "
#define ENV_VARIABLE "MY_ENV_VAR"
#define MAX_DATA_LEN 100


void printLine (const char * line)
{
    if(line != NULL)
    {
        printf("%s\n", line);
    }
}

void function() {
    wchar_t data[MAX_DATA_LEN] = FULL_COMMAND;
    size_t dataLen = wcslen(data);
    wchar_t * environment = getenv(ENV_VARIABLE); // ¼ÙÉè getenv ·µ»ØµÄÊÇ¿í×Ö·û×Ö·û´®

    if (environment != NULL) {
        size_t envLen = wcslen(environment);
        if (dataLen + envLen < MAX_DATA_LEN - 1) {
            wcsncat(data, environment, MAX_DATA_LEN - dataLen - 1);
        } else {
            printLine(L"Environment variable is too long!");
            exit(1);
        }
    }

    if (system(data) != 0) { // ¼ÙÉè system ½ÓÊÜ¿í×Ö·û×Ö·û´®
        printLine(L"command execution failed!");
        exit(1);
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


