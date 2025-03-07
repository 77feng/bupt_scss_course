/*
   通过对密文进行二次加密，直接求解出明文
*/

#include<stdio.h>
#include<string.h>

int new_key_a = 9;   // 为key_a = 3 的逆元
int new_key_b = 15;  // 为(-key_b * new_key_a) mod 26; 其中，key_b = 7

char array[] = "qxbxpluxvwhuzjct"; // 原来的密文 (位于 0x00403008)

int main()
{
    printf("Given the ciphertext: \"%s\", ", array); // 打印出密文

    int temp;
    for(int i=0; i<strlen(array); ++i){ // 使用 new_key_a 和 new_key_b 对密文进行仿射加密
        temp = array[i] - 'a';
        temp = (temp * new_key_a + new_key_b) % 26;
        array[i] = temp + 'a';
    }
    printf("we found the following plaintext (i.e., the flag): \n%s\n\n", array); // 打印出得到的明文

	system("pause");
	return 0;
}
