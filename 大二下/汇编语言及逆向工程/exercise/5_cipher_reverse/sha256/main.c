#include <stdio.h>
#include "sha256.h"

int main(int argc,char*argv[])
{
    unsigned char flag_temp[32];
    unsigned char flag[MAX_SIZE];
    unsigned char flag_sha256[64];  // 必须带unsigned,sha256消息摘要输出为256位，
                                     // 可表示为64个16进制字符

    unsigned int flag_len, flag_temp_len,i;

    memset(flag_sha256,0,32);


    printf("please input your flag:\n");
    scanf("%s", &flag);
    flag_len = strlen(flag);

    if (flag_len > 4){
        for (int i = 0; i < flag_len; ++i)
        {
            if ((flag[i] < 'a' || flag[i] > 'z') && (flag[i] < 'A' || flag[i] > 'Z')){
                puts("\nInvalid ASCII character detected!\n");

                system("pause");
                return 0;
            }
        }

        strncpy(flag_temp, flag, 5);
        sha256(flag_sha256, flag_temp, 4);

		if(!strncmp(flag_sha256, "45c6c64ffd31a750bcb2e150519f1963e5424bafd380637cff33075c25d35334", 64))
			printf("\nwell done!\n\n");
		else
			printf("\nSorry to say \"wrong\"!\n\n");
    }

    system("pause");
    return 0;
}
