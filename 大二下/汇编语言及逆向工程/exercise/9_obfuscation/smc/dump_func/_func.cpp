#include <stdio.h>
#include <stdlib.h>

int temp_func(char *flag){
    if(flag[0] != 's')
        return 1;
    else if (flag[1] != 'm')
        return 1;
    else if (flag[2] != 'i')
        return 1;
    else if (flag[3] != 'l')
        return 1;
    else if (flag[4] != 'e')
        return 1;
    else
        return 0;
};

int main() {
    int result;
    char flag[] ="smile";

    printf("anchor-1\n");
    result = temp_func(flag);
    printf("anchor-2\n");


    if(result)
        puts("Please try again...\n");
    else
        puts("Congratulations!\n");

    system("pause");
    return 0;
}
