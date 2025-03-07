	.file	"sha256.c"
	.intel_syntax noprefix
	.text
Ltext0:
	.section .rdata,"dr"
	.align 32
_k:
	.long	1116352408
	.long	1899447441
	.long	-1245643825
	.long	-373957723
	.long	961987163
	.long	1508970993
	.long	-1841331548
	.long	-1424204075
	.long	-670586216
	.long	310598401
	.long	607225278
	.long	1426881987
	.long	1925078388
	.long	-2132889090
	.long	-1680079193
	.long	-1046744716
	.long	-459576895
	.long	-272742522
	.long	264347078
	.long	604807628
	.long	770255983
	.long	1249150122
	.long	1555081692
	.long	1996064986
	.long	-1740746414
	.long	-1473132947
	.long	-1341970488
	.long	-1084653625
	.long	-958395405
	.long	-710438585
	.long	113926993
	.long	338241895
	.long	666307205
	.long	773529912
	.long	1294757372
	.long	1396182291
	.long	1695183700
	.long	1986661051
	.long	-2117940946
	.long	-1838011259
	.long	-1564481375
	.long	-1474664885
	.long	-1035236496
	.long	-949202525
	.long	-778901479
	.long	-694614492
	.long	-200395387
	.long	275423344
	.long	430227734
	.long	506948616
	.long	659060556
	.long	883997877
	.long	958139571
	.long	1322822218
	.long	1537002063
	.long	1747873779
	.long	1955562222
	.long	2024104815
	.long	-2067236844
	.long	-1933114872
	.long	-1866530822
	.long	-1538233109
	.long	-1090935817
	.long	-965641998
	.text
	.globl	_sha256
	.def	_sha256;	.scl	2;	.type	32;	.endef
_sha256:
LFB5:
	.file 1 "O:/BUPT-SCSS/Courses/ASM_and_Reverse_Engineering/Programs/C_C++/5_cipher_reverse/sha256/sha256.c"
	.loc 1 17 70
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 168
	.loc 1 23 2
	lea	eax, [ebp-152]
	mov	DWORD PTR [esp], eax
	call	_sha256_init
	.loc 1 24 2
	mov	eax, DWORD PTR [ebp+16]
	mov	DWORD PTR [esp+8], eax
	mov	eax, DWORD PTR [ebp+12]
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-152]
	mov	DWORD PTR [esp], eax
	call	_sha256_update
	.loc 1 25 2
	lea	eax, [ebp-40]
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-152]
	mov	DWORD PTR [esp], eax
	call	_sha256_final
	.loc 1 27 2
	lea	eax, [ebp-40]
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [esp], eax
	call	_byte2str
	.loc 1 28 1
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE5:
	.globl	_sha256_transform
	.def	_sha256_transform;	.scl	2;	.type	32;	.endef
_sha256_transform:
LFB6:
	.loc 1 31 1
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 304
	.loc 1 34 9
	mov	DWORD PTR [ebp-36], 0
	.loc 1 34 16
	mov	DWORD PTR [ebp-40], 0
	.loc 1 34 2
	jmp	L3
L4:
	.loc 1 35 15 discriminator 3
	mov	edx, DWORD PTR [ebp+12]
	mov	eax, DWORD PTR [ebp-40]
	add	eax, edx
	mov	al, BYTE PTR [eax]
	movzx	eax, al
	.loc 1 35 19 discriminator 3
	sal	eax, 24
	mov	edx, eax
	.loc 1 35 33 discriminator 3
	mov	eax, DWORD PTR [ebp-40]
	lea	ecx, [eax+1]
	mov	eax, DWORD PTR [ebp+12]
	add	eax, ecx
	mov	al, BYTE PTR [eax]
	movzx	eax, al
	.loc 1 35 41 discriminator 3
	sal	eax, 16
	.loc 1 35 26 discriminator 3
	or	edx, eax
	.loc 1 35 55 discriminator 3
	mov	eax, DWORD PTR [ebp-40]
	lea	ecx, [eax+2]
	mov	eax, DWORD PTR [ebp+12]
	add	eax, ecx
	mov	al, BYTE PTR [eax]
	movzx	eax, al
	.loc 1 35 63 discriminator 3
	sal	eax, 8
	.loc 1 35 48 discriminator 3
	or	edx, eax
	.loc 1 35 76 discriminator 3
	mov	eax, DWORD PTR [ebp-40]
	lea	ecx, [eax+3]
	mov	eax, DWORD PTR [ebp+12]
	add	eax, ecx
	mov	al, BYTE PTR [eax]
	movzx	eax, al
	.loc 1 35 69 discriminator 3
	or	eax, edx
	mov	edx, eax
	.loc 1 35 8 discriminator 3
	mov	eax, DWORD PTR [ebp-36]
	mov	DWORD PTR [ebp-304+eax*4], edx
	.loc 1 34 29 discriminator 3
	inc	DWORD PTR [ebp-36]
	.loc 1 34 36 discriminator 3
	add	DWORD PTR [ebp-40], 4
L3:
	.loc 1 34 2 discriminator 1
	cmp	DWORD PTR [ebp-36], 15
	jbe	L4
	.loc 1 36 2
	jmp	L5
L6:
	.loc 1 37 18 discriminator 2
	mov	eax, DWORD PTR [ebp-36]
	sub	eax, 2
	.loc 1 37 15 discriminator 2
	mov	eax, DWORD PTR [ebp-304+eax*4]
	.loc 1 37 33 discriminator 2
	rol	eax, 15
	mov	edx, eax
	.loc 1 37 71 discriminator 2
	mov	eax, DWORD PTR [ebp-36]
	sub	eax, 2
	.loc 1 37 68 discriminator 2
	mov	eax, DWORD PTR [ebp-304+eax*4]
	.loc 1 37 86 discriminator 2
	rol	eax, 13
	.loc 1 37 62 discriminator 2
	xor	edx, eax
	.loc 1 37 123 discriminator 2
	mov	eax, DWORD PTR [ebp-36]
	sub	eax, 2
	.loc 1 37 120 discriminator 2
	mov	eax, DWORD PTR [ebp-304+eax*4]
	.loc 1 37 129 discriminator 2
	shr	eax, 10
	.loc 1 37 115 discriminator 2
	xor	edx, eax
	.loc 1 37 143 discriminator 2
	mov	eax, DWORD PTR [ebp-36]
	sub	eax, 7
	.loc 1 37 140 discriminator 2
	mov	eax, DWORD PTR [ebp-304+eax*4]
	.loc 1 37 137 discriminator 2
	add	edx, eax
	.loc 1 37 158 discriminator 2
	mov	eax, DWORD PTR [ebp-36]
	sub	eax, 15
	.loc 1 37 155 discriminator 2
	mov	eax, DWORD PTR [ebp-304+eax*4]
	.loc 1 37 173 discriminator 2
	ror	eax, 7
	mov	ecx, eax
	.loc 1 37 211 discriminator 2
	mov	eax, DWORD PTR [ebp-36]
	sub	eax, 15
	.loc 1 37 208 discriminator 2
	mov	eax, DWORD PTR [ebp-304+eax*4]
	.loc 1 37 227 discriminator 2
	rol	eax, 14
	.loc 1 37 202 discriminator 2
	xor	ecx, eax
	.loc 1 37 265 discriminator 2
	mov	eax, DWORD PTR [ebp-36]
	sub	eax, 15
	.loc 1 37 262 discriminator 2
	mov	eax, DWORD PTR [ebp-304+eax*4]
	.loc 1 37 272 discriminator 2
	shr	eax, 3
	.loc 1 37 257 discriminator 2
	xor	eax, ecx
	.loc 1 37 148 discriminator 2
	add	edx, eax
	.loc 1 37 285 discriminator 2
	mov	eax, DWORD PTR [ebp-36]
	sub	eax, 16
	.loc 1 37 282 discriminator 2
	mov	eax, DWORD PTR [ebp-304+eax*4]
	.loc 1 37 279 discriminator 2
	add	edx, eax
	.loc 1 37 8 discriminator 2
	mov	eax, DWORD PTR [ebp-36]
	mov	DWORD PTR [ebp-304+eax*4], edx
	.loc 1 36 18 discriminator 2
	inc	DWORD PTR [ebp-36]
L5:
	.loc 1 36 2 discriminator 1
	cmp	DWORD PTR [ebp-36], 63
	jbe	L6
	.loc 1 39 4
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax+80]
	mov	DWORD PTR [ebp-4], eax
	.loc 1 40 4
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax+84]
	mov	DWORD PTR [ebp-8], eax
	.loc 1 41 4
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax+88]
	mov	DWORD PTR [ebp-12], eax
	.loc 1 42 4
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax+92]
	mov	DWORD PTR [ebp-16], eax
	.loc 1 43 4
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax+96]
	mov	DWORD PTR [ebp-20], eax
	.loc 1 44 4
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax+100]
	mov	DWORD PTR [ebp-24], eax
	.loc 1 45 4
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax+104]
	mov	DWORD PTR [ebp-28], eax
	.loc 1 46 4
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax+108]
	mov	DWORD PTR [ebp-32], eax
	.loc 1 48 9
	mov	DWORD PTR [ebp-36], 0
	.loc 1 48 2
	jmp	L7
L8:
	.loc 1 49 27 discriminator 3
	mov	eax, DWORD PTR [ebp-20]
	ror	eax, 6
	mov	edx, eax
	.loc 1 49 65 discriminator 3
	mov	eax, DWORD PTR [ebp-20]
	ror	eax, 11
	.loc 1 49 48 discriminator 3
	xor	edx, eax
	.loc 1 49 104 discriminator 3
	mov	eax, DWORD PTR [ebp-20]
	rol	eax, 7
	.loc 1 49 87 discriminator 3
	xor	edx, eax
	.loc 1 49 10 discriminator 3
	mov	eax, DWORD PTR [ebp-32]
	lea	ecx, [edx+eax]
	.loc 1 49 135 discriminator 3
	mov	eax, DWORD PTR [ebp-20]
	and	eax, DWORD PTR [ebp-24]
	mov	edx, eax
	.loc 1 49 145 discriminator 3
	mov	eax, DWORD PTR [ebp-20]
	not	eax
	.loc 1 49 150 discriminator 3
	and	eax, DWORD PTR [ebp-28]
	.loc 1 49 142 discriminator 3
	xor	eax, edx
	.loc 1 49 127 discriminator 3
	lea	edx, [ecx+eax]
	.loc 1 49 161 discriminator 3
	mov	eax, DWORD PTR [ebp-36]
	mov	eax, DWORD PTR _k[0+eax*4]
	.loc 1 49 158 discriminator 3
	add	edx, eax
	.loc 1 49 168 discriminator 3
	mov	eax, DWORD PTR [ebp-36]
	mov	eax, DWORD PTR [ebp-304+eax*4]
	.loc 1 49 6 discriminator 3
	add	eax, edx
	mov	DWORD PTR [ebp-44], eax
	.loc 1 50 23 discriminator 3
	mov	eax, DWORD PTR [ebp-4]
	ror	eax, 2
	mov	edx, eax
	.loc 1 50 61 discriminator 3
	mov	eax, DWORD PTR [ebp-4]
	ror	eax, 13
	.loc 1 50 44 discriminator 3
	xor	edx, eax
	.loc 1 50 100 discriminator 3
	mov	eax, DWORD PTR [ebp-4]
	rol	eax, 10
	.loc 1 50 83 discriminator 3
	mov	ecx, edx
	xor	ecx, eax
	.loc 1 50 138 discriminator 3
	mov	eax, DWORD PTR [ebp-8]
	xor	eax, DWORD PTR [ebp-12]
	and	eax, DWORD PTR [ebp-4]
	mov	edx, eax
	.loc 1 50 159 discriminator 3
	mov	eax, DWORD PTR [ebp-8]
	and	eax, DWORD PTR [ebp-12]
	.loc 1 50 152 discriminator 3
	xor	eax, edx
	.loc 1 50 6 discriminator 3
	add	eax, ecx
	mov	DWORD PTR [ebp-48], eax
	.loc 1 51 5 discriminator 3
	mov	eax, DWORD PTR [ebp-28]
	mov	DWORD PTR [ebp-32], eax
	.loc 1 52 5 discriminator 3
	mov	eax, DWORD PTR [ebp-24]
	mov	DWORD PTR [ebp-28], eax
	.loc 1 53 5 discriminator 3
	mov	eax, DWORD PTR [ebp-20]
	mov	DWORD PTR [ebp-24], eax
	.loc 1 54 5 discriminator 3
	mov	edx, DWORD PTR [ebp-16]
	mov	eax, DWORD PTR [ebp-44]
	add	eax, edx
	mov	DWORD PTR [ebp-20], eax
	.loc 1 55 5 discriminator 3
	mov	eax, DWORD PTR [ebp-12]
	mov	DWORD PTR [ebp-16], eax
	.loc 1 56 5 discriminator 3
	mov	eax, DWORD PTR [ebp-8]
	mov	DWORD PTR [ebp-12], eax
	.loc 1 57 5 discriminator 3
	mov	eax, DWORD PTR [ebp-4]
	mov	DWORD PTR [ebp-8], eax
	.loc 1 58 5 discriminator 3
	mov	edx, DWORD PTR [ebp-44]
	mov	eax, DWORD PTR [ebp-48]
	add	eax, edx
	mov	DWORD PTR [ebp-4], eax
	.loc 1 48 22 discriminator 3
	inc	DWORD PTR [ebp-36]
L7:
	.loc 1 48 2 discriminator 1
	cmp	DWORD PTR [ebp-36], 63
	jbe	L8
	.loc 1 61 16
	mov	eax, DWORD PTR [ebp+8]
	mov	edx, DWORD PTR [eax+80]
	mov	eax, DWORD PTR [ebp-4]
	add	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [eax+80], edx
	.loc 1 62 16
	mov	eax, DWORD PTR [ebp+8]
	mov	edx, DWORD PTR [eax+84]
	mov	eax, DWORD PTR [ebp-8]
	add	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [eax+84], edx
	.loc 1 63 16
	mov	eax, DWORD PTR [ebp+8]
	mov	edx, DWORD PTR [eax+88]
	mov	eax, DWORD PTR [ebp-12]
	add	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [eax+88], edx
	.loc 1 64 16
	mov	eax, DWORD PTR [ebp+8]
	mov	edx, DWORD PTR [eax+92]
	mov	eax, DWORD PTR [ebp-16]
	add	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [eax+92], edx
	.loc 1 65 16
	mov	eax, DWORD PTR [ebp+8]
	mov	edx, DWORD PTR [eax+96]
	mov	eax, DWORD PTR [ebp-20]
	add	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [eax+96], edx
	.loc 1 66 16
	mov	eax, DWORD PTR [ebp+8]
	mov	edx, DWORD PTR [eax+100]
	mov	eax, DWORD PTR [ebp-24]
	add	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [eax+100], edx
	.loc 1 67 16
	mov	eax, DWORD PTR [ebp+8]
	mov	edx, DWORD PTR [eax+104]
	mov	eax, DWORD PTR [ebp-28]
	add	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [eax+104], edx
	.loc 1 68 16
	mov	eax, DWORD PTR [ebp+8]
	mov	edx, DWORD PTR [eax+108]
	mov	eax, DWORD PTR [ebp-32]
	add	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [eax+108], edx
	.loc 1 69 1
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE6:
	.globl	_sha256_init
	.def	_sha256_init;	.scl	2;	.type	32;	.endef
_sha256_init:
LFB7:
	.loc 1 72 1
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	.loc 1 73 15
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [eax+64], 0
	.loc 1 74 14
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [eax+72], 0
	mov	DWORD PTR [eax+76], 0
	.loc 1 75 16
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [eax+80], 1779033703
	.loc 1 76 16
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [eax+84], -1150833019
	.loc 1 77 16
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [eax+88], 1013904242
	.loc 1 78 16
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [eax+92], -1521486534
	.loc 1 79 16
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [eax+96], 1359893119
	.loc 1 80 16
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [eax+100], -1694144372
	.loc 1 81 16
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [eax+104], 528734635
	.loc 1 82 16
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [eax+108], 1541459225
	.loc 1 83 1
	nop
	pop	ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE7:
	.globl	_sha256_update
	.def	_sha256_update;	.scl	2;	.type	32;	.endef
_sha256_update:
LFB8:
	.loc 1 86 1
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 24
	.loc 1 89 9
	mov	DWORD PTR [ebp-4], 0
	.loc 1 89 2
	jmp	L11
L13:
	.loc 1 90 33
	mov	edx, DWORD PTR [ebp+12]
	mov	eax, DWORD PTR [ebp-4]
	add	edx, eax
	.loc 1 90 16
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax+64]
	.loc 1 90 33
	mov	cl, BYTE PTR [edx]
	.loc 1 90 27
	mov	edx, DWORD PTR [ebp+8]
	mov	BYTE PTR [edx+eax], cl
	.loc 1 91 6
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax+64]
	.loc 1 91 15
	lea	edx, [eax+1]
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [eax+64], edx
	.loc 1 92 10
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax+64]
	.loc 1 92 6
	cmp	eax, 64
	jne	L12
	.loc 1 93 29
	mov	eax, DWORD PTR [ebp+8]
	.loc 1 93 4
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [esp], eax
	call	_sha256_transform
	.loc 1 94 16
	mov	eax, DWORD PTR [ebp+8]
	mov	edx, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+72]
	add	eax, 512
	adc	edx, 0
	mov	ecx, DWORD PTR [ebp+8]
	mov	DWORD PTR [ecx+72], eax
	mov	DWORD PTR [ecx+76], edx
	.loc 1 95 17
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [eax+64], 0
L12:
	.loc 1 89 23 discriminator 2
	inc	DWORD PTR [ebp-4]
L11:
	.loc 1 89 2 discriminator 1
	mov	eax, DWORD PTR [ebp-4]
	cmp	eax, DWORD PTR [ebp+16]
	jb	L13
	.loc 1 98 1
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE8:
	.globl	_sha256_final
	.def	_sha256_final;	.scl	2;	.type	32;	.endef
_sha256_final:
LFB9:
	.loc 1 101 1
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	push	ebx
	sub	esp, 36
	.cfi_offset 3, -12
	.loc 1 104 4
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax+64]
	mov	DWORD PTR [ebp-12], eax
	.loc 1 107 9
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax+64]
	.loc 1 107 5
	cmp	eax, 55
	ja	L15
	.loc 1 108 14
	mov	eax, DWORD PTR [ebp-12]
	lea	edx, [eax+1]
	mov	DWORD PTR [ebp-12], edx
	.loc 1 108 18
	mov	edx, DWORD PTR [ebp+8]
	mov	BYTE PTR [edx+eax], -128
	.loc 1 109 9
	jmp	L16
L17:
	.loc 1 110 15
	mov	eax, DWORD PTR [ebp-12]
	lea	edx, [eax+1]
	mov	DWORD PTR [ebp-12], edx
	.loc 1 110 19
	mov	edx, DWORD PTR [ebp+8]
	mov	BYTE PTR [edx+eax], 0
L16:
	.loc 1 109 9
	cmp	DWORD PTR [ebp-12], 55
	jbe	L17
	jmp	L18
L15:
	.loc 1 113 14
	mov	eax, DWORD PTR [ebp-12]
	lea	edx, [eax+1]
	mov	DWORD PTR [ebp-12], edx
	.loc 1 113 18
	mov	edx, DWORD PTR [ebp+8]
	mov	BYTE PTR [edx+eax], -128
	.loc 1 114 9
	jmp	L19
L20:
	.loc 1 115 15
	mov	eax, DWORD PTR [ebp-12]
	lea	edx, [eax+1]
	mov	DWORD PTR [ebp-12], edx
	.loc 1 115 19
	mov	edx, DWORD PTR [ebp+8]
	mov	BYTE PTR [edx+eax], 0
L19:
	.loc 1 114 9
	cmp	DWORD PTR [ebp-12], 63
	jbe	L20
	.loc 1 116 28
	mov	eax, DWORD PTR [ebp+8]
	.loc 1 116 3
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [esp], eax
	call	_sha256_transform
	.loc 1 117 13
	mov	eax, DWORD PTR [ebp+8]
	.loc 1 117 3
	mov	DWORD PTR [esp+8], 56
	mov	DWORD PTR [esp+4], 0
	mov	DWORD PTR [esp], eax
	call	_memset
L18:
	.loc 1 121 14
	mov	eax, DWORD PTR [ebp+8]
	mov	edx, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+72]
	.loc 1 121 20
	mov	ecx, DWORD PTR [ebp+8]
	mov	ecx, DWORD PTR [ecx+64]
	.loc 1 121 30
	sal	ecx, 3
	mov	ebx, 0
	.loc 1 121 14
	add	eax, ecx
	adc	edx, ebx
	mov	ecx, DWORD PTR [ebp+8]
	mov	DWORD PTR [ecx+72], eax
	mov	DWORD PTR [ecx+76], edx
	.loc 1 122 21
	mov	eax, DWORD PTR [ebp+8]
	mov	edx, DWORD PTR [eax+76]
	mov	eax, DWORD PTR [eax+72]
	.loc 1 122 16
	mov	dl, al
	mov	eax, DWORD PTR [ebp+8]
	mov	BYTE PTR [eax+63], dl
	.loc 1 123 21
	mov	eax, DWORD PTR [ebp+8]
	mov	ecx, DWORD PTR [eax+72]
	mov	ebx, DWORD PTR [eax+76]
	.loc 1 123 30
	mov	eax, ecx
	mov	edx, ebx
	shrd	eax, edx, 8
	shr	edx, 8
	.loc 1 123 16
	mov	dl, al
	mov	eax, DWORD PTR [ebp+8]
	mov	BYTE PTR [eax+62], dl
	.loc 1 124 21
	mov	eax, DWORD PTR [ebp+8]
	mov	ecx, DWORD PTR [eax+72]
	mov	ebx, DWORD PTR [eax+76]
	.loc 1 124 30
	mov	eax, ecx
	mov	edx, ebx
	shrd	eax, edx, 16
	shr	edx, 16
	.loc 1 124 16
	mov	dl, al
	mov	eax, DWORD PTR [ebp+8]
	mov	BYTE PTR [eax+61], dl
	.loc 1 125 21
	mov	eax, DWORD PTR [ebp+8]
	mov	ecx, DWORD PTR [eax+72]
	mov	ebx, DWORD PTR [eax+76]
	.loc 1 125 30
	mov	eax, ecx
	mov	edx, ebx
	shrd	eax, edx, 24
	shr	edx, 24
	.loc 1 125 16
	mov	dl, al
	mov	eax, DWORD PTR [ebp+8]
	mov	BYTE PTR [eax+60], dl
	.loc 1 126 21
	mov	eax, DWORD PTR [ebp+8]
	mov	ecx, DWORD PTR [eax+72]
	mov	ebx, DWORD PTR [eax+76]
	.loc 1 126 30
	mov	eax, ecx
	mov	edx, ebx
	mov	eax, edx
	xor	edx, edx
	.loc 1 126 16
	mov	dl, al
	mov	eax, DWORD PTR [ebp+8]
	mov	BYTE PTR [eax+59], dl
	.loc 1 127 21
	mov	eax, DWORD PTR [ebp+8]
	mov	ecx, DWORD PTR [eax+72]
	mov	ebx, DWORD PTR [eax+76]
	.loc 1 127 30
	mov	eax, ecx
	mov	edx, ebx
	mov	eax, edx
	xor	edx, edx
	shr	eax, 8
	.loc 1 127 16
	mov	dl, al
	mov	eax, DWORD PTR [ebp+8]
	mov	BYTE PTR [eax+58], dl
	.loc 1 128 21
	mov	eax, DWORD PTR [ebp+8]
	mov	ecx, DWORD PTR [eax+72]
	mov	ebx, DWORD PTR [eax+76]
	.loc 1 128 30
	mov	eax, ecx
	mov	edx, ebx
	mov	eax, edx
	xor	edx, edx
	shr	eax, 16
	.loc 1 128 16
	mov	dl, al
	mov	eax, DWORD PTR [ebp+8]
	mov	BYTE PTR [eax+57], dl
	.loc 1 129 21
	mov	eax, DWORD PTR [ebp+8]
	mov	ecx, DWORD PTR [eax+72]
	mov	ebx, DWORD PTR [eax+76]
	.loc 1 129 30
	mov	eax, ecx
	mov	edx, ebx
	mov	eax, edx
	xor	edx, edx
	shr	eax, 24
	.loc 1 129 16
	mov	dl, al
	mov	eax, DWORD PTR [ebp+8]
	mov	BYTE PTR [eax+56], dl
	.loc 1 130 27
	mov	eax, DWORD PTR [ebp+8]
	.loc 1 130 2
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [esp], eax
	call	_sha256_transform
	.loc 1 134 9
	mov	DWORD PTR [ebp-12], 0
	.loc 1 134 2
	jmp	L21
L22:
	.loc 1 135 24 discriminator 3
	mov	eax, DWORD PTR [ebp+8]
	mov	edx, DWORD PTR [eax+80]
	.loc 1 135 35 discriminator 3
	mov	ecx, DWORD PTR [ebp-12]
	mov	eax, 0
	sub	eax, ecx
	sal	eax, 3
	add	eax, 24
	.loc 1 135 28 discriminator 3
	mov	cl, al
	shr	edx, cl
	mov	ecx, edx
	.loc 1 135 7 discriminator 3
	mov	edx, DWORD PTR [ebp+12]
	mov	eax, DWORD PTR [ebp-12]
	add	eax, edx
	.loc 1 135 11 discriminator 3
	mov	dl, cl
	mov	BYTE PTR [eax], dl
	.loc 1 136 28 discriminator 3
	mov	eax, DWORD PTR [ebp+8]
	mov	edx, DWORD PTR [eax+84]
	.loc 1 136 39 discriminator 3
	mov	ecx, DWORD PTR [ebp-12]
	mov	eax, 0
	sub	eax, ecx
	sal	eax, 3
	add	eax, 24
	.loc 1 136 32 discriminator 3
	mov	cl, al
	shr	edx, cl
	.loc 1 136 7 discriminator 3
	mov	eax, DWORD PTR [ebp-12]
	lea	ecx, [eax+4]
	mov	eax, DWORD PTR [ebp+12]
	add	eax, ecx
	.loc 1 136 15 discriminator 3
	mov	BYTE PTR [eax], dl
	.loc 1 137 28 discriminator 3
	mov	eax, DWORD PTR [ebp+8]
	mov	edx, DWORD PTR [eax+88]
	.loc 1 137 39 discriminator 3
	mov	ecx, DWORD PTR [ebp-12]
	mov	eax, 0
	sub	eax, ecx
	sal	eax, 3
	add	eax, 24
	.loc 1 137 32 discriminator 3
	mov	cl, al
	shr	edx, cl
	.loc 1 137 7 discriminator 3
	mov	eax, DWORD PTR [ebp-12]
	lea	ecx, [eax+8]
	mov	eax, DWORD PTR [ebp+12]
	add	eax, ecx
	.loc 1 137 15 discriminator 3
	mov	BYTE PTR [eax], dl
	.loc 1 138 29 discriminator 3
	mov	eax, DWORD PTR [ebp+8]
	mov	edx, DWORD PTR [eax+92]
	.loc 1 138 40 discriminator 3
	mov	ecx, DWORD PTR [ebp-12]
	mov	eax, 0
	sub	eax, ecx
	sal	eax, 3
	add	eax, 24
	.loc 1 138 33 discriminator 3
	mov	cl, al
	shr	edx, cl
	.loc 1 138 7 discriminator 3
	mov	eax, DWORD PTR [ebp-12]
	lea	ecx, [eax+12]
	mov	eax, DWORD PTR [ebp+12]
	add	eax, ecx
	.loc 1 138 16 discriminator 3
	mov	BYTE PTR [eax], dl
	.loc 1 139 29 discriminator 3
	mov	eax, DWORD PTR [ebp+8]
	mov	edx, DWORD PTR [eax+96]
	.loc 1 139 40 discriminator 3
	mov	ecx, DWORD PTR [ebp-12]
	mov	eax, 0
	sub	eax, ecx
	sal	eax, 3
	add	eax, 24
	.loc 1 139 33 discriminator 3
	mov	cl, al
	shr	edx, cl
	.loc 1 139 7 discriminator 3
	mov	eax, DWORD PTR [ebp-12]
	lea	ecx, [eax+16]
	mov	eax, DWORD PTR [ebp+12]
	add	eax, ecx
	.loc 1 139 16 discriminator 3
	mov	BYTE PTR [eax], dl
	.loc 1 140 29 discriminator 3
	mov	eax, DWORD PTR [ebp+8]
	mov	edx, DWORD PTR [eax+100]
	.loc 1 140 40 discriminator 3
	mov	ecx, DWORD PTR [ebp-12]
	mov	eax, 0
	sub	eax, ecx
	sal	eax, 3
	add	eax, 24
	.loc 1 140 33 discriminator 3
	mov	cl, al
	shr	edx, cl
	.loc 1 140 7 discriminator 3
	mov	eax, DWORD PTR [ebp-12]
	lea	ecx, [eax+20]
	mov	eax, DWORD PTR [ebp+12]
	add	eax, ecx
	.loc 1 140 16 discriminator 3
	mov	BYTE PTR [eax], dl
	.loc 1 141 29 discriminator 3
	mov	eax, DWORD PTR [ebp+8]
	mov	edx, DWORD PTR [eax+104]
	.loc 1 141 40 discriminator 3
	mov	ecx, DWORD PTR [ebp-12]
	mov	eax, 0
	sub	eax, ecx
	sal	eax, 3
	add	eax, 24
	.loc 1 141 33 discriminator 3
	mov	cl, al
	shr	edx, cl
	.loc 1 141 7 discriminator 3
	mov	eax, DWORD PTR [ebp-12]
	lea	ecx, [eax+24]
	mov	eax, DWORD PTR [ebp+12]
	add	eax, ecx
	.loc 1 141 16 discriminator 3
	mov	BYTE PTR [eax], dl
	.loc 1 142 29 discriminator 3
	mov	eax, DWORD PTR [ebp+8]
	mov	edx, DWORD PTR [eax+108]
	.loc 1 142 40 discriminator 3
	mov	ecx, DWORD PTR [ebp-12]
	mov	eax, 0
	sub	eax, ecx
	sal	eax, 3
	add	eax, 24
	.loc 1 142 33 discriminator 3
	mov	cl, al
	shr	edx, cl
	.loc 1 142 7 discriminator 3
	mov	eax, DWORD PTR [ebp-12]
	lea	ecx, [eax+28]
	mov	eax, DWORD PTR [ebp+12]
	add	eax, ecx
	.loc 1 142 16 discriminator 3
	mov	BYTE PTR [eax], dl
	.loc 1 134 21 discriminator 3
	inc	DWORD PTR [ebp-12]
L21:
	.loc 1 134 2 discriminator 1
	cmp	DWORD PTR [ebp-12], 3
	jbe	L22
	.loc 1 145 6
	mov	eax, DWORD PTR [ebp+12]
	add	eax, 32
	.loc 1 145 11
	mov	BYTE PTR [eax], 0
	.loc 1 146 1
	nop
	add	esp, 36
	pop	ebx
	.cfi_restore 3
	pop	ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE9:
	.section .rdata,"dr"
LC0:
	.ascii "%02x\0"
	.text
	.globl	_byte2str
	.def	_byte2str;	.scl	2;	.type	32;	.endef
_byte2str:
LFB10:
	.loc 1 148 39
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 40
	.loc 1 152 11
	mov	DWORD PTR [ebp-12], 0
	.loc 1 152 5
	jmp	L24
L25:
LBB2:
	.loc 1 153 35 discriminator 3
	mov	edx, DWORD PTR [ebp+12]
	mov	eax, DWORD PTR [ebp-12]
	add	eax, edx
	mov	al, BYTE PTR [eax]
	.loc 1 153 9 discriminator 3
	movzx	eax, al
	mov	DWORD PTR [esp+8], eax
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC0
	lea	eax, [ebp-15]
	mov	DWORD PTR [esp], eax
	call	_sprintf
	.loc 1 154 22 discriminator 3
	mov	eax, DWORD PTR [ebp-12]
	add	eax, eax
	mov	edx, eax
	.loc 1 154 20 discriminator 3
	mov	eax, DWORD PTR [ebp+8]
	add	edx, eax
	.loc 1 154 9 discriminator 3
	mov	DWORD PTR [esp+8], 2
	lea	eax, [ebp-15]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], edx
	call	_strncpy
LBE2:
	.loc 1 152 22 discriminator 3
	inc	DWORD PTR [ebp-12]
L24:
	.loc 1 152 5 discriminator 1
	cmp	DWORD PTR [ebp-12], 31
	jbe	L25
	.loc 1 157 8
	mov	eax, DWORD PTR [ebp+8]
	add	eax, 64
	.loc 1 157 15
	mov	BYTE PTR [eax], 0
	.loc 1 159 1
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE10:
Letext0:
	.file 2 "C:/Program Files (x86)/codeblocks-20.03-32bit-mingw-32bit-nosetup/MinGW/i686-w64-mingw32/include/crtdefs.h"
	.file 3 "C:/Program Files (x86)/codeblocks-20.03-32bit-mingw-32bit-nosetup/MinGW/i686-w64-mingw32/include/stdlib.h"
	.file 4 "C:/Program Files (x86)/codeblocks-20.03-32bit-mingw-32bit-nosetup/MinGW/i686-w64-mingw32/include/malloc.h"
	.file 5 "O:/BUPT-SCSS/Courses/ASM_and_Reverse_Engineering/Programs/C_C++/5_cipher_reverse/sha256/sha256.h"
	.section	.debug_info,"dr"
Ldebug_info0:
	.long	0x776
	.word	0x4
	.secrel32	Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.ascii "GNU C17 8.1.0 -march=i386 -m32 -masm=intel -g -finput-charset=UTF-8 -fexec-charset=GBK -fPIE -fno-builtin\0"
	.byte	0xc
	.ascii "O:\\BUPT-SCSS\\Courses\\ASM_and_Reverse_Engineering\\Programs\\C_C++\\5_cipher_reverse\\sha256\\sha256.c\0"
	.ascii "O:\\\\BUPT-SCSS\\\\Courses\\\\ASM_and_Reverse_Engineering\\\\Programs\\\\C_C++\\\\5_cipher_reverse\\\\sha256\0"
	.long	Ltext0
	.long	Letext0-Ltext0
	.secrel32	Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.ascii "char\0"
	.uleb128 0x3
	.ascii "size_t\0"
	.byte	0x2
	.byte	0x25
	.byte	0x16
	.long	0x15a
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.ascii "unsigned int\0"
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.ascii "int\0"
	.uleb128 0x3
	.ascii "wchar_t\0"
	.byte	0x2
	.byte	0x62
	.byte	0x18
	.long	0x181
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
	.uleb128 0x4
	.byte	0x4
	.long	0x143
	.uleb128 0x4
	.byte	0x4
	.long	0x171
	.uleb128 0x4
	.byte	0x4
	.long	0x16a
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.ascii "long unsigned int\0"
	.uleb128 0x4
	.byte	0x4
	.long	0x1f2
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.ascii "unsigned char\0"
	.uleb128 0x5
	.long	0x1e1
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
	.uleb128 0x6
	.ascii "_imp____mb_cur_max\0"
	.byte	0x3
	.byte	0x73
	.byte	0x10
	.long	0x1c0
	.uleb128 0x7
	.long	0x1b4
	.long	0x244
	.uleb128 0x8
	.long	0x15a
	.byte	0
	.byte	0
	.uleb128 0x6
	.ascii "_sys_errlist\0"
	.byte	0x3
	.byte	0xac
	.byte	0x2b
	.long	0x234
	.uleb128 0x6
	.ascii "_sys_nerr\0"
	.byte	0x3
	.byte	0xad
	.byte	0x29
	.long	0x16a
	.uleb128 0x9
	.ascii "_imp____argc\0"
	.byte	0x3
	.word	0x119
	.byte	0x10
	.long	0x1c0
	.uleb128 0x9
	.ascii "_imp____argv\0"
	.byte	0x3
	.word	0x11d
	.byte	0x13
	.long	0x297
	.uleb128 0x4
	.byte	0x4
	.long	0x29d
	.uleb128 0x4
	.byte	0x4
	.long	0x1b4
	.uleb128 0x9
	.ascii "_imp____wargv\0"
	.byte	0x3
	.word	0x121
	.byte	0x16
	.long	0x2ba
	.uleb128 0x4
	.byte	0x4
	.long	0x2c0
	.uleb128 0x4
	.byte	0x4
	.long	0x1ba
	.uleb128 0x9
	.ascii "_imp___environ\0"
	.byte	0x3
	.word	0x127
	.byte	0x13
	.long	0x297
	.uleb128 0x9
	.ascii "_imp___wenviron\0"
	.byte	0x3
	.word	0x12c
	.byte	0x16
	.long	0x2ba
	.uleb128 0x9
	.ascii "_imp___pgmptr\0"
	.byte	0x3
	.word	0x132
	.byte	0x12
	.long	0x29d
	.uleb128 0x9
	.ascii "_imp___wpgmptr\0"
	.byte	0x3
	.word	0x137
	.byte	0x15
	.long	0x2c0
	.uleb128 0x9
	.ascii "_imp___osplatform\0"
	.byte	0x3
	.word	0x13c
	.byte	0x19
	.long	0x341
	.uleb128 0x4
	.byte	0x4
	.long	0x15a
	.uleb128 0x9
	.ascii "_imp___osver\0"
	.byte	0x3
	.word	0x141
	.byte	0x19
	.long	0x341
	.uleb128 0x9
	.ascii "_imp___winver\0"
	.byte	0x3
	.word	0x146
	.byte	0x19
	.long	0x341
	.uleb128 0x9
	.ascii "_imp___winmajor\0"
	.byte	0x3
	.word	0x14b
	.byte	0x19
	.long	0x341
	.uleb128 0x9
	.ascii "_imp___winminor\0"
	.byte	0x3
	.word	0x150
	.byte	0x19
	.long	0x341
	.uleb128 0x6
	.ascii "_amblksiz\0"
	.byte	0x4
	.byte	0x35
	.byte	0x17
	.long	0x15a
	.uleb128 0x3
	.ascii "BYTE\0"
	.byte	0x5
	.byte	0x13
	.byte	0x17
	.long	0x1e1
	.uleb128 0x5
	.long	0x3b8
	.uleb128 0x3
	.ascii "WORD\0"
	.byte	0x5
	.byte	0x14
	.byte	0x16
	.long	0x15a
	.uleb128 0x5
	.long	0x3ca
	.uleb128 0xa
	.byte	0x70
	.byte	0x5
	.byte	0x16
	.byte	0x9
	.long	0x424
	.uleb128 0xb
	.ascii "data\0"
	.byte	0x5
	.byte	0x17
	.byte	0x7
	.long	0x424
	.byte	0
	.uleb128 0xb
	.ascii "datalen\0"
	.byte	0x5
	.byte	0x18
	.byte	0x7
	.long	0x3ca
	.byte	0x40
	.uleb128 0xb
	.ascii "bitlen\0"
	.byte	0x5
	.byte	0x19
	.byte	0x15
	.long	0x434
	.byte	0x48
	.uleb128 0xb
	.ascii "state\0"
	.byte	0x5
	.byte	0x1a
	.byte	0x7
	.long	0x44e
	.byte	0x50
	.byte	0
	.uleb128 0x7
	.long	0x3b8
	.long	0x434
	.uleb128 0x8
	.long	0x15a
	.byte	0x3f
	.byte	0
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.ascii "long long unsigned int\0"
	.uleb128 0x7
	.long	0x3ca
	.long	0x45e
	.uleb128 0x8
	.long	0x15a
	.byte	0x7
	.byte	0
	.uleb128 0x3
	.ascii "SHA256_CTX\0"
	.byte	0x5
	.byte	0x1b
	.byte	0x3
	.long	0x3dc
	.uleb128 0x7
	.long	0x3d7
	.long	0x481
	.uleb128 0x8
	.long	0x15a
	.byte	0x3f
	.byte	0
	.uleb128 0x5
	.long	0x471
	.uleb128 0xc
	.ascii "k\0"
	.byte	0x1
	.byte	0x6
	.byte	0x13
	.long	0x481
	.uleb128 0x5
	.byte	0x3
	.long	_k
	.uleb128 0xd
	.ascii "byte2str\0"
	.byte	0x1
	.byte	0x94
	.byte	0x6
	.long	LFB10
	.long	LFE10-LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0x50a
	.uleb128 0xe
	.ascii "out\0"
	.byte	0x1
	.byte	0x94
	.byte	0x14
	.long	0x50a
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xe
	.ascii "hash\0"
	.byte	0x1
	.byte	0x94
	.byte	0x20
	.long	0x50a
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0xc
	.ascii "temp\0"
	.byte	0x1
	.byte	0x95
	.byte	0x7
	.long	0x510
	.uleb128 0x2
	.byte	0x91
	.sleb128 -23
	.uleb128 0xc
	.ascii "i\0"
	.byte	0x1
	.byte	0x96
	.byte	0xa
	.long	0x3ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xf
	.long	LBB2
	.long	LBE2-LBB2
	.uleb128 0x10
	.ascii "sprintf\0"
	.byte	0x1
	.byte	0x99
	.byte	0x9
	.long	0x16a
	.uleb128 0x11
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.long	0x3b8
	.uleb128 0x7
	.long	0x3b8
	.long	0x520
	.uleb128 0x8
	.long	0x15a
	.byte	0x2
	.byte	0
	.uleb128 0xd
	.ascii "sha256_final\0"
	.byte	0x1
	.byte	0x64
	.byte	0x6
	.long	LFB9
	.long	LFE9-LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x56c
	.uleb128 0xe
	.ascii "ctx\0"
	.byte	0x1
	.byte	0x64
	.byte	0x1f
	.long	0x56c
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xe
	.ascii "hash\0"
	.byte	0x1
	.byte	0x64
	.byte	0x29
	.long	0x50a
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0xc
	.ascii "i\0"
	.byte	0x1
	.byte	0x66
	.byte	0x7
	.long	0x3ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.long	0x45e
	.uleb128 0xd
	.ascii "sha256_update\0"
	.byte	0x1
	.byte	0x55
	.byte	0x6
	.long	LFB8
	.long	LFE8-LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x5ce
	.uleb128 0xe
	.ascii "ctx\0"
	.byte	0x1
	.byte	0x55
	.byte	0x20
	.long	0x56c
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xe
	.ascii "data\0"
	.byte	0x1
	.byte	0x55
	.byte	0x30
	.long	0x5ce
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0xe
	.ascii "len\0"
	.byte	0x1
	.byte	0x55
	.byte	0x3f
	.long	0x14b
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0xc
	.ascii "i\0"
	.byte	0x1
	.byte	0x57
	.byte	0x7
	.long	0x3ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.long	0x3c5
	.uleb128 0x12
	.ascii "sha256_init\0"
	.byte	0x1
	.byte	0x47
	.byte	0x6
	.long	LFB7
	.long	LFE7-LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x602
	.uleb128 0xe
	.ascii "ctx\0"
	.byte	0x1
	.byte	0x47
	.byte	0x1e
	.long	0x56c
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x12
	.ascii "sha256_transform\0"
	.byte	0x1
	.byte	0x1e
	.byte	0x6
	.long	LFB6
	.long	LFE6-LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x6f1
	.uleb128 0xe
	.ascii "ctx\0"
	.byte	0x1
	.byte	0x1e
	.byte	0x23
	.long	0x56c
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xe
	.ascii "data\0"
	.byte	0x1
	.byte	0x1e
	.byte	0x33
	.long	0x5ce
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0xc
	.ascii "a\0"
	.byte	0x1
	.byte	0x20
	.byte	0x7
	.long	0x3ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xc
	.ascii "b\0"
	.byte	0x1
	.byte	0x20
	.byte	0xa
	.long	0x3ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xc
	.ascii "c\0"
	.byte	0x1
	.byte	0x20
	.byte	0xd
	.long	0x3ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xc
	.ascii "d\0"
	.byte	0x1
	.byte	0x20
	.byte	0x10
	.long	0x3ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xc
	.ascii "e\0"
	.byte	0x1
	.byte	0x20
	.byte	0x13
	.long	0x3ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xc
	.ascii "f\0"
	.byte	0x1
	.byte	0x20
	.byte	0x16
	.long	0x3ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xc
	.ascii "g\0"
	.byte	0x1
	.byte	0x20
	.byte	0x19
	.long	0x3ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xc
	.ascii "h\0"
	.byte	0x1
	.byte	0x20
	.byte	0x1c
	.long	0x3ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xc
	.ascii "i\0"
	.byte	0x1
	.byte	0x20
	.byte	0x1f
	.long	0x3ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0xc
	.ascii "j\0"
	.byte	0x1
	.byte	0x20
	.byte	0x22
	.long	0x3ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xc
	.ascii "t1\0"
	.byte	0x1
	.byte	0x20
	.byte	0x25
	.long	0x3ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0xc
	.ascii "t2\0"
	.byte	0x1
	.byte	0x20
	.byte	0x29
	.long	0x3ca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0xc
	.ascii "m\0"
	.byte	0x1
	.byte	0x20
	.byte	0x2d
	.long	0x6f1
	.uleb128 0x3
	.byte	0x91
	.sleb128 -312
	.byte	0
	.uleb128 0x7
	.long	0x3ca
	.long	0x701
	.uleb128 0x8
	.long	0x15a
	.byte	0x3f
	.byte	0
	.uleb128 0xd
	.ascii "sha256\0"
	.byte	0x1
	.byte	0x11
	.byte	0x6
	.long	LFB5
	.long	LFE5-LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0x767
	.uleb128 0xe
	.ascii "out\0"
	.byte	0x1
	.byte	0x11
	.byte	0x1c
	.long	0x767
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xe
	.ascii "in\0"
	.byte	0x1
	.byte	0x11
	.byte	0x36
	.long	0x1db
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0xe
	.ascii "len\0"
	.byte	0x1
	.byte	0x11
	.byte	0x41
	.long	0x14b
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0xc
	.ascii "hash\0"
	.byte	0x1
	.byte	0x14
	.byte	0xa
	.long	0x76d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xc
	.ascii "ctx\0"
	.byte	0x1
	.byte	0x15
	.byte	0x10
	.long	0x45e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.long	0x1e1
	.uleb128 0x13
	.long	0x3b8
	.uleb128 0x8
	.long	0x15a
	.byte	0x1f
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
	.uleb128 0x4
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
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
	.uleb128 0x7
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xa
	.uleb128 0x13
	.byte	0x1
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
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x18
	.byte	0
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
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
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
	.ident	"GCC: (i686-posix-dwarf-rev0, Built by MinGW-W64 project) 8.1.0"
	.def	_memset;	.scl	2;	.type	32;	.endef
	.def	_sprintf;	.scl	2;	.type	32;	.endef
	.def	_strncpy;	.scl	2;	.type	32;	.endef
