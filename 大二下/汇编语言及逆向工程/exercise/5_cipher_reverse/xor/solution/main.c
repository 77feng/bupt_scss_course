#include<stdio.h>

int main(){
  char token[11]="abcdefg123";
  unsigned char ciphertext[]={0x28,0x3d,0x24,0x54,0x0a,0x12,0x38,0x7a,0x57,0x4a};

  char result[11];
  int i;
  for(i=0;i<10;++i){
    result[i]= token[i]^ciphertext[i];
    }
  result[i]='\0';

  printf("result is:%s\n",result);
  getchar();

  return 0;
}
