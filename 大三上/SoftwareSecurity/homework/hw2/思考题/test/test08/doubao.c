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
    if (globalReturnsTrue())
    {
        FILE *pFile;
        HCRYPTPROV hCryptProv;
        HCRYPTKEY hKey;
        HCRYPTHASH hHash;
        char password[100];
        size_t passwordLen;
        // 不再使用固定长度的缓冲区来存储待解密数据
        char *toBeDecrypted = NULL;
        DWORD toBeDecryptedLen = 0;

        printLine("Enter the password: ");
        if (fgets(password, 100, stdin) == NULL)
        {
            printLine("fgets() failed");
            password[0] = '\0';
        }
        passwordLen = strlen(password);
        if (passwordLen > 0)
        {
            password[passwordLen - 1] = '\0';

            // 使用密码安全的哈希算法库来处理密码
            // 这里只是示例，实际应用中需要正确集成和使用密码哈希库
            // 假设经过密码哈希库处理后的密码哈希存储在 passwordHash 中
            // char passwordHash[HASH_LENGTH];
            // hashPassword(password, passwordHash);
        }

        pFile = fopen("encrypted.txt", "rb");
        if (pFile == NULL)
        {
            exit(1);
        }

        // 获取文件大小
        fseek(pFile, 0, SEEK_END);
        long fileSize = ftell(pFile);
        fseek(pFile, 0, SEEK_SET);

        // 根据文件大小分配内存
        toBeDecrypted = (char *)malloc(fileSize + 1);
        if (toBeDecrypted == NULL)
        {
            fclose(pFile);
            exit(1);
        }

        // 读取文件数据
        if (fread(toBeDecrypted, sizeof(char), fileSize, pFile)!= fileSize)
        {
            free(toBeDecrypted);
            fclose(pFile);
            exit(1);
        }
        toBeDecrypted[fileSize] = '\0';
        toBeDecryptedLen = fileSize;

        if (!CryptAcquireContext(&hCryptProv, NULL, MS_ENH_RSA_AES_PROV, PROV_RSA_AES, 0))
        {
            if (!CryptAcquireContext(&hCryptProv, NULL, MS_ENH_RSA_AES_PROV, PROV_RSA_AES, CRYPT_NEWKEYSET))
            {
                printLine("Error in acquiring cryptographic context");
                free(toBeDecrypted);
                exit(1);
            }
        }

        if (!CryptCreateHash(hCryptProv, CALG_SHA_256, 0, 0, &hHash))
        {
            printLine("Error in creating hash");
            free(toBeDecrypted);
            exit(1);
        }

        if (!CryptHashData(hHash, (BYTE *)password, passwordLen, 0))
        {
            printLine("Error in hashing password");
            free(toBeDecrypted);
            exit(1);
        }

        if (!CryptDeriveKey(hCryptProv, CALG_DES, hHash, 0, &hKey))
        {
            printLine("Error in CryptDeriveKey");
            free(toBeDecrypted);
            exit(1);
        }

        if (!CryptDecrypt(hKey, 0, 1, 0, (BYTE *)toBeDecrypted, &toBeDecryptedLen))
        {
            printLine("Error in decryption");
            free(toBeDecrypted);
            exit(1);
        }

        printLine(toBeDecrypted);

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

        // 释放分配的内存
        free(toBeDecrypted);
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

