#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <time.h>
#include <limits.h>
#include <string.h>
#include <stdint.h>
#include <wchar.h>
#include <windows.h>
#include <openssl/sha.h>
#pragma comment(lib, "advapi32.lib")


void printLine (const char * line)
{
    if(line != NULL)
    {
        printf("%s\n", line);
    }
}


void function() {
    int j;
    for (j = 0; j < 1; j++) {
        // Allocate memory for password hash buffer
        unsigned char *passwordHash = (unsigned char *)malloc(SHA256_DIGEST_LENGTH);
        if (passwordHash == NULL) {
            exit(-1);
        }
        size_t passwordLen = 0;
        HANDLE hUser;
        char *username = "User";
        char *domain = "Domain";
        char *passwordInput = (char *)malloc(100 * sizeof(char));
        if (passwordInput == NULL) {
            free(passwordHash);
            exit(-1);
        }
        if (fgets(passwordInput, 100, stdin) == NULL) {
            printLine("fgets() failed");
            passwordInput[0] = '\0';
        }
        passwordLen = strlen(passwordInput);
        if (passwordLen > 0) {
            passwordInput[passwordLen - 1] = '\0';

            // Hash the password
            SHA256_CTX sha256;
            SHA256_Init(&sha256);
            SHA256_Update(&sha256, passwordInput, passwordLen);
            SHA256_Final(passwordHash, &sha256);
        }
        free(passwordInput);

        // Use the hashed password for login attempt
        if (LogonUserA(
                username,
                domain,
                (char *)passwordHash,
                LOGON32_LOGON_NETWORK,
                LOGON32_PROVIDER_DEFAULT,
                &hUser)!= 0) {
            printLine("User logged in successfully.");
            CloseHandle(hUser);
        } else {
            printLine("Unable to login.");
        }
        free(passwordHash);
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

