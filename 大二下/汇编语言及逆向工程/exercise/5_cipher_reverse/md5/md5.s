	.file	"md5.c"
	.intel_syntax noprefix
	.text
Ltext0:
	.globl	_S
	.section .rdata,"dr"
	.align 32
_S:
	.long	7
	.long	12
	.long	17
	.long	22
	.long	5
	.long	9
	.long	14
	.long	20
	.long	4
	.long	11
	.long	16
	.long	23
	.long	6
	.long	10
	.long	15
	.long	21
	.globl	_T
	.align 32
_T:
	.long	-680876936
	.long	-389564586
	.long	606105819
	.long	-1044525330
	.long	-176418897
	.long	1200080426
	.long	-1473231341
	.long	-45705983
	.long	1770035416
	.long	-1958414417
	.long	-42063
	.long	-1990404162
	.long	1804603682
	.long	-40341101
	.long	-1502002290
	.long	1236535329
	.long	-165796510
	.long	-1069501632
	.long	643717713
	.long	-373897302
	.long	-701558691
	.long	38016083
	.long	-660478335
	.long	-405537848
	.long	568446438
	.long	-1019803690
	.long	-187363961
	.long	1163531501
	.long	-1444681467
	.long	-51403784
	.long	1735328473
	.long	-1926607734
	.long	-378558
	.long	-2022574463
	.long	1839030562
	.long	-35309556
	.long	-1530992060
	.long	1272893353
	.long	-155497632
	.long	-1094730640
	.long	681279174
	.long	-358537222
	.long	-722521979
	.long	76029189
	.long	-640364487
	.long	-421815835
	.long	530742520
	.long	-995338651
	.long	-198630844
	.long	1126891415
	.long	-1416354905
	.long	-57434055
	.long	1700485571
	.long	-1894986606
	.long	-1051523
	.long	-2054922799
	.long	1873313359
	.long	-30611744
	.long	-1560198380
	.long	1309151649
	.long	-145523070
	.long	-1120210379
	.long	718787259
	.long	-343485551
	.text
	.globl	_ROTATE_LEFT
	.def	_ROTATE_LEFT;	.scl	2;	.type	32;	.endef
_ROTATE_LEFT:
LFB17:
	.file 1 "O:/BUPT-SCSS/Courses_and_research/ASM_and_Reverse_Engineering/Programs/C_C++/5_cipher_reverse/md5/md5.c"
	.loc 1 21 58
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	.loc 1 22 19
	mov	eax, DWORD PTR [ebp+12]
	mov	edx, DWORD PTR [ebp+8]
	mov	cl, al
	rol	edx, cl
	mov	eax, edx
	.loc 1 23 1
	pop	ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.globl	_F
	.def	_F;	.scl	2;	.type	32;	.endef
_F:
LFB18:
	.loc 1 25 64
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	.loc 1 26 12
	mov	eax, DWORD PTR [ebp+8]
	and	eax, DWORD PTR [ebp+12]
	mov	edx, eax
	.loc 1 26 21
	mov	eax, DWORD PTR [ebp+8]
	not	eax
	.loc 1 26 25
	and	eax, DWORD PTR [ebp+16]
	.loc 1 26 17
	or	eax, edx
	.loc 1 27 1
	pop	ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.globl	_G
	.def	_G;	.scl	2;	.type	32;	.endef
_G:
LFB19:
	.loc 1 29 64
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	.loc 1 30 12
	mov	eax, DWORD PTR [ebp+8]
	and	eax, DWORD PTR [ebp+16]
	mov	edx, eax
	.loc 1 30 25
	mov	eax, DWORD PTR [ebp+16]
	not	eax
	.loc 1 30 22
	and	eax, DWORD PTR [ebp+12]
	.loc 1 30 17
	or	eax, edx
	.loc 1 31 1
	pop	ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.globl	_H
	.def	_H;	.scl	2;	.type	32;	.endef
_H:
LFB20:
	.loc 1 33 64
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	.loc 1 34 12
	mov	eax, DWORD PTR [ebp+8]
	xor	eax, DWORD PTR [ebp+12]
	.loc 1 34 16
	xor	eax, DWORD PTR [ebp+16]
	.loc 1 35 1
	pop	ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.globl	_I
	.def	_I;	.scl	2;	.type	32;	.endef
_I:
LFB21:
	.loc 1 37 64
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	.loc 1 38 20
	mov	eax, DWORD PTR [ebp+16]
	not	eax
	.loc 1 38 17
	or	eax, DWORD PTR [ebp+8]
	.loc 1 38 12
	xor	eax, DWORD PTR [ebp+12]
	.loc 1 39 1
	pop	ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE21:
	.globl	_FF
	.def	_FF;	.scl	2;	.type	32;	.endef
_FF:
LFB22:
	.loc 1 41 121
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 24
	.loc 1 42 8
	mov	eax, DWORD PTR [ebp+20]
	mov	DWORD PTR [esp+8], eax
	mov	eax, DWORD PTR [ebp+16]
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [ebp+12]
	mov	DWORD PTR [esp], eax
	call	_F
	mov	edx, eax
	.loc 1 42 17
	mov	eax, DWORD PTR [ebp+24]
	add	edx, eax
	.loc 1 42 21
	mov	eax, DWORD PTR [ebp+28]
	add	edx, eax
	.loc 1 42 5
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	add	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [eax], edx
	.loc 1 43 7
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	mov	edx, DWORD PTR [ebp+32]
	mov	DWORD PTR [esp+4], edx
	mov	DWORD PTR [esp], eax
	call	_ROTATE_LEFT
	mov	edx, eax
	.loc 1 43 5
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [eax], edx
	.loc 1 44 5
	mov	eax, DWORD PTR [ebp+8]
	mov	edx, DWORD PTR [eax]
	mov	eax, DWORD PTR [ebp+12]
	add	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [eax], edx
	.loc 1 46 2
	nop
	.loc 1 47 1
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE22:
	.globl	_GG
	.def	_GG;	.scl	2;	.type	32;	.endef
_GG:
LFB23:
	.loc 1 49 121
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 24
	.loc 1 50 8
	mov	eax, DWORD PTR [ebp+20]
	mov	DWORD PTR [esp+8], eax
	mov	eax, DWORD PTR [ebp+16]
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [ebp+12]
	mov	DWORD PTR [esp], eax
	call	_G
	mov	edx, eax
	.loc 1 50 17
	mov	eax, DWORD PTR [ebp+24]
	add	edx, eax
	.loc 1 50 21
	mov	eax, DWORD PTR [ebp+28]
	add	edx, eax
	.loc 1 50 5
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	add	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [eax], edx
	.loc 1 51 7
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	mov	edx, DWORD PTR [ebp+32]
	mov	DWORD PTR [esp+4], edx
	mov	DWORD PTR [esp], eax
	call	_ROTATE_LEFT
	mov	edx, eax
	.loc 1 51 5
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [eax], edx
	.loc 1 52 5
	mov	eax, DWORD PTR [ebp+8]
	mov	edx, DWORD PTR [eax]
	mov	eax, DWORD PTR [ebp+12]
	add	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [eax], edx
	.loc 1 54 2
	nop
	.loc 1 55 1
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE23:
	.globl	_HH
	.def	_HH;	.scl	2;	.type	32;	.endef
_HH:
LFB24:
	.loc 1 57 121
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 24
	.loc 1 58 8
	mov	eax, DWORD PTR [ebp+20]
	mov	DWORD PTR [esp+8], eax
	mov	eax, DWORD PTR [ebp+16]
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [ebp+12]
	mov	DWORD PTR [esp], eax
	call	_H
	mov	edx, eax
	.loc 1 58 17
	mov	eax, DWORD PTR [ebp+24]
	add	edx, eax
	.loc 1 58 21
	mov	eax, DWORD PTR [ebp+28]
	add	edx, eax
	.loc 1 58 5
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	add	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [eax], edx
	.loc 1 59 7
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	mov	edx, DWORD PTR [ebp+32]
	mov	DWORD PTR [esp+4], edx
	mov	DWORD PTR [esp], eax
	call	_ROTATE_LEFT
	mov	edx, eax
	.loc 1 59 5
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [eax], edx
	.loc 1 60 5
	mov	eax, DWORD PTR [ebp+8]
	mov	edx, DWORD PTR [eax]
	mov	eax, DWORD PTR [ebp+12]
	add	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [eax], edx
	.loc 1 62 2
	nop
	.loc 1 63 1
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE24:
	.globl	_II
	.def	_II;	.scl	2;	.type	32;	.endef
_II:
LFB25:
	.loc 1 65 121
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 24
	.loc 1 66 8
	mov	eax, DWORD PTR [ebp+20]
	mov	DWORD PTR [esp+8], eax
	mov	eax, DWORD PTR [ebp+16]
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [ebp+12]
	mov	DWORD PTR [esp], eax
	call	_I
	mov	edx, eax
	.loc 1 66 17
	mov	eax, DWORD PTR [ebp+24]
	add	edx, eax
	.loc 1 66 21
	mov	eax, DWORD PTR [ebp+28]
	add	edx, eax
	.loc 1 66 5
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	add	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [eax], edx
	.loc 1 67 7
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	mov	edx, DWORD PTR [ebp+32]
	mov	DWORD PTR [esp+4], edx
	mov	DWORD PTR [esp], eax
	call	_ROTATE_LEFT
	mov	edx, eax
	.loc 1 67 5
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [eax], edx
	.loc 1 68 5
	mov	eax, DWORD PTR [ebp+8]
	mov	edx, DWORD PTR [eax]
	mov	eax, DWORD PTR [ebp+12]
	add	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [eax], edx
	.loc 1 70 2
	nop
	.loc 1 71 1
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE25:
	.globl	_shift
	.def	_shift;	.scl	2;	.type	32;	.endef
_shift:
LFB26:
	.loc 1 74 35
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 16
	.loc 1 76 5
	mov	eax, DWORD PTR [ebp+8]
	sal	eax, 24
	mov	DWORD PTR [ebp-4], eax
	.loc 1 77 20
	mov	eax, DWORD PTR [ebp+8]
	sal	eax, 8
	.loc 1 77 5
	and	eax, 16711680
	mov	DWORD PTR [ebp-8], eax
	.loc 1 78 10
	mov	eax, DWORD PTR [ebp+8]
	shr	eax, 8
	.loc 1 78 5
	and	eax, 65280
	mov	DWORD PTR [ebp-12], eax
	.loc 1 79 5
	mov	eax, DWORD PTR [ebp+8]
	shr	eax, 24
	mov	DWORD PTR [ebp-16], eax
	.loc 1 81 13
	mov	edx, DWORD PTR [ebp-4]
	mov	eax, DWORD PTR [ebp-8]
	add	edx, eax
	.loc 1 81 18
	mov	eax, DWORD PTR [ebp-12]
	add	edx, eax
	.loc 1 81 23
	mov	eax, DWORD PTR [ebp-16]
	add	eax, edx
	.loc 1 82 1
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE26:
	.data
	.align 4
LC0:
	.byte	1
	.byte	35
	.byte	69
	.byte	103
	.byte	-119
	.byte	-85
	.byte	-51
	.byte	-17
	.byte	-2
	.byte	-36
	.byte	-70
	.byte	-104
	.byte	118
	.byte	84
	.byte	50
	.byte	16
	.text
	.globl	_md5_init
	.def	_md5_init;	.scl	2;	.type	32;	.endef
_md5_init:
LFB27:
	.loc 1 85 79
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	push	edi
	push	esi
	push	ebx
	sub	esp, 16
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	.loc 1 86 19
	lea	eax, [ebp-28]
	mov	ebx, OFFSET FLAT:LC0
	mov	edx, 4
	mov	edi, eax
	mov	esi, ebx
	mov	ecx, edx
	rep movsd
	.loc 1 93 2
	mov	edx, DWORD PTR [ebp-28]
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [eax], edx
	.loc 1 94 2
	lea	eax, [ebp-28]
	add	eax, 4
	mov	edx, DWORD PTR [eax]
	mov	eax, DWORD PTR [ebp+12]
	mov	DWORD PTR [eax], edx
	.loc 1 95 2
	lea	eax, [ebp-28]
	add	eax, 8
	mov	edx, DWORD PTR [eax]
	mov	eax, DWORD PTR [ebp+16]
	mov	DWORD PTR [eax], edx
	.loc 1 96 2
	lea	eax, [ebp-28]
	add	eax, 12
	mov	edx, DWORD PTR [eax]
	mov	eax, DWORD PTR [ebp+20]
	mov	DWORD PTR [eax], edx
	.loc 1 97 2
	nop
	.loc 1 98 1
	add	esp, 16
	pop	ebx
	.cfi_restore 3
	pop	esi
	.cfi_restore 6
	pop	edi
	.cfi_restore 7
	pop	ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE27:
	.globl	_md5_update
	.def	_md5_update;	.scl	2;	.type	32;	.endef
_md5_update:
LFB28:
	.loc 1 100 63
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 56
	.loc 1 104 24
	mov	eax, DWORD PTR [ebp+16]
	sal	eax, 3
	.loc 1 104 9
	mov	DWORD PTR [ebp-32], eax
	.loc 1 108 31
	mov	eax, DWORD PTR [ebp+16]
	and	eax, 63
	.loc 1 108 9
	mov	edx, 56
	sub	edx, eax
	mov	eax, edx
	mov	DWORD PTR [ebp-16], eax
	.loc 1 111 27
	mov	edx, DWORD PTR [ebp+16]
	mov	eax, DWORD PTR [ebp-16]
	add	eax, edx
	.loc 1 111 9
	add	eax, 8
	mov	DWORD PTR [ebp-20], eax
	.loc 1 113 24
	mov	DWORD PTR [esp+4], 1
	mov	eax, DWORD PTR [ebp-20]
	mov	DWORD PTR [esp], eax
	call	_calloc
	mov	DWORD PTR [ebp-24], eax
	.loc 1 114 2
	mov	eax, DWORD PTR [ebp+16]
	mov	DWORD PTR [esp+8], eax
	mov	eax, DWORD PTR [ebp+12]
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [ebp-24]
	mov	DWORD PTR [esp], eax
	call	_memcpy
	.loc 1 115 8
	mov	edx, DWORD PTR [ebp-24]
	mov	eax, DWORD PTR [ebp+16]
	add	eax, edx
	.loc 1 115 16
	mov	BYTE PTR [eax], -128
	.loc 1 118 4
	mov	DWORD PTR [ebp-28], 4
	.loc 1 119 9
	mov	DWORD PTR [ebp-12], 0
	.loc 1 119 2
	jmp	L24
L25:
	.loc 1 120 3 discriminator 3
	mov	eax, DWORD PTR [ebp-12]
	lea	edx, [ebp-32]
	add	eax, edx
	.loc 1 120 33 discriminator 3
	mov	ecx, DWORD PTR [ebp-12]
	mov	edx, DWORD PTR [ebp-20]
	add	edx, ecx
	lea	ecx, [edx-8]
	mov	edx, DWORD PTR [ebp-24]
	add	edx, ecx
	.loc 1 120 3 discriminator 3
	mov	al, BYTE PTR [eax]
	mov	BYTE PTR [edx], al
	.loc 1 119 22 discriminator 3
	inc	DWORD PTR [ebp-12]
L24:
	.loc 1 119 2 discriminator 1
	mov	eax, DWORD PTR [ebp-12]
	cmp	eax, DWORD PTR [ebp-28]
	jl	L25
	.loc 1 125 7
	mov	eax, DWORD PTR [ebp+8]
	mov	edx, DWORD PTR [ebp-24]
	mov	DWORD PTR [eax], edx
	.loc 1 126 9
	mov	eax, DWORD PTR [ebp-20]
	.loc 1 127 1
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE28:
	.globl	_md5_transform
	.def	_md5_transform;	.scl	2;	.type	32;	.endef
_md5_transform:
LFB29:
	.loc 1 130 51
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 24
	.loc 1 131 2
	mov	DWORD PTR [esp+8], 64
	mov	eax, DWORD PTR [ebp+12]
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [esp], eax
	call	_memcpy
	.loc 1 132 2
	nop
	.loc 1 134 1
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE29:
	.globl	_data_round
	.def	_data_round;	.scl	2;	.type	32;	.endef
_data_round:
LFB30:
	.loc 1 136 107
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	push	edi
	push	esi
	push	ebx
	sub	esp, 60
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	.loc 1 138 19
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	.loc 1 138 15
	mov	DWORD PTR [ebp-28], eax
	.loc 1 139 19
	mov	eax, DWORD PTR [ebp+12]
	mov	eax, DWORD PTR [eax]
	.loc 1 139 15
	mov	DWORD PTR [ebp-32], eax
	.loc 1 140 19
	mov	eax, DWORD PTR [ebp+16]
	mov	eax, DWORD PTR [eax]
	.loc 1 140 15
	mov	DWORD PTR [ebp-36], eax
	.loc 1 141 19
	mov	eax, DWORD PTR [ebp+20]
	mov	eax, DWORD PTR [eax]
	.loc 1 141 15
	mov	DWORD PTR [ebp-40], eax
	.loc 1 144 2
	mov	edi, 7
	mov	esi, -680876936
	mov	eax, DWORD PTR [ebp+24]
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-40]
	mov	edx, DWORD PTR [ebp-36]
	mov	eax, DWORD PTR [ebp-32]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-28]
	mov	DWORD PTR [esp], eax
	call	_FF
	.loc 1 145 2
	mov	edi, 12
	mov	esi, -389564586
	.loc 1 145 15
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 4
	.loc 1 145 2
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-36]
	mov	edx, DWORD PTR [ebp-32]
	mov	eax, DWORD PTR [ebp-28]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-40]
	mov	DWORD PTR [esp], eax
	call	_FF
	.loc 1 146 2
	mov	edi, 17
	mov	esi, 606105819
	.loc 1 146 15
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 8
	.loc 1 146 2
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-32]
	mov	edx, DWORD PTR [ebp-28]
	mov	eax, DWORD PTR [ebp-40]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-36]
	mov	DWORD PTR [esp], eax
	call	_FF
	.loc 1 147 5
	mov	edi, 22
	mov	esi, -1044525330
	.loc 1 147 18
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 12
	.loc 1 147 5
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-28]
	mov	edx, DWORD PTR [ebp-40]
	mov	eax, DWORD PTR [ebp-36]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-32]
	mov	DWORD PTR [esp], eax
	call	_FF
	.loc 1 148 2
	mov	edi, 7
	mov	esi, -176418897
	.loc 1 148 15
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 16
	.loc 1 148 2
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-40]
	mov	edx, DWORD PTR [ebp-36]
	mov	eax, DWORD PTR [ebp-32]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-28]
	mov	DWORD PTR [esp], eax
	call	_FF
	.loc 1 149 2
	mov	edi, 12
	mov	esi, 1200080426
	.loc 1 149 15
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 20
	.loc 1 149 2
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-36]
	mov	edx, DWORD PTR [ebp-32]
	mov	eax, DWORD PTR [ebp-28]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-40]
	mov	DWORD PTR [esp], eax
	call	_FF
	.loc 1 150 2
	mov	edi, 17
	mov	esi, -1473231341
	.loc 1 150 15
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 24
	.loc 1 150 2
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-32]
	mov	edx, DWORD PTR [ebp-28]
	mov	eax, DWORD PTR [ebp-40]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-36]
	mov	DWORD PTR [esp], eax
	call	_FF
	.loc 1 151 2
	mov	edi, 22
	mov	esi, -45705983
	.loc 1 151 15
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 28
	.loc 1 151 2
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-28]
	mov	edx, DWORD PTR [ebp-40]
	mov	eax, DWORD PTR [ebp-36]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-32]
	mov	DWORD PTR [esp], eax
	call	_FF
	.loc 1 152 2
	mov	edi, 7
	mov	esi, 1770035416
	.loc 1 152 15
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 32
	.loc 1 152 2
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-40]
	mov	edx, DWORD PTR [ebp-36]
	mov	eax, DWORD PTR [ebp-32]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-28]
	mov	DWORD PTR [esp], eax
	call	_FF
	.loc 1 153 2
	mov	edi, 12
	mov	esi, -1958414417
	.loc 1 153 15
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 36
	.loc 1 153 2
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-36]
	mov	edx, DWORD PTR [ebp-32]
	mov	eax, DWORD PTR [ebp-28]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-40]
	mov	DWORD PTR [esp], eax
	call	_FF
	.loc 1 154 2
	mov	edi, 17
	mov	esi, -42063
	.loc 1 154 15
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 40
	.loc 1 154 2
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-32]
	mov	edx, DWORD PTR [ebp-28]
	mov	eax, DWORD PTR [ebp-40]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-36]
	mov	DWORD PTR [esp], eax
	call	_FF
	.loc 1 155 2
	mov	edi, 22
	mov	esi, -1990404162
	.loc 1 155 15
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 44
	.loc 1 155 2
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-28]
	mov	edx, DWORD PTR [ebp-40]
	mov	eax, DWORD PTR [ebp-36]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-32]
	mov	DWORD PTR [esp], eax
	call	_FF
	.loc 1 156 2
	mov	edi, 7
	mov	esi, 1804603682
	.loc 1 156 15
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 48
	.loc 1 156 2
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-40]
	mov	edx, DWORD PTR [ebp-36]
	mov	eax, DWORD PTR [ebp-32]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-28]
	mov	DWORD PTR [esp], eax
	call	_FF
	.loc 1 157 2
	mov	edi, 12
	mov	esi, -40341101
	.loc 1 157 15
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 52
	.loc 1 157 2
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-36]
	mov	edx, DWORD PTR [ebp-32]
	mov	eax, DWORD PTR [ebp-28]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-40]
	mov	DWORD PTR [esp], eax
	call	_FF
	.loc 1 158 2
	mov	edi, 17
	mov	esi, -1502002290
	.loc 1 158 15
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 56
	.loc 1 158 2
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-32]
	mov	edx, DWORD PTR [ebp-28]
	mov	eax, DWORD PTR [ebp-40]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-36]
	mov	DWORD PTR [esp], eax
	call	_FF
	.loc 1 159 2
	mov	edi, 22
	mov	esi, 1236535329
	.loc 1 159 15
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 60
	.loc 1 159 2
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-28]
	mov	edx, DWORD PTR [ebp-40]
	mov	eax, DWORD PTR [ebp-36]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-32]
	mov	DWORD PTR [esp], eax
	call	_FF
	.loc 1 162 5
	mov	edi, 5
	mov	esi, -165796510
	.loc 1 162 18
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 4
	.loc 1 162 5
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-40]
	mov	edx, DWORD PTR [ebp-36]
	mov	eax, DWORD PTR [ebp-32]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-28]
	mov	DWORD PTR [esp], eax
	call	_GG
	.loc 1 163 5
	mov	edi, 9
	mov	esi, -1069501632
	.loc 1 163 18
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 24
	.loc 1 163 5
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-36]
	mov	edx, DWORD PTR [ebp-32]
	mov	eax, DWORD PTR [ebp-28]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-40]
	mov	DWORD PTR [esp], eax
	call	_GG
	.loc 1 164 2
	mov	edi, 14
	mov	esi, 643717713
	.loc 1 164 15
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 44
	.loc 1 164 2
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-32]
	mov	edx, DWORD PTR [ebp-28]
	mov	eax, DWORD PTR [ebp-40]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-36]
	mov	DWORD PTR [esp], eax
	call	_GG
	.loc 1 165 2
	mov	edi, 20
	mov	esi, -373897302
	mov	eax, DWORD PTR [ebp+24]
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-28]
	mov	edx, DWORD PTR [ebp-40]
	mov	eax, DWORD PTR [ebp-36]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-32]
	mov	DWORD PTR [esp], eax
	call	_GG
	.loc 1 166 2
	mov	edi, 5
	mov	esi, -701558691
	.loc 1 166 15
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 20
	.loc 1 166 2
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-40]
	mov	edx, DWORD PTR [ebp-36]
	mov	eax, DWORD PTR [ebp-32]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-28]
	mov	DWORD PTR [esp], eax
	call	_GG
	.loc 1 167 2
	mov	edi, 9
	mov	esi, 38016083
	.loc 1 167 15
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 40
	.loc 1 167 2
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-36]
	mov	edx, DWORD PTR [ebp-32]
	mov	eax, DWORD PTR [ebp-28]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-40]
	mov	DWORD PTR [esp], eax
	call	_GG
	.loc 1 168 2
	mov	edi, 14
	mov	esi, -660478335
	.loc 1 168 15
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 60
	.loc 1 168 2
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-32]
	mov	edx, DWORD PTR [ebp-28]
	mov	eax, DWORD PTR [ebp-40]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-36]
	mov	DWORD PTR [esp], eax
	call	_GG
	.loc 1 169 2
	mov	edi, 20
	mov	esi, -405537848
	.loc 1 169 15
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 16
	.loc 1 169 2
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-28]
	mov	edx, DWORD PTR [ebp-40]
	mov	eax, DWORD PTR [ebp-36]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-32]
	mov	DWORD PTR [esp], eax
	call	_GG
	.loc 1 170 2
	mov	edi, 5
	mov	esi, 568446438
	.loc 1 170 15
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 36
	.loc 1 170 2
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-40]
	mov	edx, DWORD PTR [ebp-36]
	mov	eax, DWORD PTR [ebp-32]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-28]
	mov	DWORD PTR [esp], eax
	call	_GG
	.loc 1 171 2
	mov	edi, 9
	mov	esi, -1019803690
	.loc 1 171 15
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 56
	.loc 1 171 2
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-36]
	mov	edx, DWORD PTR [ebp-32]
	mov	eax, DWORD PTR [ebp-28]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-40]
	mov	DWORD PTR [esp], eax
	call	_GG
	.loc 1 172 2
	mov	edi, 14
	mov	esi, -187363961
	.loc 1 172 15
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 12
	.loc 1 172 2
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-32]
	mov	edx, DWORD PTR [ebp-28]
	mov	eax, DWORD PTR [ebp-40]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-36]
	mov	DWORD PTR [esp], eax
	call	_GG
	.loc 1 173 2
	mov	edi, 20
	mov	esi, 1163531501
	.loc 1 173 15
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 32
	.loc 1 173 2
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-28]
	mov	edx, DWORD PTR [ebp-40]
	mov	eax, DWORD PTR [ebp-36]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-32]
	mov	DWORD PTR [esp], eax
	call	_GG
	.loc 1 174 2
	mov	edi, 5
	mov	esi, -1444681467
	.loc 1 174 15
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 52
	.loc 1 174 2
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-40]
	mov	edx, DWORD PTR [ebp-36]
	mov	eax, DWORD PTR [ebp-32]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-28]
	mov	DWORD PTR [esp], eax
	call	_GG
	.loc 1 175 2
	mov	edi, 9
	mov	esi, -51403784
	.loc 1 175 15
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 8
	.loc 1 175 2
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-36]
	mov	edx, DWORD PTR [ebp-32]
	mov	eax, DWORD PTR [ebp-28]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-40]
	mov	DWORD PTR [esp], eax
	call	_GG
	.loc 1 176 2
	mov	edi, 14
	mov	esi, 1735328473
	.loc 1 176 15
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 28
	.loc 1 176 2
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-32]
	mov	edx, DWORD PTR [ebp-28]
	mov	eax, DWORD PTR [ebp-40]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-36]
	mov	DWORD PTR [esp], eax
	call	_GG
	.loc 1 177 2
	mov	edi, 20
	mov	esi, -1926607734
	.loc 1 177 15
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 48
	.loc 1 177 2
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-28]
	mov	edx, DWORD PTR [ebp-40]
	mov	eax, DWORD PTR [ebp-36]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-32]
	mov	DWORD PTR [esp], eax
	call	_GG
	.loc 1 180 3
	mov	edi, 4
	mov	esi, -378558
	.loc 1 180 16
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 20
	.loc 1 180 3
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-40]
	mov	edx, DWORD PTR [ebp-36]
	mov	eax, DWORD PTR [ebp-32]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-28]
	mov	DWORD PTR [esp], eax
	call	_HH
	.loc 1 181 3
	mov	edi, 11
	mov	esi, -2022574463
	.loc 1 181 16
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 32
	.loc 1 181 3
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-36]
	mov	edx, DWORD PTR [ebp-32]
	mov	eax, DWORD PTR [ebp-28]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-40]
	mov	DWORD PTR [esp], eax
	call	_HH
	.loc 1 182 3
	mov	edi, 16
	mov	esi, 1839030562
	.loc 1 182 16
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 44
	.loc 1 182 3
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-32]
	mov	edx, DWORD PTR [ebp-28]
	mov	eax, DWORD PTR [ebp-40]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-36]
	mov	DWORD PTR [esp], eax
	call	_HH
	.loc 1 183 3
	mov	edi, 23
	mov	esi, -35309556
	.loc 1 183 16
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 56
	.loc 1 183 3
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-28]
	mov	edx, DWORD PTR [ebp-40]
	mov	eax, DWORD PTR [ebp-36]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-32]
	mov	DWORD PTR [esp], eax
	call	_HH
	.loc 1 184 3
	mov	edi, 4
	mov	esi, -1530992060
	.loc 1 184 16
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 4
	.loc 1 184 3
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-40]
	mov	edx, DWORD PTR [ebp-36]
	mov	eax, DWORD PTR [ebp-32]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-28]
	mov	DWORD PTR [esp], eax
	call	_HH
	.loc 1 185 3
	mov	edi, 11
	mov	esi, 1272893353
	.loc 1 185 16
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 16
	.loc 1 185 3
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-36]
	mov	edx, DWORD PTR [ebp-32]
	mov	eax, DWORD PTR [ebp-28]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-40]
	mov	DWORD PTR [esp], eax
	call	_HH
	.loc 1 186 3
	mov	edi, 16
	mov	esi, -155497632
	.loc 1 186 16
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 28
	.loc 1 186 3
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-32]
	mov	edx, DWORD PTR [ebp-28]
	mov	eax, DWORD PTR [ebp-40]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-36]
	mov	DWORD PTR [esp], eax
	call	_HH
	.loc 1 187 3
	mov	edi, 23
	mov	esi, -1094730640
	.loc 1 187 16
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 40
	.loc 1 187 3
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-28]
	mov	edx, DWORD PTR [ebp-40]
	mov	eax, DWORD PTR [ebp-36]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-32]
	mov	DWORD PTR [esp], eax
	call	_HH
	.loc 1 188 3
	mov	edi, 4
	mov	esi, 681279174
	.loc 1 188 16
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 52
	.loc 1 188 3
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-40]
	mov	edx, DWORD PTR [ebp-36]
	mov	eax, DWORD PTR [ebp-32]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-28]
	mov	DWORD PTR [esp], eax
	call	_HH
	.loc 1 189 3
	mov	edi, 11
	mov	esi, -358537222
	mov	eax, DWORD PTR [ebp+24]
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-36]
	mov	edx, DWORD PTR [ebp-32]
	mov	eax, DWORD PTR [ebp-28]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-40]
	mov	DWORD PTR [esp], eax
	call	_HH
	.loc 1 190 3
	mov	edi, 16
	mov	esi, -722521979
	.loc 1 190 16
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 12
	.loc 1 190 3
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-32]
	mov	edx, DWORD PTR [ebp-28]
	mov	eax, DWORD PTR [ebp-40]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-36]
	mov	DWORD PTR [esp], eax
	call	_HH
	.loc 1 191 3
	mov	edi, 23
	mov	esi, 76029189
	.loc 1 191 16
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 24
	.loc 1 191 3
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-28]
	mov	edx, DWORD PTR [ebp-40]
	mov	eax, DWORD PTR [ebp-36]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-32]
	mov	DWORD PTR [esp], eax
	call	_HH
	.loc 1 192 3
	mov	edi, 4
	mov	esi, -640364487
	.loc 1 192 16
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 36
	.loc 1 192 3
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-40]
	mov	edx, DWORD PTR [ebp-36]
	mov	eax, DWORD PTR [ebp-32]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-28]
	mov	DWORD PTR [esp], eax
	call	_HH
	.loc 1 193 3
	mov	edi, 11
	mov	esi, -421815835
	.loc 1 193 16
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 48
	.loc 1 193 3
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-36]
	mov	edx, DWORD PTR [ebp-32]
	mov	eax, DWORD PTR [ebp-28]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-40]
	mov	DWORD PTR [esp], eax
	call	_HH
	.loc 1 194 3
	mov	edi, 16
	mov	esi, 530742520
	.loc 1 194 16
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 60
	.loc 1 194 3
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-32]
	mov	edx, DWORD PTR [ebp-28]
	mov	eax, DWORD PTR [ebp-40]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-36]
	mov	DWORD PTR [esp], eax
	call	_HH
	.loc 1 195 3
	mov	edi, 23
	mov	esi, -995338651
	.loc 1 195 16
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 8
	.loc 1 195 3
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-28]
	mov	edx, DWORD PTR [ebp-40]
	mov	eax, DWORD PTR [ebp-36]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-32]
	mov	DWORD PTR [esp], eax
	call	_HH
	.loc 1 198 2
	mov	edi, 6
	mov	esi, -198630844
	mov	eax, DWORD PTR [ebp+24]
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-40]
	mov	edx, DWORD PTR [ebp-36]
	mov	eax, DWORD PTR [ebp-32]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-28]
	mov	DWORD PTR [esp], eax
	call	_II
	.loc 1 199 2
	mov	edi, 10
	mov	esi, 1126891415
	.loc 1 199 15
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 28
	.loc 1 199 2
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-36]
	mov	edx, DWORD PTR [ebp-32]
	mov	eax, DWORD PTR [ebp-28]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-40]
	mov	DWORD PTR [esp], eax
	call	_II
	.loc 1 200 2
	mov	edi, 15
	mov	esi, -1416354905
	.loc 1 200 15
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 56
	.loc 1 200 2
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-32]
	mov	edx, DWORD PTR [ebp-28]
	mov	eax, DWORD PTR [ebp-40]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-36]
	mov	DWORD PTR [esp], eax
	call	_II
	.loc 1 201 2
	mov	edi, 21
	mov	esi, -57434055
	.loc 1 201 15
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 20
	.loc 1 201 2
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-28]
	mov	edx, DWORD PTR [ebp-40]
	mov	eax, DWORD PTR [ebp-36]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-32]
	mov	DWORD PTR [esp], eax
	call	_II
	.loc 1 202 2
	mov	edi, 6
	mov	esi, 1700485571
	.loc 1 202 15
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 48
	.loc 1 202 2
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-40]
	mov	edx, DWORD PTR [ebp-36]
	mov	eax, DWORD PTR [ebp-32]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-28]
	mov	DWORD PTR [esp], eax
	call	_II
	.loc 1 203 2
	mov	edi, 10
	mov	esi, -1894986606
	.loc 1 203 15
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 12
	.loc 1 203 2
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-36]
	mov	edx, DWORD PTR [ebp-32]
	mov	eax, DWORD PTR [ebp-28]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-40]
	mov	DWORD PTR [esp], eax
	call	_II
	.loc 1 204 2
	mov	edi, 15
	mov	esi, -1051523
	.loc 1 204 15
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 40
	.loc 1 204 2
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-32]
	mov	edx, DWORD PTR [ebp-28]
	mov	eax, DWORD PTR [ebp-40]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-36]
	mov	DWORD PTR [esp], eax
	call	_II
	.loc 1 205 2
	mov	edi, 21
	mov	esi, -2054922799
	.loc 1 205 15
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 4
	.loc 1 205 2
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-28]
	mov	edx, DWORD PTR [ebp-40]
	mov	eax, DWORD PTR [ebp-36]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-32]
	mov	DWORD PTR [esp], eax
	call	_II
	.loc 1 206 2
	mov	edi, 6
	mov	esi, 1873313359
	.loc 1 206 15
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 32
	.loc 1 206 2
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-40]
	mov	edx, DWORD PTR [ebp-36]
	mov	eax, DWORD PTR [ebp-32]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-28]
	mov	DWORD PTR [esp], eax
	call	_II
	.loc 1 207 2
	mov	edi, 10
	mov	esi, -30611744
	.loc 1 207 15
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 60
	.loc 1 207 2
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-36]
	mov	edx, DWORD PTR [ebp-32]
	mov	eax, DWORD PTR [ebp-28]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-40]
	mov	DWORD PTR [esp], eax
	call	_II
	.loc 1 208 2
	mov	edi, 15
	mov	esi, -1560198380
	.loc 1 208 15
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 24
	.loc 1 208 2
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-32]
	mov	edx, DWORD PTR [ebp-28]
	mov	eax, DWORD PTR [ebp-40]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-36]
	mov	DWORD PTR [esp], eax
	call	_II
	.loc 1 209 2
	mov	edi, 21
	mov	esi, 1309151649
	.loc 1 209 15
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 52
	.loc 1 209 2
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-28]
	mov	edx, DWORD PTR [ebp-40]
	mov	eax, DWORD PTR [ebp-36]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-32]
	mov	DWORD PTR [esp], eax
	call	_II
	.loc 1 210 2
	mov	edi, 6
	mov	esi, -145523070
	.loc 1 210 15
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 16
	.loc 1 210 2
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-40]
	mov	edx, DWORD PTR [ebp-36]
	mov	eax, DWORD PTR [ebp-32]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-28]
	mov	DWORD PTR [esp], eax
	call	_II
	.loc 1 211 2
	mov	edi, 10
	mov	esi, -1120210379
	.loc 1 211 15
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 44
	.loc 1 211 2
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-36]
	mov	edx, DWORD PTR [ebp-32]
	mov	eax, DWORD PTR [ebp-28]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-40]
	mov	DWORD PTR [esp], eax
	call	_II
	.loc 1 212 2
	mov	edi, 15
	mov	esi, 718787259
	.loc 1 212 15
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 8
	.loc 1 212 2
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-32]
	mov	edx, DWORD PTR [ebp-28]
	mov	eax, DWORD PTR [ebp-40]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-36]
	mov	DWORD PTR [esp], eax
	call	_II
	.loc 1 213 2
	mov	edi, 21
	mov	esi, -343485551
	.loc 1 213 15
	mov	eax, DWORD PTR [ebp+24]
	add	eax, 36
	.loc 1 213 2
	mov	ebx, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebp-28]
	mov	edx, DWORD PTR [ebp-40]
	mov	eax, DWORD PTR [ebp-36]
	mov	DWORD PTR [esp+24], edi
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-32]
	mov	DWORD PTR [esp], eax
	call	_II
	.loc 1 215 5
	mov	eax, DWORD PTR [ebp+8]
	mov	edx, DWORD PTR [eax]
	mov	eax, DWORD PTR [ebp-28]
	add	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [eax], edx
	.loc 1 216 5
	mov	eax, DWORD PTR [ebp+12]
	mov	edx, DWORD PTR [eax]
	mov	eax, DWORD PTR [ebp-32]
	add	edx, eax
	mov	eax, DWORD PTR [ebp+12]
	mov	DWORD PTR [eax], edx
	.loc 1 217 5
	mov	eax, DWORD PTR [ebp+16]
	mov	edx, DWORD PTR [eax]
	mov	eax, DWORD PTR [ebp-36]
	add	edx, eax
	mov	eax, DWORD PTR [ebp+16]
	mov	DWORD PTR [eax], edx
	.loc 1 218 5
	mov	eax, DWORD PTR [ebp+20]
	mov	edx, DWORD PTR [eax]
	mov	eax, DWORD PTR [ebp-40]
	add	edx, eax
	mov	eax, DWORD PTR [ebp+20]
	mov	DWORD PTR [eax], edx
	.loc 1 219 1
	nop
	add	esp, 60
	pop	ebx
	.cfi_restore 3
	pop	esi
	.cfi_restore 6
	pop	edi
	.cfi_restore 7
	pop	ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE30:
	.section .rdata,"dr"
LC1:
	.ascii "%08x%08x%08x%08x\0"
	.text
	.globl	_md5_calc
	.def	_md5_calc;	.scl	2;	.type	32;	.endef
_md5_calc:
LFB31:
	.loc 1 221 58
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	push	edi
	push	esi
	push	ebx
	sub	esp, 76
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	.loc 1 227 38
	mov	DWORD PTR [esp], 64
	call	_malloc
	mov	DWORD PTR [ebp-32], eax
	.loc 1 229 14
	mov	eax, DWORD PTR [ebp+16]
	mov	DWORD PTR [esp+8], eax
	mov	eax, DWORD PTR [ebp+12]
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-40]
	mov	DWORD PTR [esp], eax
	call	_md5_update
	mov	DWORD PTR [ebp-36], eax
	.loc 1 232 5
	lea	eax, [ebp-56]
	mov	DWORD PTR [esp+12], eax
	lea	eax, [ebp-52]
	mov	DWORD PTR [esp+8], eax
	lea	eax, [ebp-48]
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-44]
	mov	DWORD PTR [esp], eax
	call	_md5_init
	.loc 1 235 8
	mov	DWORD PTR [ebp-28], 0
	.loc 1 235 2
	jmp	L31
L32:
	.loc 1 236 3 discriminator 3
	mov	eax, DWORD PTR [ebp-40]
	.loc 1 236 35 discriminator 3
	mov	edx, DWORD PTR [ebp-28]
	sal	edx, 6
	.loc 1 236 3 discriminator 3
	add	eax, edx
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [ebp-32]
	mov	DWORD PTR [esp], eax
	call	_md5_transform
	.loc 1 237 3 discriminator 3
	mov	eax, DWORD PTR [ebp-32]
	mov	DWORD PTR [esp+16], eax
	lea	eax, [ebp-56]
	mov	DWORD PTR [esp+12], eax
	lea	eax, [ebp-52]
	mov	DWORD PTR [esp+8], eax
	lea	eax, [ebp-48]
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-44]
	mov	DWORD PTR [esp], eax
	call	_data_round
	.loc 1 235 32 discriminator 3
	inc	DWORD PTR [ebp-28]
L31:
	.loc 1 235 26 discriminator 1
	mov	eax, DWORD PTR [ebp-36]
	shr	eax, 6
	mov	edx, eax
	.loc 1 235 14 discriminator 1
	mov	eax, DWORD PTR [ebp-28]
	.loc 1 235 2 discriminator 1
	cmp	edx, eax
	ja	L32
	.loc 1 242 2
	mov	eax, DWORD PTR [ebp-56]
	mov	DWORD PTR [esp], eax
	call	_shift
	mov	edi, eax
	mov	eax, DWORD PTR [ebp-52]
	mov	DWORD PTR [esp], eax
	call	_shift
	mov	esi, eax
	mov	eax, DWORD PTR [ebp-48]
	mov	DWORD PTR [esp], eax
	call	_shift
	mov	ebx, eax
	mov	eax, DWORD PTR [ebp-44]
	mov	DWORD PTR [esp], eax
	call	_shift
	mov	DWORD PTR [esp+20], edi
	mov	DWORD PTR [esp+16], esi
	mov	DWORD PTR [esp+12], ebx
	mov	DWORD PTR [esp+8], eax
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC1
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [esp], eax
	call	_sprintf
	.loc 1 244 5
	mov	eax, DWORD PTR [ebp-32]
	mov	DWORD PTR [esp], eax
	call	_free
	.loc 1 245 4
	mov	DWORD PTR [ebp-32], 0
	.loc 1 246 2
	mov	eax, DWORD PTR [ebp-40]
	mov	DWORD PTR [esp], eax
	call	_free
	.loc 1 247 13
	mov	DWORD PTR [ebp-40], 0
	.loc 1 249 2
	nop
	.loc 1 251 1
	add	esp, 76
	pop	ebx
	.cfi_restore 3
	pop	esi
	.cfi_restore 6
	pop	edi
	.cfi_restore 7
	pop	ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE31:
Letext0:
	.file 2 "C:/Program Files (x86)/CodeBlocks/MinGW/i686-w64-mingw32/include/crtdefs.h"
	.file 3 "C:/Program Files (x86)/CodeBlocks/MinGW/i686-w64-mingw32/include/stdio.h"
	.file 4 "C:/Program Files (x86)/CodeBlocks/MinGW/i686-w64-mingw32/include/stdlib.h"
	.file 5 "C:/Program Files (x86)/CodeBlocks/MinGW/i686-w64-mingw32/include/malloc.h"
	.file 6 "O:/BUPT-SCSS/Courses_and_research/ASM_and_Reverse_Engineering/Programs/C_C++/5_cipher_reverse/md5/md5.h"
	.section	.debug_info,"dr"
Ldebug_info0:
	.long	0xafc
	.word	0x4
	.secrel32	Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.ascii "GNU C17 8.1.0 -march=i386 -m32 -masm=intel -g -fPIC -finput-charset=UTF-8 -fexec-charset=UTF-8 -fno-stack-protector\0"
	.byte	0xc
	.ascii "O:\\BUPT-SCSS\\Courses_and_research\\ASM_and_Reverse_Engineering\\Programs\\C_C++\\5_cipher_reverse\\md5\\md5.c\0"
	.ascii "O:\\\\BUPT-SCSS\\\\Courses_and_research\\\\ASM_and_Reverse_Engineering\\\\Programs\\\\C_C++\\\\5_cipher_reverse\\\\md5\0"
	.long	Ltext0
	.long	Letext0-Ltext0
	.secrel32	Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.ascii "char\0"
	.uleb128 0x3
	.long	0x15e
	.uleb128 0x4
	.ascii "size_t\0"
	.byte	0x2
	.byte	0x25
	.byte	0x16
	.long	0x17a
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.ascii "unsigned int\0"
	.uleb128 0x3
	.long	0x17a
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.ascii "int\0"
	.uleb128 0x4
	.ascii "wchar_t\0"
	.byte	0x2
	.byte	0x62
	.byte	0x18
	.long	0x1a6
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.ascii "short unsigned int\0"
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.ascii "long int\0"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.ascii "long long int\0"
	.uleb128 0x5
	.byte	0x4
	.long	0x15e
	.uleb128 0x5
	.byte	0x4
	.long	0x196
	.uleb128 0x5
	.byte	0x4
	.long	0x18f
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.ascii "long unsigned int\0"
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.ascii "unsigned char\0"
	.uleb128 0x6
	.ascii "_iobuf\0"
	.byte	0x20
	.byte	0x3
	.byte	0x1a
	.byte	0xa
	.long	0x2a1
	.uleb128 0x7
	.ascii "_ptr\0"
	.byte	0x3
	.byte	0x1b
	.byte	0xb
	.long	0x1d9
	.byte	0
	.uleb128 0x7
	.ascii "_cnt\0"
	.byte	0x3
	.byte	0x1c
	.byte	0x9
	.long	0x18f
	.byte	0x4
	.uleb128 0x7
	.ascii "_base\0"
	.byte	0x3
	.byte	0x1d
	.byte	0xb
	.long	0x1d9
	.byte	0x8
	.uleb128 0x7
	.ascii "_flag\0"
	.byte	0x3
	.byte	0x1e
	.byte	0x9
	.long	0x18f
	.byte	0xc
	.uleb128 0x7
	.ascii "_file\0"
	.byte	0x3
	.byte	0x1f
	.byte	0x9
	.long	0x18f
	.byte	0x10
	.uleb128 0x7
	.ascii "_charbuf\0"
	.byte	0x3
	.byte	0x20
	.byte	0x9
	.long	0x18f
	.byte	0x14
	.uleb128 0x7
	.ascii "_bufsiz\0"
	.byte	0x3
	.byte	0x21
	.byte	0x9
	.long	0x18f
	.byte	0x18
	.uleb128 0x7
	.ascii "_tmpfname\0"
	.byte	0x3
	.byte	0x22
	.byte	0xb
	.long	0x1d9
	.byte	0x1c
	.byte	0
	.uleb128 0x4
	.ascii "FILE\0"
	.byte	0x3
	.byte	0x24
	.byte	0x19
	.long	0x211
	.uleb128 0x8
	.long	0x2a1
	.long	0x2b9
	.uleb128 0x9
	.byte	0
	.uleb128 0xa
	.ascii "_imp___iob\0"
	.byte	0x3
	.byte	0x5c
	.byte	0x10
	.long	0x2cc
	.uleb128 0x5
	.byte	0x4
	.long	0x2ae
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.ascii "double\0"
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.ascii "float\0"
	.uleb128 0x2
	.byte	0xc
	.byte	0x4
	.ascii "long double\0"
	.uleb128 0xa
	.ascii "_imp____mb_cur_max\0"
	.byte	0x4
	.byte	0x73
	.byte	0x10
	.long	0x1e5
	.uleb128 0x8
	.long	0x1d9
	.long	0x31f
	.uleb128 0xb
	.long	0x17a
	.byte	0
	.byte	0
	.uleb128 0xa
	.ascii "_sys_errlist\0"
	.byte	0x4
	.byte	0xac
	.byte	0x2b
	.long	0x30f
	.uleb128 0xa
	.ascii "_sys_nerr\0"
	.byte	0x4
	.byte	0xad
	.byte	0x29
	.long	0x18f
	.uleb128 0xc
	.ascii "_imp____argc\0"
	.byte	0x4
	.word	0x119
	.byte	0x10
	.long	0x1e5
	.uleb128 0xc
	.ascii "_imp____argv\0"
	.byte	0x4
	.word	0x11d
	.byte	0x13
	.long	0x372
	.uleb128 0x5
	.byte	0x4
	.long	0x378
	.uleb128 0x5
	.byte	0x4
	.long	0x1d9
	.uleb128 0xc
	.ascii "_imp____wargv\0"
	.byte	0x4
	.word	0x121
	.byte	0x16
	.long	0x395
	.uleb128 0x5
	.byte	0x4
	.long	0x39b
	.uleb128 0x5
	.byte	0x4
	.long	0x1df
	.uleb128 0xc
	.ascii "_imp___environ\0"
	.byte	0x4
	.word	0x127
	.byte	0x13
	.long	0x372
	.uleb128 0xc
	.ascii "_imp___wenviron\0"
	.byte	0x4
	.word	0x12c
	.byte	0x16
	.long	0x395
	.uleb128 0xc
	.ascii "_imp___pgmptr\0"
	.byte	0x4
	.word	0x132
	.byte	0x12
	.long	0x378
	.uleb128 0xc
	.ascii "_imp___wpgmptr\0"
	.byte	0x4
	.word	0x137
	.byte	0x15
	.long	0x39b
	.uleb128 0xc
	.ascii "_imp___osplatform\0"
	.byte	0x4
	.word	0x13c
	.byte	0x19
	.long	0x41c
	.uleb128 0x5
	.byte	0x4
	.long	0x17a
	.uleb128 0xc
	.ascii "_imp___osver\0"
	.byte	0x4
	.word	0x141
	.byte	0x19
	.long	0x41c
	.uleb128 0xc
	.ascii "_imp___winver\0"
	.byte	0x4
	.word	0x146
	.byte	0x19
	.long	0x41c
	.uleb128 0xc
	.ascii "_imp___winmajor\0"
	.byte	0x4
	.word	0x14b
	.byte	0x19
	.long	0x41c
	.uleb128 0xc
	.ascii "_imp___winminor\0"
	.byte	0x4
	.word	0x150
	.byte	0x19
	.long	0x41c
	.uleb128 0xa
	.ascii "_amblksiz\0"
	.byte	0x5
	.byte	0x35
	.byte	0x17
	.long	0x17a
	.uleb128 0x8
	.long	0x18a
	.long	0x4a3
	.uleb128 0xb
	.long	0x17a
	.byte	0xf
	.byte	0
	.uleb128 0x3
	.long	0x493
	.uleb128 0xd
	.ascii "S\0"
	.byte	0x6
	.byte	0xc
	.byte	0x14
	.long	0x4a3
	.uleb128 0x5
	.byte	0x3
	.long	_S
	.uleb128 0x8
	.long	0x18a
	.long	0x4c8
	.uleb128 0xb
	.long	0x17a
	.byte	0x3f
	.byte	0
	.uleb128 0x3
	.long	0x4b8
	.uleb128 0xd
	.ascii "T\0"
	.byte	0x6
	.byte	0xd
	.byte	0x14
	.long	0x4c8
	.uleb128 0x5
	.byte	0x3
	.long	_T
	.uleb128 0xe
	.ascii "md5_calc\0"
	.byte	0x1
	.byte	0xdd
	.byte	0x6
	.long	LFB31
	.long	LFE31-LFB31
	.uleb128 0x1
	.byte	0x9c
	.long	0x59d
	.uleb128 0xf
	.ascii "out\0"
	.byte	0x1
	.byte	0xdd
	.byte	0x15
	.long	0x1d9
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xf
	.ascii "input\0"
	.byte	0x1
	.byte	0xdd
	.byte	0x26
	.long	0x59d
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0xf
	.ascii "inLen\0"
	.byte	0x1
	.byte	0xdd
	.byte	0x34
	.long	0x16b
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x10
	.ascii "i\0"
	.byte	0x1
	.byte	0xde
	.byte	0x6
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x11
	.secrel32	LASF0
	.byte	0x1
	.byte	0xe0
	.byte	0xc
	.long	0x16b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x10
	.ascii "filledData\0"
	.byte	0x1
	.byte	0xe1
	.byte	0x8
	.long	0x1d9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x10
	.ascii "A\0"
	.byte	0x1
	.byte	0xe2
	.byte	0xf
	.long	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x10
	.ascii "B\0"
	.byte	0x1
	.byte	0xe2
	.byte	0x11
	.long	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x10
	.ascii "C\0"
	.byte	0x1
	.byte	0xe2
	.byte	0x13
	.long	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x10
	.ascii "D\0"
	.byte	0x1
	.byte	0xe2
	.byte	0x15
	.long	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x10
	.ascii "M\0"
	.byte	0x1
	.byte	0xe3
	.byte	0x13
	.long	0x41c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x166
	.uleb128 0xe
	.ascii "data_round\0"
	.byte	0x1
	.byte	0x88
	.byte	0x6
	.long	LFB30
	.long	LFE30-LFB30
	.uleb128 0x1
	.byte	0x9c
	.long	0x636
	.uleb128 0xf
	.ascii "A\0"
	.byte	0x1
	.byte	0x88
	.byte	0x1f
	.long	0x41c
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xf
	.ascii "B\0"
	.byte	0x1
	.byte	0x88
	.byte	0x30
	.long	0x41c
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0xf
	.ascii "C\0"
	.byte	0x1
	.byte	0x88
	.byte	0x41
	.long	0x41c
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0xf
	.ascii "D\0"
	.byte	0x1
	.byte	0x88
	.byte	0x52
	.long	0x41c
	.uleb128 0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0xf
	.ascii "m\0"
	.byte	0x1
	.byte	0x88
	.byte	0x69
	.long	0x636
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x10
	.ascii "a\0"
	.byte	0x1
	.byte	0x8a
	.byte	0xf
	.long	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x10
	.ascii "b\0"
	.byte	0x1
	.byte	0x8b
	.byte	0xf
	.long	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x10
	.ascii "c\0"
	.byte	0x1
	.byte	0x8c
	.byte	0xf
	.long	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x10
	.ascii "d\0"
	.byte	0x1
	.byte	0x8d
	.byte	0xf
	.long	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x18a
	.uleb128 0xe
	.ascii "md5_transform\0"
	.byte	0x1
	.byte	0x82
	.byte	0x6
	.long	LFB29
	.long	LFE29-LFB29
	.uleb128 0x1
	.byte	0x9c
	.long	0x67d
	.uleb128 0xf
	.ascii "out\0"
	.byte	0x1
	.byte	0x82
	.byte	0x22
	.long	0x41c
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xf
	.ascii "input\0"
	.byte	0x1
	.byte	0x82
	.byte	0x2d
	.long	0x1d9
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.byte	0
	.uleb128 0x12
	.ascii "md5_update\0"
	.byte	0x1
	.byte	0x64
	.byte	0x8
	.long	0x16b
	.long	LFB28
	.long	LFE28-LFB28
	.uleb128 0x1
	.byte	0x9c
	.long	0x730
	.uleb128 0xf
	.ascii "out\0"
	.byte	0x1
	.byte	0x64
	.byte	0x1a
	.long	0x378
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xf
	.ascii "input\0"
	.byte	0x1
	.byte	0x64
	.byte	0x2b
	.long	0x59d
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0xf
	.ascii "inLen\0"
	.byte	0x1
	.byte	0x64
	.byte	0x39
	.long	0x16b
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x10
	.ascii "i\0"
	.byte	0x1
	.byte	0x65
	.byte	0x6
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x10
	.ascii "j\0"
	.byte	0x1
	.byte	0x66
	.byte	0x6
	.long	0x18f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x10
	.ascii "bitLen\0"
	.byte	0x1
	.byte	0x68
	.byte	0x9
	.long	0x16b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x10
	.ascii "fillLen\0"
	.byte	0x1
	.byte	0x6c
	.byte	0x9
	.long	0x16b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x11
	.secrel32	LASF0
	.byte	0x1
	.byte	0x6f
	.byte	0x9
	.long	0x16b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x10
	.ascii "outBuf\0"
	.byte	0x1
	.byte	0x71
	.byte	0x8
	.long	0x1d9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x13
	.ascii "md5_init\0"
	.byte	0x1
	.byte	0x55
	.byte	0x6
	.long	LFB27
	.long	LFE27-LFB27
	.uleb128 0x1
	.byte	0x9c
	.long	0x790
	.uleb128 0xf
	.ascii "A\0"
	.byte	0x1
	.byte	0x55
	.byte	0x1d
	.long	0x41c
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xf
	.ascii "B\0"
	.byte	0x1
	.byte	0x55
	.byte	0x2d
	.long	0x41c
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0xf
	.ascii "C\0"
	.byte	0x1
	.byte	0x55
	.byte	0x3d
	.long	0x41c
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0xf
	.ascii "D\0"
	.byte	0x1
	.byte	0x55
	.byte	0x4d
	.long	0x41c
	.uleb128 0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x10
	.ascii "data\0"
	.byte	0x1
	.byte	0x56
	.byte	0x13
	.long	0x790
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0x8
	.long	0x200
	.long	0x7a0
	.uleb128 0xb
	.long	0x17a
	.byte	0xf
	.byte	0
	.uleb128 0x14
	.ascii "shift\0"
	.byte	0x1
	.byte	0x4a
	.byte	0xe
	.long	0x17a
	.long	LFB26
	.long	LFE26-LFB26
	.uleb128 0x1
	.byte	0x9c
	.long	0x802
	.uleb128 0xf
	.ascii "a\0"
	.byte	0x1
	.byte	0x4a
	.byte	0x21
	.long	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x10
	.ascii "t1\0"
	.byte	0x1
	.byte	0x4b
	.byte	0xf
	.long	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x10
	.ascii "t2\0"
	.byte	0x1
	.byte	0x4b
	.byte	0x12
	.long	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x10
	.ascii "t3\0"
	.byte	0x1
	.byte	0x4b
	.byte	0x15
	.long	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x10
	.ascii "t4\0"
	.byte	0x1
	.byte	0x4b
	.byte	0x18
	.long	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xe
	.ascii "II\0"
	.byte	0x1
	.byte	0x41
	.byte	0x6
	.long	LFB25
	.long	LFE25-LFB25
	.uleb128 0x1
	.byte	0x9c
	.long	0x873
	.uleb128 0xf
	.ascii "a\0"
	.byte	0x1
	.byte	0x41
	.byte	0x17
	.long	0x41c
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xf
	.ascii "b\0"
	.byte	0x1
	.byte	0x41
	.byte	0x26
	.long	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0xf
	.ascii "c\0"
	.byte	0x1
	.byte	0x41
	.byte	0x35
	.long	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0xf
	.ascii "d\0"
	.byte	0x1
	.byte	0x41
	.byte	0x44
	.long	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0xf
	.ascii "m\0"
	.byte	0x1
	.byte	0x41
	.byte	0x53
	.long	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0xf
	.ascii "t\0"
	.byte	0x1
	.byte	0x41
	.byte	0x68
	.long	0x18a
	.uleb128 0x2
	.byte	0x91
	.sleb128 20
	.uleb128 0xf
	.ascii "s\0"
	.byte	0x1
	.byte	0x41
	.byte	0x77
	.long	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 24
	.byte	0
	.uleb128 0xe
	.ascii "HH\0"
	.byte	0x1
	.byte	0x39
	.byte	0x6
	.long	LFB24
	.long	LFE24-LFB24
	.uleb128 0x1
	.byte	0x9c
	.long	0x8e4
	.uleb128 0xf
	.ascii "a\0"
	.byte	0x1
	.byte	0x39
	.byte	0x17
	.long	0x41c
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xf
	.ascii "b\0"
	.byte	0x1
	.byte	0x39
	.byte	0x26
	.long	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0xf
	.ascii "c\0"
	.byte	0x1
	.byte	0x39
	.byte	0x35
	.long	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0xf
	.ascii "d\0"
	.byte	0x1
	.byte	0x39
	.byte	0x44
	.long	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0xf
	.ascii "m\0"
	.byte	0x1
	.byte	0x39
	.byte	0x53
	.long	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0xf
	.ascii "t\0"
	.byte	0x1
	.byte	0x39
	.byte	0x68
	.long	0x18a
	.uleb128 0x2
	.byte	0x91
	.sleb128 20
	.uleb128 0xf
	.ascii "s\0"
	.byte	0x1
	.byte	0x39
	.byte	0x77
	.long	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 24
	.byte	0
	.uleb128 0xe
	.ascii "GG\0"
	.byte	0x1
	.byte	0x31
	.byte	0x6
	.long	LFB23
	.long	LFE23-LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0x955
	.uleb128 0xf
	.ascii "a\0"
	.byte	0x1
	.byte	0x31
	.byte	0x17
	.long	0x41c
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xf
	.ascii "b\0"
	.byte	0x1
	.byte	0x31
	.byte	0x26
	.long	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0xf
	.ascii "c\0"
	.byte	0x1
	.byte	0x31
	.byte	0x35
	.long	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0xf
	.ascii "d\0"
	.byte	0x1
	.byte	0x31
	.byte	0x44
	.long	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0xf
	.ascii "m\0"
	.byte	0x1
	.byte	0x31
	.byte	0x53
	.long	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0xf
	.ascii "t\0"
	.byte	0x1
	.byte	0x31
	.byte	0x68
	.long	0x18a
	.uleb128 0x2
	.byte	0x91
	.sleb128 20
	.uleb128 0xf
	.ascii "s\0"
	.byte	0x1
	.byte	0x31
	.byte	0x77
	.long	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 24
	.byte	0
	.uleb128 0xe
	.ascii "FF\0"
	.byte	0x1
	.byte	0x29
	.byte	0x6
	.long	LFB22
	.long	LFE22-LFB22
	.uleb128 0x1
	.byte	0x9c
	.long	0x9c6
	.uleb128 0xf
	.ascii "a\0"
	.byte	0x1
	.byte	0x29
	.byte	0x17
	.long	0x41c
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xf
	.ascii "b\0"
	.byte	0x1
	.byte	0x29
	.byte	0x26
	.long	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0xf
	.ascii "c\0"
	.byte	0x1
	.byte	0x29
	.byte	0x35
	.long	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0xf
	.ascii "d\0"
	.byte	0x1
	.byte	0x29
	.byte	0x44
	.long	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0xf
	.ascii "m\0"
	.byte	0x1
	.byte	0x29
	.byte	0x53
	.long	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0xf
	.ascii "t\0"
	.byte	0x1
	.byte	0x29
	.byte	0x68
	.long	0x18a
	.uleb128 0x2
	.byte	0x91
	.sleb128 20
	.uleb128 0xf
	.ascii "s\0"
	.byte	0x1
	.byte	0x29
	.byte	0x77
	.long	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 24
	.byte	0
	.uleb128 0x14
	.ascii "I\0"
	.byte	0x1
	.byte	0x25
	.byte	0xe
	.long	0x17a
	.long	LFB21
	.long	LFE21-LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0xa06
	.uleb128 0xf
	.ascii "X\0"
	.byte	0x1
	.byte	0x25
	.byte	0x1d
	.long	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xf
	.ascii "Y\0"
	.byte	0x1
	.byte	0x25
	.byte	0x2d
	.long	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0xf
	.ascii "Z\0"
	.byte	0x1
	.byte	0x25
	.byte	0x3d
	.long	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.byte	0
	.uleb128 0x14
	.ascii "H\0"
	.byte	0x1
	.byte	0x21
	.byte	0xe
	.long	0x17a
	.long	LFB20
	.long	LFE20-LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0xa46
	.uleb128 0xf
	.ascii "X\0"
	.byte	0x1
	.byte	0x21
	.byte	0x1d
	.long	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xf
	.ascii "Y\0"
	.byte	0x1
	.byte	0x21
	.byte	0x2d
	.long	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0xf
	.ascii "Z\0"
	.byte	0x1
	.byte	0x21
	.byte	0x3d
	.long	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.byte	0
	.uleb128 0x14
	.ascii "G\0"
	.byte	0x1
	.byte	0x1d
	.byte	0xe
	.long	0x17a
	.long	LFB19
	.long	LFE19-LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0xa86
	.uleb128 0xf
	.ascii "X\0"
	.byte	0x1
	.byte	0x1d
	.byte	0x1d
	.long	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xf
	.ascii "Y\0"
	.byte	0x1
	.byte	0x1d
	.byte	0x2d
	.long	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0xf
	.ascii "Z\0"
	.byte	0x1
	.byte	0x1d
	.byte	0x3d
	.long	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.byte	0
	.uleb128 0x14
	.ascii "F\0"
	.byte	0x1
	.byte	0x19
	.byte	0xe
	.long	0x17a
	.long	LFB18
	.long	LFE18-LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0xac6
	.uleb128 0xf
	.ascii "X\0"
	.byte	0x1
	.byte	0x19
	.byte	0x1d
	.long	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xf
	.ascii "Y\0"
	.byte	0x1
	.byte	0x19
	.byte	0x2d
	.long	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0xf
	.ascii "Z\0"
	.byte	0x1
	.byte	0x19
	.byte	0x3d
	.long	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.byte	0
	.uleb128 0x15
	.ascii "ROTATE_LEFT\0"
	.byte	0x1
	.byte	0x15
	.byte	0xe
	.long	0x17a
	.long	LFB17
	.long	LFE17-LFB17
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xf
	.ascii "x\0"
	.byte	0x1
	.byte	0x15
	.byte	0x27
	.long	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xf
	.ascii "n\0"
	.byte	0x1
	.byte	0x15
	.byte	0x37
	.long	0x17a
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.byte	0
	.byte	0
	.section	.debug_abbrev,"dr"
Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0x8
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1b
	.uleb128 0x8
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"dr"
	.long	0x1c
	.word	0x2
	.secrel32	Ldebug_info0
	.byte	0x4
	.byte	0
	.word	0
	.word	0
	.long	Ltext0
	.long	Letext0-Ltext0
	.long	0
	.long	0
	.section	.debug_line,"dr"
Ldebug_line0:
	.section	.debug_str,"dr"
LASF0:
	.ascii "filledLen\0"
	.ident	"GCC: (i686-posix-dwarf-rev0, Built by MinGW-W64 project) 8.1.0"
	.def	_calloc;	.scl	2;	.type	32;	.endef
	.def	_memcpy;	.scl	2;	.type	32;	.endef
	.def	_malloc;	.scl	2;	.type	32;	.endef
	.def	_sprintf;	.scl	2;	.type	32;	.endef
	.def	_free;	.scl	2;	.type	32;	.endef
