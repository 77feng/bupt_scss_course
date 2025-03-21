#include<stdio.h>
#include<stdlib.h>
#include<string.h>

/*
    本例的flag为：FLAG{Welc0me_t0_the_world_of_Reverse}
*/
char check[] = "GMBH|Xfmd1nf`u1`uif`xpsme`pg`Sfwfstf~";

int readInput(char *buf, int len) {
	char ch;
	int i;

	for (i = 0; i<len; i++) {  // 读取限定最大长度的字符串
		ch = getchar();

		if (ch == '\n')        // 中间遇回车，即终止读取
			break;

		buf[i] = ch;
	}

	buf[i] = 0;                // 添加字符串结束标识，方便按字符串形式整体输出字符型数组
	return i;
}

int checkflag(char *buf) {
	int i, j=strlen(check);

	if (strlen(buf) != j)      // 检查长度是否符合要求
		return 0;

	for (i = 0; i<j; i++) {    // 检查输入字符型数组是否匹配
		if (buf[i] + 1 != check[i])
			return 0;
	}

	if (i == j)
		return 1;
}

int main() {
    char input[50];

	printf("Please give me your input:  ");
	readInput(input, 50);

	if (checkflag(input)) {
		printf("\nGood job! You have successfully captured the FLAG!!!\n\n");
	}
	else {
		printf("\nSorry! You might need to try it again!!!\n\n");
	}

	system("pause");
	return 0;
}
