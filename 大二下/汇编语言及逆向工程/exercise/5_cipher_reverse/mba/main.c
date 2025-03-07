//
// Created by G6 on 2021-09-17.
//

#include "stdio.h"
#include "stdlib.h"
#include "mba.h"

unsigned char target[] = {
    0x3e, 0xac, 0x4d, 0xc9, 0x1d, 0xf8, 0xd4, 0xb2, 0xc2, 0x08, 0xc8, 0xd9, 0xf1, 0x21, 0x3a, 0x48, 0x87, 0x56, 0x9d, 0x4e, 0x16, 0x49, 0xc6, 0xa3, 0xa4, 0x9b, 0x45, 0xa7, 0x6e, 0x30, 0xf8, 0x6f
};

// flag{0o0..MBA_0bF_1s_S0_1ntEresT1ng!!}
#define FLAG_LEN 38

int main() {
    unsigned char inputstr[50];
    puts("Your flag? ");
    scanf("%40s", inputstr);
    if (strlen(inputstr) != FLAG_LEN) {
        printf("Wrong!\n");
        exit(0);
    }
    if (inputstr[0] != 'f' ||
        inputstr[1] != 'l' ||
        inputstr[2] != 'a' ||
        inputstr[3] != 'g' ||
        inputstr[4] != '{' ||
        inputstr[FLAG_LEN-1] != '}') {
        printf("Wrong!\n");
        exit(0);
    }

    for (int i=0; i<4; i++) {
        encrypt(inputstr+5+i*8);
    }

    // for (int i=0; i<32; i++) {
    //     printf("0x%02x, ", inputstr[i+5]);
    // }
    for (int i=0; i<32; i++) {
        if (inputstr[i+5] != target[i]) {
            printf("Wrong!\n");
            exit(0);
        }
    }

    puts("Correct!");

}


// solver

//#include "stdint.h"
//#include "stdio.h"
//
//uint32_t keys[] = {
//        0x6e62d8bf,
//        0x9d267e07,
//        0x11e4f02d,
//        0xd3f7a4db,
//        0xec6e58a7,
//        0xed533f39,
//        0xe580c341,
//        0xfbd60b0a,
//        0x97910694,
//        0xfcf773d2,
//        0xfebd1752,
//        0x2b21177d,
//        0xe6461508,
//        0xde988950,
//        0x1d85f4a1,
//        0xe6b56c0a,
//        0x39eab74d,
//        0xba45746c,
//        0x60964248,
//        0x5e0b4656,
//        0x2e6d19a,
//        0x2d3f2a70,
//        0x50892ef7,
//        0xb00f0be,
//        0x66d5323d,
//        0xa65af8f5,
//        0x7ffe2b48,
//        0xd4e9b28d,
//        0x2a74490,
//        0xdc4c2c7a,
//        0x3b9574a,
//        0x69454a35,
//        0xe1547c84,
//        0xf65f9761,
//        0xddc6f263,
//        0x64ace3cd,
//        0xafa18898,
//        0x56cf2751,
//        0xbebe73a3,
//        0xae927c81,
//        0xe61c1936,
//        0xd3e5c151,
//        0x238ba0af,
//        0x479cb66d,
//        0x4ec2ac58,
//        0x136da85,
//        0x33f5a63b,
//        0xefc4b465,
//        0xfdaa6082,
//        0xa6e0bbe8,
//        0x1c722ca1,
//        0x3dd2a5d1,
//        0x2e607a1e,
//        0x7a7bc530,
//        0x3fd1de11,
//        0x64884b08,
//        0x82006fae,
//        0x853ee7d0,
//        0xacda09e6,
//        0xdaf24fe9,
//};
//uint32_t keys_inv[] ={
//        0x6e62d8bf,
//        0x5988bfb5,
//        0x11e4f02d,
//        0xd3f7a4db,
//        0xec6e58a7,
//        0xed533f39,
//        0xe580c341,
//        0x3724e34f,
//        0x97910694,
//        0xfcf773d2,
//        0xfebd1752,
//        0x2b21177d,
//        0xe6461508,
//        0xdef4eaa8,
//        0x1d85f4a1,
//        0xe6b56c0a,
//        0x39eab74d,
//        0xba45746c,
//        0x60964248,
//        0x12ea4a5b,
//        0x2e6d19a,
//        0x2d3f2a70,
//        0x50892ef7,
//        0xb00f0be,
//        0x66d5323d,
//        0xc9c6ff78,
//        0x7ffe2b48,
//        0xd4e9b28d,
//        0x2a74490,
//        0xdc4c2c7a,
//        0x3b9574a,
//        0xf855f304,
//        0xe1547c84,
//        0xf65f9761,
//        0xddc6f263,
//        0x64ace3cd,
//        0xafa18898,
//        0x7dba50e4,
//        0xbebe73a3,
//        0xae927c81,
//        0xe61c1936,
//        0xd3e5c151,
//        0x238ba0af,
//        0x6d3d6147,
//        0x4ec2ac58,
//        0x136da85,
//        0x33f5a63b,
//        0xefc4b465,
//        0xfdaa6082,
//        0xbe2db395,
//        0x1c722ca1,
//        0x3dd2a5d1,
//        0x2e607a1e,
//        0x7a7bc530,
//        0x3fd1de11,
//        0x4476b345,
//        0x82006fae,
//        0x853ee7d0,
//        0xacda09e6,
//        0xdaf24fe9,
//};
//
//#define MASK 0xffffffff
//#define BITSHIFT 32
//
//
//#define idea_mul(r,a,b,ul) \
//ul=(unsigned long long)a*b; \
//if (ul != 0) \
//	{ \
//	r=(ul&MASK)-(ul>>BITSHIFT); \
//	r-=((r)>>BITSHIFT); \
//	} \
//else \
//	r=(uint32_t)(-(long long int)a-b+1); /* assuming a or b is 0 and in range */
//
//
////    t0 = (uint32_t)(x0^x1);
//#define IN(r, x0, x1, t0, t1, ul, k1, k2, k3, k4) \
//    idea_mul(t0, (uint32_t)(x0^x1), k1, ul) \
//    t1 = (uint32_t)(t0^k2); \
//    idea_mul(t0,t0,k3,ul); \
//    t1=(t0+t1)&MASK; \
//    idea_mul(t1,t1,k4,ul); \
//    t0=(t0+t1)&MASK; \
//    r = (uint32_t)(t0^t1);
//
//
//#define ROUNDDD(x0, x1, t0, t1, ul, tmp, k1, k2, k3, k4, k5, k6) \
//    x0 = x0 + k1; \
//    idea_mul(x1, x1, k2, ul); \
//    x0 = x0 & MASK; \
//    x1 = x1 & MASK; \
//    IN(tmp, x0, x1, t0, t1, ul, k3, k4, k5, k6) \
//    x0 ^= tmp; \
//    x1 ^= tmp;
//
//#define ROUND 10
//
//#define DUMP(tmp, x0, x1, t0, t1, ul) \
//    printf("0x%llx\n", tmp); \
//    printf("0x%llx\n", x0); \
//    printf("0x%llx\n", x1); \
//    printf("0x%llx\n\n", ul);
//
//void encrypt(uint32_t *d) {
//    register uint64_t x0, x1, t0, t1, ul, tmp;
//    x0 = d[0];
//    x1 = d[1];
//    uint32_t *p = keys;
//
//    for (int _=0; _<ROUND; _++) {
////        x0 = x0 + KEY1;
////        idea_mul(x1, x1, KEY2, ul);
////
////        x0 = x0 & MASK;
////        x1 = x1 & MASK;
////
////        IN(tmp, x0, x1, t0, t1, ul, KEY3, KEY4, KEY5, KEY6)
////
////        x0 ^= tmp;
////        x1 ^= tmp;
//        ROUNDDD(x0, x1, t0, t1, ul, tmp, *p++, *p++, *p++, *p++, *p++, *p++)
//    }
//
//    d[0] = x0;
//    d[1] = x1;
//}
//
//void decrypt(uint32_t *d) {
//    register uint64_t x0, x1, t0, t1, ul, tmp;
//    x0 = d[0];
//    x1 = d[1];
//    uint32_t *p = keys_inv+ROUND*6-1;
////    uint32_t k1, k2;
//
//
//    for (int _=0; _<ROUND; _++) {
//    uint64_t k6=*p--, k5=*p--,k4=*p--,k3=*p--,k2=*p--,k1=*p--;
//        IN(tmp, x0, x1, t0, t1, ul, k3,k4,k5,k6)
//        x0 ^= tmp;
//        x1 ^= tmp;
//
//        x0 = x0 & MASK;
//        x1 = x1 & MASK;
//
//        x0 = (x0 - k1) & MASK;
//        idea_mul(x1, x1, k2, ul);
//    }
//
//    d[0] = x0;
//    d[1] = x1;
//}
//
//unsigned char target[] = {
//    0x3e, 0xac, 0x4d, 0xc9, 0x1d, 0xf8, 0xd4, 0xb2, 0xc2, 0x08, 0xc8, 0xd9, 0xf1, 0x21, 0x3a, 0x48, 0x87, 0x56, 0x9d, 0x4e, 0x16, 0x49, 0xc6, 0xa3, 0xa4, 0x9b, 0x45, 0xa7, 0x6e, 0x30, 0xf8, 0x6f
//};
//
//int main() {
//    for (int i=0; i<4; i++) {
//        decrypt(target+i*8);
//    }
//    printf("flag{%s}\n", target);
//
//    for (int i=0; i<4; i++) {
//        encrypt(target+i*8);
//    }
//    for (int i=0; i<32; i++) {
//        printf("0x%02x, ", target[i]);
//    }
//    printf("\n");
//}
