#include<stdio.h>
#include<string.h>
#include<stdlib.h>

void encryption(unsigned char * plaintext,unsigned char * ciphertext);
void decryption(unsigned char * ciphertext,unsigned char * plaintext);

void ip_replace(unsigned char * in,unsigned char *out);
void fp_replace(unsigned char * in,unsigned char *out);
void byte2Bit(unsigned char *in,unsigned char *out,int len);
void bit2Byte(unsigned char *in,unsigned char *out,int len);

void f_func(unsigned char *in,unsigned char * out,unsigned char *ki);
void get_subkey();

void byteXOR(unsigned char *a,unsigned char *b,int len);
void e_expand(unsigned char * in,unsigned char * out);
void s_replace(unsigned char * in,unsigned char * out);
void p_replace(unsigned char * in,unsigned char * out);

void pc1_replace(unsigned char * in,unsigned char * out);
void pc2_replace(unsigned char *in,unsigned char *out);

const char IP_Table[64]= {
        58, 50, 42, 34, 26, 18, 10, 2, 60, 52, 44, 36, 28, 20, 12, 4,
        62, 54, 46, 38, 30, 22, 14, 6, 64, 56, 48, 40, 32, 24, 16, 8,
        57, 49, 41, 33, 25, 17,  9, 1, 59, 51, 43, 35, 27, 19, 11, 3,
        61, 53, 45, 37, 29, 21, 13, 5, 63, 55, 47, 39, 31, 23, 15, 7
};

const char IPR_Table[64] = {
        40, 8, 48, 16, 56, 24, 64, 32, 39, 7, 47, 15, 55, 23, 63, 31,
        38, 6, 46, 14, 54, 22, 62, 30, 37, 5, 45, 13, 53, 21, 61, 29,
        36, 4, 44, 12, 52, 20, 60, 28, 35, 3, 43, 11, 51, 19, 59, 27,
        34, 2, 42, 10, 50, 18, 58, 26, 33, 1, 41,  9, 49, 17, 57, 25
};

const char E_Table[48] = {
        32,  1,  2,  3,  4,  5,  4,  5,  6,  7,  8,  9,
        8,  9, 10, 11, 12, 13, 12, 13, 14, 15, 16, 17,
        16, 17, 18, 19, 20, 21, 20, 21, 22, 23, 24, 25,
        24, 25, 26, 27, 28, 29, 28, 29, 30, 31, 32,  1
};

const char P_Table[32] = {
        16, 7, 20, 21, 29, 12, 28, 17, 1,  15, 23, 26, 5,  18, 31, 10,
        2,  8, 24, 14, 32, 27, 3,  9,  19, 13, 30, 6,  22, 11, 4,  25
};

const char PC1_Table[56] = {
        57, 49, 41, 33, 25, 17,  9,  1, 58, 50, 42, 34, 26, 18,
        10,  2, 59, 51, 43, 35, 27, 19, 11,  3, 60, 52, 44, 36,
        63, 55, 47, 39, 31, 23, 15,  7, 62, 54, 46, 38, 30, 22,
        14,  6, 61, 53, 45, 37, 29, 21, 13,  5, 28, 20, 12,  4
};
const char PC2_Table[48] = {
        14, 17, 11, 24,  1,  5,  3, 28, 15,  6, 21, 10,
        23, 19, 12,  4, 26,  8, 16,  7, 27, 20, 13,  2,
        41, 52, 31, 37, 47, 55, 30, 40, 51, 45, 33, 48,
        44, 49, 39, 56, 34, 53, 46, 42, 50, 36, 29, 32
};

const char LOOP_Table[16] = {
    1,1,2,2,2,2,2,2,1,2,2,2,2,2,2,1
};
const char S_Box[8][4][16] = {
        // S1
        14, 4, 13,  1,  2, 15, 11,  8,  3, 10,  6, 12,  5,  9,  0,  7,
        0, 15,  7,  4, 14,  2, 13,  1, 10,  6, 12, 11,  9,  5,  3,  8,
        4,  1, 14,  8, 13,  6,  2, 11, 15, 12,  9,  7,  3, 10,  5,  0,
        15, 12,  8,  2,  4,  9,  1,  7,  5, 11,  3, 14, 10,  0,  6, 13,
        // S2
        15, 1,  8, 14,  6, 11,  3,  4,  9,  7,  2, 13, 12,  0,  5, 10,
        3, 13,  4,  7, 15,  2,  8, 14, 12,  0,  1, 10,  6,  9, 11,  5,
        0, 14,  7, 11, 10,  4, 13,  1,  5,  8, 12,  6,  9,  3,  2, 15,
        13,  8, 10,  1,  3, 15,  4,  2, 11,  6,  7, 12,  0,  5, 14,  9,
        // S3
        10,  0,  9, 14,  6,  3, 15,  5,  1, 13, 12,  7, 11,  4,  2,  8,
        13,  7,  0,  9,  3,  4,  6, 10,  2,  8,  5, 14, 12, 11, 15,  1,
        13,  6,  4,  9,  8, 15,  3,  0, 11,  1,  2, 12,  5, 10, 14,  7,
        1, 10, 13,  0,  6,  9,  8,  7,  4, 15, 14,  3, 11,  5,  2, 12,
        // S4
        7,  13, 14,  3,  0,  6,  9, 10,  1,  2,  8,  5, 11, 12,  4, 15,
        13,  8, 11,  5,  6, 15,  0,  3,  4,  7,  2, 12,  1, 10, 14,  9,
        10,  6,  9,  0, 12, 11,  7, 13, 15,  1,  3, 14,  5,  2,  8,  4,
        3, 15,  0,  6, 10,  1, 13,  8,  9,  4,  5, 11, 12,  7,  2, 14,
        // S5
        2,  12,  4,  1,  7, 10, 11,  6,  8,  5,  3, 15, 13,  0, 14,  9,
        14, 11,  2, 12,  4,  7, 13,  1,  5,  0, 15, 10,  3,  9,  8,  6,
        4,  2,  1, 11, 10, 13,  7,  8, 15,  9, 12,  5,  6,  3,  0, 14,
        11,  8, 12,  7,  1, 14,  2, 13,  6, 15,  0,  9, 10,  4,  5,  3,
        // S6
        12,  1, 10, 15,  9,  2,  6,  8,  0, 13,  3,  4, 14,  7,  5, 11,
        10, 15,  4,  2,  7, 12,  9,  5,  6,  1, 13, 14,  0, 11,  3,  8,
        9, 14, 15,  5,  2,  8, 12,  3,  7,  0,  4, 10,  1, 13, 11,  6,
        4,  3,  2, 12,  9,  5, 15, 10, 11, 14,  1,  7,  6,  0,  8, 13,
        // S7
        4, 11,  2, 14, 15,  0,  8, 13,  3, 12,  9,  7,  5, 10,  6,  1,
        13,  0, 11,  7,  4,  9,  1, 10, 14,  3,  5, 12,  2, 15,  8,  6,
        1,  4, 11, 13, 12,  3,  7, 14, 10, 15,  6,  8,  0,  5,  9,  2,
        6, 11, 13,  8,  1,  4, 10,  7,  9,  5,  0, 15, 14,  2,  3, 12,
        // S8
        13,  2,  8,  4,  6, 15, 11,  1, 10,  9,  3, 14,  5,  0, 12,  7,
        1, 15, 13,  8, 10,  3,  7,  4, 12,  5,  6, 11,  0, 14,  9,  2,
        7, 11,  4,  1,  9, 12, 14,  2,  0,  6, 10, 13, 15,  3,  5,  8,
        2,  1, 14,  7,  4, 10,  8, 13, 15, 12,  9,  0,  3,  5,  6, 11
};

unsigned char KEY[] = "DE3_En1C";  // 定义密钥
unsigned char subkey[16][48];  // 定义子密钥

unsigned char result[]={0xef,0x34,0xd4,0xa3,0xc6,0x84,0xe4,0x23};

void encryption(unsigned char * plaintext,unsigned char * ciphertext){
    int i;
    unsigned char array_plaintext[64];
    unsigned char f_result[32];
    unsigned char left_array[32];
    unsigned char right_array[32];

    byte2Bit(plaintext,array_plaintext,8);
    ip_replace(array_plaintext,array_plaintext);

    memcpy(left_array,array_plaintext,32);
    memcpy(right_array,array_plaintext+32,32);

    for(i=0;i<15;++i){
        f_func(right_array,f_result,&subkey[i][0]);
        byteXOR(f_result,left_array,32);
        memcpy(left_array,right_array,32);
        memcpy(right_array,f_result,32);
    }

    f_func(right_array,f_result,&subkey[i][0]);
    byteXOR(left_array,f_result,32);

    memcpy(array_plaintext,left_array,32);
    memcpy(array_plaintext+32,right_array,32);

    fp_replace(array_plaintext,array_plaintext);
    bit2Byte(array_plaintext,ciphertext,8);

}

void decryption(unsigned char * ciphertext,unsigned char * plaintext){
    int i;
    unsigned char array_ciphertext[64];
    unsigned char f_result[32];
    unsigned char left_array[32];
    unsigned char right_array[32];

    byte2Bit(ciphertext,array_ciphertext,8);
    ip_replace(array_ciphertext,array_ciphertext);

    memcpy(left_array,array_ciphertext,32);
    memcpy(right_array,array_ciphertext+32,32);

    for(i=15;i>0;--i){
        f_func(right_array,f_result,&subkey[i][0]);
        byteXOR(f_result,left_array,32);
        memcpy(left_array,right_array,32);
        memcpy(right_array,f_result,32);
    }

    f_func(right_array,f_result,&subkey[i][0]);
    byteXOR(left_array,f_result,32);

    memcpy(array_ciphertext,left_array,32);
    memcpy(array_ciphertext+32,right_array,32);

    fp_replace(array_ciphertext,array_ciphertext);
    bit2Byte(array_ciphertext,plaintext,8);

}

void byte2Bit(unsigned char *in,unsigned char *out,int len){
    int i,j;
    for(i=0;i<len;++i)
        for(j=0;j<8;++j){
            out[i*8+j] = (in[i]>>(7-j))&0x1;
            }
}

void bit2Byte(unsigned char *in,unsigned char *out,int len){
    int i,j;
    unsigned char temp;
    for(i=0;i<len;++i){
        temp = in[i*8]&0x1;
        for(j=1;j<8;++j){
            temp = temp<<1;
            temp = temp+(in[i*8+j]&0x1);
        }
        out[i]=temp;
    }
}

//change the input 64 bit data to 64 bytes array, use ip table to replace 64 bytes array
void ip_replace(unsigned char * in,unsigned char *out){
    int i;
    unsigned char temp[64];
    memcpy(temp,in,64);
    //use ip table to replace 64 bytes(bit) array
    for(i=0;i<64;++i){
        out[i] = temp[IP_Table[i]-1];
        //printf("%x ",out[i]);
    }
}

void fp_replace(unsigned char *in,unsigned char* out){
    int i;
    unsigned char temp[64];

    memcpy(temp,in,64);
    for(i=0;i<64;++i)
        out[i] = temp[IPR_Table[i]-1];
}

void e_expand(unsigned char * in, unsigned char *out){
    unsigned char temp[48];
    int i;

    memcpy(temp,in,48);
    for(i=0;i<48;++i)
        out[i] = temp[E_Table[i]-1];
}

void s_replace(unsigned char * in,unsigned char *out){
    int i,j;
    int raw,col;
    char temp;
    for(i=0,j=0;i<8;++i){
        raw = ((in[i*6]<<1)|(in[i*6+5]))&0x3;
        col = ((in[i*6+1]<<3)|(in[i*6+2]<<2)|(in[i*6+3]<<1)|(in[i*6+4]))&0xF;
        temp = S_Box[i][raw][col]&0xF;
        out[j] = (temp>>3)&0x1;
        out[j+1] = (temp>>2)&0x1;
        out[j+2] = (temp>>1)&0x1;
        out[j+3] = (temp)&0x1;
        j+=4;
    }
}

void p_replace(unsigned char * in,unsigned char * out){
    unsigned char temp[32];
    int i;

    memcpy(temp,in,32);
    for(i=0;i<32;++i){
        out[i] = temp[P_Table[i]-1];
    }
}

void byteXOR(unsigned char *a,unsigned char *b,int len){
    int i;
    for(i=0;i<len;++i){
        a[i] = (a[i]+b[i])&0x1;
    }
}

void f_func(unsigned char * in,unsigned char * out,unsigned char * ki){
    unsigned char expand_result[48];
    unsigned char replace_result[32];

    e_expand(in,expand_result);
    byteXOR(expand_result,ki,48);
    s_replace(expand_result,replace_result);
    p_replace(replace_result,replace_result);
    memcpy(out,replace_result,32);
}

void pc1_replace(unsigned char * in,unsigned char * out){
    int i;
    for(i=0;i<56;++i)
        out[i]=in[PC1_Table[i]-1];
}

void pc2_replace(unsigned char *in,unsigned char *out){
    int i;
    for(i=0;i<48;++i)
        out[i] = in[PC2_Table[i]-1];
}

void shift_left(unsigned char *in,unsigned char *out,int len){
    unsigned char temp[28];
    int i,j;

    memcpy(temp,in,28);  // 拷贝 28 字节
    for(i=len,j=0; i<28; ++i)
        out[j++] = temp[i];
    for(i=0; i<len; ++i)
        out[j++] = temp[i];
}

void get_subkey(){ // 基于给定的密钥生成16个子密钥
    unsigned char key_temp[64];
    unsigned char pc1_result[56];
    unsigned char pc2_result[48];
    int i;

    byte2Bit(KEY,key_temp,8);
    pc1_replace(key_temp,pc1_result);

    for(i=0;i<16;++i){
        shift_left(pc1_result,pc1_result,LOOP_Table[i]);
        shift_left(pc1_result+28,pc1_result+28,LOOP_Table[i]);
        pc2_replace(pc1_result,pc2_result);
        memcpy(&subkey[i][0],pc2_result,48);
    }
}

int main()
{
    unsigned char plaintext[20];  // 存放明文的数组；'HarDd3s?'
    unsigned char ciphertext[8];  // 存放密文的数组；{0xef,0x34,0xd4,0xa3,0xc6,0x84,0xe4,0x23}

    int i=0;

	puts("Please input your FLAG:"); // 输入待加密的明文字符串
	scanf("%s", plaintext);

	if(strlen((const char *)plaintext) != 8){ // 如果输入的明文长度不为 8，就不执行 des 加密
	    puts("\n*-*-* any plaintext with its length not being equal to 8 will be ignored! *-*-*\n");

	    system("pause");
		return -1;
	}

    get_subkey();  // 基于给定的密钥，生成后续 16 个子秘钥 --> 用于 des 16轮加密运算
    encryption(plaintext,ciphertext);  // 加密明文字符串

    for(i=0;i<8;++i){
        if(ciphertext[i]!=result[i]){
			puts("\nsorry to say \'Wrong\'!!!\n");

			system("pause");
			return -2;
		}
    }
	puts("\nwell done!!!\n------------------------\n");

//	printf("ciphertext: "); // 将密文逐字节打印出来
//	for(i=0; i<8; i++){
//        printf("0x%X ", *(ciphertext+i));
//	}
//
//	decryption(result, plaintext);  // 解密密文
//	printf("\nplaintext: %s\n\n", plaintext);

	system("pause");
    return 0;
}
