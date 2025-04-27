#include<stdio.h>
#include<stdlib.h>
#include<string.h>

// ²é¿´Õ»ÄÚÈİ

int main(){

	__asm int 3
	char format[32];
	strcpy(format,"%08x.%08x.%08x.%08x");
	printf(format,1,2,3);
	return 0;
}


