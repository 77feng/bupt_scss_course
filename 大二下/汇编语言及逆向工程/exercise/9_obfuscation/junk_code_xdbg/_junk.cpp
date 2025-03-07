#include <stdio.h>
#include <stdlib.h>

int main(){

    puts("------ 暑假到了，真开心 ^_^ ------\n");

    /* 编译器的编译选项设置里添加 -masm=intel，指示使用 intel汇编语法*/

    // #1 --> CALL 指令混淆
    asm(
        "xor eax, eax;"
        "jz  __label;"  // jz直接跳转到__label，不会执行下一个jnz指令

        "jnz __labelX;" // 动态分析时，实际不会执行此语句;给静态分析增加迷惑性
        "__labelX:;"
        ".byte 0xE8;"   // 添加字节码; E8 对应的汇编指令为 call
        );

    asm("__label:"); // 添加跳转的 label
    puts("------ 嗯......考试也快到了 ------\n");

    system("pause");
    return 0;
}
