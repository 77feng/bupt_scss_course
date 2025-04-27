#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <time.h>
#include <limits.h>
#include <string.h>
#include <stdint.h>
#include <wchar.h>
#include <windows.h>
#include <wincrypt.h>

/* Link with the Advapi32.lib file for Crypt* functions */
#pragma comment (lib, "Advapi32")

int globalReturnsTrue()
{
    return 1;
}

int globalReturnsFalse()
{
    return 0;
}

void printLine (const char * line)
{
    if(line != NULL)
    {
        printf("%s\n", line);
    }
}

void function()
{
    if(globalReturnsTrue())
    {
        FILE *pFile = NULL;
        HCRYPTPROV hCryptProv = 0;
        HCRYPTKEY hKey = 0;
        HCRYPTHASH hHash = 0;
        char password[100];
        size_t passwordLen;
        char toBeDecrypted[100] = {0};  // 初始化为零
        DWORD toBeDecryptedLen = sizeof(toBeDecrypted)-1;

        printLine("Enter the password: ");
        if (fgets(password, 100, stdin) == NULL)
        {
            printLine("fgets() failed");
            password[0] = '\0';
            return;
        }

        // 去除末尾换行符
        passwordLen = strlen(password);
        if (passwordLen > 0)
        {
            password[passwordLen-1] = '\0';
        }

        pFile = fopen("encrypted.txt", "rb");
        if (pFile == NULL)
        {
            printLine("File open failed.");
            memset(password, 0, sizeof(password));  // 清理密码
            return;
        }

        size_t bytesRead = fread(toBeDecrypted, sizeof(char), sizeof(toBeDecrypted)-1, pFile);
        if (bytesRead == 0)
        {
            printLine("File read failed.");
            fclose(pFile);
            memset(password, 0, sizeof(password));  // 清理密码
            return;
        }
        toBeDecrypted[bytesRead] = '\0';

        if(!CryptAcquireContext(&hCryptProv, NULL, MS_ENH_RSA_AES_PROV, PROV_RSA_AES, 0))
        {
            if(!CryptAcquireContext(&hCryptProv, NULL, MS_ENH_RSA_AES_PROV, PROV_RSA_AES, CRYPT_NEWKEYSET))
            {
                printLine("Error in acquiring cryptographic context");
                memset(password, 0, sizeof(password));  // 清理密码
                fclose(pFile);
                return;
            }
        }

        if(!CryptCreateHash(hCryptProv, CALG_SHA_256, 0, 0, &hHash))
        {
            printLine("Error in creating hash");
            memset(password, 0, sizeof(password));
            CryptReleaseContext(hCryptProv, 0);
            fclose(pFile);
            return;
        }

        if(!CryptHashData(hHash, (BYTE *) password, passwordLen, 0))
        {
            printLine("Error in hashing password");
            memset(password, 0, sizeof(password));
            CryptDestroyHash(hHash);
            CryptReleaseContext(hCryptProv, 0);
            fclose(pFile);
            return;
        }

        if(!CryptDeriveKey(hCryptProv, CALG_DES, hHash, 0, &hKey))
        {
            printLine("Error in CryptDeriveKey");
            memset(password, 0, sizeof(password));
            CryptDestroyHash(hHash);
            CryptReleaseContext(hCryptProv, 0);
            fclose(pFile);
            return;
        }

        if(!CryptDecrypt(hKey, 0, TRUE, 0, (BYTE *)toBeDecrypted, &toBeDecryptedLen))
        {
            printLine("Error in decryption");
            memset(password, 0, sizeof(password));
            memset(toBeDecrypted, 0, sizeof(toBeDecrypted));
            CryptDestroyKey(hKey);
            CryptDestroyHash(hHash);
            CryptReleaseContext(hCryptProv, 0);
            fclose(pFile);
            return;
        }
        toBeDecrypted[toBeDecryptedLen] = '\0';
        printLine(toBeDecrypted);

        // 清理敏感数据并释放资源
        memset(password, 0, sizeof(password));
        memset(toBeDecrypted, 0, sizeof(toBeDecrypted));
        if (hKey)
        {
            CryptDestroyKey(hKey);
        }
        if (hHash)
        {
            CryptDestroyHash(hHash);
        }
        if (hCryptProv)
        {
            CryptReleaseContext(hCryptProv, 0);
        }
        if (pFile)
        {
            fclose(pFile);
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

