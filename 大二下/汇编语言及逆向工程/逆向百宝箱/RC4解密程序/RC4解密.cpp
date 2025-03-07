#include<stdio.h>
#include<windows.h>
#include<string.h>
#define MAX_KEY 256
#define MAX_STR 100

int pos_i=0;
int pos_j=0;
int sbox[256];
unsigned char key[MAX_KEY]={0x52, 0x43, 0x34, 0x6B, 0x65, 0x79, 0x0FA};//!!!!!!!!!!!!!!!!!存放密钥 
unsigned char answer[MAX_STR] = {0x1B, 0x0CA, 0x0AE, 0x0EF, 0x1E, 0x95, 0x4B, 0x0C2, 0x0D5, 0x0E3, 0x33, 0x76, 0x4F, 0x0F9, 0x4F, 0x0D2, 0x0FC, 0x60};
//!!!!!!!!!!!!!存放明文 
void init_sbox();
unsigned char generate_key();
void decryption(unsigned char *plaintext,unsigned char *result);

int main()
{
 	SetConsoleOutputCP(65001); // 设置控制台输出为UTF-8编码
    SetConsoleCP(65001); // 设置控制台输入为UTF-8编码
	char result[MAX_STR]={0};
	int len;
	unsigned char cipher[MAX_STR]= {0x1B, 0x0CA, 0x0AE, 0x0EF, 0x1E, 0x95, 0x4B, 0x0C2, 0x0D5, 0x0E3, 0x33, 0x76, 0x4F, 0x0F9, 0x4F, 0x0D2, 0x0FC, 0x60};
//!!!!!!!!!!!!!存放明文 
	decryption((unsigned char*)cipher,(unsigned char*)result);
	printf("%s",result);
	system("pause");
	return 0; }

void decryption(unsigned char* ciphertext,unsigned char*result) {
	pos_i =0;
	pos_j =0;
	int len = strlen((const char*)ciphertext);
	int i=0;
	init_sbox();
	for(i=0;i<len;++i)
		result[i]= ciphertext[i]^generate_key();
	result[i]='\0'; }



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











