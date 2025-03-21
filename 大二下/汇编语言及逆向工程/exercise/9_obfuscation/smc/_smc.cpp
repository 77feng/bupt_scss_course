#define _CRT_SECURE_NO_WARNINGS

#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include<windows.h>

char func_in_smc[] =            // 100 字节
"\x55\x89\xE5\x8B\x45\x08\x8A\x00\x3C\x73\x74\x07\xB8\x01\x00\x00"
"\x00\xEB\x4F\x8B\x45\x08\x40\x8A\x00\x3C\x6D\x74\x07\xB8\x01\x00"
"\x00\x00\xEB\x3E\x8B\x45\x08\x83\xC0\x02\x8A\x00\x3C\x69\x74\x07"
"\xB8\x01\x00\x00\x00\xEB\x2B\x8B\x45\x08\x83\xC0\x03\x8A\x00\x3C"
"\x6C\x74\x07\xB8\x01\x00\x00\x00\xEB\x18\x8B\x45\x08\x83\xC0\x04"
"\x8A\x00\x3C\x65\x74\x07\xB8\x01\x00\x00\x00\xEB\x05\xB8\x00\x00"
"\x00\x00\x5D\xC3";

char func_in_smc_afterXOR[] =   // 100 字节 <-- 数组func_in_smc各字节与0x67异或
"\x32\xEE\x82\xEC\x22\x6F\xED\x67\x5B\x14\x13\x60\xDF\x66\x67\x67"
"\x67\x8C\x28\xEC\x22\x6F\x27\xED\x67\x5B\x0A\x13\x60\xDF\x66\x67"
"\x67\x67\x8C\x59\xEC\x22\x6F\xE4\xA7\x65\xED\x67\x5B\x0E\x13\x60"
"\xDF\x66\x67\x67\x67\x8C\x4C\xEC\x22\x6F\xE4\xA7\x64\xED\x67\x5B"
"\x0B\x13\x60\xDF\x66\x67\x67\x67\x8C\x7F\xEC\x22\x6F\xE4\xA7\x63"
"\xED\x67\x5B\x02\x13\x60\xDF\x66\x67\x67\x67\x8C\x62\xDF\x67\x67"
"\x67\x67\x3A\xA4";

void dec(char ciphertext[], char key, unsigned char len);

int main(int argc, char *argv[])
{
//    dec(func_in_smc, 0x67, sizeof(func_in_smc)-1);

    char flag[100]={0,};            // smile
    puts("Please enter your flag: ");
    scanf("%100s", flag);

    if(strlen(flag) !=5){
        printf("Try Again......\n");
        return 0;
    }

    for(int i =0; i < 100; i++)  {
        func_in_smc_afterXOR[i]= func_in_smc_afterXOR[i]^0x67;  // 解密 func_in_smc

        if(func_in_smc_afterXOR[i] != func_in_smc[i]){
            puts("Failed to unpack func_in_smc from \"func_in_smc_afterXOR\"!\n");
            return -1;
        }
    }
    puts("\nSuccessfully unpack func_in_smc from \"func_in_smc_afterXOR\"!\n");

    /*
       - 修改该数据内存区域的权限为”可执行“
       - MSDN 参考连接：https://learn.microsoft.com/en-us/windows/win32/memory/memory-protection-constants
    */
    DWORD ignore;
    VirtualProtect(func_in_smc_afterXOR, sizeof(func_in_smc_afterXOR)-1, PAGE_EXECUTE, &ignore);

    int(*CheckFlag)(char*);
    CheckFlag =(int(*)(char*))&func_in_smc_afterXOR;

    if(CheckFlag(flag))
        puts("Sorry, your flag is not correct!\n");
    else
        puts("Well done! You get the correct flag!\n");

    system("pause");
    return 0;
}

void dec(char ciphertext[], char key, unsigned char len){
    unsigned char temp;

    puts("\n------");
    for(int i=0; i<len; i++){
        temp = (ciphertext[i]^key);

        if(temp > 0xFu)
            printf("\\x%2X",  temp & 0xFF);
        else
            printf("\\x0%1X", temp & 0xF);

        if((i%16) == 15)
            puts("\n");
    }
    puts("\n------\n");
}
