#include <stdio.h>
#include <string>
#define PASSWORD "1234567"

int verify_password (char *password)
{
	int authenticated;
	char buffer[8];// add local buff
	authenticated=strcmp(password,PASSWORD);
	strcpy(buffer,password);//over flowed here!	
	return authenticated;
}


main()
{
	int valid_flag=0;
	char password[1024];
	while(1)
	{
		printf("please input password:       ");
		
		scanf("%s",password);
		
		valid_flag = verify_password(password);
		
		if(valid_flag)
		{
			printf("incorrect password!\n\n");
		}
		else
		{
			printf("Congratulation! You have passed the verification!\n");
			break;
		}
	}
}
