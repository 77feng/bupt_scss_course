#include<stdio.h>
#include<string.h>

int main(){
   char check[] = "GMBH|Xfmd1nf`u1`uif`xpsme`pg`Sfwfstf~";
   char flag[40] = {0};

   for(int i=0; i<strlen(check); i++)
        flag[i]= check[i]-1;

   printf("解出的flag如下\n%s\n", flag);
   return 0;
}
