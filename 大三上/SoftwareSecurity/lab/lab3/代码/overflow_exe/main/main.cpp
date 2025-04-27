#include <stdio.h>
#include <windows.h>
#include <string>
#define PASSWORD "1234567"
int verify_password (char *password)
{
	int authenticated;
	char buffer[44];
	authenticated=strcmp(password,PASSWORD);
	strcpy(buffer,password);//over flowed here!	
	return authenticated;
}
main()
{
	int valid_flag=0;
	char password[1024];
	FILE * fp;
	LoadLibrary("user32.dll");//prepare for messagebox
	if(!(fp=fopen("password.txt","rw+")))
	{
		exit(0);
	}
	fscanf(fp,"%s",password);
	valid_flag = verify_password(password);
	if(valid_flag)
	{
		printf("incorrect password!\n");
	}
	else
	{
		printf("Congratulation! You have passed the verification!\n");
	}
	fclose(fp);
}