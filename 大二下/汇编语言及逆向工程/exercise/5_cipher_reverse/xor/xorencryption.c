#include<stdio.h>
#include<string.h>

#define KEY_LEN 10

unsigned char token[]="abcdefg123";
unsigned char answer[]={0x28,0x3d,0x24,0x54,0xa,0x12,0x38,0x7a,0x57,0x4a};

int main()
{
	//char key_temp[]="I_G0ot_Key";
	char key_temp[KEY_LEN+1];
	int i;

	puts("xor encryption program!");
	puts("please input a string:");
	scanf("%s",key_temp);
	if(strlen(key_temp)!=KEY_LEN){
		puts("wrong!");
		getchar();
	    system("pause");
		return -1;
	}
	for(i=0;i<KEY_LEN;++i){
            //xor encryption
		key_temp[i]=(token[i]^key_temp[i]);
	}
	for(i=0;i<KEY_LEN;++i){
		if(key_temp[i]!=answer[i])
		{
			puts("wrong answer!!!!");
			break;
		}
	}
	if(i==KEY_LEN)
		puts("good job!!!");
	system("pause");
	return 0;
}
