#include "mba.h"

void encrypt(uint32_t *d) {
    uint64_t obfvar1, obfvar2;
    register uint64_t x0, x1, t0, t1, ul, tmp;
    x0 = d[0];
    x1 = d[1];


    // uint32_t *p = keys;
    // for (int _=0; _<ROUND; _++) {
    //     uint64_t k1=*p++, k2=*p++, k3=*p++, k4=*p++, k5=*p++, k6=*p++;
    //     // x0 = ADD1(x0, k1);
    //     // // x0 = x0+ k1;
    //     // idea_mul(x1, x1, k2, ul);
    //     // x0 = x0 & MASK;
    //     // x1 = x1 & MASK;
    //     // IN(tmp, x0, x1, t0, t1, ul, k3, k4, k5, k6)
    //     // x0 ^= tmp;
    //     // x1 ^= tmp;
    //    ROUNDDD(x0, x1, t0, t1, ul, tmp, k1,k2,k3,k4,k5,k6)
    // }
    ROUNDDD(1, x0, x1, t0, t1, ul, tmp, KEY_0,KEY_1,KEY_2,KEY_3,KEY_4,KEY_5)
    ROUNDDD(2, x0, x1, t0, t1, ul, tmp, KEY_6,KEY_7,KEY_8,KEY_9,KEY_10,KEY_11)
    ROUNDDD(3, x0, x1, t0, t1, ul, tmp, KEY_12,KEY_13,KEY_14,KEY_15,KEY_16,KEY_17)
    ROUNDDD(4, x0, x1, t0, t1, ul, tmp, KEY_18,KEY_19,KEY_20,KEY_21,KEY_22,KEY_23)
    ROUNDDD(5, x0, x1, t0, t1, ul, tmp, KEY_24,KEY_25,KEY_26,KEY_27,KEY_28,KEY_29)
    ROUNDDD(6, x0, x1, t0, t1, ul, tmp, KEY_30,KEY_31,KEY_32,KEY_33,KEY_34,KEY_35)
    ROUNDDD(7, x0, x1, t0, t1, ul, tmp, KEY_36,KEY_37,KEY_38,KEY_39,KEY_40,KEY_41)
    ROUNDDD(8, x0, x1, t0, t1, ul, tmp, KEY_42,KEY_43,KEY_44,KEY_45,KEY_46,KEY_47)
    ROUNDDD(9, x0, x1, t0, t1, ul, tmp, KEY_48,KEY_49,KEY_50,KEY_51,KEY_52,KEY_53)
    ROUNDDD(10, x0, x1, t0, t1, ul, tmp, KEY_54,KEY_55,KEY_56,KEY_57,KEY_58,KEY_59)

    d[0] = x0;
    d[1] = x1;
}

// void decrypt(uint32_t *d) {
//     uint64_t obfvar1, obfvar2;
//     register uint64_t x0, x1, t0, t1, ul, tmp;
//     x0 = d[0];
//     x1 = d[1];
//     uint32_t *p = keys_inv+ROUND*6-1;
// //    uint32_t k1, k2;
//
//
//     for (int _=0; _<ROUND; _++) {
//     uint64_t k6=*p--, k5=*p--,k4=*p--,k3=*p--,k2=*p--,k1=*p--;
//         IN(_, tmp, x0, x1, t0, t1, ul, k3,k4,k5,k6)
//         x0 ^= tmp;
//         x1 ^= tmp;
//
//         x0 = x0 & MASK;
//         x1 = x1 & MASK;
//
//         x0 = (x0 - k1) & MASK;
//         idea_mul(_, x1, x1, k2, ul);
//     }
//
//     d[0] = x0;
//     d[1] = x1;
// }

// int main() {
//
//     uint32_t a[] = {
//             0x12345678,
//             0xdeadbeef
//     };
//
//         encrypt(a);
//         printf("%llx\t%llx\n", a[0], a[1]);
//         // decrypt(a);
//         // printf("%llx\t%llx\n", a[0], a[1]);
//     test();
// }
