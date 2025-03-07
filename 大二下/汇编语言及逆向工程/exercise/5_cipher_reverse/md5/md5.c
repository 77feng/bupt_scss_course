#include "md5.h"

unsigned int const S[16] = {
	7, 12, 17, 22,
	5, 9, 14, 20,
	4, 11, 16, 23,
	6, 10, 15, 21
};

unsigned int const T[64] = {
	0xd76aa478, 0xe8c7b756, 0x242070db, 0xc1bdceee, 0xf57c0faf, 0x4787c62a, 0xa8304613, 0xfd469501,
	0x698098d8, 0x8b44f7af, 0xffff5bb1, 0x895cd7be, 0x6b901122, 0xfd987193, 0xa679438e, 0x49b40821,
	0xf61e2562, 0xc040b340, 0x265e5a51, 0xe9b6c7aa, 0xd62f105d, 0x02441453, 0xd8a1e681, 0xe7d3fbc8,
	0x21e1cde6, 0xc33707d6, 0xf4d50d87, 0x455a14ed, 0xa9e3e905, 0xfcefa3f8, 0x676f02d9, 0x8d2a4c8a,
	0xfffa3942, 0x8771f681, 0x6d9d6122, 0xfde5380c, 0xa4beea44, 0x4bdecfa9, 0xf6bb4b60, 0xbebfbc70,
	0x289b7ec6, 0xeaa127fa, 0xd4ef3085, 0x04881d05, 0xd9d4d039, 0xe6db99e5, 0x1fa27cf8, 0xc4ac5665,
	0xf4292244, 0x432aff97, 0xab9423a7, 0xfc93a039, 0x655b59c3, 0x8f0ccc92, 0xffeff47d, 0x85845dd1,
	0x6fa87e4f, 0xfe2ce6e0, 0xa3014314, 0x4e0811a1, 0xf7537e82, 0xbd3af235, 0x2ad7d2bb, 0xeb86d391
};

unsigned int ROTATE_LEFT(unsigned int x, unsigned int n) {
	return ((x << n) | (x >> (32 - n)));
}

unsigned int F(unsigned int X, unsigned int Y, unsigned int Z) {
	return (X & Y) | ((~X) & Z);
}

unsigned int G(unsigned int X, unsigned int Y, unsigned int Z) {
	return (X & Z) | (Y & (~Z));
}

unsigned int H(unsigned int X, unsigned int Y, unsigned int Z) {
	return (X ^ Y ^ Z);
}

unsigned int I(unsigned int X, unsigned int Y, unsigned int Z) {
	return (Y ^ (X | (~Z)));
}

void FF(unsigned int *a,unsigned int b,unsigned int c,unsigned int d,unsigned int m,unsigned int const t,unsigned int s){
	*a += F(b,c,d) + m + t;
	*a = ROTATE_LEFT(*a,s);
	*a += b;

	return;
}

void GG(unsigned int *a,unsigned int b,unsigned int c,unsigned int d,unsigned int m,unsigned int const t,unsigned int s){
	*a += G(b,c,d) + m + t;
	*a = ROTATE_LEFT(*a,s);
	*a += b;

	return;
}

void HH(unsigned int *a,unsigned int b,unsigned int c,unsigned int d,unsigned int m,unsigned int const t,unsigned int s){
	*a += H(b,c,d) + m + t;
	*a = ROTATE_LEFT(*a,s);
	*a += b;

	return;
}

void II(unsigned int *a,unsigned int b,unsigned int c,unsigned int d,unsigned int m,unsigned int const t,unsigned int s){
	*a += I(b,c,d) + m + t;
	*a = ROTATE_LEFT(*a,s);
	*a += b;

	return;
}


unsigned int shift(unsigned int a){
	unsigned int t1,t2,t3,t4;
	t1 = (a & 0xFF) << 24;
	t2 = (a & 0xFF00) << 8;
	t3 = (a >> 8) & 0xFF00;
	t4 = (a >> 24) & 0xFF;
	//printf("%x\n",t1 + t2 + t3 + t4);
	return (t1 + t2 + t3 + t4);
}

/* MD5 initialization */
void md5_init(unsigned int *A,unsigned int *B,unsigned int *C,unsigned int *D){
    unsigned char data[] = {
		0x01, 0x23, 0x45, 0x67,
		0x89, 0xAB, 0xCD, 0xEF,
		0xFE, 0xDC, 0xBA, 0x98,
		0x76, 0x54, 0x32, 0x10
	};

	memcpy(A, data, 4);//int A=0x67452301
	memcpy(B, data + 4, 4);//int B=0xEFCDAB89
	memcpy(C, data + 8, 4);//int C=0x98BADCFE
	memcpy(D, data + 12, 4);//int D=0x10325476
	return;
}

size_t md5_update(char **out, char const *input, size_t inLen){
	int i;
	int j;

	size_t bitLen = inLen * 8; // the bit length of input
	//size_t fillLen = 64 - (inLen - 56) % 64;  // the length of padding
	//printf("len:%d\n",fillLen);

	size_t fillLen = 56 - (inLen % 64);
	//printf("temp:%d\n",temp);

	size_t filledLen = inLen + fillLen + 8; // the length after padding

	char *outBuf = (char*)calloc(filledLen, sizeof(char));
	memcpy(outBuf, input, inLen);
	outBuf[inLen] = 0x80;// padding 1


	j = sizeof(inLen);  // the length of input_lengh
	for (i = 0; i < j; i++) {
		memcpy(outBuf + filledLen - 8 + i, (char*)(&bitLen) + i, 1); // LittleEndian
		//memcpy(outBuf + filledLen - 4 + i, (char*)(&bitLen) + j - 1 - i, 1);

	}

	*out = outBuf;  // the data after padding
	return filledLen;
}


void md5_transform(unsigned int *out,  char *input){
	memcpy(out,input,GROUP_SIZE);
	return;

}

void data_round(unsigned int *A, unsigned int *B, unsigned int *C, unsigned int *D, unsigned int const *m){
	//int k;
	unsigned int a = *A;
	unsigned int b = *B;
	unsigned int c = *C;
	unsigned int d = *D;

	/* round 1 */
	FF(&a,b,c,d,m[0],T[0],S[0]);
	FF(&d,a,b,c,m[1],T[1],S[1]);
	FF(&c,d,a,b,m[2],T[2],S[2]);
    FF(&b,c,d,a,m[3],T[3],S[3]);
	FF(&a,b,c,d,m[4],T[4],S[0]);
	FF(&d,a,b,c,m[5],T[5],S[1]);
	FF(&c,d,a,b,m[6],T[6],S[2]);
	FF(&b,c,d,a,m[7],T[7],S[3]);
	FF(&a,b,c,d,m[8],T[8],S[0]);
	FF(&d,a,b,c,m[9],T[9],S[1]);
	FF(&c,d,a,b,m[10],T[10],S[2]);
	FF(&b,c,d,a,m[11],T[11],S[3]);
	FF(&a,b,c,d,m[12],T[12],S[0]);
	FF(&d,a,b,c,m[13],T[13],S[1]);
	FF(&c,d,a,b,m[14],T[14],S[2]);
	FF(&b,c,d,a,m[15],T[15],S[3]);

	/* round 2 */
    GG(&a,b,c,d,m[1],T[16],S[4]);
    GG(&d,a,b,c,m[6],T[17],S[5]);
	GG(&c,d,a,b,m[11],T[18],S[6]);
	GG(&b,c,d,a,m[0],T[19],S[7]);
	GG(&a,b,c,d,m[5],T[20],S[4]);
	GG(&d,a,b,c,m[10],T[21],S[5]);
	GG(&c,d,a,b,m[15],T[22],S[6]);
	GG(&b,c,d,a,m[4],T[23],S[7]);
	GG(&a,b,c,d,m[9],T[24],S[4]);
	GG(&d,a,b,c,m[14],T[25],S[5]);
	GG(&c,d,a,b,m[3],T[26],S[6]);
	GG(&b,c,d,a,m[8],T[27],S[7]);
	GG(&a,b,c,d,m[13],T[28],S[4]);
	GG(&d,a,b,c,m[2],T[29],S[5]);
	GG(&c,d,a,b,m[7],T[30],S[6]);
	GG(&b,c,d,a,m[12],T[31],S[7]);

    /* round 3 */
 	HH(&a,b,c,d,m[5],T[32],S[8]);
 	HH(&d,a,b,c,m[8],T[33],S[9]);
 	HH(&c,d,a,b,m[11],T[34],S[10]);
 	HH(&b,c,d,a,m[14],T[35],S[11]);
 	HH(&a,b,c,d,m[1],T[36],S[8]);
 	HH(&d,a,b,c,m[4],T[37],S[9]);
 	HH(&c,d,a,b,m[7],T[38],S[10]);
 	HH(&b,c,d,a,m[10],T[39],S[11]);
 	HH(&a,b,c,d,m[13],T[40],S[8]);
 	HH(&d,a,b,c,m[0],T[41],S[9]);
 	HH(&c,d,a,b,m[3],T[42],S[10]);
 	HH(&b,c,d,a,m[6],T[43],S[11]);
 	HH(&a,b,c,d,m[9],T[44],S[8]);
 	HH(&d,a,b,c,m[12],T[45],S[9]);
 	HH(&c,d,a,b,m[15],T[46],S[10]);
 	HH(&b,c,d,a,m[2],T[47],S[11]);

	/* round 4 */
	II(&a,b,c,d,m[0],T[48],S[12]);
	II(&d,a,b,c,m[7],T[49],S[13]);
	II(&c,d,a,b,m[14],T[50],S[14]);
	II(&b,c,d,a,m[5],T[51],S[15]);
	II(&a,b,c,d,m[12],T[52],S[12]);
	II(&d,a,b,c,m[3],T[53],S[13]);
	II(&c,d,a,b,m[10],T[54],S[14]);
	II(&b,c,d,a,m[1],T[55],S[15]);
	II(&a,b,c,d,m[8],T[56],S[12]);
	II(&d,a,b,c,m[15],T[57],S[13]);
	II(&c,d,a,b,m[6],T[58],S[14]);
	II(&b,c,d,a,m[13],T[59],S[15]);
	II(&a,b,c,d,m[4],T[60],S[12]);
	II(&d,a,b,c,m[11],T[61],S[13]);
	II(&c,d,a,b,m[2],T[62],S[14]);
	II(&b,c,d,a,m[9],T[63],S[15]);

	*A += a;
	*B += b;
	*C += c;
	*D += d;
}

void md5_calc(char *out, char const *input, size_t inLen){
	int i;

    size_t filledLen;
	char *filledData;
	unsigned int A,B,C,D;
    unsigned int *M = (unsigned int*)malloc(GROUP_SIZE);

	filledLen = md5_update(&filledData,input,inLen);
	//printf("input:%s\n",input);

    md5_init(&A,&B,&C,&D);
    //printf("%x\n%x\n%x\n%x\n",A,B,C,D);

	for(i = 0;i < filledLen / GROUP_SIZE;i++){
		md5_transform(M, filledData + i * 64);  //char to int
		data_round(&A,&B,&C,&D,M);
	}

	//printf("%x\n%x\n%x\n%x\n",A,B,C,D);

	sprintf(out,"%08x%08x%08x%08x",shift(A),shift(B),shift(C),shift(D));

    free(M);
	M = NULL;
	free(filledData);
	filledData = NULL;

	return;

}
