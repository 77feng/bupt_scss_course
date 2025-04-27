#include <errno.h>
#include <stdio.h>
#include <string.h>

typedef int errno_t; // 手动定义 errno_t 为 int

// 安全strcpy函数定义
errno_t strcpy_s(char *restrict s1, size_t s1max, const char *restrict s2) {
  if (s1 == NULL || s2 == NULL) {
    return EINVAL;  // 无效的参数
  }
  if (s1max == 0) {
    return ERANGE;  // 缓冲区大小无效
  }

  size_t src_len = strlen(s2);

  if (src_len >= s1max) {
    s1[0] = '\0'; // 清空目标缓冲区
    return ERANGE;  // 缓冲区过小
  }

  // 复制字符串并确保以 \0 结尾
  for (size_t i = 0; i <= src_len; ++i) {
    s1[i] = s2[i];
  }

  return 0; // 成功复制
}

// 测试函数
void test_strcpy_s() {

  char dest[10]; // 目标缓冲区
  errno_t result;
  
  // 成功测试
  const char *source1 = "Hello"; // 合适的长度
  
  result = strcpy_s(dest, sizeof(dest), source1);
  
  printf("test1:\n");
  printf("source is %s\n", source1);
  
  if (result == 0 && strcmp(dest, source1) == 0) {
    printf("Success!\n");
  } 
  else {
    printf("Error：%d, ", result);
    
    if (result == 34) printf("ERANGE\n");
    else if (result == 22) printf("EINVAL\n");
  }
  
  printf("\n");
  
  
  //错误测试 - 无界的字符串 
  const char *source2 = "01234567890123456789bupt"; // 无界的字符串
  
  result = strcpy_s(dest, sizeof(dest), source2);
  
  printf("test2:\n");
  printf("source is %s\n", source2);
  
  printf("Error：%d, ", result);
  
  if (result == 34) printf("ERANGE\n");
  else if (result == 22) printf("EINVAL\n");
  
  printf("\n");
  
  
  //错误测试 - 空结尾的字符串 
  const char *source3 = "0123456789";
  
  result = strcpy_s(dest, sizeof(dest), source3);
  
  printf("test3:\n");
  printf("source is %s\n", source3);
  
  printf("Error：%d, ", result);
  
  if (result == 34) printf("ERANGE\n");
  else if (result == 22) printf("EINVAL\n");
  
  printf("\n");
  

  //错误测试 - 意外截断字符串 
  const char *source4 = "0123456789buptbupt"; 
  
  result = strcpy_s(dest, sizeof(dest), source4);
  
  printf("test4:\n");
  printf("source is %s\n", source4);
  
  printf("Error：%d, ", result);
  
  if (result == 34) printf("ERANGE\n");
  else if (result == 22) printf("EINVAL");
  
  printf("\n");
  
  
  //错误测试 - 过长的字符串 
  const char *source5 = "buptbuptbuptbuptbupt"; 
  
  result = strcpy_s(dest, sizeof(dest), source4);
  
  printf("test5:\n");
  printf("source is %s\n", source5);
  
  printf("Error：%d, ", result);
  
  if (result == 34) printf("ERANGE\n");
  else if (result == 22) printf("EINVAL\n");
  
  printf("\n");
  

  //错误测试 - 源字符串为 NULL
  result = strcpy_s(dest, sizeof(dest), NULL);
  
  printf("test6:\n");
  printf("source is %s\n", NULL);
  
  printf("Error：%d, ", result);
  
  if (result == 34) printf("ERANGE\n");
  else if (result == 22) printf("EINVAL\n");


}

int main() {
  test_strcpy_s(); // 运行所有测试用例
  return 0;
}
