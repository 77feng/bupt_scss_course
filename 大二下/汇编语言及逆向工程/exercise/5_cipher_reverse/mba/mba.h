//
// Created by G6 on 2021-09-17.
//

#ifndef MBA_H
#define MBA_H

#include "stdint.h"
#include "string.h"

#define MASK 0xffffffff
#define BITSHIFT 32


// #define idea_mul(num, r,a,b,ul) \
// ul=(unsigned long long)a*b; \
// if (ul != 0) \
// 	{ \
// 	r=(ul&MASK)-(ul>>BITSHIFT); \
// 	r-=((r)>>BITSHIFT); \
// 	} \
// else \
//     r=(uint32_t)(ADD2((-(long long int)a), (-b+1), num)); /* assuming a or b is 0 and in range */
// 	// r=(uint32_t)(-(long long int)a-b+1); /* assuming a or b is 0 and in range */

#define idea_mul(num, r,a,b,ul) \
ul=(unsigned long long)a*b; \
if (ul != 0) \
	{ \
	r = ADD5((ul&MASK), (~(ul>>BITSHIFT)+1), ul); \
    r = ADD6(r, ((~((r)>>BITSHIFT)) + 1), b); \
	} \
else \
    r=(uint32_t)(ADD3((-(long long int)a), (-b+1), ul)); /* assuming a or b is 0 and in range */


#define IN(num, r, x0, x1, t0, t1, ul, k1, k2, k3, k4) \
   idea_mul(num, t0, (uint32_t)(XOR4(x0, x1, k1)), k1, ul) \
   t1 = (uint32_t)(XOR3(t0, k2)); \
   idea_mul(num, t0,t0,k3,ul); \
   t1=ADD2(t0,t1, num)&MASK; \
   idea_mul(num, t1,t1,k4,ul); \
   t0=ADD4(t0,t1, obfvar2)&MASK; \
   r = (uint32_t)(XOR5(t0,t1, RAND_0_##num));

// #define IN(r, x0, x1, t0, t1, ul, k1, k2, k3, k4) \
//     idea_mul(t0, (uint32_t)(x0^x1), k1, ul) \
//     t1 = (uint32_t)(t0^k2); \
//     idea_mul(t0,t0,k3,ul); \
//     t1=(t0+t1)&MASK; \
//     idea_mul(t1,t1,k4,ul); \
//     t0=(t0+t1)&MASK; \
//     r = (uint32_t)(t0^t1);

//#define ROUNDDD(x0, x1, t0, t1, ul, tmp, k1, k2, k3, k4, k5, k6) \
//    x0 = x0 + k1; \
//    idea_mul(x1, x1, k2, ul); \
//    x0 = x0 & MASK; \
//    x1 = x1 & MASK; \
//    IN(tmp, x0, x1, t0, t1, ul, k3, k4, k5, k6) \
//    x0 ^= tmp; \
//    x1 ^= tmp;

#define ROUNDDD(num, x0, x1, t0, t1, ul, tmp, k1, k2, k3, k4, k5, k6) \
    x0 = ADD1(x0, k1, num); \
    idea_mul(num, x1, x1, k2, ul); \
    x0 = x0 & MASK; \
    x1 = x1 & MASK; \
    IN(num, tmp, x0, x1, t0, t1, ul, k3, k4, k5, k6) \
    x0 = XOR1(x0, tmp, t1); \
    x1 = XOR2(x1, tmp, t0);

#define ROUND 10

#define OBFFFFF

#ifdef OBFFFFF

#if 1
#define KEY_0 0x6e62d8bf
#define KEY_1 0x9d267e07
#define KEY_2 0x11e4f02d
#define KEY_3 0xd3f7a4db
#define KEY_4 0xec6e58a7
#define KEY_5 0xed533f39
#define KEY_6 0xe580c341
#define KEY_7 0xfbd60b0a
#define KEY_8 0x97910694
#define KEY_9 0xfcf773d2
#define KEY_10 0xfebd1752
#define KEY_11 0x2b21177d
#define KEY_12 0xe6461508
#define KEY_13 0xde988950
#define KEY_14 0x1d85f4a1
#define KEY_15 0xe6b56c0a
#define KEY_16 0x39eab74d
#define KEY_17 0xba45746c
#define KEY_18 0x60964248
#define KEY_19 0x5e0b4656
#define KEY_20 0x2e6d19a
#define KEY_21 0x2d3f2a70
#define KEY_22 0x50892ef7
#define KEY_23 0xb00f0be
#define KEY_24 0x66d5323d
#define KEY_25 0xa65af8f5
#define KEY_26 0x7ffe2b48
#define KEY_27 0xd4e9b28d
#define KEY_28 0x2a74490
#define KEY_29 0xdc4c2c7a
#define KEY_30 0x3b9574a
#define KEY_31 0x69454a35
#define KEY_32 0xe1547c84
#define KEY_33 0xf65f9761
#define KEY_34 0xddc6f263
#define KEY_35 0x64ace3cd
#define KEY_36 0xafa18898
#define KEY_37 0x56cf2751
#define KEY_38 0xbebe73a3
#define KEY_39 0xae927c81
#define KEY_40 0xe61c1936
#define KEY_41 0xd3e5c151
#define KEY_42 0x238ba0af
#define KEY_43 0x479cb66d
#define KEY_44 0x4ec2ac58
#define KEY_45 0x136da85
#define KEY_46 0x33f5a63b
#define KEY_47 0xefc4b465
#define KEY_48 0xfdaa6082
#define KEY_49 0xa6e0bbe8
#define KEY_50 0x1c722ca1
#define KEY_51 0x3dd2a5d1
#define KEY_52 0x2e607a1e
#define KEY_53 0x7a7bc530
#define KEY_54 0x3fd1de11
#define KEY_55 0x64884b08
#define KEY_56 0x82006fae
#define KEY_57 0x853ee7d0
#define KEY_58 0xacda09e6
#define KEY_59 0xdaf24fe9
// uint32_t keys[] = {
//         0x6e62d8bf,
//         0x9d267e07,
//         0x11e4f02d,
//         0xd3f7a4db,
//         0xec6e58a7,
//         0xed533f39,
//         0xe580c341,
//         0xfbd60b0a,
//         0x97910694,
//         0xfcf773d2,
//         0xfebd1752,
//         0x2b21177d,
//         0xe6461508,
//         0xde988950,
//         0x1d85f4a1,
//         0xe6b56c0a,
//         0x39eab74d,
//         0xba45746c,
//         0x60964248,
//         0x5e0b4656,
//         0x2e6d19a,
//         0x2d3f2a70,
//         0x50892ef7,
//         0xb00f0be,
//         0x66d5323d,
//         0xa65af8f5,
//         0x7ffe2b48,
//         0xd4e9b28d,
//         0x2a74490,
//         0xdc4c2c7a,
//         0x3b9574a,
//         0x69454a35,
//         0xe1547c84,
//         0xf65f9761,
//         0xddc6f263,
//         0x64ace3cd,
//         0xafa18898,
//         0x56cf2751,
//         0xbebe73a3,
//         0xae927c81,
//         0xe61c1936,
//         0xd3e5c151,
//         0x238ba0af,
//         0x479cb66d,
//         0x4ec2ac58,
//         0x136da85,
//         0x33f5a63b,
//         0xefc4b465,
//         0xfdaa6082,
//         0xa6e0bbe8,
//         0x1c722ca1,
//         0x3dd2a5d1,
//         0x2e607a1e,
//         0x7a7bc530,
//         0x3fd1de11,
//         0x64884b08,
//         0x82006fae,
//         0x853ee7d0,
//         0xacda09e6,
//         0xdaf24fe9,
// };
// uint32_t keys_inv[] ={
//         0x6e62d8bf,
//         0x5988bfb5,
//         0x11e4f02d,
//         0xd3f7a4db,
//         0xec6e58a7,
//         0xed533f39,
//         0xe580c341,
//         0x3724e34f,
//         0x97910694,
//         0xfcf773d2,
//         0xfebd1752,
//         0x2b21177d,
//         0xe6461508,
//         0xdef4eaa8,
//         0x1d85f4a1,
//         0xe6b56c0a,
//         0x39eab74d,
//         0xba45746c,
//         0x60964248,
//         0x12ea4a5b,
//         0x2e6d19a,
//         0x2d3f2a70,
//         0x50892ef7,
//         0xb00f0be,
//         0x66d5323d,
//         0xc9c6ff78,
//         0x7ffe2b48,
//         0xd4e9b28d,
//         0x2a74490,
//         0xdc4c2c7a,
//         0x3b9574a,
//         0xf855f304,
//         0xe1547c84,
//         0xf65f9761,
//         0xddc6f263,
//         0x64ace3cd,
//         0xafa18898,
//         0x7dba50e4,
//         0xbebe73a3,
//         0xae927c81,
//         0xe61c1936,
//         0xd3e5c151,
//         0x238ba0af,
//         0x6d3d6147,
//         0x4ec2ac58,
//         0x136da85,
//         0x33f5a63b,
//         0xefc4b465,
//         0xfdaa6082,
//         0xbe2db395,
//         0x1c722ca1,
//         0x3dd2a5d1,
//         0x2e607a1e,
//         0x7a7bc530,
//         0x3fd1de11,
//         0x4476b345,
//         0x82006fae,
//         0x853ee7d0,
//         0xacda09e6,
//         0xdaf24fe9,
// };
#endif


#if 1
#define RAND_0_1 0xb2c4ec32
#define RAND_1_1 0xbec749a3
#define RAND_2_1 0x25c2126b
#define RAND_3_1 0x73d0dfae
#define RAND_4_1 0xe31b361f
#define RAND_5_1 0x746b5f66
#define RAND_6_1 0x4e90a229
#define RAND_0_2 0x25db5ad8
#define RAND_1_2 0x8f1c711f
#define RAND_2_2 0x275bcdd0
#define RAND_3_2 0x9cec851b
#define RAND_4_2 0x6b87717f
#define RAND_5_2 0xf7bf9eef
#define RAND_6_2 0xe6d6fde7
#define RAND_0_3 0x9a550514
#define RAND_1_3 0x11185551
#define RAND_2_3 0x1e7e997c
#define RAND_3_3 0x7abebe2
#define RAND_4_3 0x63a60f8a
#define RAND_5_3 0x5eb6f5cc
#define RAND_6_3 0x45f457d6
#define RAND_0_4 0xe679b381
#define RAND_1_4 0x89da191d
#define RAND_2_4 0x4704e013
#define RAND_3_4 0x772f079f
#define RAND_4_4 0x561a2b5f
#define RAND_5_4 0x1c4b34d8
#define RAND_6_4 0xa192c201
#define RAND_0_5 0x31199e43
#define RAND_1_5 0x6da7d73d
#define RAND_2_5 0x49d7f2b5
#define RAND_3_5 0x2463004d
#define RAND_4_5 0x3f1a6149
#define RAND_5_5 0x9d279358
#define RAND_6_5 0x326f6e01
#define RAND_0_6 0xdc43b639
#define RAND_1_6 0xc22b26cd
#define RAND_2_6 0xa383b075
#define RAND_3_6 0xa5fcf4b8
#define RAND_4_6 0x6afa55a4
#define RAND_5_6 0x7af752be
#define RAND_6_6 0x6ff755ad
#define RAND_0_7 0xc1e3b703
#define RAND_1_7 0x8f7be0d7
#define RAND_2_7 0x6472748f
#define RAND_3_7 0x953b45d1
#define RAND_4_7 0x8a7eab21
#define RAND_5_7 0x1d79565d
#define RAND_6_7 0x241be8d8
#define RAND_0_8 0x8e132e9d
#define RAND_1_8 0xfcb41f96
#define RAND_2_8 0x33da5a21
#define RAND_3_8 0x1030644b
#define RAND_4_8 0xf339985f
#define RAND_5_8 0xfdcc8eae
#define RAND_6_8 0xc8169ebc
#define RAND_0_9 0x879f7007
#define RAND_1_9 0xedb5ce8b
#define RAND_2_9 0x11a1da5b
#define RAND_3_9 0xa306221c
#define RAND_4_9 0x82d70c39
#define RAND_5_9 0x5e6b38bc
#define RAND_6_9 0xf7bf7b91
#define RAND_0_10 0x7c345fde
#define RAND_1_10 0xd71eaf1b
#define RAND_2_10 0xd34afdc4
#define RAND_3_10 0xa7263ebf
#define RAND_4_10 0x27e4d280
#define RAND_5_10 0xde7a756b
#define RAND_6_10 0xaf4973d3
#endif

#define ADD1(x, y, num) IND1_1(x, RAND_1_##num) + IND1_2(y, RAND_2_##num)
#define ADD2(x, y, num) IND2_1(x, RAND_3_##num, RAND_4_##num) + IND2_2(y, RAND_5_##num, RAND_6_##num)
#define ADD3(a, b, c) 2*(c^~(~a&(~b|c)))-1*(b|(a&~c))-2*(b&~(a&c))-1*(c^~(~a&(b|c)))+2*(c^(~a|(b|c)))+5*((a&c)|(b&~c))-6*((a&b)|~(a^(b^c)))+5*(~(a|b)|(b^c))-1*(b&~(a^c))+1*~(a^(b^c))+1*b+2*~(~a|(b&c))+4*(~(a^b)&(a^c))-1*((b&c)|(a&(b|c)))+2*(b^(~a&(b|c)))-6*((b&c)|(~a&(b|c)))+7*(~(a|~b)|~(a^(b^c)))+2*((a&b)|~(b|c))-2*(a&(b|c))+11*(b^~(~a&(~b&c)))+1*~(b^c)-1*((a&c)|~(b|c))+11*(a|b)-6*(c^(a&(b|c)))+2*(a&~b)+2*(c^~(a|(~b&c)))+7*(~(a&~b)&(b^c))+3*(b^~(~a&(b^c)))+11*(~a&(~b|c))+2*(a|~b)+1*(b^~(a&(~b&c)))-7*~(a^b)-3*~(a&~b)+5*(c^(~a&(b|c)))-1*~(a&~c)-2*~(~a&(~b&c))-2*(c^(a&(~b|c)))+4*((a|b)&(b^c))-1*~(a|(b&c))-1*~(a|b)+1*(~b&~(a^c))+3*(a^(b^c))-7*(b^~(a&(b^c)))-2*(b^(~a|(b|c)))-3*(b|c)-11*(a^b)+1*(~(a^b)&~(a^c))-7*(~(a|~b)|(b^c))-2*(b^~(~a&(~b|c)))-18*~(a|(b|c))-7*~(a|(~b|c))-12*~(~a|(b|c))+4*~(~a|(~b|c))+19*(~a&(~b&c))+32*(~a&(b&c))-22*(a&(~b&c))+12*(a&(b&c))-11*(b|~(a|~c))
//a+b = 2*(c^~(~a&(~b|c)))-1*(b|(a&~c))-2*(b&~(a&c))-1*(c^~(~a&(b|c)))+2*(c^(~a|(b|c)))+5*((a&c)|(b&~c))-6*((a&b)|~(a^(b^c)))+5*(~(a|b)|(b^c))-1*(b&~(a^c))+1*~(a^(b^c))+1*b+2*~(~a|(b&c))+4*(~(a^b)&(a^c))-1*((b&c)|(a&(b|c)))+2*(b^(~a&(b|c)))-6*((b&c)|(~a&(b|c)))+7*(~(a|~b)|~(a^(b^c)))+2*((a&b)|~(b|c))-2*(a&(b|c))+11*(b^~(~a&(~b&c)))+1*~(b^c)-1*((a&c)|~(b|c))+11*(a|b)-6*(c^(a&(b|c)))+2*(a&~b)+2*(c^~(a|(~b&c)))+7*(~(a&~b)&(b^c))+3*(b^~(~a&(b^c)))+11*(~a&(~b|c))+2*(a|~b)+1*(b^~(a&(~b&c)))-7*~(a^b)-3*~(a&~b)+5*(c^(~a&(b|c)))-1*~(a&~c)-2*~(~a&(~b&c))-2*(c^(a&(~b|c)))+4*((a|b)&(b^c))-1*~(a|(b&c))-1*~(a|b)+1*(~b&~(a^c))+3*(a^(b^c))-7*(b^~(a&(b^c)))-2*(b^(~a|(b|c)))-3*(b|c)-11*(a^b)+1*(~(a^b)&~(a^c))-7*(~(a|~b)|(b^c))-2*(b^~(~a&(~b|c)))-18*~(a|(b|c))-7*~(a|(~b|c))-12*~(~a|(b|c))+4*~(~a|(~b|c))+19*(~a&(~b&c))+32*(~a&(b&c))-22*(a&(~b&c))+12*(a&(b&c))-11*(b|~(a|~c))
#define ADD4(a, b, c) -2*((a&~b)|~(a^(b^c)))-5*((a&c)|(b&~c))-7*(c^~(~a&(~b&c)))-2*(b|c)-1*(~(a&~b)&(b^c))+1*(~c&~(a^b))-7*(c|~(a|~b))+11*(c^(a|~b))+1*(b&~c)+3*(~(a&b)&(b^c))-7*(c^(a|b))+2*(a|(b&c))-6*(a&(b|c))-7*~(a&(b&c))-1*(a^(b^c))+2*(c^~(~a&(b|c)))+3*((b&c)^~(~a&(b^c)))-5*(c^~(~a&(~b|c)))-1*~(a&c)-7*(c&(a^b))-2*(b^~(a&(~b&c)))+4*(c^~(~a|(b&c)))+3*(~a&(~b|c))-5*((a&c)^(b|c))+7*((b&~c)|~(~a|(~b&c)))-6*(b^(~a&(b^c)))+1*b-3*(b^(~a|(b|c)))+7*(c^~(~a&(b&c)))+7*((a&b)|~(b|~c))-1*(c&~(a^b))-11*(b&~(a&c))-1*(a^(b&c))+3*(~b|(a^c))+2*~a+5*((a|~b)&~(b^c))-5*~(a|(b&c))+5*(b^~(a|(b&c)))+1*~(a|(~b&c))-5*(c^(~a&(b|c)))-1*(b^~(a|(~b&c)))+1*(c|(a&~b))+2*((a&b)^~(a^(b&c)))-11*(b&c)-5*((a|~b)&(b^c))+7*~(a^(b^c))+1*(b|~(a|c))-25*~(a|(b|c))+42*~(a|(~b|c))-11*~(~a|(b|c))+7*~(~a|(~b|c))+33*(~a&(~b&c))+13*(~a&(b&c))+22*(a&(~b&c))+14*(a&(b&c))+3*(b^(a&c))
//a+b = -2*((a&~b)|~(a^(b^c)))-5*((a&c)|(b&~c))-7*(c^~(~a&(~b&c)))-2*(b|c)-1*(~(a&~b)&(b^c))+1*(~c&~(a^b))-7*(c|~(a|~b))+11*(c^(a|~b))+1*(b&~c)+3*(~(a&b)&(b^c))-7*(c^(a|b))+2*(a|(b&c))-6*(a&(b|c))-7*~(a&(b&c))-1*(a^(b^c))+2*(c^~(~a&(b|c)))+3*((b&c)^~(~a&(b^c)))-5*(c^~(~a&(~b|c)))-1*~(a&c)-7*(c&(a^b))-2*(b^~(a&(~b&c)))+4*(c^~(~a|(b&c)))+3*(~a&(~b|c))-5*((a&c)^(b|c))+7*((b&~c)|~(~a|(~b&c)))-6*(b^(~a&(b^c)))+1*b-3*(b^(~a|(b|c)))+7*(c^~(~a&(b&c)))+7*((a&b)|~(b|~c))-1*(c&~(a^b))-11*(b&~(a&c))-1*(a^(b&c))+3*(~b|(a^c))+2*~a+5*((a|~b)&~(b^c))-5*~(a|(b&c))+5*(b^~(a|(b&c)))+1*~(a|(~b&c))-5*(c^(~a&(b|c)))-1*(b^~(a|(~b&c)))+1*(c|(a&~b))+2*((a&b)^~(a^(b&c)))-11*(b&c)-5*((a|~b)&(b^c))+7*~(a^(b^c))+1*(b|~(a|c))-25*~(a|(b|c))+42*~(a|(~b|c))-11*~(~a|(b|c))+7*~(~a|(~b|c))+33*(~a&(~b&c))+13*(~a&(b&c))+22*(a&(~b&c))+14*(a&(b&c))+3*(b^(a&c))

#define ADD5(a, b, c) -1*(-6*(~(a^b)&(a^c))-2*((a&c)|(b&~c))-6*(c&(a^b))-7*(b^~(a&(~b|c)))+11*(c&(a|~b))-7*(b|c)+7*((b&~c)|~(~a|(~b&c)))-1*(c^(a|(~b|c)))+3*~(a&~a)+5*(c^~(a|(~b&c)))+1*(b^~(a&~c))-7*(b&~(a&c))-1*(c^~(a&(b&c)))+2*(a&~b)+11*(~b&(a^c))-1*(b|(a^c))+11*(b^~(a&c))+7*(a|(b^c))+11*(c^(a|(b&c)))-1*(c^~(~a|(~b&c)))-b-11*(~(a&b)&(b^c))-2*(a|(~b|c))+7*((a|b)&(a^(b^c)))-1*(b^(a&c))-7*(~(a&b)&~(a^(b^c)))-1*(c^(a&(b|c)))-3*(c^(~a&(~b|c)))-1*(c|(a^b))+1*~(a|(b^c))+5*(b|~(a|~c))+1*~(b|c)-6*~(b&~c)-1*(a&~c)-5*(b^(~a&(~b|c)))-11*(b^(a&~c))+7*~(a^b)+4*(~(a&~b)&(b^c))+3*(~(a^b)&~(a^c))+1*(b^(a&(b^c)))-11*(~c&~(a^b))-2*((a&c)^(a^(b&c)))+11*~(a|(b|c))+4*~(a|(~b|c))-41*~(~a|(b|c))-4*~(~a|(~b|c))-28*(~a&(~b&c))+39*(~a&(b&c))+12*(a&(~b&c))-20*(a&(b&c))-(-7*(b^(a&(~b|c)))+3*(b^(a&(b|c)))))
// a+b = b+-1*(-6*(~(a^b)&(a^c))-2*((a&c)|(b&~c))-6*(c&(a^b))-7*(b^~(a&(~b|c)))+11*(c&(a|~b))-7*(b|c)+7*((b&~c)|~(~a|(~b&c)))-1*(c^(a|(~b|c)))+3*~(a&~a)+5*(c^~(a|(~b&c)))+1*(b^~(a&~c))-7*(b&~(a&c))-1*(c^~(a&(b&c)))+2*(a&~b)+11*(~b&(a^c))-1*(b|(a^c))+11*(b^~(a&c))+7*(a|(b^c))+11*(c^(a|(b&c)))-1*(c^~(~a|(~b&c)))-11*(~(a&b)&(b^c))-2*(a|(~b|c))+7*((a|b)&(a^(b^c)))-1*(b^(a&c))-7*(~(a&b)&~(a^(b^c)))-1*(c^(a&(b|c)))-3*(c^(~a&(~b|c)))-1*(c|(a^b))+1*~(a|(b^c))+5*(b|~(a|~c))+1*~(b|c)-6*~(b&~c)-1*(a&~c)-5*(b^(~a&(~b|c)))-11*(b^(a&~c))+7*~(a^b)+4*(~(a&~b)&(b^c))+3*(~(a^b)&~(a^c))+1*(b^(a&(b^c)))-11*(~c&~(a^b))-2*((a&c)^(a^(b&c)))+11*~(a|(b|c))+4*~(a|(~b|c))-41*~(~a|(b|c))-4*~(~a|(~b|c))-28*(~a&(~b&c))+39*(~a&(b&c))+12*(a&(~b&c))-20*(a&(b&c))-(-7*(b^(a&(~b|c)))+3*(b^(a&(b|c)))))
#define ADD6(a, b, c) -2*~(~a|(~b&c))+2*(a&(~b|c))-3*(b^(~a|(~b|c)))+1*(~a|(b&c))+11*((b&c)^~(a&(b^c)))+1*(c^(a|~b))-1*((a&c)^(a^(b&c)))+11*(b^(~a|(b|c)))-16*~(a|(b|c))-7*~(a|(~b|c))-7*~(~a|(b|c))+1*b+6*~(~a|(~b|c))-20*(~a&(~b&c))-1*(~a&(b&c))-4*(a&(~b&c))+1*(a&(b&c))-5*(c^(~a|(b&c)))
// a+b = -2*~(~a|(~b&c))+2*(a&(~b|c))-3*(b^(~a|(~b|c)))+1*(~a|(b&c))+11*((b&c)^~(a&(b^c)))+1*(c^(a|~b))-1*((a&c)^(a^(b&c)))+11*(b^(~a|(b|c)))-16*~(a|(b|c))-7*~(a|(~b|c))-7*~(~a|(b|c))+1*b+6*~(~a|(~b|c))-20*(~a&(~b&c))-1*(~a&(b&c))-4*(a&(~b&c))+1*(a&(b&c))-5*(c^(~a|(b&c)))

#define IND1_1(z, t) (-6*(z^t)+7*~(z&t)-2*(z|t)+7*~z-3*~(z&~z)-7*~t-4*~(z|t)-4*~(z|~t)+12*(z&~t)+5*(z&t)+1*t)
// z = -6*(z^t)+7*~(z&t)-2*(z|t)+7*~z-3*~(z&~z)-7*~t-4*~(z|t)-4*~(z|~t)+12*(z&~t)+5*(z&t)+1*t
#define IND1_2(z, t) (4*~t+3*~(z^t)+2*~(z&~z)+5*(z|~t)+1*~z+1*~(z&t)-16*~(z|t)-15*~(z|~t)-11*(z&~t)-20*(z&t)+11*t)
// z = 4*~t+3*~(z^t)+2*~(z&~z)+5*(z|~t)+1*~z+1*~(z&t)-16*~(z|t)-15*~(z|~t)-11*(z&~t)-20*(z&t)+11*t

#define IND2_1(c, a, b) (-1*((a&b)|~(b^c))+2*(b^(~a|(b^c)))+7*~(a&(b^c))+3*(b^~(~a&(~b|c)))+7*(c^(a|b))-5*~(a|(b^c))+11*a+1*(c^~(a&(~b&c)))-3*((a&~b)|~(b^c))-1*~(a|(~b&c))+5*((b&~c)|~(~a|(~b&c)))+11*(b^(~a&(~b|c)))+5*~(a^b)+2*(c^~(a&(b|c)))+1*(~(a^b)|~(a^c))-11*(c&(a^b))+4*((b&c)^~(a&(b^c)))-5*((a&c)|~(b|c))+11*(c^~(~a&(b|c)))-1*(b^~(~a&(b|c)))+3*(~(a^b)&(a^c))-1*(~(a|~b)|(b^c))-6*(~b&~(a^c))-1*~(a|b)+1*(b^~(a|(~b&c)))-1*(~(a^b)|(a^c))+1*(a|(~b|c))-11*(b^(~a|(~b|c)))-11*~(b&~c)+2*(c&(a|~b))-6*((a&b)|~(b|c))-5*(c^~(a&(b&c)))+1*(c^~(a&~b))+1*(a&(~b|c))+3*(c^(a|(b&c)))-7*(~(a|b)|~(b^c))+4*(c^~(~a&(~b|c)))-6*((b&~c)^(a|(b^c)))+4*~(a&c)+5*(~(a|b)|~(a^(b^c)))-1*~(b|c)+9*~(a|(b|c))-39*~(a|(~b|c))-7*~(~a|(b|c))-31*(~a&(~b&c))+7*(~a&(b&c))+25*(a&(~b&c))-4*(a&(b&c))-50*~(~a|(~b|c))+1*(a|(b&c)))
// c = -1*((a&b)|~(b^c))+2*(b^(~a|(b^c)))+7*~(a&(b^c))+3*(b^~(~a&(~b|c)))+7*(c^(a|b))-5*~(a|(b^c))+11*a+1*(c^~(a&(~b&c)))-3*((a&~b)|~(b^c))-1*~(a|(~b&c))+5*((b&~c)|~(~a|(~b&c)))+11*(b^(~a&(~b|c)))+5*~(a^b)+2*(c^~(a&(b|c)))+1*(~(a^b)|~(a^c))-11*(c&(a^b))+4*((b&c)^~(a&(b^c)))-5*((a&c)|~(b|c))+11*(c^~(~a&(b|c)))-1*(b^~(~a&(b|c)))+3*(~(a^b)&(a^c))-1*(~(a|~b)|(b^c))-6*(~b&~(a^c))-1*~(a|b)+1*(b^~(a|(~b&c)))-1*(~(a^b)|(a^c))+1*(a|(~b|c))-11*(b^(~a|(~b|c)))-11*~(b&~c)+2*(c&(a|~b))-6*((a&b)|~(b|c))-5*(c^~(a&(b&c)))+1*(c^~(a&~b))+1*(a&(~b|c))+3*(c^(a|(b&c)))-7*(~(a|b)|~(b^c))+4*(c^~(~a&(~b|c)))-6*((b&~c)^(a|(b^c)))+4*~(a&c)+5*(~(a|b)|~(a^(b^c)))-1*~(b|c)+9*~(a|(b|c))-39*~(a|(~b|c))-7*~(~a|(b|c))-31*(~a&(~b&c))+7*(~a&(b&c))+25*(a&(~b&c))-4*(a&(b&c))-50*~(~a|(~b|c))+1*(a|(b&c))
#define IND2_2(b, a, c) (-6*(~a|(b&c))-1*(b^~(a|(b&c)))-7*(b^~(~a&(~b&c)))+7*(~(a|~b)|~(a^(b^c)))+1*(~(a&b)&~(a^(b^c)))-3*~(a|(~b&c))-1*(b^(a&(b^c)))-6*(b^~(a&~c))-7*(a&(b^c))+2*~(b&c)+11*(a&(~b|c))+1*(b^(a&c))-6*~(~a&(~b&c))+4*~a-11*(c^~(a&(b&c)))-11*~(a&b)+5*((b&c)|(~a&(b|c)))+3*(c^(~a&(b|c)))-1*(b^(a|(b^c)))+7*~(b|c)-5*~(~a&(b^c))-2*(b&~(a^c))-11*((b&c)|(a&(b|c)))+2*(b^(~a&(b|c)))+1*(c^~(a&b))+4*(c^(a|(b|c)))+1*(c^~(a|b))+1*((a&b)|~(b|c))-6*(c^~(a|(b&c)))+5*(b^~(a&c))+2*((b&c)^~(~a&(b^c)))-1*(~b|~(a^c))+2*(~c|~(a^b))-2*(b|c)-11*(c^~(~a&(~b|c)))+2*(c^(~a|(b|c)))+4*~(a|~c)-7*(b&c)+4*(c|(a&~b))-3*(c^~(~a&(~b&c)))+5*((a&b)|~(b|~c))-1*~c+4*(b^~(~a|(b&c)))+1*~(a|b)+24*~(a|(b|c))+30*~(a|(~b|c))+7*~(~a|(b|c))+30*~(~a|(~b|c))+1*(~a&(~b&c))+34*(~a&(b&c))+16*(a&(~b&c))+16*(a&(b&c))+7*(~b|(a^c)))
// b = -6*(~a|(b&c))-1*(b^~(a|(b&c)))-7*(b^~(~a&(~b&c)))+7*(~(a|~b)|~(a^(b^c)))+1*(~(a&b)&~(a^(b^c)))-3*~(a|(~b&c))-1*(b^(a&(b^c)))-6*(b^~(a&~c))-7*(a&(b^c))+2*~(b&c)+11*(a&(~b|c))+1*(b^(a&c))-6*~(~a&(~b&c))+4*~a-11*(c^~(a&(b&c)))-11*~(a&b)+5*((b&c)|(~a&(b|c)))+3*(c^(~a&(b|c)))-1*(b^(a|(b^c)))+7*~(b|c)-5*~(~a&(b^c))-2*(b&~(a^c))-11*((b&c)|(a&(b|c)))+2*(b^(~a&(b|c)))+1*(c^~(a&b))+4*(c^(a|(b|c)))+1*(c^~(a|b))+1*((a&b)|~(b|c))-6*(c^~(a|(b&c)))+5*(b^~(a&c))+2*((b&c)^~(~a&(b^c)))-1*(~b|~(a^c))+2*(~c|~(a^b))-2*(b|c)-11*(c^~(~a&(~b|c)))+2*(c^(~a|(b|c)))+4*~(a|~c)-7*(b&c)+4*(c|(a&~b))-3*(c^~(~a&(~b&c)))+5*((a&b)|~(b|~c))-1*~c+4*(b^~(~a|(b&c)))+1*~(a|b)+24*~(a|(b|c))+30*~(a|(~b|c))+7*~(~a|(b|c))+30*~(~a|(~b|c))+1*(~a&(~b&c))+34*(~a&(b&c))+16*(a&(~b&c))+16*(a&(b&c))+7*(~b|(a^c))


#define XOR1(a, b, c) -5*~(~a&(b|c))-6*(b&~(a&~c))+2*(~(a^b)&~(a^c))-6*(~(a&~b)&(a^(b^c)))-11*~(~a&(~b&c))+2*(b^(~a&(b^c)))+2*(c^(a&(~b|c)))-1*(c&(a^b))+1*(~c|~(a^b))+2*(b^(~a&(~b|c)))-1*((b&c)^~(~a&(b^c)))-11*(a^c)+5*((a&~b)|~(b^c))+3*(~(a^b)|~(a^c))+5*(a&~c)+2*((a^b)&~(a^c))+11*(b^(a&(~b|c)))-1*(b&~(a^c))-3*~c-2*(b^(a|(b&c)))-1*(c^~(~a&(~b&c)))-7*(b^(~a|(b&c)))-1*~(a&(b^c))+11*(c^(a&b))+7*(a|b)+4*((a&c)^(a^(b&c)))+13*~(a|(b|c))+6*~(a|(~b|c))-2*~(~a|(b|c))-10*~(~a|(~b|c))+2*(~a&(~b&c))-14*(~a&(b&c))-21*(a&(~b&c))+4*(a&(b&c))+3*(~b|(a^c))
// (a^b) = -5*~(~a&(b|c))-6*(b&~(a&~c))+2*(~(a^b)&~(a^c))-6*(~(a&~b)&(a^(b^c)))-11*~(~a&(~b&c))+2*(b^(~a&(b^c)))+2*(c^(a&(~b|c)))-1*(c&(a^b))+1*(~c|~(a^b))+2*(b^(~a&(~b|c)))-1*((b&c)^~(~a&(b^c)))-11*(a^c)+5*((a&~b)|~(b^c))+3*(~(a^b)|~(a^c))+5*(a&~c)+2*((a^b)&~(a^c))+11*(b^(a&(~b|c)))-1*(b&~(a^c))-3*~c-2*(b^(a|(b&c)))-1*(c^~(~a&(~b&c)))-7*(b^(~a|(b&c)))-1*~(a&(b^c))+11*(c^(a&b))+7*(a|b)+4*((a&c)^(a^(b&c)))+13*~(a|(b|c))+6*~(a|(~b|c))-2*~(~a|(b|c))-10*~(~a|(~b|c))+2*(~a&(~b&c))-14*(~a&(b&c))-21*(a&(~b&c))+4*(a&(b&c))+3*(~b|(a^c))

#define XOR2(a, b, c) -3*(c^(a|~b))-1*(c&(a^b))-7*(c^~(~a|(~b&c)))+11*~(~a|(b^c))+11*~(a&~c)+3*~b+4*((a&c)|~(b|c))-2*(~(a|~b)|(b^c))-11*(c^(~a&(b|c)))+4*(b&~(a&~c))-6*((a&c)^(a^(~b&c)))+2*a+1*((a&b)^~(a^(b&c)))-3*~c+7*((a^b)|~(a^c))+5*(~b&~(a^c))+1*(b^~(a|(~b&c)))-11*(a&b)+5*(c^~(a|(~b&c)))+11*((a^b)|(a^c))-5*(a|~c)-2*~(a|b)-1*(b^~(a|(b&c)))+7*(a&(b|c))+4*(b&c)+2*~(b|~c)+1*(a^c)-6*((a|~b)&(b^c))+1*((a&b)|(b^c))+1*((b&c)|(a&(b|c)))-3*((a&~b)|(b^c))+2*(b|~(a|~c))-6*(c^(~a|(~b&c)))+1*~(a^(b|c))-6*(~(a|b)|~(a^(b^c)))-12*~(a|(b|c))+26*~(~a|(~b|c))-3*(~a&(~b&c))-19*(~a&(b&c))-12*(a&(~b&c))-15*(a&(b&c))-(1*(b^(~a&(b^c)))+11*((a|b)&(a^(b^c))))
// (a^b) = -3*(c^(a|~b))-1*(c&(a^b))-7*(c^~(~a|(~b&c)))+11*~(~a|(b^c))+11*~(a&~c)+3*~b+4*((a&c)|~(b|c))-2*(~(a|~b)|(b^c))-11*(c^(~a&(b|c)))+4*(b&~(a&~c))-6*((a&c)^(a^(~b&c)))+2*a+1*((a&b)^~(a^(b&c)))-3*~c+7*((a^b)|~(a^c))+5*(~b&~(a^c))+1*(b^~(a|(~b&c)))-11*(a&b)+5*(c^~(a|(~b&c)))+11*((a^b)|(a^c))-5*(a|~c)-2*~(a|b)-1*(b^~(a|(b&c)))+7*(a&(b|c))+4*(b&c)+2*~(b|~c)+1*(a^c)-6*((a|~b)&(b^c))+1*((a&b)|(b^c))+1*((b&c)|(a&(b|c)))-3*((a&~b)|(b^c))+2*(b|~(a|~c))-6*(c^(~a|(~b&c)))+1*~(a^(b|c))-6*(~(a|b)|~(a^(b^c)))-12*~(a|(b|c))+26*~(~a|(~b|c))-3*(~a&(~b&c))-19*(~a&(b&c))-12*(a&(~b&c))-15*(a&(b&c))-(1*(b^(~a&(b^c)))+11*((a|b)&(a^(b^c))))

#define XOR3(z, t) 2*(z|t)+11*(z|~t)+7*~(z&~z)+1*~(z&t)-7*~z+11*~(z^t)-23*~(z|t)+5*~(z|~t)-19*(z&~t)-23*(z&t)-(1*z+7*t)
// (z^t) = 2*(z|t)+11*(z|~t)+7*~(z&~z)+1*~(z&t)-7*~z+11*~(z^t)-23*~(z|t)+5*~(z|~t)-19*(z&~t)-23*(z&t)-(1*z+7*t)

#define XOR4(b, c, a) -5*(b^(~a|(b|c)))-11*((a|~b)&~(b^c))+2*~(a^(~b|c))+1*(c^~(~a&(~b&c)))+1*(~(a&~b)&~(b^c))-1*(b|~(a|c))+1*(a|(~b|c))-2*(c^~(a&(b|c)))-11*(~a|(b|c))+4*~(a&(b^c))-7*((a&c)|~(b|c))+30*~(a|(b|c))+18*~(a|(~b|c))+12*~(~a|(b|c))+10*~(~a|(~b|c))+21*(~a&(~b&c))+5*(~a&(b&c))+33*(a&(~b&c))+35*(a&(b&c))-(-1*(~(a|~b)|(b^c))+11*(c^~(a|~b)))
// (b^c) = -5*(b^(~a|(b|c)))-11*((a|~b)&~(b^c))+2*~(a^(~b|c))+1*(c^~(~a&(~b&c)))+1*(~(a&~b)&~(b^c))-1*(b|~(a|c))+1*(a|(~b|c))-2*(c^~(a&(b|c)))-11*(~a|(b|c))+4*~(a&(b^c))-7*((a&c)|~(b|c))+30*~(a|(b|c))+18*~(a|(~b|c))+12*~(~a|(b|c))+10*~(~a|(~b|c))+21*(~a&(~b&c))+5*(~a&(b&c))+33*(a&(~b&c))+35*(a&(b&c))-(-1*(~(a|~b)|(b^c))+11*(c^~(a|~b)))

#define XOR5(b, c, a) 1*(c^(a|(b&c)))+11*(c^(~a&(~b|c)))-2*(a|(~b&c))-1*(b^(a&~c))+2*(b&(a^c))-1*(b^(~a&(b^c)))+1*((a&b)|(b^c))+2*(c&~(a&~b))-6*(~(a^b)&~(a^c))-2*(a|(~b|c))-5*(c&(a^b))-1*(~a|(b^c))+5*(c|(a&~b))-2*(b^~(a&(~b&c)))-7*~(a^(b&c))-2*(b|(a&c))+1*((a&b)|(a^(b^c)))-6*(~(a&b)&~(b^c))-1*(b^(a&(b^c)))+3*(c^~(~a&(~b|c)))+2*(c^~(a&(~b&c)))-6*(c|~(a|~b))-2*((a|~b)&~(b^c))-6*(c^~(a&(~b|c)))-1*(b|c)+2*((a|b)&(a^(b^c)))-11*(c^~(~a|(b&c)))+2*((a&~b)|(a^(b^c)))+4*(b|~(a^c))+2*~(b^c)-3*((a&~b)|~(a^(b^c)))-6*(c^~(~a|(~b&c)))+1*(c&~(a&b))-2*((a&b)|~(a^(b^c)))-3*~(~a&(~b&c))+5*((b&c)^~(a&(b^c)))+2*((b&~c)|~(~a|(~b&c)))+1*(c^(~a|(~b&c)))-5*((a&c)^~(a^(b&c)))+1*(~(a|~b)|~(a^(b^c)))+2*~(b&c)+24*~(a|(b|c))+8*~(a|(~b|c))+14*~(~a|(b|c))+29*~(~a|(~b|c))+22*(~a&(~b&c))+34*(~a&(b&c))+17*(a&(~b&c))+20*(a&(b&c))-(7*(~c&~(a^b))+3*((a^b)&(a^c)))
// (b^c) = 1*(c^(a|(b&c)))+11*(c^(~a&(~b|c)))-2*(a|(~b&c))-1*(b^(a&~c))+2*(b&(a^c))-1*(b^(~a&(b^c)))+1*((a&b)|(b^c))+2*(c&~(a&~b))-6*(~(a^b)&~(a^c))-2*(a|(~b|c))-5*(c&(a^b))-1*(~a|(b^c))+5*(c|(a&~b))-2*(b^~(a&(~b&c)))-7*~(a^(b&c))-2*(b|(a&c))+1*((a&b)|(a^(b^c)))-6*(~(a&b)&~(b^c))-1*(b^(a&(b^c)))+3*(c^~(~a&(~b|c)))+2*(c^~(a&(~b&c)))-6*(c|~(a|~b))-2*((a|~b)&~(b^c))-6*(c^~(a&(~b|c)))-1*(b|c)+2*((a|b)&(a^(b^c)))-11*(c^~(~a|(b&c)))+2*((a&~b)|(a^(b^c)))+4*(b|~(a^c))+2*~(b^c)-3*((a&~b)|~(a^(b^c)))-6*(c^~(~a|(~b&c)))+1*(c&~(a&b))-2*((a&b)|~(a^(b^c)))-3*~(~a&(~b&c))+5*((b&c)^~(a&(b^c)))+2*((b&~c)|~(~a|(~b&c)))+1*(c^(~a|(~b&c)))-5*((a&c)^~(a^(b&c)))+1*(~(a|~b)|~(a^(b^c)))+2*~(b&c)+24*~(a|(b|c))+8*~(a|(~b|c))+14*~(~a|(b|c))+29*~(~a|(~b|c))+22*(~a&(~b&c))+34*(~a&(b&c))+17*(a&(~b&c))+20*(a&(b&c))-(7*(~c&~(a^b))+3*((a^b)&(a^c)))

#else
#endif

#if 0
// uint32_t ttt1 = 0xdeadbeef;
// uint32_t ttt2 = 0x12345678;
// uint32_t ttt2 = 0xdeadbeef;
//uint64_t ttt1 = 0xfffffffffc81d107;
//uint64_t ttt2 = 4294967295;
//    // int64_t ttt1 = -1, ttt2=-1;
//    int64_t a1 = -1, a2=0xfffffffffc81d107, a3=0xfffffffffc81d107;
//
//void test() {
////    uint32_t c = 0xdeadbeef;
//    uint64_t a, b, c;
//    uint64_t t0, t1, t2, t3;
////    scanf("%u %u %u", &a, &b, &c);
////    c = IND2(c, RAND_1, RAND_2);
//    // c = XOR3(ttt1, ttt2);
//    c = ADD5(ttt1, ttt2, RAND_1_1);
//    // c = IND4_1(ttt1, a, b) - IND4_2(ttt2, t0, t3);
//    // c = SUB1(ttt1, ttt2);
//    printf("0x%llx\n", c);
//    printf("0x%llx\n", ttt1+ttt2);
//}
#endif


#endif // MBA_H
