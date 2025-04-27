#include <stdio.h>
#include <stdarg.h>
#include <string.h>

// 辅助函数：将字符串复制到缓冲区，并检查缓冲区是否足够大
int copy_to_buffer(char* buffer, size_t* index, size_t sizeOfBuffer, const char* str) {
    size_t len = strlen(str);  // 获取字符串长度
    if (*index + len < sizeOfBuffer) {
        // 如果缓冲区足够大，将字符串复制到缓冲区
        memcpy(buffer + *index, str, len);
        *index += len;  // 更新写入位置
        return 0;
    }
    return -1;  // 缓冲区不足，返回错误
}

// 自定义 sprintf_s 函数，实现简单的格式化输出
int my_sprintf_s(char* buffer, size_t sizeOfBuffer, const char* format, ...) {
    if (buffer == NULL || sizeOfBuffer == 0) {
        // 参数无效，返回错误
        return -1;
    }

    va_list args;
    va_start(args, format);  // 初始化 va_list
    size_t i = 0;  // 记录写入字符的位置

    // 遍历格式化字符串
    while (*format != '\0') {
        if (*format != '%' && i < sizeOfBuffer - 1) {
            // 处理普通字符，直接复制到缓冲区
            buffer[i++] = *format;
        }
        else if (*format == '%' && *(format + 1) == 's') {
            // 处理 %s 格式符
            const char* str = va_arg(args, const char*);  // 获取下一个参数（字符串）
            if (str == "-1") {
                // 如果字符串参数为"-1"，返回错误
                va_end(args);
                return -1;
            }
            if (str == NULL || copy_to_buffer(buffer, &i, sizeOfBuffer, str) != 0) {
                // 如果字符串为空或者缓冲区不足，返回错误
                va_end(args);
                return -1;
            }
            format++;  // 跳过 '%s'
        }
        else if (*format == '%' && *(format + 1) == 'd') {
            // 处理 %d 格式符
            long int num = va_arg(args, long int);  // 获取下一个参数（整数）
            char str[200];
            sprintf_s(str, sizeof(str), "%d", num);  // 将整数转换为字符串
            if (copy_to_buffer(buffer, &i, sizeOfBuffer, str) != 0) {
                // 如果缓冲区不足，返回错误
                va_end(args);
                return -1;
            }
            format++;  // 跳过 '%d'
        }
        else {
            // 处理未知的格式符，返回错误
            va_end(args);
            return -1;
        }

        ++format;  // 继续处理下一个字符
    }

    // 在字符串末尾添加终止符
    if (i < sizeOfBuffer) {
        buffer[i] = '\0';
    } else {
        // 缓冲区不足，返回错误
        va_end(args);
        return -1;
    }

    va_end(args);  // 清理 va_list
    return i;  // 返回写入的字符数（不包括终止符）
}

int main() {
    char buffer[20];

    // 示例 1: 正常输出
    printf("Normal output example:\n");
    int result = my_sprintf_s(buffer, sizeof(buffer), "BUPT, %s%d!", "SCSS, ", 1111, "-1");
    if (result >= 0) {
        printf("Formatted string: %s\n", buffer);
    } else {
        printf("Error occurred: %d\n", result);
    }

    // 示例 2: 缓冲区溢出示例
    printf("Example of Scalable Buffer:\n");
    result = my_sprintf_s(buffer, sizeof(buffer), "BUUUUUUUUUUUUUUUUUUUUUUUUUPPPPPPPPPTTTTTTTTTTTTTT, %s%d!", "SCSS, ", 11111, "-1");
    if (result >= 0) {
        printf("Formatted string: %s\n", buffer);
    } else {
        printf("Error occurred: %d\n", result);
    }

    // 示例 3: 查看堆栈内容
    printf("Example of viewing stack content:\n");
    result = my_sprintf_s(buffer, sizeof(buffer), "BUPT, %s%d%s%s%s!", "SCSS, ", 11111, "-1");
    if (result >= 0) {
        printf("Formatted string: %s\n", buffer);
    } else {
        printf("Error occurred: %d\n", result);
    }

    // 示例 4: 内存覆盖示例
    printf("Memory Overwrite Example:\n");
    result = my_sprintf_s(buffer, sizeof(buffer), "BUPT, %s%d%s!", "SCSS, ", 11111, "Memory Overwrite Memory Overwrite Memory Overwrite", "-1");
    if (result >= 0) {
        printf("Formatted string: %s\n", buffer);
    } else {
        printf("Error occurred: %d\n", result);
    }

    return 0;
}
