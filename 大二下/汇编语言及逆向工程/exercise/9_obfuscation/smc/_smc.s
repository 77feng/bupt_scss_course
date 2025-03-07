	.file	"_smc.cpp"
	.intel_syntax noprefix
	.text
	.section .rdata,"dr"
LC0:
	.ascii "\12------\0"
LC1:
	.ascii "\12------\12\0"
LC2:
	.ascii "\\x%2X\0"
LC3:
	.ascii "\\x0%1X\0"
LC4:
	.ascii "\12\0"
	.text
	.p2align 2,,3
	.globl	__Z3decPcch
	.def	__Z3decPcch;	.scl	2;	.type	32;	.endef
__Z3decPcch:
LFB530:
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
	mov	ebp, DWORD PTR [esp+48]
	mov	esi, DWORD PTR [esp+56]
	movzx	edi, BYTE PTR [esp+52]
	mov	DWORD PTR [esp], OFFSET FLAT:LC0
	call	_puts
	and	esi, 255
	je	L6
	xor	ebx, ebx
	jmp	L2
	.p2align 2,,3
L13:
	mov	DWORD PTR [esp], OFFSET FLAT:LC2
	call	_printf
	mov	eax, ebx
	and	eax, 15
	cmp	eax, 15
	je	L12
L5:
	inc	ebx
	cmp	ebx, esi
	je	L6
L2:
	mov	eax, edi
	xor	al, BYTE PTR [ebp+0+ebx]
	movzx	edx, al
	mov	DWORD PTR [esp+4], edx
	cmp	al, 15
	ja	L13
	mov	DWORD PTR [esp], OFFSET FLAT:LC3
	call	_printf
	mov	eax, ebx
	and	eax, 15
	cmp	eax, 15
	jne	L5
L12:
	mov	DWORD PTR [esp], OFFSET FLAT:LC4
	call	_puts
	inc	ebx
	cmp	ebx, esi
	jne	L2
L6:
	mov	DWORD PTR [esp+48], OFFSET FLAT:LC1
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
	jmp	_puts
	.cfi_endproc
LFE530:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC5:
	.ascii "Please enter your flag: \0"
LC6:
	.ascii "%100s\0"
LC7:
	.ascii "Try Again......\0"
	.align 4
LC8:
	.ascii "Failed to unpack func_in_smc from \"func_in_smc_afterXOR\"!\12\0"
	.align 4
LC9:
	.ascii "\12Successfully unpack func_in_smc from \"func_in_smc_afterXOR\"!\12\0"
	.align 4
LC10:
	.ascii "Sorry, your flag is not correct!\12\0"
	.align 4
LC11:
	.ascii "Well done! You get the correct flag!\12\0"
LC12:
	.ascii "pause\0"
	.section	.text.startup,"x"
	.p2align 2,,3
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB531:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	push	edi
	push	ebx
	and	esp, -16
	add	esp, -128
	.cfi_offset 7, -12
	.cfi_offset 3, -16
	call	___main
	lea	edi, [esp+28]
	mov	ecx, 25
	xor	eax, eax
	rep stosd
	mov	DWORD PTR [esp], OFFSET FLAT:LC5
	call	_puts
	lea	ebx, [esp+28]
	mov	DWORD PTR [esp+4], ebx
	mov	DWORD PTR [esp], OFFSET FLAT:LC6
	call	_scanf
	mov	ecx, -1
	xor	eax, eax
	mov	edi, ebx
	repnz scasb
	cmp	ecx, -7
	jne	L23
	xor	eax, eax
	jmp	L15
	.p2align 2,,3
L17:
	inc	eax
	cmp	eax, 100
	je	L24
L15:
	mov	dl, BYTE PTR _func_in_smc_afterXOR[eax]
	xor	edx, 103
	mov	BYTE PTR _func_in_smc_afterXOR[eax], dl
	cmp	dl, BYTE PTR _func_in_smc[eax]
	je	L17
	mov	DWORD PTR [esp], OFFSET FLAT:LC8
	call	_puts
	or	eax, -1
L14:
	lea	esp, [ebp-8]
	pop	ebx
	.cfi_remember_state
	.cfi_restore 3
	pop	edi
	.cfi_restore 7
	pop	ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
L23:
	.cfi_restore_state
	mov	DWORD PTR [esp], OFFSET FLAT:LC7
	call	_puts
	xor	eax, eax
	jmp	L14
L24:
	mov	DWORD PTR [esp], OFFSET FLAT:LC9
	call	_puts
	mov	DWORD PTR [esp], ebx
	call	_func_in_smc_afterXOR
	test	eax, eax
	je	L18
	mov	DWORD PTR [esp], OFFSET FLAT:LC10
	call	_puts
L19:
	mov	DWORD PTR [esp], OFFSET FLAT:LC12
	call	_system
	xor	eax, eax
	jmp	L14
L18:
	mov	DWORD PTR [esp], OFFSET FLAT:LC11
	call	_puts
	jmp	L19
	.cfi_endproc
LFE531:
	.globl	_func_in_smc_afterXOR
	.data
	.align 32
_func_in_smc_afterXOR:
	.ascii "2\356\202\354\"o\355g[\24\23`\337fggg\214(\354\"o'\355g[\12\23`\337fggg\214Y\354\"o\344\247e\355g[\16\23`\337fggg\214L\354\"o\344\247d\355g[\13\23`\337fggg\214\177\354\"o\344\247c\355g[\2\23`\337fggg\214b\337gggg:\244\0"
	.globl	_func_in_smc
	.align 32
_func_in_smc:
	.ascii "U\211\345\213E\10\212\0<st\7\270\1\0\0\0\353O\213E\10@\212\0<mt\7\270\1\0\0\0\353>\213E\10\203\300\2\212\0<it\7\270\1\0\0\0\353+\213E\10\203\300\3\212\0<lt\7\270\1\0\0\0\353\30\213E\10\203\300\4\212\0<et\7\270\1\0\0\0\353\5\270\0\0\0\0]\303\0"
	.ident	"GCC: (i686-posix-dwarf-rev0, Built by MinGW-W64 project) 8.1.0"
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_system;	.scl	2;	.type	32;	.endef
