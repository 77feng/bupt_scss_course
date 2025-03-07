	.file	"main.c"
	.intel_syntax noprefix
	.text
	.def	___main;	.scl	2;	.type	32;	.endef
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB13:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	and	esp, -16
	sub	esp, 32
	call	___main
	mov	DWORD PTR [esp+28], 0
	call	_CreateGame
	mov	DWORD PTR [esp+28], eax
	mov	DWORD PTR [esp], eax
	call	_GameStartScreen
	mov	eax, DWORD PTR [esp+28]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR [esp], eax
	call	_RandomDistributeMines
	mov	eax, DWORD PTR [esp+28]
	mov	DWORD PTR [esp], eax
	call	_GameProcessScreen
	mov	eax, DWORD PTR [esp+28]
	mov	DWORD PTR [esp], eax
	call	_GameEndScreen
	mov	eax, DWORD PTR [esp+28]
	add	eax, 4
	mov	DWORD PTR [esp], eax
	call	_DestroyMap
	lea	eax, [esp+28]
	mov	DWORD PTR [esp], eax
	call	_DestroyGame
	mov	eax, 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE13:
	.ident	"GCC: (i686-posix-dwarf-rev0, Built by MinGW-W64 project) 8.1.0"
	.def	_CreateGame;	.scl	2;	.type	32;	.endef
	.def	_GameStartScreen;	.scl	2;	.type	32;	.endef
	.def	_RandomDistributeMines;	.scl	2;	.type	32;	.endef
	.def	_GameProcessScreen;	.scl	2;	.type	32;	.endef
	.def	_GameEndScreen;	.scl	2;	.type	32;	.endef
	.def	_DestroyMap;	.scl	2;	.type	32;	.endef
	.def	_DestroyGame;	.scl	2;	.type	32;	.endef
