	.file	"mines.c"
	.intel_syntax noprefix
	.text
	.globl	_DestroyGame
	.def	_DestroyGame;	.scl	2;	.type	32;	.endef
_DestroyGame:
LFB109:
	.cfi_startproc
	push	ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	sub	esp, 24
	.cfi_def_cfa_offset 32
	mov	ebx, DWORD PTR [esp+32]
	mov	eax, DWORD PTR [ebx]
	mov	DWORD PTR [esp], eax
	call	_free
	mov	DWORD PTR [ebx], 0
	add	esp, 24
	.cfi_def_cfa_offset 8
	pop	ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
LFE109:
	.globl	_InitializeGame
	.def	_InitializeGame;	.scl	2;	.type	32;	.endef
_InitializeGame:
LFB110:
	.cfi_startproc
	mov	eax, DWORD PTR [esp+4]
	mov	BYTE PTR [eax], 0
	mov	BYTE PTR [eax+1], 0
	mov	DWORD PTR [eax+4], 0
	ret
	.cfi_endproc
LFE110:
	.globl	_CreateGame
	.def	_CreateGame;	.scl	2;	.type	32;	.endef
_CreateGame:
LFB108:
	.cfi_startproc
	push	ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	sub	esp, 24
	.cfi_def_cfa_offset 32
	mov	DWORD PTR [esp], 8
	call	_malloc
	mov	ebx, eax
	test	eax, eax
	je	L4
	mov	DWORD PTR [esp], eax
	call	_InitializeGame
L4:
	mov	eax, ebx
	add	esp, 24
	.cfi_def_cfa_offset 8
	pop	ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
LFE108:
	.globl	_DestroyMap
	.def	_DestroyMap;	.scl	2;	.type	32;	.endef
_DestroyMap:
LFB112:
	.cfi_startproc
	push	esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	push	ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	sub	esp, 20
	.cfi_def_cfa_offset 32
	mov	esi, DWORD PTR [esp+32]
	mov	ebx, 0
L8:
	mov	edx, DWORD PTR [esi]
	cmp	DWORD PTR [edx], ebx
	jle	L11
	lea	eax, [0+ebx*4]
	add	eax, DWORD PTR [edx+36]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR [esp], eax
	call	_free
	inc	ebx
	jmp	L8
L11:
	mov	eax, DWORD PTR [edx+36]
	mov	DWORD PTR [esp], eax
	call	_free
	mov	eax, DWORD PTR [esi]
	mov	DWORD PTR [esp], eax
	call	_free
	mov	DWORD PTR [esi], 0
	add	esp, 20
	.cfi_def_cfa_offset 12
	pop	ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	pop	esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
LFE112:
	.globl	_ClearBlockTable
	.def	_ClearBlockTable;	.scl	2;	.type	32;	.endef
_ClearBlockTable:
LFB114:
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
	mov	ebp, DWORD PTR [esp+20]
	mov	edi, DWORD PTR [esp+28]
	mov	esi, 0
	jmp	L13
L19:
	inc	esi
L13:
	cmp	esi, DWORD PTR [esp+24]
	jge	L18
	mov	edx, 0
L15:
	cmp	edx, edi
	jge	L19
	lea	ecx, [ebp+0+esi*4]
	lea	eax, [0+edx*8]
	mov	ebx, eax
	add	ebx, DWORD PTR [ecx]
	mov	DWORD PTR [ebx], 0
	add	eax, DWORD PTR [ecx]
	mov	DWORD PTR [eax+4], 0
	inc	edx
	jmp	L15
L18:
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
LFE114:
	.globl	_InitializeMap
	.def	_InitializeMap;	.scl	2;	.type	32;	.endef
_InitializeMap:
LFB113:
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
	sub	esp, 16
	.cfi_def_cfa_offset 32
	mov	ebx, DWORD PTR [esp+32]
	mov	eax, DWORD PTR [esp+36]
	mov	edx, DWORD PTR [esp+40]
	mov	DWORD PTR [ebx], eax
	mov	DWORD PTR [ebx+4], edx
	mov	ecx, DWORD PTR [esp+44]
	mov	DWORD PTR [ebx+8], ecx
	imul	edx, eax
	mov	DWORD PTR [ebx+12], edx
	mov	DWORD PTR [ebx+16], 0
	mov	DWORD PTR [ebx+20], edx
	mov	DWORD PTR [ebx+24], 0
	mov	DWORD PTR [ebx+28], 0
	mov	DWORD PTR [ebx+32], 0
	sal	eax, 2
	mov	DWORD PTR [esp], eax
	call	_malloc
	mov	DWORD PTR [ebx+36], eax
	mov	esi, 0
L21:
	mov	eax, DWORD PTR [ebx]
	cmp	eax, esi
	jle	L24
	lea	edi, [0+esi*4]
	add	edi, DWORD PTR [ebx+36]
	mov	eax, DWORD PTR [ebx+4]
	sal	eax, 3
	mov	DWORD PTR [esp], eax
	call	_malloc
	mov	DWORD PTR [edi], eax
	inc	esi
	jmp	L21
L24:
	mov	edx, DWORD PTR [ebx+4]
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [ebx+36]
	mov	DWORD PTR [esp], eax
	call	_ClearBlockTable
	add	esp, 16
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
LFE113:
	.globl	_CreateMap
	.def	_CreateMap;	.scl	2;	.type	32;	.endef
_CreateMap:
LFB111:
	.cfi_startproc
	push	ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	sub	esp, 24
	.cfi_def_cfa_offset 32
	mov	DWORD PTR [esp], 40
	call	_malloc
	mov	ebx, eax
	test	eax, eax
	je	L25
	mov	eax, DWORD PTR [esp+40]
	mov	DWORD PTR [esp+12], eax
	mov	eax, DWORD PTR [esp+36]
	mov	DWORD PTR [esp+8], eax
	mov	eax, DWORD PTR [esp+32]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], ebx
	call	_InitializeMap
L25:
	mov	eax, ebx
	add	esp, 24
	.cfi_def_cfa_offset 8
	pop	ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
LFE111:
	.globl	_RandomDistributeMines
	.def	_RandomDistributeMines;	.scl	2;	.type	32;	.endef
_RandomDistributeMines:
LFB115:
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
	mov	edi, DWORD PTR [esp+80]
	mov	DWORD PTR [esp], 0
	call	__time32
	mov	DWORD PTR [esp], eax
	call	_srand
	mov	ebx, 0
	jmp	L29
L30:
	dec	ebx
L31:
	inc	ebx
L29:
	cmp	DWORD PTR [edi+8], ebx
	jle	L46
	call	_rand
	cdq
	idiv	DWORD PTR [edi]
	mov	esi, edx
	call	_rand
	cdq
	idiv	DWORD PTR [edi+4]
	mov	eax, DWORD PTR [edi+36]
	sal	edx, 3
	add	edx, DWORD PTR [eax+esi*4]
	cmp	DWORD PTR [edx], 0
	jne	L30
	mov	DWORD PTR [edx], 9
	jmp	L31
L46:
	mov	edx, 0
	mov	eax, edx
	mov	esi, edi
	jmp	L33
L48:
	mov	edx, DWORD PTR [esp+44]
	inc	edx
	mov	DWORD PTR [edi], edx
	jmp	L36
L49:
	mov	edi, DWORD PTR [esp+28]
	mov	ebp, DWORD PTR [esp+36]
	add	edi, DWORD PTR [ebx+ebp]
	mov	ebx, DWORD PTR [edi]
	inc	ebx
	mov	DWORD PTR [edi], ebx
	jmp	L37
L50:
	mov	ebx, DWORD PTR [esp+28]
	mov	edx, DWORD PTR [esp+36]
	add	ebx, DWORD PTR [edi+edx]
	mov	edx, DWORD PTR [ebx]
	inc	edx
	mov	DWORD PTR [ebx], edx
	jmp	L35
L51:
	add	edx, DWORD PTR [esp+28]
	mov	ebx, DWORD PTR [edx]
	inc	ebx
	mov	DWORD PTR [edx], ebx
	jmp	L38
L52:
	add	ebx, DWORD PTR [esp+28]
	mov	edi, DWORD PTR [ebx]
	inc	edi
	mov	DWORD PTR [ebx], edi
	jmp	L39
L53:
	mov	ebx, DWORD PTR [esp+28]
	mov	ebp, DWORD PTR [esp+36]
	add	ebx, DWORD PTR [edi+ebp]
	mov	edi, ebx
	mov	ebx, DWORD PTR [ebx]
	inc	ebx
	mov	DWORD PTR [edi], ebx
	jmp	L40
L54:
	mov	ebp, DWORD PTR [esp+28]
	mov	ebx, DWORD PTR [esp+36]
	add	ebp, DWORD PTR [edi+ebx]
	inc	DWORD PTR [ebp+0]
	jmp	L41
L34:
	inc	ecx
L43:
	cmp	DWORD PTR [esi+4], ecx
	jle	L47
	mov	ebx, DWORD PTR [esi+36]
	mov	DWORD PTR [esp+40], eax
	lea	ebp, [0+eax*4]
	mov	DWORD PTR [esp+36], ebp
	mov	DWORD PTR [esp+32], ecx
	lea	edi, [0+ecx*8]
	mov	DWORD PTR [esp+28], edi
	add	edi, DWORD PTR [ebx+ebp]
	mov	ebp, DWORD PTR [edi]
	mov	DWORD PTR [esp+44], ebp
	cmp	ebp, 9
	je	L34
	test	eax, eax
	jle	L35
	test	ecx, ecx
	jle	L36
	lea	ebp, [-8+ecx*8]
	mov	edx, ebp
	add	edx, DWORD PTR [ebx-4+eax*4]
	cmp	DWORD PTR [edx], 9
	je	L48
L36:
	mov	ebx, DWORD PTR [esi+36]
	mov	edx, DWORD PTR [esp+40]
	lea	edx, [-4+edx*4]
	mov	edi, DWORD PTR [esp+28]
	add	edi, DWORD PTR [ebx+edx]
	cmp	DWORD PTR [edi], 9
	je	L49
L37:
	lea	ebx, [ecx+1]
	cmp	ebx, DWORD PTR [esi+4]
	jge	L35
	mov	edi, DWORD PTR [esi+36]
	mov	ebx, DWORD PTR [esp+32]
	lea	ebx, [8+ebx*8]
	add	ebx, DWORD PTR [edi+edx]
	cmp	DWORD PTR [ebx], 9
	je	L50
L35:
	test	ecx, ecx
	jle	L38
	mov	edx, DWORD PTR [esi+36]
	mov	ebx, DWORD PTR [esp+36]
	mov	edx, DWORD PTR [edx+ebx]
	mov	ebx, DWORD PTR [esp+32]
	cmp	DWORD PTR [edx-8+ebx*8], 9
	je	L51
L38:
	lea	edx, [ecx+1]
	cmp	edx, DWORD PTR [esi+4]
	jge	L39
	mov	ebx, DWORD PTR [esi+36]
	mov	edi, DWORD PTR [esp+36]
	mov	ebx, DWORD PTR [ebx+edi]
	mov	edi, DWORD PTR [esp+32]
	cmp	DWORD PTR [ebx+8+edi*8], 9
	je	L52
L39:
	lea	ebx, [eax+1]
	cmp	ebx, DWORD PTR [esi]
	jge	L34
	test	ecx, ecx
	jle	L40
	mov	edi, DWORD PTR [esi+36]
	mov	ebx, DWORD PTR [esp+32]
	lea	ebx, [-8+ebx*8]
	mov	ebp, DWORD PTR [esp+40]
	add	ebx, DWORD PTR [edi+4+ebp*4]
	cmp	DWORD PTR [ebx], 9
	je	L53
L40:
	mov	edi, DWORD PTR [esi+36]
	mov	ebx, DWORD PTR [esp+40]
	lea	ebx, [4+ebx*4]
	mov	DWORD PTR [esp+40], ebx
	mov	ebp, DWORD PTR [esp+28]
	add	ebp, DWORD PTR [edi+ebx]
	cmp	DWORD PTR [ebp+0], 9
	je	L54
L41:
	cmp	edx, DWORD PTR [esi+4]
	jge	L34
	mov	edi, DWORD PTR [esi+36]
	mov	edx, DWORD PTR [esp+32]
	lea	edx, [8+edx*8]
	mov	ebx, DWORD PTR [esp+40]
	add	edx, DWORD PTR [edi+ebx]
	cmp	DWORD PTR [edx], 9
	jne	L34
	mov	edx, DWORD PTR [esp+28]
	mov	ebx, DWORD PTR [esp+36]
	add	edx, DWORD PTR [edi+ebx]
	mov	ebx, DWORD PTR [edx]
	inc	ebx
	mov	DWORD PTR [edx], ebx
	jmp	L34
L47:
	inc	eax
L33:
	cmp	DWORD PTR [esi], eax
	jle	L55
	mov	ecx, 0
	jmp	L43
L55:
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
LFE115:
	.section .rdata,"dr"
LC0:
	.ascii "%%%dd \0"
LC1:
	.ascii " %%-%dd\0"
LC2:
	.ascii "\0"
LC3:
	.ascii " \0"
LC4:
	.ascii " \12\0"
LC5:
	.ascii "+\0"
LC6:
	.ascii "-\0"
LC7:
	.ascii "+\12\0"
LC8:
	.ascii "\33[0m\0"
LC9:
	.ascii "|\0"
LC10:
	.ascii "\33[44;01m\0"
LC11:
	.ascii "   \0"
LC12:
	.ascii "\33[44;37;01m\0"
LC13:
	.ascii " F \0"
LC14:
	.ascii " ? \0"
LC15:
	.ascii "\33[34;01m\0"
LC16:
	.ascii " %d \0"
LC17:
	.ascii "\33[41;37;01m\0"
LC18:
	.ascii " * \0"
LC19:
	.ascii "|\12\0"
	.text
	.globl	_PrintMap
	.def	_PrintMap;	.scl	2;	.type	32;	.endef
_PrintMap:
LFB116:
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
	sub	esp, 268
	.cfi_def_cfa_offset 288
	mov	eax, DWORD PTR [esp+288]
	mov	ebx, DWORD PTR [eax]
	mov	ecx, 0
	jmp	L57
L58:
	inc	ecx
	mov	eax, 1717986919
	imul	ebx
	mov	eax, edx
	sar	eax, 2
	sar	ebx, 31
	sub	eax, ebx
	mov	ebx, eax
L57:
	test	ebx, ebx
	jne	L58
	mov	DWORD PTR [esp+44], ecx
	mov	DWORD PTR [esp+8], ecx
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC0
	lea	eax, [esp+156]
	mov	DWORD PTR [esp], eax
	call	_sprintf
	mov	eax, DWORD PTR [esp+288]
	mov	ecx, DWORD PTR [eax+4]
	jmp	L59
L60:
	inc	ebx
	mov	eax, 1717986919
	imul	ecx
	mov	eax, edx
	sar	eax, 2
	sar	ecx, 31
	sub	eax, ecx
	mov	ecx, eax
L59:
	test	ecx, ecx
	jne	L60
	mov	DWORD PTR [esp+20], ecx
	mov	ebp, ebx
	cmp	ebx, 3
	jge	L61
	mov	ebp, 3
L61:
	mov	DWORD PTR [esp+8], ebp
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC1
	lea	eax, [esp+56]
	mov	DWORD PTR [esp], eax
	call	_sprintf
	lea	eax, [ebp+1]
	mov	edx, DWORD PTR [esp+288]
	imul	eax, DWORD PTR [edx+4]
	mov	edx, DWORD PTR [esp+44]
	lea	edx, [eax+2+edx]
	mov	eax, 80
	sub	eax, edx
	mov	edx, eax
	shr	edx, 31
	add	eax, edx
	sar	eax
	mov	esi, eax
	mov	DWORD PTR [esp+36], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC2
	call	_printf
	mov	ebx, DWORD PTR [esp+20]
	jmp	L62
L63:
	mov	DWORD PTR [esp], OFFSET FLAT:LC3
	call	_printf
	inc	ebx
L62:
	cmp	ebx, esi
	jl	L63
	mov	ebx, DWORD PTR [esp+20]
	mov	esi, DWORD PTR [esp+44]
	jmp	L64
L65:
	mov	DWORD PTR [esp], OFFSET FLAT:LC3
	call	_printf
	inc	ebx
L64:
	cmp	esi, ebx
	jge	L65
	mov	ebx, DWORD PTR [esp+20]
	mov	esi, DWORD PTR [esp+288]
	jmp	L66
L67:
	inc	ebx
	mov	DWORD PTR [esp+4], ebx
	lea	eax, [esp+56]
	mov	DWORD PTR [esp], eax
	call	_printf
L66:
	cmp	DWORD PTR [esi+4], ebx
	jg	L67
	mov	DWORD PTR [esp], OFFSET FLAT:LC4
	call	_printf
	mov	ebx, DWORD PTR [esp+20]
	mov	esi, DWORD PTR [esp+36]
	jmp	L68
L69:
	mov	DWORD PTR [esp], OFFSET FLAT:LC3
	call	_printf
	inc	ebx
L68:
	cmp	ebx, esi
	jl	L69
	mov	ebx, DWORD PTR [esp+20]
	mov	esi, DWORD PTR [esp+44]
	jmp	L70
L71:
	mov	DWORD PTR [esp], OFFSET FLAT:LC3
	call	_printf
	inc	ebx
L70:
	cmp	esi, ebx
	jge	L71
	mov	esi, DWORD PTR [esp+20]
	mov	edi, DWORD PTR [esp+288]
	jmp	L72
L74:
	mov	DWORD PTR [esp], OFFSET FLAT:LC6
	call	_printf
	inc	ebx
L73:
	cmp	ebx, ebp
	jl	L74
	inc	esi
L72:
	cmp	DWORD PTR [edi+4], esi
	jle	L101
	mov	DWORD PTR [esp], OFFSET FLAT:LC5
	call	_printf
	mov	ebx, DWORD PTR [esp+20]
	jmp	L73
L101:
	mov	DWORD PTR [esp], OFFSET FLAT:LC7
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC8
	call	_printf
	mov	eax, DWORD PTR [esp+20]
	mov	DWORD PTR [esp+28], eax
	mov	edi, DWORD PTR [esp+288]
	jmp	L76
L77:
	mov	DWORD PTR [esp], OFFSET FLAT:LC3
	call	_printf
	inc	ebx
L98:
	cmp	ebx, esi
	jl	L77
	mov	DWORD PTR [esp], OFFSET FLAT:LC2
	call	_printf
	mov	eax, DWORD PTR [esp+28]
	inc	eax
	mov	DWORD PTR [esp+40], eax
	mov	DWORD PTR [esp+4], eax
	lea	eax, [esp+156]
	mov	DWORD PTR [esp], eax
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC8
	call	_printf
	mov	eax, DWORD PTR [esp+20]
	mov	DWORD PTR [esp+24], eax
	jmp	L78
L107:
	mov	DWORD PTR [esp], OFFSET FLAT:LC8
	call	_printf
	mov	eax, DWORD PTR [edi+36]
	mov	edx, DWORD PTR [esp+28]
	lea	esi, [0+edx*4]
	mov	edx, DWORD PTR [esp+24]
	sal	edx, 3
	mov	DWORD PTR [esp+32], edx
	add	edx, DWORD PTR [eax+esi]
	mov	eax, DWORD PTR [edx+4]
	test	eax, eax
	je	L102
	cmp	eax, 1
	je	L103
	cmp	eax, 2
	je	L104
	mov	eax, DWORD PTR [edx]
	test	eax, eax
	je	L105
	dec	eax
	cmp	eax, 7
	ja	L86
	mov	DWORD PTR [esp], OFFSET FLAT:LC15
	call	_printf
	mov	eax, DWORD PTR [edi+36]
	mov	edx, DWORD PTR [esp+32]
	add	edx, DWORD PTR [eax+esi]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC16
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC8
	call	_printf
	jmp	L82
L102:
	mov	DWORD PTR [esp], OFFSET FLAT:LC10
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC11
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC8
	call	_printf
L82:
	mov	DWORD PTR [esp], OFFSET FLAT:LC2
	call	_printf
	mov	esi, DWORD PTR [esp+20]
	jmp	L87
L103:
	mov	DWORD PTR [esp], OFFSET FLAT:LC12
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC13
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC8
	call	_printf
	jmp	L82
L104:
	mov	DWORD PTR [esp], OFFSET FLAT:LC12
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC14
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC8
	call	_printf
	jmp	L82
L105:
	mov	DWORD PTR [esp], OFFSET FLAT:LC11
	call	_printf
	jmp	L82
L86:
	mov	DWORD PTR [esp], OFFSET FLAT:LC17
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC18
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC8
	call	_printf
	jmp	L82
L88:
	mov	DWORD PTR [esp], OFFSET FLAT:LC3
	call	_printf
	inc	esi
L87:
	mov	eax, ebx
	shr	eax, 31
	add	eax, ebx
	sar	eax
	mov	ecx, ebx
	sub	ecx, eax
	mov	eax, ecx
	dec	eax
	cmp	eax, esi
	jg	L88
	mov	DWORD PTR [esp], OFFSET FLAT:LC8
	call	_printf
	inc	DWORD PTR [esp+24]
L78:
	mov	eax, DWORD PTR [esp+24]
	cmp	DWORD PTR [edi+4], eax
	jle	L106
	mov	DWORD PTR [esp], OFFSET FLAT:LC2
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC9
	call	_printf
	mov	esi, DWORD PTR [esp+20]
L79:
	lea	ebx, [ebp-1]
	mov	eax, ebx
	shr	eax, 31
	add	eax, ebx
	sar	eax
	dec	eax
	cmp	eax, esi
	jle	L107
	mov	DWORD PTR [esp], OFFSET FLAT:LC3
	call	_printf
	inc	esi
	jmp	L79
L106:
	mov	DWORD PTR [esp], OFFSET FLAT:LC2
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC19
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC8
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC2
	call	_printf
	mov	ebx, DWORD PTR [esp+20]
	mov	esi, DWORD PTR [esp+36]
	jmp	L90
L91:
	mov	DWORD PTR [esp], OFFSET FLAT:LC3
	call	_printf
	inc	ebx
L90:
	cmp	ebx, esi
	jl	L91
	mov	ebx, DWORD PTR [esp+20]
	mov	esi, DWORD PTR [esp+44]
	jmp	L92
L93:
	mov	DWORD PTR [esp], OFFSET FLAT:LC3
	call	_printf
	inc	ebx
L92:
	cmp	esi, ebx
	jge	L93
	mov	esi, DWORD PTR [esp+20]
	jmp	L94
L96:
	mov	DWORD PTR [esp], OFFSET FLAT:LC6
	call	_printf
	inc	ebx
L95:
	cmp	ebx, ebp
	jl	L96
	inc	esi
L94:
	cmp	DWORD PTR [edi+4], esi
	jle	L108
	mov	DWORD PTR [esp], OFFSET FLAT:LC5
	call	_printf
	mov	ebx, DWORD PTR [esp+20]
	jmp	L95
L108:
	mov	DWORD PTR [esp], OFFSET FLAT:LC7
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC8
	call	_printf
	mov	eax, DWORD PTR [esp+40]
	mov	DWORD PTR [esp+28], eax
L76:
	mov	eax, DWORD PTR [esp+28]
	cmp	DWORD PTR [edi], eax
	jle	L109
	mov	ebx, DWORD PTR [esp+20]
	mov	esi, DWORD PTR [esp+36]
	jmp	L98
L109:
	add	esp, 268
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
LFE116:
	.globl	_HandleBlock
	.def	_HandleBlock;	.scl	2;	.type	32;	.endef
_HandleBlock:
LFB117:
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
	mov	ebx, DWORD PTR [esp+80]
	mov	esi, DWORD PTR [esp+84]
	mov	edi, DWORD PTR [esp+88]
	test	esi, esi
	js	L136
	cmp	DWORD PTR [ebx], esi
	jle	L137
	test	edi, edi
	js	L138
	cmp	DWORD PTR [ebx+4], edi
	jle	L139
	mov	ecx, DWORD PTR [ebx+36]
	lea	edx, [0+esi*4]
	lea	eax, [0+edi*8]
	mov	ebp, eax
	add	ebp, DWORD PTR [ecx+edx]
	mov	ecx, ebp
	cmp	DWORD PTR [ebp+4], 3
	je	L140
	mov	ebp, DWORD PTR [esp+92]
	mov	DWORD PTR [ecx+4], ebp
	mov	ecx, DWORD PTR [ebx+36]
	add	eax, DWORD PTR [ecx+edx]
	cmp	DWORD PTR [eax+4], 3
	je	L144
L112:
	mov	DWORD PTR [ebx+16], 0
	mov	DWORD PTR [ebx+24], 0
	mov	DWORD PTR [ebx+28], 0
	mov	DWORD PTR [ebx+32], 0
	mov	edi, 0
	jmp	L130
L144:
	cmp	DWORD PTR [eax], 0
	jne	L112
	mov	eax, DWORD PTR [ebx+4]
	imul	eax, DWORD PTR [ebx]
	sal	eax, 3
	mov	DWORD PTR [esp], eax
	call	_malloc
	mov	DWORD PTR [esp+36], eax
	mov	DWORD PTR [eax], esi
	mov	DWORD PTR [eax+4], edi
	mov	ebp, 0
	mov	DWORD PTR [esp+28], ebp
	jmp	L123
L118:
	mov	ecx, DWORD PTR [ebx+36]
	add	ebp, DWORD PTR [ecx+esi]
	mov	DWORD PTR [ebp+4], 3
L114:
	test	eax, eax
	jle	L141
	mov	edi, DWORD PTR [ebx+36]
	lea	esi, [0+edx*4]
	lea	ecx, [-8+eax*8]
	mov	ebp, ecx
	add	ebp, DWORD PTR [edi+esi]
	cmp	DWORD PTR [ebp+0], 0
	jne	L120
	cmp	DWORD PTR [ebp+4], 3
	je	L120
	inc	DWORD PTR [esp+32]
	mov	edi, DWORD PTR [esp+32]
	mov	ebp, DWORD PTR [esp+36]
	lea	edi, [ebp+0+edi*8]
	mov	DWORD PTR [edi], edx
	lea	ebp, [eax-1]
	mov	DWORD PTR [edi+4], ebp
L120:
	mov	edi, DWORD PTR [ebx+36]
	add	ecx, DWORD PTR [edi+esi]
	mov	DWORD PTR [ecx+4], 3
	mov	edi, DWORD PTR [esp+32]
	mov	DWORD PTR [esp+28], edi
L119:
	lea	edi, [eax+1]
	cmp	edi, DWORD PTR [ebx+4]
	jge	L121
	lea	esi, [0+edx*4]
	lea	ecx, [8+eax*8]
	mov	ebp, ecx
	mov	DWORD PTR [esp+32], ecx
	mov	ecx, DWORD PTR [ebx+36]
	add	ebp, DWORD PTR [ecx+esi]
	cmp	DWORD PTR [ebp+0], 0
	jne	L122
	cmp	DWORD PTR [ebp+4], 3
	je	L122
	inc	DWORD PTR [esp+28]
	mov	ebp, DWORD PTR [esp+28]
	mov	ecx, DWORD PTR [esp+36]
	lea	ecx, [ecx+ebp*8]
	mov	DWORD PTR [ecx], edx
	mov	DWORD PTR [ecx+4], edi
L122:
	mov	ecx, DWORD PTR [ebx+36]
	mov	ebp, DWORD PTR [esp+32]
	add	ebp, DWORD PTR [ecx+esi]
	mov	DWORD PTR [ebp+4], 3
L121:
	lea	ecx, [edx+1]
	mov	DWORD PTR [esp+32], ecx
	cmp	ecx, DWORD PTR [ebx]
	jl	L145
L123:
	cmp	DWORD PTR [esp+28], 0
	js	L146
	mov	eax, DWORD PTR [esp+36]
	mov	edi, DWORD PTR [esp+28]
	lea	ecx, [eax+edi*8]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR [ecx+4]
	dec	edi
	mov	DWORD PTR [esp+32], edi
	test	edx, edx
	jle	L114
	test	eax, eax
	jle	L115
	mov	edi, DWORD PTR [ebx+36]
	lea	esi, [-4+edx*4]
	lea	ebp, [-8+eax*8]
	mov	DWORD PTR [esp+40], ebp
	add	ebp, DWORD PTR [edi+esi]
	cmp	DWORD PTR [ebp+0], 0
	jne	L116
	cmp	DWORD PTR [ebp+4], 3
	je	L116
	lea	edi, [edx-1]
	mov	DWORD PTR [ecx], edi
	lea	edi, [eax-1]
	mov	DWORD PTR [ecx+4], edi
	mov	edi, DWORD PTR [esp+28]
	mov	DWORD PTR [esp+32], edi
L116:
	mov	ecx, DWORD PTR [ebx+36]
	mov	edi, DWORD PTR [esp+40]
	add	edi, DWORD PTR [ecx+esi]
	mov	DWORD PTR [edi+4], 3
L115:
	mov	edi, DWORD PTR [ebx+36]
	lea	esi, [-4+edx*4]
	lea	ecx, [0+eax*8]
	mov	ebp, ecx
	add	ebp, DWORD PTR [edi+esi]
	cmp	DWORD PTR [ebp+0], 0
	jne	L117
	cmp	DWORD PTR [ebp+4], 3
	je	L117
	inc	DWORD PTR [esp+32]
	mov	edi, DWORD PTR [esp+32]
	mov	ebp, DWORD PTR [esp+36]
	lea	edi, [ebp+0+edi*8]
	lea	ebp, [edx-1]
	mov	DWORD PTR [edi], ebp
	mov	DWORD PTR [edi+4], eax
L117:
	mov	edi, DWORD PTR [ebx+36]
	add	ecx, DWORD PTR [edi+esi]
	mov	DWORD PTR [ecx+4], 3
	lea	ecx, [eax+1]
	mov	DWORD PTR [esp+28], ecx
	cmp	ecx, DWORD PTR [ebx+4]
	jge	L114
	mov	edi, DWORD PTR [ebx+36]
	lea	ebp, [8+eax*8]
	mov	ecx, ebp
	add	ecx, DWORD PTR [edi+esi]
	cmp	DWORD PTR [ecx], 0
	jne	L118
	cmp	DWORD PTR [ecx+4], 3
	je	L118
	inc	DWORD PTR [esp+32]
	mov	edi, DWORD PTR [esp+32]
	mov	ecx, DWORD PTR [esp+36]
	lea	edi, [ecx+edi*8]
	lea	ecx, [edx-1]
	mov	DWORD PTR [edi], ecx
	mov	ecx, DWORD PTR [esp+28]
	mov	DWORD PTR [edi+4], ecx
	jmp	L118
L141:
	mov	edi, DWORD PTR [esp+32]
	mov	DWORD PTR [esp+28], edi
	jmp	L119
L145:
	test	eax, eax
	jle	L124
	mov	esi, DWORD PTR [ebx+36]
	lea	ecx, [4+edx*4]
	mov	DWORD PTR [esp+40], ecx
	lea	ebp, [-8+eax*8]
	mov	DWORD PTR [esp+44], ebp
	add	ebp, DWORD PTR [esi+ecx]
	cmp	DWORD PTR [ebp+0], 0
	jne	L125
	cmp	DWORD PTR [ebp+4], 3
	je	L125
	inc	DWORD PTR [esp+28]
	mov	esi, DWORD PTR [esp+28]
	mov	ecx, DWORD PTR [esp+36]
	lea	esi, [ecx+esi*8]
	mov	ecx, DWORD PTR [esp+32]
	mov	DWORD PTR [esi], ecx
	lea	ecx, [eax-1]
	mov	DWORD PTR [esi+4], ecx
L125:
	mov	esi, DWORD PTR [ebx+36]
	mov	ebp, DWORD PTR [esp+40]
	mov	ecx, DWORD PTR [esp+44]
	add	ecx, DWORD PTR [esi+ebp]
	mov	DWORD PTR [ecx+4], 3
L124:
	mov	esi, DWORD PTR [ebx+36]
	lea	edx, [4+edx*4]
	mov	DWORD PTR [esp+40], eax
	lea	ebp, [0+eax*8]
	mov	DWORD PTR [esp+44], ebp
	add	ebp, DWORD PTR [esi+edx]
	cmp	DWORD PTR [ebp+0], 0
	jne	L126
	cmp	DWORD PTR [ebp+4], 3
	je	L126
	inc	DWORD PTR [esp+28]
	mov	esi, DWORD PTR [esp+28]
	mov	ecx, DWORD PTR [esp+36]
	lea	esi, [ecx+esi*8]
	mov	ecx, DWORD PTR [esp+32]
	mov	DWORD PTR [esi], ecx
	mov	DWORD PTR [esi+4], eax
L126:
	mov	eax, DWORD PTR [ebx+36]
	mov	ecx, DWORD PTR [esp+44]
	add	ecx, DWORD PTR [eax+edx]
	mov	DWORD PTR [ecx+4], 3
	cmp	edi, DWORD PTR [ebx+4]
	jge	L123
	mov	eax, DWORD PTR [ebx+36]
	mov	ecx, DWORD PTR [esp+40]
	lea	esi, [8+ecx*8]
	mov	ecx, esi
	add	ecx, DWORD PTR [eax+edx]
	cmp	DWORD PTR [ecx], 0
	jne	L128
	cmp	DWORD PTR [ecx+4], 3
	je	L128
	inc	DWORD PTR [esp+28]
	mov	ecx, DWORD PTR [esp+28]
	mov	eax, DWORD PTR [esp+36]
	lea	eax, [eax+ecx*8]
	mov	ecx, DWORD PTR [esp+32]
	mov	DWORD PTR [eax], ecx
	mov	DWORD PTR [eax+4], edi
L128:
	mov	eax, DWORD PTR [ebx+36]
	add	esi, DWORD PTR [eax+edx]
	mov	DWORD PTR [esi+4], 3
	jmp	L123
L146:
	mov	eax, DWORD PTR [esp+36]
	mov	DWORD PTR [esp], eax
	call	_free
	jmp	L112
L148:
	mov	esi, DWORD PTR [ebx+16]
	inc	esi
	mov	DWORD PTR [ebx+16], esi
	mov	esi, eax
	add	esi, DWORD PTR [edx]
	cmp	DWORD PTR [esi], 9
	jne	L131
	mov	esi, DWORD PTR [ebx+32]
	inc	esi
	mov	DWORD PTR [ebx+32], esi
	jmp	L131
L149:
	mov	esi, DWORD PTR [ebx+24]
	inc	esi
	mov	DWORD PTR [ebx+24], esi
	jmp	L132
L133:
	inc	ecx
L135:
	cmp	DWORD PTR [ebx+4], ecx
	jle	L147
	lea	edx, [0+edi*4]
	add	edx, DWORD PTR [ebx+36]
	lea	eax, [0+ecx*8]
	mov	esi, eax
	add	esi, DWORD PTR [edx]
	cmp	DWORD PTR [esi+4], 3
	je	L148
L131:
	mov	esi, eax
	add	esi, DWORD PTR [edx]
	cmp	DWORD PTR [esi+4], 1
	je	L149
L132:
	add	eax, DWORD PTR [edx]
	cmp	DWORD PTR [eax+4], 2
	jne	L133
	mov	eax, DWORD PTR [ebx+28]
	inc	eax
	mov	DWORD PTR [ebx+28], eax
	jmp	L133
L147:
	inc	edi
L130:
	cmp	DWORD PTR [ebx], edi
	jle	L150
	mov	ecx, 0
	jmp	L135
L150:
	mov	eax, DWORD PTR [ebx+12]
	sub	eax, DWORD PTR [ebx+16]
	mov	DWORD PTR [ebx+20], eax
	mov	al, 1
	jmp	L110
L136:
	mov	al, 0
L110:
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
L137:
	.cfi_restore_state
	mov	al, 0
	jmp	L110
L138:
	mov	al, 0
	jmp	L110
L139:
	mov	al, 0
	jmp	L110
L140:
	mov	al, 0
	jmp	L110
	.cfi_endproc
LFE117:
	.section .rdata,"dr"
LC20:
	.ascii "cls\0"
LC21:
	.ascii "                       \0"
LC22:
	.ascii "\33[32;01;05m\7\7\7\0"
	.align 4
LC23:
	.ascii "\271\247\317\262\243\254\304\372\322\321\311\250\263\366\313\371\323\320\265\330\300\327\243\254\323\316\317\267\312\244\300\373\243\241\12\0"
LC24:
	.ascii "                        \0"
LC25:
	.ascii "\33[31;01;05m\7\0"
	.align 4
LC26:
	.ascii "\272\334\322\305\272\266\243\254\304\372\262\310\265\275\301\313\265\330\300\327\243\254\323\316\317\267\312\247\260\334\243\241\12\0"
LC27:
	.ascii "\12\0"
	.align 4
LC28:
	.ascii "\33[4m                                                                                \33[0m\12\12\0"
LC29:
	.ascii "\12\12\0"
	.text
	.globl	_GameEndScreen
	.def	_GameEndScreen;	.scl	2;	.type	32;	.endef
_GameEndScreen:
LFB120:
	.cfi_startproc
	push	ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	sub	esp, 24
	.cfi_def_cfa_offset 32
	mov	ebx, DWORD PTR [esp+32]
	mov	DWORD PTR [esp], OFFSET FLAT:LC20
	call	_system
	cmp	BYTE PTR [ebx+1], 0
	je	L152
	mov	DWORD PTR [esp], OFFSET FLAT:LC21
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC22
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC23
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC8
	call	_printf
L153:
	mov	DWORD PTR [esp], OFFSET FLAT:LC27
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC28
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC27
	call	_printf
	mov	eax, DWORD PTR [ebx+4]
	mov	DWORD PTR [esp], eax
	call	_PrintMap
	mov	DWORD PTR [esp], OFFSET FLAT:LC29
	call	_printf
	add	esp, 24
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	pop	ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
L152:
	.cfi_restore_state
	mov	DWORD PTR [esp], OFFSET FLAT:LC24
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC25
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC26
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC8
	call	_printf
	jmp	L153
	.cfi_endproc
LFE120:
	.section .rdata,"dr"
LC30:
	.ascii "\33[47;30m\0"
LC31:
	.ascii "[ \315\263\274\306\320\305\317\242 ]\12\0"
LC32:
	.ascii "    \0"
LC33:
	.ascii "\320\320\312\375: \0"
LC34:
	.ascii "\33[33;01m\0"
LC35:
	.ascii "%-13d\0"
LC36:
	.ascii "\301\320\312\375: \0"
LC37:
	.ascii "\267\275\277\351\327\334\312\375: \0"
LC38:
	.ascii "%-9d\0"
LC39:
	.ascii "\265\330\300\327\312\375: \0"
LC40:
	.ascii "%-11d\0"
LC41:
	.ascii "\322\321\267\255\277\252\267\275\277\351\312\375: \0"
LC42:
	.ascii "%-5d\0"
LC43:
	.ascii "\316\264\267\255\277\252\267\275\277\351\312\375: \0"
LC44:
	.ascii "\306\354\261\352\312\375: \0"
LC45:
	.ascii "\322\311\316\312\261\352\312\375: \0"
	.text
	.globl	_GameInfo
	.def	_GameInfo;	.scl	2;	.type	32;	.endef
_GameInfo:
LFB121:
	.cfi_startproc
	push	ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	sub	esp, 24
	.cfi_def_cfa_offset 32
	mov	ebx, DWORD PTR [esp+32]
	mov	DWORD PTR [esp], OFFSET FLAT:LC30
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC31
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC8
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC32
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC33
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC34
	call	_printf
	mov	eax, DWORD PTR [ebx+4]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC35
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC8
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC36
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC34
	call	_printf
	mov	eax, DWORD PTR [ebx+4]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC35
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC8
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC37
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC34
	call	_printf
	mov	eax, DWORD PTR [ebx+4]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC38
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC8
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC39
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC34
	call	_printf
	mov	eax, DWORD PTR [ebx+4]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC40
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC8
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC27
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC32
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC41
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC34
	call	_printf
	mov	eax, DWORD PTR [ebx+4]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC42
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC8
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC43
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC34
	call	_printf
	mov	eax, DWORD PTR [ebx+4]
	mov	eax, DWORD PTR [eax+20]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC42
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC8
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC44
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC34
	call	_printf
	mov	eax, DWORD PTR [ebx+4]
	mov	eax, DWORD PTR [eax+24]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC40
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC8
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC45
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC34
	call	_printf
	mov	eax, DWORD PTR [ebx+4]
	mov	eax, DWORD PTR [eax+28]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC38
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC8
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC29
	call	_printf
	add	esp, 24
	.cfi_def_cfa_offset 8
	pop	ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
LFE121:
	.section .rdata,"dr"
LC46:
	.ascii "[ \262\331\327\367\313\265\303\367 ]\12\0"
LC47:
	.ascii "    \303\374\301\356\320\320\270\361\312\275\243\272\12\0"
LC48:
	.ascii "        \0"
	.align 4
LC49:
	.ascii "\320\320\261\340\272\305 \301\320\261\340\272\305 \267\275\277\351\262\331\327\367\326\270\301\356, \310\347 6 8 v \265\310\12\0"
LC50:
	.ascii "    \267\275\277\351\262\331\327\367\326\270\301\356\243\272\12\0"
LC51:
	.ascii "V\0"
LC52:
	.ascii ": \275\253\322\273\270\366\316\264\267\255\277\252\265\304\267\275\277\351\267\255\277\252\12\0"
LC53:
	.ascii "F\0"
	.align 4
LC54:
	.ascii ": \266\324\322\273\270\366\316\264\267\255\277\252\265\304\267\275\277\351\311\350\326\303\320\241\306\354\261\352\274\307\243\254\261\355\312\276\264\313\264\246\310\267\266\250\323\320\265\330\300\327\12\0"
LC55:
	.ascii "?\0"
	.align 4
LC56:
	.ascii ": \266\324\322\273\270\366\316\264\267\255\277\252\265\304\267\275\277\351\311\350\326\303\322\311\316\312\261\352\274\307\243\254\261\355\312\276\264\313\264\246\277\311\304\334\323\320\265\330\300\327\12\0"
LC57:
	.ascii "C\0"
	.align 4
LC58:
	.ascii ": \307\345\263\375\322\273\270\366\316\264\267\255\277\252\265\304\267\275\277\351\311\317\265\304\310\316\272\316\261\352\274\307\12\0"
	.text
	.globl	_GameHelp
	.def	_GameHelp;	.scl	2;	.type	32;	.endef
_GameHelp:
LFB122:
	.cfi_startproc
	sub	esp, 28
	.cfi_def_cfa_offset 32
	mov	DWORD PTR [esp], OFFSET FLAT:LC30
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC46
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC8
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC47
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC48
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC34
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC49
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC8
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC50
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC48
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC34
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC51
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC8
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC52
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC48
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC34
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC53
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC8
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC54
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC48
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC34
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC55
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC8
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC56
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC48
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC34
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC57
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC8
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC58
	call	_printf
	add	esp, 28
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
LFE122:
	.section .rdata,"dr"
LC59:
	.ascii "[ \304\321\266\310 ]\12\0"
	.align 4
LC60:
	.ascii "    %d. \263\365\274\266\243\250 9\320\320 x  9\301\320\243\254"
	.ascii "10\270\366\265\330\300\327\243\251\12\0"
	.align 4
LC61:
	.ascii "    %d. \326\320\274\266\243\250"
	.ascii "16\320\320 x 16\301\320\243\254"
	.ascii "40\270\366\265\330\300\327\243\251\12\0"
	.align 4
LC62:
	.ascii "    %d. \270\337\274\266\243\250"
	.ascii "16\320\320 x 30\301\320\243\254"
	.ascii "99\270\366\265\330\300\327\243\251\12\0"
LC63:
	.ascii "    %d. \327\324\266\250\322\345\12\0"
LC64:
	.ascii "\33[32m\0"
LC65:
	.ascii "\307\353\321\241\324\361\304\321\266\310\243\272\0"
LC66:
	.ascii "\33[32;01m\0"
LC67:
	.ascii "%d\0"
LC68:
	.ascii "\33[31m\0"
LC69:
	.ascii "\307\353\312\344\310\353\325\375\310\267\265\304\261\340\272\305\243\241\12\0"
LC70:
	.ascii "\320\320\312\375\243\272\0"
LC71:
	.ascii "\320\320\312\375\267\266\316\247\243\272%d ~ %d\243\241\12\0"
LC72:
	.ascii "\301\320\312\375\243\272\0"
LC73:
	.ascii "\301\320\312\375\267\266\316\247\243\272%d ~ %d\243\241\12\0"
LC74:
	.ascii "\265\330\300\327\312\375\243\272\0"
LC77:
	.ascii "\265\330\300\327\312\375\267\266\316\247\243\272%d ~ %d\243\241\12\0"
LC78:
	.ascii "\314\341\312\276\0"
	.align 4
LC79:
	.ascii "\307\353\327\320\317\270\324\304\266\301\323\316\317\267\262\331\327\367\313\265\303\367\262\242\327\274\261\270\277\252\312\274\311\250\300\327 ^_^\243\241\0"
LC80:
	.ascii "pause\0"
	.text
	.globl	_GameStartScreen
	.def	_GameStartScreen;	.scl	2;	.type	32;	.endef
_GameStartScreen:
LFB118:
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
	sub	esp, 48
	.cfi_def_cfa_offset 64
	mov	DWORD PTR [esp], OFFSET FLAT:LC20
	call	_system
	mov	DWORD PTR [esp], OFFSET FLAT:_mines_title
	call	[DWORD PTR __imp__SetConsoleTitleA@4]
	.cfi_def_cfa_offset 60
	sub	esp, 4
	.cfi_def_cfa_offset 64
	mov	DWORD PTR [esp], OFFSET FLAT:LC30
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC59
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC8
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC27
	call	_printf
	mov	DWORD PTR [esp+4], 1
	mov	DWORD PTR [esp], OFFSET FLAT:LC60
	call	_printf
	mov	DWORD PTR [esp+4], 2
	mov	DWORD PTR [esp], OFFSET FLAT:LC61
	call	_printf
	mov	DWORD PTR [esp+4], 3
	mov	DWORD PTR [esp], OFFSET FLAT:LC62
	call	_printf
	mov	DWORD PTR [esp+4], 0
	mov	DWORD PTR [esp], OFFSET FLAT:LC63
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC27
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC28
	call	_printf
	jmp	L161
L185:
	mov	DWORD PTR [esp], OFFSET FLAT:LC68
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC69
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC8
	call	_printf
L160:
	cmp	ebx, 3
	jbe	L184
L161:
	mov	DWORD PTR [esp], OFFSET FLAT:LC64
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC65
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC8
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC66
	call	_printf
	lea	eax, [esp+32]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC67
	call	_scanf
	mov	DWORD PTR [esp], OFFSET FLAT:LC8
	call	_printf
	mov	ebx, DWORD PTR [esp+32]
	cmp	ebx, 3
	jbe	L160
	jmp	L185
L184:
	mov	eax, DWORD PTR [esp+32]
	cmp	eax, 1
	je	L186
	cmp	eax, 2
	je	L187
	cmp	eax, 3
	jne	L165
	mov	DWORD PTR [esp+44], 16
	mov	DWORD PTR [esp+40], 30
	mov	DWORD PTR [esp+36], 99
	jmp	L163
L186:
	mov	DWORD PTR [esp+44], 9
	mov	DWORD PTR [esp+40], 9
	mov	DWORD PTR [esp+36], 10
L163:
	mov	eax, DWORD PTR [esp+36]
	mov	DWORD PTR [esp+8], eax
	mov	eax, DWORD PTR [esp+40]
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [esp+44]
	mov	DWORD PTR [esp], eax
	call	_CreateMap
	mov	edx, DWORD PTR [esp+64]
	mov	DWORD PTR [edx+4], eax
	mov	DWORD PTR [esp+12], 17
	mov	DWORD PTR [esp+8], OFFSET FLAT:LC78
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC79
	mov	DWORD PTR [esp], 0
	call	[DWORD PTR __imp__MessageBoxA@16]
	.cfi_def_cfa_offset 48
	sub	esp, 16
	.cfi_def_cfa_offset 64
	cmp	eax, 1
	jne	L176
	call	_GameHelp
	mov	DWORD PTR [esp], OFFSET FLAT:LC80
	call	_system
	add	esp, 48
	.cfi_remember_state
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
L187:
	.cfi_restore_state
	mov	DWORD PTR [esp+44], 16
	mov	DWORD PTR [esp+40], 16
	mov	DWORD PTR [esp+36], 40
	jmp	L163
L189:
	mov	eax, 0
L166:
	mov	bl, al
	and	ebx, 1
	je	L188
L167:
	test	bl, bl
	jne	L170
L165:
	mov	DWORD PTR [esp], OFFSET FLAT:LC64
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC70
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC8
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC66
	call	_printf
	lea	eax, [esp+44]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC67
	call	_scanf
	mov	DWORD PTR [esp], OFFSET FLAT:LC8
	call	_printf
	cmp	DWORD PTR [esp+44], 1
	jle	L189
	mov	eax, 1
	jmp	L166
L188:
	mov	DWORD PTR [esp], OFFSET FLAT:LC68
	call	_printf
	mov	DWORD PTR [esp+8], 2147483647
	mov	DWORD PTR [esp+4], 2
	mov	DWORD PTR [esp], OFFSET FLAT:LC71
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC8
	call	_printf
	jmp	L167
L191:
	mov	eax, 0
L168:
	mov	bl, al
	and	ebx, 1
	je	L190
L169:
	test	bl, bl
	jne	L175
L170:
	mov	DWORD PTR [esp], OFFSET FLAT:LC64
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC72
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC8
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC66
	call	_printf
	lea	eax, [esp+40]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC67
	call	_scanf
	mov	DWORD PTR [esp], OFFSET FLAT:LC8
	call	_printf
	cmp	DWORD PTR [esp+40], 1
	jle	L191
	mov	eax, 1
	jmp	L168
L190:
	mov	DWORD PTR [esp], OFFSET FLAT:LC68
	call	_printf
	mov	DWORD PTR [esp+8], 2147483647
	mov	DWORD PTR [esp+4], 2
	mov	DWORD PTR [esp], OFFSET FLAT:LC73
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC8
	call	_printf
	jmp	L169
L193:
	mov	edi, 1
	jmp	L171
L194:
	mov	esi, 1
	jmp	L172
L179:
	mov	eax, 0
L173:
	mov	bl, al
	and	ebx, 1
	je	L192
L174:
	test	bl, bl
	jne	L163
L175:
	mov	DWORD PTR [esp], OFFSET FLAT:LC64
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC74
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC8
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC66
	call	_printf
	lea	eax, [esp+36]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC67
	call	_scanf
	mov	DWORD PTR [esp], OFFSET FLAT:LC8
	call	_printf
	mov	eax, DWORD PTR [esp+44]
	imul	eax, DWORD PTR [esp+40]
	mov	DWORD PTR [esp+20], eax
	fild	DWORD PTR [esp+20]
	fld	st(0)
	fmul	QWORD PTR LC75
	fnstcw	WORD PTR [esp+30]
	mov	ax, WORD PTR [esp+30]
	or	ah, 12
	mov	WORD PTR [esp+28], ax
	fldcw	WORD PTR [esp+28]
	fistp	DWORD PTR [esp+24]
	fldcw	WORD PTR [esp+30]
	mov	eax, DWORD PTR [esp+24]
	mov	edi, eax
	test	eax, eax
	jle	L193
L171:
	fmul	QWORD PTR LC76
	fldcw	WORD PTR [esp+28]
	fistp	DWORD PTR [esp+24]
	fldcw	WORD PTR [esp+30]
	mov	eax, DWORD PTR [esp+24]
	mov	esi, eax
	test	eax, eax
	jle	L194
L172:
	mov	eax, DWORD PTR [esp+36]
	cmp	eax, edi
	jl	L179
	cmp	eax, esi
	jle	L180
	mov	eax, 0
	jmp	L173
L180:
	mov	eax, 1
	jmp	L173
L192:
	mov	DWORD PTR [esp], OFFSET FLAT:LC68
	call	_printf
	mov	DWORD PTR [esp+8], esi
	mov	DWORD PTR [esp+4], edi
	mov	DWORD PTR [esp], OFFSET FLAT:LC77
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC8
	call	_printf
	jmp	L174
L176:
	mov	DWORD PTR [esp], 0
	call	_exit
	.cfi_endproc
LFE118:
	.section .rdata,"dr"
LC82:
	.ascii "\303\374\301\356\320\320\243\272\0"
LC83:
	.ascii "%d%d%s\0"
LC84:
	.ascii "\307\353\312\344\310\353\325\375\310\267\265\304\303\374\301\356\320\320\243\241\0"
LC85:
	.ascii "v\0"
LC86:
	.ascii "f\0"
LC87:
	.ascii "c\0"
	.text
	.globl	_GameProcessScreen
	.def	_GameProcessScreen;	.scl	2;	.type	32;	.endef
_GameProcessScreen:
LFB119:
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
	sub	esp, 140
	.cfi_def_cfa_offset 160
	mov	ebx, DWORD PTR [esp+160]
	jmp	L196
L197:
	mov	DWORD PTR [esp], OFFSET FLAT:LC27
	call	_puts
	mov	DWORD PTR [esp], ebx
	call	_GameHelp
	mov	DWORD PTR [esp+12], 1
	mov	DWORD PTR [esp+8], OFFSET FLAT:LC78
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC84
	mov	DWORD PTR [esp], 0
	call	[DWORD PTR __imp__MessageBoxA@16]
	.cfi_def_cfa_offset 144
	sub	esp, 16
	.cfi_def_cfa_offset 160
	test	eax, eax
	jne	L196
L198:
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC51
	lea	eax, [esp+20]
	mov	DWORD PTR [esp], eax
	call	_strcmp
	test	eax, eax
	jne	L214
	mov	esi, 1
	mov	ebp, 3
L200:
	mov	eax, esi
	test	al, al
	jne	L201
	mov	DWORD PTR [esp], OFFSET FLAT:LC27
	call	_puts
	mov	DWORD PTR [esp], ebx
	call	_GameHelp
	mov	DWORD PTR [esp+12], 1
	mov	DWORD PTR [esp+8], OFFSET FLAT:LC78
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC84
	mov	DWORD PTR [esp], 0
	call	[DWORD PTR __imp__MessageBoxA@16]
	.cfi_def_cfa_offset 144
	sub	esp, 16
	.cfi_def_cfa_offset 160
	test	eax, eax
	jne	L196
L201:
	mov	DWORD PTR [esp+12], ebp
	mov	eax, DWORD PTR [esp+120]
	dec	eax
	mov	DWORD PTR [esp+8], eax
	mov	eax, DWORD PTR [esp+124]
	dec	eax
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [ebx+4]
	mov	DWORD PTR [esp], eax
	call	_HandleBlock
	mov	eax, DWORD PTR [ebx+4]
	mov	ecx, DWORD PTR [eax+8]
	cmp	DWORD PTR [eax+20], ecx
	sete	dl
	mov	BYTE PTR [ebx+1], dl
	cmp	DWORD PTR [eax+32], 0
	jle	L215
	mov	edx, 1
L202:
	mov	al, dl
	and	eax, 1
	mov	BYTE PTR [ebx], al
L196:
	movzx	esi, BYTE PTR [ebx]
	mov	eax, esi
	test	al, al
	jne	L216
	mov	DWORD PTR [esp], OFFSET FLAT:LC29
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC20
	call	_system
	mov	eax, DWORD PTR [ebx+4]
	mov	DWORD PTR [esp], eax
	call	_PrintMap
	mov	DWORD PTR [esp], OFFSET FLAT:LC29
	call	_printf
	mov	DWORD PTR [esp], ebx
	call	_GameInfo
	mov	DWORD PTR [esp], OFFSET FLAT:LC64
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC82
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC8
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC66
	call	_printf
	mov	DWORD PTR [esp], 0
	call	[DWORD PTR __imp____acrt_iob_func]
	mov	DWORD PTR [esp], eax
	call	_rewind
	lea	edi, [esp+20]
	mov	DWORD PTR [esp+12], edi
	lea	eax, [esp+120]
	mov	DWORD PTR [esp+8], eax
	lea	eax, [esp+124]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC83
	call	_scanf
	mov	DWORD PTR [esp], edi
	call	_strlen
	cmp	eax, 100
	ja	L197
	mov	eax, DWORD PTR [ebx+4]
	mov	ecx, DWORD PTR [esp+124]
	cmp	DWORD PTR [eax], ecx
	jl	L197
	mov	ecx, DWORD PTR [esp+120]
	cmp	DWORD PTR [eax+4], ecx
	jge	L198
	jmp	L197
L214:
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC85
	lea	eax, [esp+20]
	mov	DWORD PTR [esp], eax
	call	_strcmp
	test	eax, eax
	jne	L217
	mov	esi, 1
	mov	ebp, 3
	jmp	L200
L217:
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC53
	lea	eax, [esp+20]
	mov	DWORD PTR [esp], eax
	call	_strcmp
	test	eax, eax
	jne	L218
	mov	esi, 1
	mov	ebp, 1
	jmp	L200
L218:
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC86
	lea	eax, [esp+20]
	mov	DWORD PTR [esp], eax
	call	_strcmp
	test	eax, eax
	jne	L219
	mov	esi, 1
	mov	ebp, 1
	jmp	L200
L219:
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC55
	lea	eax, [esp+20]
	mov	DWORD PTR [esp], eax
	call	_strcmp
	test	eax, eax
	jne	L220
	mov	esi, 1
	mov	ebp, 2
	jmp	L200
L220:
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC57
	lea	eax, [esp+20]
	mov	DWORD PTR [esp], eax
	call	_strcmp
	test	eax, eax
	jne	L221
	mov	esi, 1
	mov	ebp, 0
	jmp	L200
L221:
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC87
	lea	eax, [esp+20]
	mov	DWORD PTR [esp], eax
	call	_strcmp
	test	eax, eax
	jne	L200
	mov	esi, 1
	mov	ebp, 0
	jmp	L200
L215:
	test	dl, dl
	je	L212
	mov	edx, 1
	jmp	L202
L212:
	mov	edx, 0
	jmp	L202
L216:
	add	esp, 140
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
LFE119:
	.globl	_mines_title
	.data
	.align 4
_mines_title:
	.ascii "\311\250\300\327\0"
	.section .rdata,"dr"
	.align 8
LC75:
	.long	-1717986918
	.long	1068079513
	.align 8
LC76:
	.long	-858993459
	.long	1072483532
	.ident	"GCC: (i686-posix-dwarf-rev0, Built by MinGW-W64 project) 8.1.0"
	.def	_free;	.scl	2;	.type	32;	.endef
	.def	_malloc;	.scl	2;	.type	32;	.endef
	.def	__time32;	.scl	2;	.type	32;	.endef
	.def	_srand;	.scl	2;	.type	32;	.endef
	.def	_rand;	.scl	2;	.type	32;	.endef
	.def	_sprintf;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_system;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_exit;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_strcmp;	.scl	2;	.type	32;	.endef
	.def	_rewind;	.scl	2;	.type	32;	.endef
	.def	_strlen;	.scl	2;	.type	32;	.endef
