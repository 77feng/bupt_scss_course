#include <stdio.h>
#include <stdlib.h>

int main(){

    puts("------ 暑假到了，真开心 ^_^ ------\n");

    /* 编译器的编译选项设置里添加 -masm=intel，指示使用 intel汇编语法*/

    // #1 --> CALL 指令混淆
    asm(
        "xor eax, eax;"
        "jz __label;"
        "add esp, 0x48;" // 添加字节码; 减少72字节的栈空间
        );

    asm("__label:"); // 添加跳转的 label
    puts("------ 嗯......考试也快到了 ------\n");

    system("pause");
    return 0;
}
