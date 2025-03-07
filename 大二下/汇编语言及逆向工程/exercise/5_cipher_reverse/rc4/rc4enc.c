#include<stdio.h>
#include<windows.h>
#include<string.h>
#define MAX_KEY 256
#define MAX_STR 100

int pos_i=0;
int pos_j=0;
int sbox[256];
unsigned char key[MAX_KEY]="RC4key";
unsigned char answer[MAX_STR] = {0x1b,0xca,0xae,0xef,0x1e,0x95,0x4b,0xc2,0xd5,0xe3,0x33,0x76,0x4f,0xf9,0x4f,0xd2,0xfc,0x60,0x96};

void init_sbox();
unsigned char generate_key();
void encryption(unsigned char *plaintext,unsigned char *result);
//Is_Th13_Simple_Rc4?

int main()
{
    char str[MAX_STR];
    char result[MAX_STR]={0};
    int i;
	int len;

	puts("please input a correct string to encrypt:");
    scanf("%s",str);

	len = strlen(str);
    encryption((unsigned char *)str,(unsigned char *)result);


    for(i=0;i<len;++i)
	{
		if((unsigned char)result[i]!=answer[i]){
			puts("Wrong!!!");
			system("pause");
			return -1;}
	}
	puts("Great!!!");
	system("pause");
    return 0;
}

void init_sbox(){
    int i,j;
    int key_len = strlen((const char *)key);
    unsigned char temp;
    for(i=0;i<256;++i)
        sbox[i]=i;
    j=0;

    for(i=0;i<256;++i){
        j=(j+sbox[i]+key[i%key_len])%256;
        temp = sbox[i];
        sbox[i] = sbox[j];
        sbox[j] = temp;
    }
}

unsigned char generate_key(){
    unsigned char temp;
    int t;

    pos_i=(pos_i+1)%256;
    pos_j = (pos_j+sbox[pos_i])%256;
    temp = sbox[pos_i];
    sbox[pos_i] = sbox[pos_j];
    sbox[pos_j] = temp;
    t = (sbox[pos_i]+sbox[pos_j])%256;
    return sbox[t];
}

void encryption(unsigned char *plaintext,unsigned char * result){
    pos_i = 0;
    pos_j = 0;
    int len = strlen((const char *)plaintext);
    int i=0;

    init_sbox();
    for(i=0;i<len;++i){
        result[i]=plaintext[i]^generate_key();
    }
    result[i]='\0';
}
