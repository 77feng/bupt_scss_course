#include <stdio.h>
#include <stdlib.h>
#include <windows.h>
#include <tchar.h>
#include <string>
#include <atlbase.h>

typedef int ( WINAPI* pWriteFile )( HANDLE hFile, LPCVOID lpBuffer, DWORD nNumberOfBytesToWrite, LPDWORD lpNumberOfBytesWritten,LPOVERLAPPED lpOverlapped ); // 声明函数指针
pWriteFile p_WriteFile = 0;

int WINAPI MyWriteFile( HANDLE hFile, LPCVOID lpBuffer, DWORD nNumberOfBytesToWrite, LPDWORD lpNumberOfBytesWritten,LPOVERLAPPED lpOverlapped )
{
    char hook_buffer[] = {"Ooops! Here you are, the WIN IAT Hook!"};
    printf("\nNo pwd will be written, but: %s\n\n", hook_buffer);

    return p_WriteFile(hFile, hook_buffer, sizeof(hook_buffer), lpNumberOfBytesWritten, lpOverlapped);
}

BOOL IATHook(HMODULE hModule, LPCTSTR pImageName, LPCVOID pTargetFuncAddr, LPCVOID pReplaceFuncAddr )
{
    IMAGE_DOS_HEADER* pImgDosHdr = ( IMAGE_DOS_HEADER* )hModule;
    IMAGE_OPTIONAL_HEADER* pImgOptHdr = ( IMAGE_OPTIONAL_HEADER* )( ( DWORD )hModule + pImgDosHdr->e_lfanew + 24 );
    IMAGE_IMPORT_DESCRIPTOR* pImgImportDes = ( IMAGE_IMPORT_DESCRIPTOR* )( ( DWORD )hModule + pImgOptHdr->DataDirectory[IMAGE_DIRECTORY_ENTRY_IMPORT].VirtualAddress );
    IMAGE_THUNK_DATA* pImgThunkData = NULL;

    std::string TargetLibraryName;

    DWORD Value = 0;
    DWORD OldProtect = 0;
    DWORD NewProtect = 0;
    LPDWORD FuncAddress = NULL;

    while ( pImgImportDes->Characteristics != 0 )
    {
        USES_CONVERSION;
        LPCTSTR lpszName =  ( ( LPCSTR )( DWORD )hModule + pImgImportDes->Name ) ;
        TargetLibraryName = lpszName;
        if ( TargetLibraryName.compare( pImageName ) == 0 ) // 定位PE文件中导入的动态链接库
        {
            pImgThunkData = ( IMAGE_THUNK_DATA* )( ( DWORD )hModule + pImgImportDes->FirstThunk ); // 定位PE文件中 IAT 的 RVA内存地址
            break;
        }
        pImgImportDes++;
    }
    if ( pImgThunkData == NULL )
    {
        return FALSE;
    }

    while ( pImgThunkData->u1.Function )
    {
        FuncAddress = ( LPDWORD ) & ( pImgThunkData->u1.Function );
        if ( *FuncAddress == ( DWORD )pTargetFuncAddr ) // 判断是否为目标函数（地址）
        {
            VirtualProtect( FuncAddress, sizeof( DWORD ), PAGE_READWRITE, &OldProtect ); // 修改IAT表的可读可写属性
            if ( !WriteProcessMemory( ( HANDLE ) - 1, FuncAddress, &pReplaceFuncAddr, 4, NULL ) ) // 替换目标函数的地址为自定义的函数
            {
                return FALSE;
            }
            VirtualProtect( FuncAddress, sizeof( DWORD ), OldProtect, 0 ); // 恢复IAT表的可读可写属性
            return TRUE;
        }
        pImgThunkData++;
    }
    return FALSE;
}

BOOL Hook(HMODULE hModule,LPCTSTR pImageName,LPCSTR pTargetFuncName)
{
    HMODULE hLib = LoadLibrary( pImageName ); // 动态加载PE文件
    if ( NULL != hLib )
    {
        p_WriteFile = ( pWriteFile )GetProcAddress( hLib, pTargetFuncName );  // 获得WriteFile的函数地址
        BOOL bRet = IATHook( hModule, pImageName, p_WriteFile, MyWriteFile ); // 基于 IAT Hook，对WriteFile函数执行钩取

        FreeLibrary( hLib );
        return bRet;
    }

    return FALSE;
}

int main()
{
    char buffer[11];
    DWORD bytesWritten;

    HANDLE fh = CreateFile("pwd.txt", GENERIC_WRITE, 0, NULL, OPEN_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL);


    if(fh == INVALID_HANDLE_VALUE)  // 判断文件是否创建成功
    {
        printf("File handle is not opened for \"pwd.txt\".\n");
        system("Pause");
        exit(EXIT_FAILURE);
    }
    else
    {
        printf("File handle is opened for \"pwd.txt\" successfully.\n\n");
    }

    printf("Please enter your password(no more than 10 letters):\n");
    for(int i = 0; i<10; i++) // 没有用 scanf，防止溢出
    {
        buffer[i] = getchar();
        if(buffer[i] == 10)
            break;
    }
    buffer[i] = '\0'; // 截断字符串
    printf("The pwd that you just specify is: %s\n", buffer);

    Hook( GetModuleHandle( NULL ), _T( "KERNEL32.dll" ), ( "WriteFile" ) ); // 使用 IAT Hook 钩取 WriteFile 函数
    WriteFile(fh, buffer, sizeof(buffer), &bytesWritten, NULL);

    system("Pause");
    return 0;
}


