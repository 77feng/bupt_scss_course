#include <stdio.h>
#include <stdlib.h>

void __attribute__((__stdcall__)) no_params(){
    char str[] = "------ 暑假到了，真开心 ^_^ ------\n";

    puts(str);
    /* 编译器的编译选项设置里添加 -masm=intel，指示使用 intel汇编语法*/
    asm(
        "xor eax, eax;"
        "jz __label;"
        "ret 0xA;" // 添加字节码; 返回后将栈顶压缩 10字节
        );

    asm("__label:"); // 添加跳转的 label
    puts("------ 嗯......考试也快到了 ------\n");
};


int  main(){
    no_params();

    system("pause");
    return 0;
}
