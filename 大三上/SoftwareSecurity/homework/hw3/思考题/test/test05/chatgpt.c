#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <time.h>
#include <limits.h>
#include <string.h>
#include <stdint.h>
#include <wchar.h>
#include <windows.h>
#pragma comment(lib, "advapi32.lib")


void printLine (const char * line)
{
    if(line != NULL)
    {
        printf("%s\n", line);
    }
}

void function()
{
    int j;
    for(j = 0; j < 1; j++)
    {
        {
            char * password = (char *)malloc(100*sizeof(char));
            if (password == NULL) {exit(-1);}
            size_t passwordLen = 0;
            HANDLE hUser;
            char * username = "User";
            char * domain = "Domain";
            password[0] = '\0';

            // 限制输入长度，防止溢出
            if (fgets(password, 100, stdin) == NULL)
            {
                printLine("fgets() failed");
                password[0] = '\0';
            }

            passwordLen = strlen(password);
            if (passwordLen > 0)
            {
                password[passwordLen-1] = '\0';  // 去除末尾换行符
            }

            // 尝试登录
            if (LogonUserA(
                        username,
                        domain,
                        password,
                        LOGON32_LOGON_NETWORK,
                        LOGON32_PROVIDER_DEFAULT,
                        &hUser) != 0)
            {
                printLine("User logged in successfully.");
                CloseHandle(hUser);
            }
            else
            {
                printLine("Unable to login.");
            }

            // 在释放前清除密码缓冲区
            memset(password, 0, passwordLen);
            free(password);
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

