#ifndef MD5_H
#define MD5_H

#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include<stddef.h>

#define GROUP_SIZE 64
#define MAX_SIZE 1024

unsigned int const S[16];
unsigned int const T[64];

unsigned int ROTATE_LEFT(unsigned int x, unsigned int n);
unsigned int F(unsigned int X, unsigned int Y, unsigned int Z);
unsigned int G(unsigned int X, unsigned int Y, unsigned int Z);
unsigned int H(unsigned int X, unsigned int Y, unsigned int Z);
unsigned int I(unsigned int X, unsigned int Y, unsigned int Z);

void FF(unsigned int *a,unsigned int b,unsigned int c,unsigned int d,unsigned int m,unsigned int const t,unsigned int s);
void GG(unsigned int *a,unsigned int b,unsigned int c,unsigned int d,unsigned int m,unsigned int const t,unsigned int s);
void HH(unsigned int *a,unsigned int b,unsigned int c,unsigned int d,unsigned int m,unsigned int const t,unsigned int s);
void II(unsigned int *a,unsigned int b,unsigned int c,unsigned int d,unsigned int m,unsigned int const t,unsigned int s);
unsigned int shift(unsigned int a);

void md5_init(unsigned int *A,unsigned int *B,unsigned int *C,unsigned int *D);
size_t md5_update(char **out, char const *input, size_t inLen);
void md5_transform(unsigned int *out,  char *input);
void data_round(unsigned int *a, unsigned int *b, unsigned int *c, unsigned int *d, unsigned int const *m);
void md5_calc(char *out, char const *input, size_t inLen);

#endif
