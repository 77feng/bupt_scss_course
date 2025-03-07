#include<iostream>
#include<windows.h>
#include<stdlib.h>
#include<stdio.h>

using namespace std;

char dll[] = "O:\\BUPT-SCSS\\Courses_and_research\\ASM_and_Reverse_Engineering\\Programs\\C_C++\\8_hook\\_mines_sweeping\\Hook_mines_sweeping_helper\\INJECTION\\bin\\Release\\INJECTION.dll";

HWND hWnd;
HANDLE hWinmine;

HANDLE RtlCreateUserThread(
	LPVOID lpBaseAddress,
	LPVOID lpSpace
)
{
	//The prototype of RtlCreateUserThread from undocumented.ntinternals.com
	typedef DWORD(WINAPI * functypeRtlCreateUserThread)(
		HANDLE      ProcessHandle,
		PSECURITY_DESCRIPTOR  SecurityDescriptor,
		BOOL      CreateSuspended,
		ULONG     StackZeroBits,
		PULONG     StackReserved,
		PULONG     StackCommit,
		LPVOID     StartAddress,
		LPVOID     StartParameter,
		HANDLE      ThreadHandle,
		LPVOID     ClientID
		);

	//Get handle for ntdll which contains RtlCreateUserThread
	HANDLE hRemoteThread = NULL;
	HMODULE hNtDllModule = GetModuleHandle("ntdll.dll");
	if (hNtDllModule == NULL)
	{
		return NULL;
	}

	functypeRtlCreateUserThread funcRtlCreateUserThread = (functypeRtlCreateUserThread)GetProcAddress(hNtDllModule, "RtlCreateUserThread");
	if (!funcRtlCreateUserThread)
	{
		return NULL;
	}

	funcRtlCreateUserThread(hWinmine, NULL, 0, 0, 0, 0, lpBaseAddress, lpSpace, &hRemoteThread, NULL);
	return hRemoteThread;
}

HANDLE NtCreateThreadEx(
	LPVOID lpBaseAddress,
	LPVOID lpSpace
)
{
	//The prototype of NtCreateThreadEx from undocumented.ntinternals.com
	typedef DWORD(WINAPI * functypeNtCreateThreadEx)(
		PHANDLE                 ThreadHandle,
		ACCESS_MASK             DesiredAccess,
		LPVOID                  ObjectAttributes,
		HANDLE                  ProcessHandle,
		LPTHREAD_START_ROUTINE  lpStartAddress,
		LPVOID                  lpParameter,
		BOOL                    CreateSuspended,
		DWORD                   dwStackSize,
		DWORD                   Unknown1,
		DWORD                   Unknown2,
		LPVOID                  Unknown3
		);
	HANDLE                      hRemoteThread = NULL;
	HMODULE                     hNtDllModule = NULL;
	functypeNtCreateThreadEx    funcNtCreateThreadEx = NULL;

	//Get handle for ntdll which contains NtCreateThreadEx
	hNtDllModule = GetModuleHandle("ntdll.dll");
	if (hNtDllModule == NULL)
	{
		return NULL;
	}

	funcNtCreateThreadEx = (functypeNtCreateThreadEx)GetProcAddress(hNtDllModule, "NtCreateThreadEx");
	if (!funcNtCreateThreadEx)
	{
		return NULL;
	}

	funcNtCreateThreadEx(&hRemoteThread, GENERIC_ALL, NULL, hWinmine, (LPTHREAD_START_ROUTINE)lpBaseAddress, lpSpace, FALSE, 0, 0, 0, NULL);
	return hRemoteThread;
}

int injectIntoPID(int method)
{
	//Gets the PID handle for the target process
	hWnd = FindWindowW(NULL, L"扫雷");
	DWORD pid;
	GetWindowThreadProcessId(hWnd, &pid);
	hWinmine = OpenProcess(PROCESS_ALL_ACCESS, FALSE, pid);

	if (hWinmine == NULL)
	{
		puts("Could not find PID");
		return -1;
	}

	//Retrieves kernel32.dll module handle for getting loadlibrary base address
	HMODULE hModule = GetModuleHandle("kernel32.dll");

	//Gets address for LoadLibraryA in kernel32.dll
	LPVOID lpBaseAddress = (LPVOID)GetProcAddress(hModule, "LoadLibraryA");
	if (lpBaseAddress == NULL)
	{
		puts("Unable to locate LoadLibraryA");
		return -1;
	}

	//Allocates space inside for inject.dll to our target process
	LPVOID lpSpace = (LPVOID)VirtualAllocEx(hWinmine, NULL, strlen(dll), MEM_RESERVE | MEM_COMMIT, PAGE_READWRITE);
	if (lpSpace == NULL)
	{
		cout << "Could not allocate memory in process: " << pid << endl;
		return -1;
	}

	//Write inject.dll to memory of PID
	int n = WriteProcessMemory(hWinmine, lpSpace, dll, strlen(dll), NULL);
	if (n == 0)
	{
		puts("Could not write to process's address space");
		return -1;
	}

	HANDLE hThread;
	switch (method)
	{
	case 1:
		hThread = NtCreateThreadEx(lpBaseAddress, lpSpace);
		break;
	case 2:
		hThread = RtlCreateUserThread(lpBaseAddress, lpSpace);
		break;
	default:
		hThread = CreateRemoteThread(hWinmine, NULL, 0, (LPTHREAD_START_ROUTINE)lpBaseAddress, lpSpace, 0, nullptr);
	}

	if (hThread == NULL)
	{
	    puts("DLL injection failed");
		return -1;
	}
	else
	{
		DWORD threadId = GetThreadId(hThread);
		cout<< "Injected thread id: " << threadId << "for pid: " << pid << endl;

		CloseHandle(hWinmine);
	}

    return 0;
}

int main(int argc, char* argv[])
{
	int method;

	puts("Which method? (0 (default): CRT, 1: NtCreateThread, 2: RtlCreateUserThread)");
	scanf("%u", &method);

	int result = injectIntoPID(method);
	if (result == -1)
	{
		puts("Could not inject into PID");
	}

	system("pause");
	return 0;
}
