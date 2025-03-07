#include <stdio.h>
#include <stdlib.h>
#include <windows.h>

int main(){

	int a =0, b =100876, c =0;

	__try{
		c = b / a;  //触发整数除零异常
	}
	__except(EXCEPTION_EXECUTE_HANDLER){
		MessageBox( NULL, TEXT("Some integer is divide by zero."),
                    TEXT("ERROR"), MB_OK );

		a =1;      //修正错误
		c = b / a;
	}

	printf("b / a = %d, by correcting a=%d\n\n", c, a);

	system("pause");
	return 0;
}

