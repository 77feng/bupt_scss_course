	.file	"winmine_helper_by_debug.cpp"
	.intel_syntax noprefix
	.text
	.section	.text$_Z5scanfPKcz,"x"
	.linkonce discard
	.p2align 2,,3
	.globl	__Z5scanfPKcz
	.def	__Z5scanfPKcz;	.scl	2;	.type	32;	.endef
__Z5scanfPKcz:
LFB730:
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
	mov	edx, DWORD PTR [esp+32]
	mov	DWORD PTR [esp+4], edx
	mov	DWORD PTR [esp], eax
	call	___mingw_vfscanf
	add	esp, 24
	.cfi_def_cfa_offset 8
	pop	ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
LFE730:
	.section	.text$_Z6printfPKcz,"x"
	.linkonce discard
	.p2align 2,,3
	.globl	__Z6printfPKcz
	.def	__Z6printfPKcz;	.scl	2;	.type	32;	.endef
__Z6printfPKcz:
LFB736:
	.cfi_startproc
	push	ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	sub	esp, 24
	.cfi_def_cfa_offset 32
	lea	ebx, [esp+36]
	mov	DWORD PTR [esp], 1
	call	[DWORD PTR __imp____acrt_iob_func]
	mov	DWORD PTR [esp+8], ebx
	mov	edx, DWORD PTR [esp+32]
	mov	DWORD PTR [esp+4], edx
	mov	DWORD PTR [esp], eax
	call	___mingw_vfprintf
	add	esp, 24
	.cfi_def_cfa_offset 8
	pop	ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
LFE736:
	.section .rdata,"dr"
	.align 4
LC0:
	.ascii "\346\234\252\350\203\275\346\210\220\345\212\237\350\216\267\345\217\226\347\263\273\347\273\237\344\270\255\346\255\243\345\234\250\350\277\220\350\241\214\347\232\204"
	.ascii "32\344\275\215\350\277\233\347\250\213\344\277\241\346\201\257\12\0"
	.text
	.p2align 2,,3
	.globl	__Z19OpenProcessWithNamePKw
	.def	__Z19OpenProcessWithNamePKw;	.scl	2;	.type	32;	.endef
__Z19OpenProcessWithNamePKw:
LFB774:
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
	sub	esp, 588
	.cfi_def_cfa_offset 608
	mov	edi, DWORD PTR [esp+608]
	mov	DWORD PTR [esp+4], 0
	mov	DWORD PTR [esp], 2
	call	_CreateToolhelp32Snapshot@8
	.cfi_def_cfa_offset 600
	sub	esp, 8
	.cfi_def_cfa_offset 608
	cmp	eax, -1
	je	L20
	mov	ebx, eax
	mov	DWORD PTR [esp+20], 556
	lea	esi, [esp+20]
	mov	DWORD PTR [esp+4], esi
	mov	DWORD PTR [esp], eax
	call	_Process32FirstW@8
	.cfi_def_cfa_offset 600
	sub	esp, 8
	.cfi_def_cfa_offset 608
	test	eax, eax
	je	L8
	lea	ebp, [esp+56]
	.p2align 2,,3
L10:
	mov	DWORD PTR [esp+4], ebp
	mov	DWORD PTR [esp], edi
	call	_wcscmp
	test	eax, eax
	jne	L12
	mov	eax, DWORD PTR [esp+28]
	mov	DWORD PTR [esp+8], eax
	mov	DWORD PTR [esp+4], 0
	mov	DWORD PTR [esp], 2035711
	call	[DWORD PTR __imp__OpenProcess@12]
	.cfi_def_cfa_offset 596
	sub	esp, 12
	.cfi_def_cfa_offset 608
	test	eax, eax
	jne	L6
L12:
	mov	DWORD PTR [esp+4], esi
	mov	DWORD PTR [esp], ebx
	call	_Process32NextW@8
	.cfi_def_cfa_offset 600
	sub	esp, 8
	.cfi_def_cfa_offset 608
	test	eax, eax
	jne	L10
L8:
	mov	DWORD PTR [esp], ebx
	call	[DWORD PTR __imp__CloseHandle@4]
	.cfi_def_cfa_offset 604
	push	eax
	.cfi_def_cfa_offset 608
	xor	eax, eax
L6:
	add	esp, 588
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
L20:
	.cfi_restore_state
	mov	DWORD PTR [esp], OFFSET FLAT:LC0
	call	__Z6printfPKcz
	mov	DWORD PTR [esp], 100876
	call	_exit
	.cfi_endproc
LFE774:
	.section .rdata,"dr"
	.align 2
LC1:
	.ascii "w\0i\0n\0m\0i\0n\0e\0.\0e\0x\0e\0\0\0"
	.align 2
LC2:
	.ascii "kb\367\226\0\0"
	.align 4
LC3:
	.ascii "\346\234\252\350\203\275\346\210\220\345\212\237\350\216\267\345\217\226\346\211\253\351\233\267\350\277\233\347\250\213. (%lu)\12\0"
LC4:
	.ascii "pause\0"
	.align 4
LC5:
	.ascii "\346\234\252\350\203\275\346\210\220\345\212\237\344\273\216\346\211\253\351\233\267\350\277\233\347\250\213\344\270\255\350\257\273\345\217\226\345\234\260\351\233\267\346\225\260\346\215\256. (%lu)\12\0"
	.text
	.p2align 2,,3
	.globl	__Z29DetectWinmineAndCaptureCursorv
	.def	__Z29DetectWinmineAndCaptureCursorv;	.scl	2;	.type	32;	.endef
__Z29DetectWinmineAndCaptureCursorv:
LFB775:
	.cfi_startproc
	push	ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	sub	esp, 40
	.cfi_def_cfa_offset 48
	mov	DWORD PTR [esp], OFFSET FLAT:LC1
	call	__Z19OpenProcessWithNamePKw
	mov	DWORD PTR _hWinmine, eax
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC2
	mov	DWORD PTR [esp], 0
	call	[DWORD PTR __imp__FindWindowW@8]
	.cfi_def_cfa_offset 40
	sub	esp, 8
	.cfi_def_cfa_offset 48
	mov	DWORD PTR _hWnd, eax
	mov	eax, DWORD PTR _hWinmine
	cmp	eax, -1
	je	L29
	mov	DWORD PTR [esp+16], 0
	mov	DWORD PTR [esp+12], 1024
	mov	DWORD PTR [esp+8], OFFSET FLAT:_GameMap
	mov	DWORD PTR [esp+4], 16798561
	mov	DWORD PTR [esp], eax
	mov	ebx, DWORD PTR __imp__ReadProcessMemory@20
	call	ebx
	.cfi_def_cfa_offset 28
	sub	esp, 20
	.cfi_def_cfa_offset 48
	test	eax, eax
	je	L24
	mov	DWORD PTR [esp+16], 0
	mov	DWORD PTR [esp+12], 8
	mov	DWORD PTR [esp+8], OFFSET FLAT:_MapSize
	mov	DWORD PTR [esp+4], 16798516
	mov	eax, DWORD PTR _hWinmine
	mov	DWORD PTR [esp], eax
	call	ebx
	.cfi_def_cfa_offset 28
	sub	esp, 20
	.cfi_def_cfa_offset 48
	test	eax, eax
	je	L24
	add	esp, 40
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	pop	ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
L24:
	.cfi_restore_state
	call	[DWORD PTR __imp__GetLastError@0]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC5
	call	__Z6printfPKcz
	mov	DWORD PTR [esp], OFFSET FLAT:LC4
	call	_system
	mov	DWORD PTR [esp], 2
	call	_exit
L29:
	call	[DWORD PTR __imp__GetLastError@0]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC3
	call	__Z6printfPKcz
	mov	DWORD PTR [esp], OFFSET FLAT:LC4
	call	_system
	mov	DWORD PTR [esp], 1
	call	_exit
	.cfi_endproc
LFE775:
	.p2align 2,,3
	.globl	__Z14LeftClickBlockii
	.def	__Z14LeftClickBlockii;	.scl	2;	.type	32;	.endef
__Z14LeftClickBlockii:
LFB776:
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
	mov	eax, DWORD PTR [esp+84]
	sal	eax, 4
	add	eax, 20
	mov	DWORD PTR _pCursor, eax
	mov	eax, DWORD PTR [esp+80]
	sal	eax, 4
	add	eax, 60
	mov	DWORD PTR _pCursor+4, eax
	mov	DWORD PTR [esp+4], OFFSET FLAT:_pCursor
	mov	eax, DWORD PTR _hWnd
	mov	DWORD PTR [esp], eax
	call	[DWORD PTR __imp__ClientToScreen@8]
	.cfi_def_cfa_offset 72
	sub	esp, 8
	.cfi_def_cfa_offset 80
	mov	eax, DWORD PTR _pCursor+4
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR _pCursor
	mov	DWORD PTR [esp], eax
	call	[DWORD PTR __imp__SetCursorPos@8]
	.cfi_def_cfa_offset 72
	sub	esp, 8
	.cfi_def_cfa_offset 80
	lea	edi, [esp+20]
	mov	ecx, 7
	xor	esi, esi
	mov	eax, esi
	rep stosd
	mov	DWORD PTR [esp+36], 2
	mov	DWORD PTR [esp+8], 28
	lea	ebx, [esp+20]
	mov	DWORD PTR [esp+4], ebx
	mov	DWORD PTR [esp], 1
	mov	ebp, DWORD PTR __imp__SendInput@12
	call	ebp
	.cfi_def_cfa_offset 68
	sub	esp, 12
	.cfi_def_cfa_offset 80
	mov	ecx, 7
	mov	edi, ebx
	mov	eax, esi
	rep stosd
	mov	DWORD PTR [esp+36], 4
	mov	DWORD PTR [esp+8], 28
	mov	DWORD PTR [esp+4], ebx
	mov	DWORD PTR [esp], 1
	call	ebp
	.cfi_def_cfa_offset 68
	sub	esp, 12
	.cfi_def_cfa_offset 80
	add	esp, 60
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
LFE776:
	.p2align 2,,3
	.globl	__Z7do_helpv
	.def	__Z7do_helpv;	.scl	2;	.type	32;	.endef
__Z7do_helpv:
LFB777:
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
	sub	esp, 28
	.cfi_def_cfa_offset 48
	call	__Z29DetectWinmineAndCaptureCursorv
	mov	DWORD PTR [esp+4], 0
	mov	DWORD PTR [esp], 0
	call	__Z14LeftClickBlockii
	mov	esi, DWORD PTR _MapSize+4
	test	esi, esi
	jle	L33
	xor	esi, esi
	xor	ebp, ebp
	mov	edi, DWORD PTR __imp__Sleep@4
	.p2align 2,,3
L37:
	mov	ebx, DWORD PTR _MapSize
	test	ebx, ebx
	jle	L34
	xor	ebx, ebx
	.p2align 2,,3
L36:
	cmp	BYTE PTR _GameMap[esi+ebx], -113
	je	L35
	mov	DWORD PTR [esp+4], ebx
	mov	DWORD PTR [esp], ebp
	call	__Z14LeftClickBlockii
L35:
	mov	eax, DWORD PTR _speed
	mov	DWORD PTR [esp], eax
	call	edi
	.cfi_def_cfa_offset 44
	push	ecx
	.cfi_def_cfa_offset 48
	inc	ebx
	cmp	DWORD PTR _MapSize, ebx
	jg	L36
L34:
	inc	ebp
	add	esi, 32
	cmp	DWORD PTR _MapSize+4, ebp
	jg	L37
L33:
	mov	eax, DWORD PTR _hWinmine
	mov	DWORD PTR [esp], eax
	mov	ebx, DWORD PTR __imp__CloseHandle@4
	call	ebx
	.cfi_def_cfa_offset 44
	push	eax
	.cfi_def_cfa_offset 48
	mov	eax, DWORD PTR _hWnd
	mov	DWORD PTR [esp], eax
	call	ebx
	.cfi_def_cfa_offset 44
	push	edx
	.cfi_def_cfa_offset 48
	add	esp, 28
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
LFE777:
	.section .rdata,"dr"
	.align 4
LC6:
	.ascii "\350\257\267\350\256\276\345\256\232\346\211\253\351\233\267\351\200\237\345\272\246\347\255\211\347\272\247\357\274\232\12  [1]\345\277\253(\351\273\230\350\256\244\351\200\237\345\272\246\347\255\211\347\272\247)\12  [2]\344\270\255\12  [3]\346\205\242\12\12---> \0"
	.align 4
LC7:
	.ascii "\350\257\267\351\207\215\346\226\260\351\200\211\345\256\232\346\211\253\351\233\267\351\200\237\345\272\246\347\255\211\347\272\247\357\274\232\12  [1]\345\277\253(\351\273\230\350\256\244\351\200\237\345\272\246\347\255\211\347\272\247)\12  [2]\344\270\255\12  [3]\346\205\242\12\12---> \0"
LC8:
	.ascii "%d\0"
	.align 4
LC9:
	.ascii "\12===>\346\211\253\351\233\267\351\200\237\345\272\246\347\255\211\347\272\247\344\270\272 [\345\277\253]\0"
	.align 4
LC10:
	.ascii "\12===>\346\211\253\351\233\267\351\200\237\345\272\246\347\255\211\347\272\247\344\270\272 [\344\270\255]\0"
	.align 4
LC11:
	.ascii "\12===>\346\211\253\351\233\267\351\200\237\345\272\246\347\255\211\347\272\247\344\270\272 [\346\205\242]\0"
	.align 4
LC12:
	.ascii "\12===>\351\207\207\347\224\250\351\273\230\350\256\244\347\232\204\346\211\253\351\233\267\351\200\237\345\272\246\347\255\211\347\272\247\357\274\232[\344\270\255]\0"
	.align 4
LC13:
	.ascii "\12\12***--------------\346\223\215\344\275\234\350\257\264\346\230\216\345\246\202\344\270\213--------------***\12\357\274\210\350\257\267\345\260\206\351\274\240\346\240\207\347\247\273\345\207\272\346\211\253\351\233\267\347\225\214\351\235\242\345\214\272\345\237\237\357\274\214\345\271\266\351\201\277\345\205\215\346\211\213\350\247\246\347\242\260\351\274\240\346\240\207!\357\274\211\11\11\11\12\12\346\214\211\344\270\213[Y]\351\224\256\357\274\232\345\274\200\345\247\213\350\207\252\345\212\250\346\211\253\351\233\267\12\346\214\211\344\270\213[N]\351\224\256\357\274\232\351\200\200\345\207\272\350\207\252\345\212\250\346\211\253\351\233\267\357\274\201\12\346\214\211\344\270\213[R]\351\224\256\357\274\232\351\207\215\346\226\260\350\256\276\347\275\256\351\200\237\345\272\246\347\255\211\347\272\247\357\274\201\12\12\0"
	.text
	.p2align 2,,3
	.globl	__Z8SetSpeedv
	.def	__Z8SetSpeedv;	.scl	2;	.type	32;	.endef
__Z8SetSpeedv:
LFB778:
	.cfi_startproc
	sub	esp, 28
	.cfi_def_cfa_offset 32
	mov	eax, DWORD PTR _count_reset
	lea	edx, [eax+1]
	mov	DWORD PTR _count_reset, edx
	test	eax, eax
	jne	L42
	mov	DWORD PTR [esp], OFFSET FLAT:LC6
	call	__Z6printfPKcz
L43:
	mov	DWORD PTR [esp+4], OFFSET FLAT:_speed
	mov	DWORD PTR [esp], OFFSET FLAT:LC8
	call	__Z5scanfPKcz
	mov	eax, DWORD PTR _speed
	cmp	eax, 2
	je	L44
	cmp	eax, 3
	je	L45
	dec	eax
	je	L49
	mov	DWORD PTR _speed, 10
	mov	DWORD PTR [esp], OFFSET FLAT:LC12
	call	__Z6printfPKcz
	mov	DWORD PTR [esp], OFFSET FLAT:LC13
	call	__Z6printfPKcz
	add	esp, 28
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
	.p2align 2,,3
L42:
	.cfi_restore_state
	mov	DWORD PTR [esp], OFFSET FLAT:LC7
	call	__Z6printfPKcz
	jmp	L43
	.p2align 2,,3
L49:
	mov	DWORD PTR _speed, 0
	mov	DWORD PTR [esp], OFFSET FLAT:LC9
	call	__Z6printfPKcz
	mov	DWORD PTR [esp], OFFSET FLAT:LC13
	call	__Z6printfPKcz
	add	esp, 28
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
	.p2align 2,,3
L45:
	.cfi_restore_state
	mov	DWORD PTR _speed, 20
	mov	DWORD PTR [esp], OFFSET FLAT:LC11
	call	__Z6printfPKcz
	mov	DWORD PTR [esp], OFFSET FLAT:LC13
	call	__Z6printfPKcz
	add	esp, 28
	.cfi_remember_state
	.cfi_def_cfa_offset 4
	ret
	.p2align 2,,3
L44:
	.cfi_restore_state
	mov	DWORD PTR _speed, 10
	mov	DWORD PTR [esp], OFFSET FLAT:LC10
	call	__Z6printfPKcz
	mov	DWORD PTR [esp], OFFSET FLAT:LC13
	call	__Z6printfPKcz
	add	esp, 28
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
LFE778:
	.section .rdata,"dr"
LC14:
	.ascii "cls\0"
	.text
	.p2align 2,,3
	.globl	__Z11StartHelperv
	.def	__Z11StartHelperv;	.scl	2;	.type	32;	.endef
__Z11StartHelperv:
LFB779:
	.cfi_startproc
	push	esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	push	ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	sub	esp, 20
	.cfi_def_cfa_offset 32
	call	__Z8SetSpeedv
	mov	ebx, DWORD PTR __imp__GetAsyncKeyState@4
	mov	esi, DWORD PTR __imp__Sleep@4
	.p2align 2,,3
L51:
	mov	DWORD PTR [esp], 89
	call	ebx
	.cfi_def_cfa_offset 28
	push	edx
	.cfi_def_cfa_offset 32
	test	ax, ax
	jne	L59
L52:
	mov	DWORD PTR [esp], 78
	call	ebx
	.cfi_def_cfa_offset 28
	push	ecx
	.cfi_def_cfa_offset 32
	test	ax, ax
	jne	L54
	mov	DWORD PTR [esp], 82
	call	ebx
	.cfi_def_cfa_offset 28
	push	edx
	.cfi_def_cfa_offset 32
	test	ax, ax
	je	L51
	mov	DWORD PTR [esp], OFFSET FLAT:LC14
	call	_system
	call	__Z8SetSpeedv
	mov	DWORD PTR [esp], 89
	call	ebx
	.cfi_def_cfa_offset 28
	push	edx
	.cfi_def_cfa_offset 32
	test	ax, ax
	je	L52
	.p2align 2,,3
L59:
	mov	edx, DWORD PTR _MapSize
	mov	eax, edx
	shr	eax, 31
	add	eax, edx
	sar	eax
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], -2
	call	__Z14LeftClickBlockii
	mov	DWORD PTR [esp], 675
	call	esi
	.cfi_def_cfa_offset 28
	push	eax
	.cfi_def_cfa_offset 32
	call	__Z7do_helpv
	jmp	L51
	.p2align 2,,3
L54:
	mov	DWORD PTR [esp], OFFSET FLAT:LC4
	call	_system
	mov	DWORD PTR [esp], 0
	call	_exit
	.cfi_endproc
LFE779:
	.globl	_count_reset
	.bss
	.align 4
_count_reset:
	.space 4
	.globl	_speed
	.align 4
_speed:
	.space 4
	.globl	_pCursor
	.align 4
_pCursor:
	.space 8
	.globl	_hWnd
	.align 4
_hWnd:
	.space 4
	.globl	_hWinmine
	.align 4
_hWinmine:
	.space 4
	.globl	_MapSize
	.align 4
_MapSize:
	.space 8
	.globl	_GameMap
	.align 32
_GameMap:
	.space 1024
	.ident	"GCC: (i686-posix-dwarf-rev0, Built by MinGW-W64 project) 8.1.0"
	.def	___mingw_vfscanf;	.scl	2;	.type	32;	.endef
	.def	___mingw_vfprintf;	.scl	2;	.type	32;	.endef
	.def	_CreateToolhelp32Snapshot@8;	.scl	2;	.type	32;	.endef
	.def	_Process32FirstW@8;	.scl	2;	.type	32;	.endef
	.def	_wcscmp;	.scl	2;	.type	32;	.endef
	.def	_Process32NextW@8;	.scl	2;	.type	32;	.endef
	.def	_exit;	.scl	2;	.type	32;	.endef
	.def	_system;	.scl	2;	.type	32;	.endef
