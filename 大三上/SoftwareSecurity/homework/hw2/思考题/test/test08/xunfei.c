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

void function() {
    if (globalReturnsTrue()) {
        FILE *pFile = NULL;
        HCRYPTPROV hCryptProv = 0;
        HCRYPTKEY hKey = 0;
        HCRYPTHASH hHash = 0;
        char password[100];
        size_t passwordLen;
        char toBeDecrypted[100];
        DWORD toBeDecryptedLen = sizeof(toBeDecrypted) - 1;

        printLine("Enter the password: ");
        if (fgets(password, sizeof(password), stdin) == NULL) {
            printLine("fgets() failed");
            password[0] = '\0';
        } else {
            passwordLen = strlen(password);
            if (passwordLen > 0 && password[passwordLen - 1] == '\n') {
                password[passwordLen - 1] = '\0';
            }
        }

        pFile = fopen("encrypted.txt", "rb");
        if (pFile == NULL) {
            printLine("Failed to open file");
            return;
        }

        if (fread(toBeDecrypted, sizeof(char), sizeof(toBeDecrypted) - 1, pFile) != sizeof(toBeDecrypted) - 1) {
            printLine("Failed to read file");
            fclose(pFile);
            return;
        }
        toBeDecrypted[99] = '\0';
        fclose(pFile);
        pFile = NULL;

        if (!CryptAcquireContext(&hCryptProv, NULL, MS_ENH_RSA_AES_PROV, PROV_RSA_AES, 0)) {
            if (!CryptAcquireContext(&hCryptProv, NULL, MS_ENH_RSA_AES_PROV, PROV_RSA_AES, CRYPT_NEWKEYSET)) {
                printLine("Error in acquiring cryptographic context");
                return;
            }
        }

        if (!CryptCreateHash(hCryptProv, CALG_SHA_256, 0, 0, &hHash)) {
            printLine("Error in creating hash");
            CryptReleaseContext(hCryptProv, 0);
            return;
        }

        if (!CryptHashData(hHash, (BYTE *)password, strlen(password), 0)) {
            printLine("Error in hashing password");
            CryptDestroyHash(hHash);
            CryptReleaseContext(hCryptProv, 0);
            return;
        }

        if (!CryptDeriveKey(hCryptProv, CALG_DES, hHash, 0, &hKey)) {
            printLine("Error in CryptDeriveKey");
            CryptDestroyHash(hHash);
            CryptReleaseContext(hCryptProv, 0);
            return;
        }

        if (!CryptDecrypt(hKey, 0, 1, 0, (BYTE *)toBeDecrypted, &toBeDecryptedLen)) {
            printLine("Error in decryption");
            CryptDestroyKey(hKey);
            CryptDestroyHash(hHash);
            CryptReleaseContext(hCryptProv, 0);
            return;
        }
        toBeDecrypted[toBeDecryptedLen] = '\0';
        printLine(toBeDecrypted);

        if (hKey) {
            CryptDestroyKey(hKey);
        }
        if (hHash) {
            CryptDestroyHash(hHash);
        }
        if (hCryptProv) {
            CryptReleaseContext(hCryptProv, 0);
        }
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

