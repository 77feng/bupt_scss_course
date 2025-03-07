#include "md5.h"

int main(){

    char resultBuf[33] = {0};
	char flag[MAX_SIZE] = {0};  // "BUPTx", 只需要前面四个大写英文字母正确即可
	char tbuf[5] = {0};
	int i;

	printf("Please input your flag:\n");
    scanf("%s",flag);

	unsigned int len = strlen(flag);

	if(len > 4){
		for(i=0; i<strlen(flag); i++){ // 判断输入的字符串是否由大小写的英文字母组成
			if ((flag[i] < 'a' || flag[i] > 'z') && (flag[i] < 'A' || flag[i] > 'Z')){
				puts("\nInvalid ASCII character detected!\n");

				system("pause");
				return 0;
			}
		}

		strncpy(tbuf,flag,4);
//		printf("tbuf:%s\n",tbuf);

		md5_calc(resultBuf,tbuf,4);
//		printf("resultBuf:%s\n",resultBuf);

		if(!strncmp(resultBuf, "23d4a52c56357cb705137656744dc055", 32))
			printf("\nwell done!\n\n");
		else
			printf("\nSorry to say \"wrong\"!\n\n");
	}

	system("pause");
	return 0;
}
