	.file	"affineenc.c"
	.intel_syntax noprefix
	.text
Ltext0:
	.globl	_answer
	.data
	.align 4
_answer:
	.ascii "qxbxpluxvwhuzjct\0"
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "please input a string:\0"
LC1:
	.ascii "%s\0"
LC2:
	.ascii "ok, you really know\0"
LC3:
	.ascii "sorry\0"
LC4:
	.ascii "pause\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB14:
	.file 1 "O:/BUPT-SCSS/Courses/ASM_and_Reverse_Engineering/Programs/C_C++/5_cipher_reverse/affine/affineenc.c"
	.loc 1 9 1
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	push	edi
	and	esp, -16
	sub	esp, 144
	.cfi_offset 7, -12
	.loc 1 9 1
	call	___main
LVL0:
	.loc 1 10 9
	mov	DWORD PTR [esp+136], 3
	.loc 1 11 9
	mov	DWORD PTR [esp+132], 7
	.loc 1 12 9
	mov	DWORD PTR [esp+128], 9
	.loc 1 13 10
	lea	edx, [esp+20]
	mov	ecx, 25
	mov	eax, 0
	mov	edi, edx
	rep stosd
	.loc 1 17 5
	mov	DWORD PTR [esp], OFFSET FLAT:LC0
	call	_puts
	.loc 1 18 5
	lea	eax, [esp+20]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC1
	call	_scanf
	.loc 1 20 11
	lea	eax, [esp+20]
	mov	DWORD PTR [esp], eax
	call	_strlen
	.loc 1 20 9
	mov	DWORD PTR [esp+124], eax
	.loc 1 21 10
	mov	DWORD PTR [esp+140], 0
	.loc 1 21 5
	jmp	L2
L6:
	.loc 1 22 17
	lea	edx, [esp+20]
	mov	eax, DWORD PTR [esp+140]
	add	eax, edx
	mov	al, BYTE PTR [eax]
	.loc 1 22 11
	cmp	al, 96
	jle	L3
	.loc 1 22 31 discriminator 1
	lea	edx, [esp+20]
	mov	eax, DWORD PTR [esp+140]
	add	eax, edx
	mov	al, BYTE PTR [eax]
	.loc 1 22 24 discriminator 1
	cmp	al, 122
	jle	L4
L3:
	.loc 1 23 20
	mov	eax, -1
	jmp	L11
L4:
	.loc 1 21 19 discriminator 2
	inc	DWORD PTR [esp+140]
L2:
	.loc 1 21 5 discriminator 1
	mov	eax, DWORD PTR [esp+140]
	cmp	eax, DWORD PTR [esp+124]
	jl	L6
	.loc 1 26 10
	mov	DWORD PTR [esp+140], 0
	.loc 1 26 5
	jmp	L7
L8:
	.loc 1 27 19 discriminator 3
	lea	edx, [esp+20]
	mov	eax, DWORD PTR [esp+140]
	add	eax, edx
	mov	al, BYTE PTR [eax]
	movsx	eax, al
	.loc 1 27 13 discriminator 3
	sub	eax, 97
	mov	DWORD PTR [esp+120], eax
	.loc 1 28 21 discriminator 3
	mov	eax, DWORD PTR [esp+120]
	imul	eax, DWORD PTR [esp+136]
	mov	edx, eax
	.loc 1 28 27 discriminator 3
	mov	eax, DWORD PTR [esp+132]
	add	eax, edx
	.loc 1 28 14 discriminator 3
	mov	ecx, 26
	cdq
	idiv	ecx
	mov	DWORD PTR [esp+120], edx
	.loc 1 29 22 discriminator 3
	mov	eax, DWORD PTR [esp+120]
	add	eax, 97
	mov	dl, al
	.loc 1 29 17 discriminator 3
	lea	ecx, [esp+20]
	mov	eax, DWORD PTR [esp+140]
	add	eax, ecx
	mov	BYTE PTR [eax], dl
	.loc 1 26 19 discriminator 3
	inc	DWORD PTR [esp+140]
L7:
	.loc 1 26 5 discriminator 1
	mov	eax, DWORD PTR [esp+140]
	cmp	eax, DWORD PTR [esp+124]
	jl	L8
	.loc 1 32 5
	mov	DWORD PTR [esp+4], OFFSET FLAT:_answer
	lea	eax, [esp+20]
	mov	DWORD PTR [esp], eax
	call	_strcmp
	.loc 1 32 4
	test	eax, eax
	jne	L9
	.loc 1 33 3
	mov	DWORD PTR [esp], OFFSET FLAT:LC2
	call	_puts
	jmp	L10
L9:
	.loc 1 36 3
	mov	DWORD PTR [esp], OFFSET FLAT:LC3
	call	_puts
L10:
	.loc 1 39 2
	mov	DWORD PTR [esp], OFFSET FLAT:LC4
	call	_system
	.loc 1 41 9
	mov	eax, 0
L11:
	.loc 1 42 1 discriminator 1
	mov	edi, DWORD PTR [ebp-4]
	leave
	.cfi_restore 5
	.cfi_restore 7
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE14:
Letext0:
	.file 2 "C:/Program Files (x86)/codeblocks-20.03-32bit-mingw-32bit-nosetup/MinGW/i686-w64-mingw32/include/stdio.h"
	.section	.debug_info,"dr"
Ldebug_info0:
	.long	0x359
	.word	0x4
	.secrel32	Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.ascii "GNU C17 8.1.0 -march=i386 -m32 -masm=intel -g -finput-charset=UTF-8 -fexec-charset=GBK -fPIE -fno-builtin\0"
	.byte	0xc
	.ascii "O:\\BUPT-SCSS\\Courses\\ASM_and_Reverse_Engineering\\Programs\\C_C++\\5_cipher_reverse\\affine\\affineenc.c\0"
	.ascii "O:\\\\BUPT-SCSS\\\\Courses\\\\ASM_and_Reverse_Engineering\\\\Programs\\\\C_C++\\\\5_cipher_reverse\\\\affine\0"
	.long	Ltext0
	.long	Letext0-Ltext0
	.secrel32	Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.ascii "char\0"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.ascii "unsigned int\0"
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.ascii "int\0"
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
	.uleb128 0x3
	.byte	0x4
	.long	0x146
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.ascii "long unsigned int\0"
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.ascii "unsigned char\0"
	.uleb128 0x4
	.ascii "_iobuf\0"
	.byte	0x20
	.byte	0x2
	.byte	0x1a
	.byte	0xa
	.long	0x254
	.uleb128 0x5
	.ascii "_ptr\0"
	.byte	0x2
	.byte	0x1b
	.byte	0xb
	.long	0x198
	.byte	0
	.uleb128 0x5
	.ascii "_cnt\0"
	.byte	0x2
	.byte	0x1c
	.byte	0x9
	.long	0x15e
	.byte	0x4
	.uleb128 0x5
	.ascii "_base\0"
	.byte	0x2
	.byte	0x1d
	.byte	0xb
	.long	0x198
	.byte	0x8
	.uleb128 0x5
	.ascii "_flag\0"
	.byte	0x2
	.byte	0x1e
	.byte	0x9
	.long	0x15e
	.byte	0xc
	.uleb128 0x5
	.ascii "_file\0"
	.byte	0x2
	.byte	0x1f
	.byte	0x9
	.long	0x15e
	.byte	0x10
	.uleb128 0x5
	.ascii "_charbuf\0"
	.byte	0x2
	.byte	0x20
	.byte	0x9
	.long	0x15e
	.byte	0x14
	.uleb128 0x5
	.ascii "_bufsiz\0"
	.byte	0x2
	.byte	0x21
	.byte	0x9
	.long	0x15e
	.byte	0x18
	.uleb128 0x5
	.ascii "_tmpfname\0"
	.byte	0x2
	.byte	0x22
	.byte	0xb
	.long	0x198
	.byte	0x1c
	.byte	0
	.uleb128 0x6
	.ascii "FILE\0"
	.byte	0x2
	.byte	0x24
	.byte	0x19
	.long	0x1c4
	.uleb128 0x7
	.long	0x254
	.long	0x26c
	.uleb128 0x8
	.byte	0
	.uleb128 0x9
	.ascii "_imp___iob\0"
	.byte	0x2
	.byte	0x5c
	.byte	0x10
	.long	0x27f
	.uleb128 0x3
	.byte	0x4
	.long	0x261
	.uleb128 0x7
	.long	0x146
	.long	0x295
	.uleb128 0xa
	.long	0x14e
	.byte	0x10
	.byte	0
	.uleb128 0xb
	.ascii "answer\0"
	.byte	0x1
	.byte	0x6
	.byte	0x6
	.long	0x285
	.uleb128 0x5
	.byte	0x3
	.long	_answer
	.uleb128 0xc
	.ascii "main\0"
	.byte	0x1
	.byte	0x8
	.byte	0x5
	.long	0x15e
	.long	LFB14
	.long	LFE14-LFB14
	.uleb128 0x1
	.byte	0x9c
	.long	0x350
	.uleb128 0xd
	.ascii "key_a\0"
	.byte	0x1
	.byte	0xa
	.byte	0x9
	.long	0x15e
	.uleb128 0x3
	.byte	0x74
	.sleb128 136
	.uleb128 0xd
	.ascii "key_b\0"
	.byte	0x1
	.byte	0xb
	.byte	0x9
	.long	0x15e
	.uleb128 0x3
	.byte	0x74
	.sleb128 132
	.uleb128 0xd
	.ascii "re_key_a\0"
	.byte	0x1
	.byte	0xc
	.byte	0x9
	.long	0x15e
	.uleb128 0x3
	.byte	0x74
	.sleb128 128
	.uleb128 0xd
	.ascii "array\0"
	.byte	0x1
	.byte	0xd
	.byte	0xa
	.long	0x350
	.uleb128 0x2
	.byte	0x74
	.sleb128 20
	.uleb128 0xd
	.ascii "temp\0"
	.byte	0x1
	.byte	0xe
	.byte	0x9
	.long	0x15e
	.uleb128 0x3
	.byte	0x74
	.sleb128 120
	.uleb128 0xd
	.ascii "len\0"
	.byte	0x1
	.byte	0xf
	.byte	0x9
	.long	0x15e
	.uleb128 0x3
	.byte	0x74
	.sleb128 124
	.uleb128 0xd
	.ascii "i\0"
	.byte	0x1
	.byte	0x10
	.byte	0x9
	.long	0x15e
	.uleb128 0x3
	.byte	0x74
	.sleb128 140
	.uleb128 0xe
	.ascii "system\0"
	.byte	0x1
	.byte	0x27
	.byte	0x2
	.long	0x15e
	.uleb128 0xf
	.byte	0
	.byte	0
	.uleb128 0x10
	.long	0x146
	.uleb128 0xa
	.long	0x14e
	.byte	0x63
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
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
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0xa
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_strlen;	.scl	2;	.type	32;	.endef
	.def	_strcmp;	.scl	2;	.type	32;	.endef
	.def	_system;	.scl	2;	.type	32;	.endef
