	.file	"main.cpp"
	.intel_syntax noprefix
	.text
	.p2align 2,,3
	.globl	__Z14LeftClickBlockii
	.def	__Z14LeftClickBlockii;	.scl	2;	.type	32;	.endef
__Z14LeftClickBlockii:
LFB566:
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
	sub	esp, 76
	.cfi_def_cfa_offset 96
	mov	eax, DWORD PTR [esp+100]
	sal	eax, 4
	add	eax, 20
	mov	DWORD PTR [esp+28], eax
	mov	eax, DWORD PTR [esp+96]
	sal	eax, 4
	add	eax, 60
	mov	DWORD PTR [esp+32], eax
	lea	eax, [esp+28]
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR _hWnd
	mov	DWORD PTR [esp], eax
	call	[DWORD PTR __imp__ClientToScreen@8]
	.cfi_def_cfa_offset 88
	sub	esp, 8
	.cfi_def_cfa_offset 96
	mov	eax, DWORD PTR [esp+32]
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [esp+28]
	mov	DWORD PTR [esp], eax
	call	[DWORD PTR __imp__SetCursorPos@8]
	.cfi_def_cfa_offset 88
	sub	esp, 8
	.cfi_def_cfa_offset 96
	lea	edi, [esp+36]
	mov	ecx, 7
	xor	esi, esi
	mov	eax, esi
	rep stosd
	mov	DWORD PTR [esp+52], 2
	mov	DWORD PTR [esp+8], 28
	lea	ebx, [esp+36]
	mov	DWORD PTR [esp+4], ebx
	mov	DWORD PTR [esp], 1
	mov	ebp, DWORD PTR __imp__SendInput@12
	call	ebp
	.cfi_def_cfa_offset 84
	sub	esp, 12
	.cfi_def_cfa_offset 96
	mov	ecx, 7
	mov	edi, ebx
	mov	eax, esi
	rep stosd
	mov	DWORD PTR [esp+52], 4
	mov	DWORD PTR [esp+8], 28
	mov	DWORD PTR [esp+4], ebx
	mov	DWORD PTR [esp], 1
	call	ebp
	.cfi_def_cfa_offset 84
	sub	esp, 12
	.cfi_def_cfa_offset 96
	add	esp, 76
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
	.cfi_endproc
LFE566:
	.section .rdata,"dr"
	.align 2
LC0:
	.ascii "kb\367\226\0\0"
	.text
	.p2align 2,,3
	.globl	_MinesSweepingHelper
	.def	_MinesSweepingHelper;	.scl	2;	.type	32;	.endef
_MinesSweepingHelper:
LFB567:
	.cfi_startproc
	push	edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	push	esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	push	ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	sub	esp, 1072
	.cfi_def_cfa_offset 1088
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC0
	mov	DWORD PTR [esp], 0
	call	[DWORD PTR __imp__FindWindowW@8]
	.cfi_def_cfa_offset 1080
	sub	esp, 8
	.cfi_def_cfa_offset 1088
	mov	DWORD PTR _hWnd, eax
	mov	DWORD PTR [esp+4], OFFSET FLAT:_pid
	mov	DWORD PTR [esp], eax
	call	[DWORD PTR __imp__GetWindowThreadProcessId@8]
	.cfi_def_cfa_offset 1080
	sub	esp, 8
	.cfi_def_cfa_offset 1088
	mov	eax, DWORD PTR _pid
	mov	DWORD PTR [esp+8], eax
	mov	DWORD PTR [esp+4], 0
	mov	DWORD PTR [esp], 2035711
	call	[DWORD PTR __imp__OpenProcess@12]
	.cfi_def_cfa_offset 1076
	sub	esp, 12
	.cfi_def_cfa_offset 1088
	mov	DWORD PTR _hWinmine, eax
	mov	DWORD PTR [esp+16], 0
	mov	DWORD PTR [esp+12], 1024
	lea	esi, [esp+48]
	mov	DWORD PTR [esp+8], esi
	mov	DWORD PTR [esp+4], 16798561
	mov	DWORD PTR [esp], eax
	mov	ebx, DWORD PTR __imp__ReadProcessMemory@20
	call	ebx
	.cfi_def_cfa_offset 1068
	sub	esp, 20
	.cfi_def_cfa_offset 1088
	mov	DWORD PTR [esp+16], 0
	mov	DWORD PTR [esp+12], 8
	lea	eax, [esp+40]
	mov	DWORD PTR [esp+8], eax
	mov	DWORD PTR [esp+4], 16798516
	mov	eax, DWORD PTR _hWinmine
	mov	DWORD PTR [esp], eax
	call	ebx
	.cfi_def_cfa_offset 1068
	sub	esp, 20
	.cfi_def_cfa_offset 1088
	mov	ebx, DWORD PTR [esp+44]
	test	ebx, ebx
	je	L5
	xor	edi, edi
	.p2align 2,,3
L9:
	mov	ecx, DWORD PTR [esp+40]
	test	ecx, ecx
	je	L6
	xor	ebx, ebx
	.p2align 2,,3
L8:
	cmp	BYTE PTR [esi+ebx], -113
	je	L7
	mov	DWORD PTR [esp+4], ebx
	mov	DWORD PTR [esp], edi
	call	__Z14LeftClickBlockii
L7:
	inc	ebx
	cmp	DWORD PTR [esp+40], ebx
	ja	L8
L6:
	inc	edi
	add	esi, 32
	cmp	DWORD PTR [esp+44], edi
	ja	L9
L5:
	mov	eax, DWORD PTR _hWinmine
	mov	DWORD PTR [esp], eax
	mov	ebx, DWORD PTR __imp__CloseHandle@4
	call	ebx
	.cfi_def_cfa_offset 1084
	push	eax
	.cfi_def_cfa_offset 1088
	mov	eax, DWORD PTR _hWnd
	mov	DWORD PTR [esp], eax
	call	ebx
	.cfi_def_cfa_offset 1084
	push	edx
	.cfi_def_cfa_offset 1088
	add	esp, 1072
	.cfi_def_cfa_offset 16
	pop	ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	pop	esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	pop	edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
LFE567:
	.section .rdata,"dr"
	.align 2
LC1:
	.ascii "\320c:y\0\0"
	.align 2
LC2:
	.ascii "\20b\237R\350leQkb\367\226\333\217\13z\0\0"
	.align 2
LC3:
	.ascii "1\201\273ykb\367\226\333\217\13z\0\0"
	.text
	.p2align 2,,3
	.globl	_DllMain@12
	.def	_DllMain@12;	.scl	2;	.type	32;	.endef
_DllMain@12:
LFB568:
	.cfi_startproc
	sub	esp, 28
	.cfi_def_cfa_offset 32
	mov	eax, DWORD PTR [esp+36]
	test	eax, eax
	je	L14
	dec	eax
	jne	L15
	mov	DWORD PTR [esp+12], 64
	mov	DWORD PTR [esp+8], OFFSET FLAT:LC1
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC2
	mov	DWORD PTR [esp], 0
	call	[DWORD PTR __imp__MessageBoxW@16]
	.cfi_def_cfa_offset 16
	sub	esp, 16
	.cfi_def_cfa_offset 32
	call	_MinesSweepingHelper
L15:
	mov	eax, 1
	add	esp, 28
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret	12
L14:
	.cfi_restore_state
	mov	DWORD PTR [esp+12], 64
	mov	DWORD PTR [esp+8], OFFSET FLAT:LC1
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC3
	mov	DWORD PTR [esp], 0
	call	[DWORD PTR __imp__MessageBoxW@16]
	.cfi_def_cfa_offset 16
	sub	esp, 16
	.cfi_def_cfa_offset 32
	mov	DWORD PTR [esp], 0
	call	[DWORD PTR __imp__ExitThread@4]
	.cfi_def_cfa_offset 28
	.cfi_endproc
LFE568:
	.globl	_hWinmine
	.bss
	.align 4
_hWinmine:
	.space 4
	.globl	_pid
	.align 4
_pid:
	.space 4
	.globl	_hWnd
	.align 4
_hWnd:
	.space 4
	.ident	"GCC: (i686-posix-dwarf-rev0, Built by MinGW-W64 project) 8.1.0"
