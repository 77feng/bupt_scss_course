	.file	"helper.cpp"
	.intel_syntax noprefix
	.text
	.section	.text$_ZNKSt5ctypeIcE8do_widenEc,"x"
	.linkonce discard
	.align 2
	.p2align 2,,3
	.globl	__ZNKSt5ctypeIcE8do_widenEc
	.def	__ZNKSt5ctypeIcE8do_widenEc;	.scl	2;	.type	32;	.endef
__ZNKSt5ctypeIcE8do_widenEc:
LFB1348:
	.cfi_startproc
	mov	al, BYTE PTR [esp+4]
	ret	4
	.cfi_endproc
LFE1348:
	.text
	.p2align 2,,3
	.def	___tcf_0;	.scl	3;	.type	32;	.endef
___tcf_0:
LFB2553:
	.cfi_startproc
	mov	ecx, OFFSET FLAT:__ZStL8__ioinit
	jmp	__ZNSt8ios_base4InitD1Ev
	.cfi_endproc
LFE2553:
	.section .rdata,"dr"
LC0:
	.ascii "%u\0"
	.text
	.p2align 2,,3
	.def	__ZL5scanfPKcz.constprop.3;	.scl	3;	.type	32;	.endef
__ZL5scanfPKcz.constprop.3:
LFB2558:
	.cfi_startproc
	push	ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	sub	esp, 24
	.cfi_def_cfa_offset 32
	lea	ebx, [esp+36]
	mov	DWORD PTR [esp], 0
	call	[DWORD PTR __imp____acrt_iob_func]
	mov	DWORD PTR [esp+8], ebx
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC0
	mov	DWORD PTR [esp], eax
	call	___mingw_vfscanf
	add	esp, 24
	.cfi_def_cfa_offset 8
	pop	ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
LFE2558:
	.section .rdata,"dr"
LC1:
	.ascii "ntdll.dll\0"
LC2:
	.ascii "RtlCreateUserThread\0"
	.text
	.p2align 2,,3
	.globl	__Z19RtlCreateUserThreadPvS_
	.def	__Z19RtlCreateUserThreadPvS_;	.scl	2;	.type	32;	.endef
__Z19RtlCreateUserThreadPvS_:
LFB2060:
	.cfi_startproc
	sub	esp, 76
	.cfi_def_cfa_offset 80
	mov	DWORD PTR [esp+60], 0
	mov	DWORD PTR [esp], OFFSET FLAT:LC1
	call	[DWORD PTR __imp__GetModuleHandleA@4]
	.cfi_def_cfa_offset 76
	push	edx
	.cfi_def_cfa_offset 80
	test	eax, eax
	je	L9
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC2
	mov	DWORD PTR [esp], eax
	call	[DWORD PTR __imp__GetProcAddress@8]
	.cfi_def_cfa_offset 72
	sub	esp, 8
	.cfi_def_cfa_offset 80
	test	eax, eax
	je	L9
	mov	DWORD PTR [esp+36], 0
	lea	edx, [esp+60]
	mov	DWORD PTR [esp+32], edx
	mov	edx, DWORD PTR [esp+84]
	mov	DWORD PTR [esp+28], edx
	mov	edx, DWORD PTR [esp+80]
	mov	DWORD PTR [esp+24], edx
	mov	DWORD PTR [esp+20], 0
	mov	DWORD PTR [esp+16], 0
	mov	DWORD PTR [esp+12], 0
	mov	DWORD PTR [esp+8], 0
	mov	DWORD PTR [esp+4], 0
	mov	edx, DWORD PTR _hWinmine
	mov	DWORD PTR [esp], edx
	call	eax
	.cfi_def_cfa_offset 40
	sub	esp, 40
	.cfi_def_cfa_offset 80
	mov	eax, DWORD PTR [esp+60]
	add	esp, 76
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
	.p2align 2,,3
L9:
	.cfi_restore_state
	xor	eax, eax
	add	esp, 76
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
LFE2060:
	.section .rdata,"dr"
LC3:
	.ascii "NtCreateThreadEx\0"
	.text
	.p2align 2,,3
	.globl	__Z16NtCreateThreadExPvS_
	.def	__Z16NtCreateThreadExPvS_;	.scl	2;	.type	32;	.endef
__Z16NtCreateThreadExPvS_:
LFB2061:
	.cfi_startproc
	sub	esp, 76
	.cfi_def_cfa_offset 80
	mov	DWORD PTR [esp+60], 0
	mov	DWORD PTR [esp], OFFSET FLAT:LC1
	call	[DWORD PTR __imp__GetModuleHandleA@4]
	.cfi_def_cfa_offset 76
	push	edx
	.cfi_def_cfa_offset 80
	test	eax, eax
	je	L17
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC3
	mov	DWORD PTR [esp], eax
	call	[DWORD PTR __imp__GetProcAddress@8]
	.cfi_def_cfa_offset 72
	sub	esp, 8
	.cfi_def_cfa_offset 80
	test	eax, eax
	je	L17
	mov	DWORD PTR [esp+40], 0
	mov	DWORD PTR [esp+36], 0
	mov	DWORD PTR [esp+32], 0
	mov	DWORD PTR [esp+28], 0
	mov	DWORD PTR [esp+24], 0
	mov	edx, DWORD PTR [esp+84]
	mov	DWORD PTR [esp+20], edx
	mov	edx, DWORD PTR [esp+80]
	mov	DWORD PTR [esp+16], edx
	mov	edx, DWORD PTR _hWinmine
	mov	DWORD PTR [esp+12], edx
	mov	DWORD PTR [esp+8], 0
	mov	DWORD PTR [esp+4], 268435456
	lea	edx, [esp+60]
	mov	DWORD PTR [esp], edx
	call	eax
	.cfi_def_cfa_offset 36
	sub	esp, 44
	.cfi_def_cfa_offset 80
	mov	eax, DWORD PTR [esp+60]
	add	esp, 76
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
	.p2align 2,,3
L17:
	.cfi_restore_state
	xor	eax, eax
	add	esp, 76
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
LFE2061:
	.section .rdata,"dr"
	.align 2
LC4:
	.ascii "kb\367\226\0\0"
LC5:
	.ascii "Could not find PID\0"
LC6:
	.ascii "kernel32.dll\0"
LC7:
	.ascii "LoadLibraryA\0"
LC8:
	.ascii "Unable to locate LoadLibraryA\0"
	.align 4
LC9:
	.ascii "Could not allocate memory in process: \0"
	.align 4
LC10:
	.ascii "Could not write to process's address space\0"
LC11:
	.ascii "DLL injection failed\0"
LC12:
	.ascii "Injected thread id: \0"
LC13:
	.ascii "for pid: \0"
	.text
	.p2align 2,,3
	.globl	__Z13injectIntoPIDi
	.def	__Z13injectIntoPIDi;	.scl	2;	.type	32;	.endef
__Z13injectIntoPIDi:
LFB2062:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	push	edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	push	esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	push	ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	sub	esp, 60
	.cfi_def_cfa_offset 80
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC4
	mov	DWORD PTR [esp], 0
	call	[DWORD PTR __imp__FindWindowW@8]
	.cfi_def_cfa_offset 72
	sub	esp, 8
	.cfi_def_cfa_offset 80
	mov	DWORD PTR _hWnd, eax
	lea	edx, [esp+44]
	mov	DWORD PTR [esp+4], edx
	mov	DWORD PTR [esp], eax
	call	[DWORD PTR __imp__GetWindowThreadProcessId@8]
	.cfi_def_cfa_offset 72
	sub	esp, 8
	.cfi_def_cfa_offset 80
	mov	eax, DWORD PTR [esp+44]
	mov	DWORD PTR [esp+8], eax
	mov	DWORD PTR [esp+4], 0
	mov	DWORD PTR [esp], 2035711
	call	[DWORD PTR __imp__OpenProcess@12]
	.cfi_def_cfa_offset 68
	sub	esp, 12
	.cfi_def_cfa_offset 80
	mov	DWORD PTR _hWinmine, eax
	test	eax, eax
	je	L46
	mov	DWORD PTR [esp], OFFSET FLAT:LC6
	call	[DWORD PTR __imp__GetModuleHandleA@4]
	.cfi_def_cfa_offset 76
	push	esi
	.cfi_def_cfa_offset 80
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC7
	mov	DWORD PTR [esp], eax
	call	[DWORD PTR __imp__GetProcAddress@8]
	.cfi_def_cfa_offset 72
	sub	esp, 8
	.cfi_def_cfa_offset 80
	mov	esi, eax
	test	eax, eax
	je	L47
	mov	ebp, -1
	mov	ecx, ebp
	mov	edi, OFFSET FLAT:_dll
	xor	eax, eax
	repnz scasb
	not	ecx
	dec	ecx
	mov	DWORD PTR [esp+16], 4
	mov	DWORD PTR [esp+12], 12288
	mov	DWORD PTR [esp+8], ecx
	mov	DWORD PTR [esp+4], 0
	mov	eax, DWORD PTR _hWinmine
	mov	DWORD PTR [esp], eax
	call	[DWORD PTR __imp__VirtualAllocEx@20]
	.cfi_def_cfa_offset 60
	sub	esp, 20
	.cfi_def_cfa_offset 80
	mov	ebx, eax
	test	eax, eax
	je	L48
	mov	ecx, ebp
	mov	edi, OFFSET FLAT:_dll
	xor	eax, eax
	repnz scasb
	mov	ebp, ecx
	not	ebp
	dec	ebp
	mov	DWORD PTR [esp+16], 0
	mov	DWORD PTR [esp+12], ebp
	mov	DWORD PTR [esp+8], OFFSET FLAT:_dll
	mov	DWORD PTR [esp+4], ebx
	mov	eax, DWORD PTR _hWinmine
	mov	DWORD PTR [esp], eax
	call	[DWORD PTR __imp__WriteProcessMemory@20]
	.cfi_def_cfa_offset 60
	sub	esp, 20
	.cfi_def_cfa_offset 80
	test	eax, eax
	je	L49
	cmp	DWORD PTR [esp+80], 1
	je	L31
	cmp	DWORD PTR [esp+80], 2
	jne	L50
	mov	DWORD PTR [esp+4], ebx
	mov	DWORD PTR [esp], esi
	call	__Z19RtlCreateUserThreadPvS_
L34:
	test	eax, eax
	je	L51
	mov	DWORD PTR [esp], eax
	call	[DWORD PTR __imp__GetThreadId@4]
	.cfi_def_cfa_offset 76
	push	esi
	.cfi_def_cfa_offset 80
	mov	ebx, eax
	mov	DWORD PTR [esp+8], 20
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC12
	mov	DWORD PTR [esp], OFFSET FLAT:__ZSt4cout
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i
	mov	DWORD PTR [esp], ebx
	mov	ecx, OFFSET FLAT:__ZSt4cout
	call	__ZNSo9_M_insertImEERSoT_
	.cfi_def_cfa_offset 76
	push	edi
	.cfi_def_cfa_offset 80
	mov	ebx, eax
	mov	DWORD PTR [esp+8], 9
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC13
	mov	DWORD PTR [esp], eax
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i
	mov	eax, DWORD PTR [esp+44]
	mov	DWORD PTR [esp], eax
	mov	ecx, ebx
	call	__ZNSo9_M_insertImEERSoT_
	.cfi_def_cfa_offset 76
	push	ebp
	.cfi_def_cfa_offset 80
	mov	esi, eax
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax-12]
	mov	ebx, DWORD PTR [esi+124+eax]
	test	ebx, ebx
	je	L36
	cmp	BYTE PTR [ebx+28], 0
	je	L37
	movsx	eax, BYTE PTR [ebx+39]
L38:
	mov	DWORD PTR [esp], eax
	mov	ecx, esi
	call	__ZNSo3putEc
	.cfi_def_cfa_offset 76
	push	edx
	.cfi_def_cfa_offset 80
	mov	ecx, eax
	call	__ZNSo5flushEv
	mov	eax, DWORD PTR _hWinmine
	mov	DWORD PTR [esp], eax
	call	[DWORD PTR __imp__CloseHandle@4]
	.cfi_def_cfa_offset 76
	push	ecx
	.cfi_def_cfa_offset 80
	xor	eax, eax
L22:
	add	esp, 60
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	pop	ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	pop	esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	pop	edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	pop	ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.p2align 2,,3
L50:
	.cfi_restore_state
	mov	DWORD PTR [esp+24], 0
	mov	DWORD PTR [esp+20], 0
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], esi
	mov	DWORD PTR [esp+8], 0
	mov	DWORD PTR [esp+4], 0
	mov	eax, DWORD PTR _hWinmine
	mov	DWORD PTR [esp], eax
	call	[DWORD PTR __imp__CreateRemoteThread@28]
	.cfi_def_cfa_offset 52
	sub	esp, 28
	.cfi_def_cfa_offset 80
	jmp	L34
	.p2align 2,,3
L37:
	mov	ecx, ebx
	call	__ZNKSt5ctypeIcE13_M_widen_initEv
	mov	eax, DWORD PTR [ebx]
	mov	eax, DWORD PTR [eax+24]
	cmp	eax, OFFSET FLAT:__ZNKSt5ctypeIcE8do_widenEc
	jne	L52
	mov	eax, 10
	jmp	L38
	.p2align 2,,3
L31:
	mov	DWORD PTR [esp+4], ebx
	mov	DWORD PTR [esp], esi
	call	__Z16NtCreateThreadExPvS_
	jmp	L34
	.p2align 2,,3
L52:
	mov	DWORD PTR [esp], 10
	mov	ecx, ebx
	call	eax
	.cfi_def_cfa_offset 76
	push	ebx
	.cfi_def_cfa_offset 80
	movsx	eax, al
	jmp	L38
L49:
	mov	DWORD PTR [esp], OFFSET FLAT:LC10
	call	_puts
	mov	eax, -1
	jmp	L22
L47:
	mov	DWORD PTR [esp], OFFSET FLAT:LC8
	call	_puts
	mov	eax, -1
	jmp	L22
L46:
	mov	DWORD PTR [esp], OFFSET FLAT:LC5
	call	_puts
	mov	eax, -1
	jmp	L22
L48:
	mov	DWORD PTR [esp+8], 38
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC9
	mov	DWORD PTR [esp], OFFSET FLAT:__ZSt4cout
	call	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i
	mov	eax, DWORD PTR [esp+44]
	mov	DWORD PTR [esp], eax
	mov	ecx, OFFSET FLAT:__ZSt4cout
	call	__ZNSo9_M_insertImEERSoT_
	.cfi_def_cfa_offset 76
	push	ebx
	.cfi_def_cfa_offset 80
	mov	esi, eax
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax-12]
	mov	ebx, DWORD PTR [esi+124+eax]
	test	ebx, ebx
	je	L36
	cmp	BYTE PTR [ebx+28], 0
	je	L28
	movsx	eax, BYTE PTR [ebx+39]
L29:
	mov	DWORD PTR [esp], eax
	mov	ecx, esi
	call	__ZNSo3putEc
	.cfi_def_cfa_offset 76
	push	edx
	.cfi_def_cfa_offset 80
	mov	ecx, eax
	call	__ZNSo5flushEv
	mov	eax, -1
	jmp	L22
L51:
	mov	DWORD PTR [esp], OFFSET FLAT:LC11
	call	_puts
	mov	eax, -1
	jmp	L22
L28:
	mov	ecx, ebx
	call	__ZNKSt5ctypeIcE13_M_widen_initEv
	mov	eax, DWORD PTR [ebx]
	mov	eax, DWORD PTR [eax+24]
	cmp	eax, OFFSET FLAT:__ZNKSt5ctypeIcE8do_widenEc
	jne	L53
	mov	eax, 10
	jmp	L29
L36:
	call	__ZSt16__throw_bad_castv
L53:
	mov	DWORD PTR [esp], 10
	mov	ecx, ebx
	call	eax
	.cfi_def_cfa_offset 76
	push	ecx
	.cfi_def_cfa_offset 80
	movsx	eax, al
	jmp	L29
	.cfi_endproc
LFE2062:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
	.align 4
LC14:
	.ascii "Which method? (0 (default): CRT, 1: NtCreateThread, 2: RtlCreateUserThread)\0"
LC15:
	.ascii "Could not inject into PID\0"
LC16:
	.ascii "pause\0"
	.section	.text.startup,"x"
	.p2align 2,,3
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB2063:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	and	esp, -16
	sub	esp, 32
	call	___main
	mov	DWORD PTR [esp], OFFSET FLAT:LC14
	call	_puts
	lea	eax, [esp+28]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC0
	call	__ZL5scanfPKcz.constprop.3
	mov	eax, DWORD PTR [esp+28]
	mov	DWORD PTR [esp], eax
	call	__Z13injectIntoPIDi
	inc	eax
	je	L57
L55:
	mov	DWORD PTR [esp], OFFSET FLAT:LC16
	call	_system
	xor	eax, eax
	leave
	.cfi_remember_state
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
L57:
	.cfi_restore_state
	mov	DWORD PTR [esp], OFFSET FLAT:LC15
	call	_puts
	jmp	L55
	.cfi_endproc
LFE2063:
	.p2align 2,,3
	.def	__GLOBAL__sub_I_dll;	.scl	3;	.type	32;	.endef
__GLOBAL__sub_I_dll:
LFB2554:
	.cfi_startproc
	sub	esp, 28
	.cfi_def_cfa_offset 32
	mov	ecx, OFFSET FLAT:__ZStL8__ioinit
	call	__ZNSt8ios_base4InitC1Ev
	mov	DWORD PTR [esp], OFFSET FLAT:___tcf_0
	call	_atexit
	add	esp, 28
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
LFE2554:
	.section	.ctors,"w"
	.align 4
	.long	__GLOBAL__sub_I_dll
	.globl	_hWinmine
	.bss
	.align 4
_hWinmine:
	.space 4
	.globl	_hWnd
	.align 4
_hWnd:
	.space 4
	.globl	_dll
	.data
	.align 32
_dll:
	.ascii "O:\\BUPT-SCSS\\Courses_and_research\\ASM_and_Reverse_Engineering\\Programs\\C_C++\\8_hook\\_mines_sweeping\\Hook_mines_sweeping_helper\\INJECTION\\bin\\Release\\INJECTION.dll\0"
.lcomm __ZStL8__ioinit,1,1
	.ident	"GCC: (i686-posix-dwarf-rev0, Built by MinGW-W64 project) 8.1.0"
	.def	__ZNSt8ios_base4InitD1Ev;	.scl	2;	.type	32;	.endef
	.def	___mingw_vfscanf;	.scl	2;	.type	32;	.endef
	.def	__ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i;	.scl	2;	.type	32;	.endef
	.def	__ZNSo9_M_insertImEERSoT_;	.scl	2;	.type	32;	.endef
	.def	__ZNSo3putEc;	.scl	2;	.type	32;	.endef
	.def	__ZNSo5flushEv;	.scl	2;	.type	32;	.endef
	.def	__ZNKSt5ctypeIcE13_M_widen_initEv;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	__ZSt16__throw_bad_castv;	.scl	2;	.type	32;	.endef
	.def	_system;	.scl	2;	.type	32;	.endef
	.def	__ZNSt8ios_base4InitC1Ev;	.scl	2;	.type	32;	.endef
	.def	_atexit;	.scl	2;	.type	32;	.endef
