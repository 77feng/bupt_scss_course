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


void function() {
    char * password = (char *)malloc(100 * sizeof(char));
    if (password == NULL) {
        exit(-1);
    }
    size_t passwordLen = 0;
    HANDLE hUser = NULL;
    char * username = "User";
    char * domain = "Domain";
    password[0] = '\0';

    if (fgets(password, 100, stdin) == NULL) {
        printLine("fgets() failed");
        free(password);
        return;
    }

    passwordLen = strlen(password);
    if (passwordLen > 0 && password[passwordLen - 1] == '\n') {
        password[passwordLen - 1] = '\0';
    }

    if (LogonUserA(username, domain, password, LOGON32_LOGON_NETWORK, LOGON32_PROVIDER_DEFAULT, &hUser)) {
        printLine("User logged in successfully.");
        CloseHandle(hUser);
    } else {
        printLine("Unable to login.");
    }

    free(password);
}



int main(int argc, char * argv[])
{
    /* seed randomness */
    srand( (unsigned)time(NULL) );

    printLine("xunfei...");
    function();

    return 0;
}

