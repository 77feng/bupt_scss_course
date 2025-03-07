	.file	"main.c"
	.intel_syntax noprefix
	.text
Ltext0:
	.comm	_S, 64, 5
	.comm	_T, 256, 5
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "Please input your flag:\0"
LC1:
	.ascii "%s\0"
	.align 4
LC2:
	.ascii "\12Invalid ASCII character detected!\12\0"
LC3:
	.ascii "pause\0"
	.align 4
LC4:
	.ascii "23d4a52c56357cb705137656744dc055\0"
LC5:
	.ascii "\12well done!\12\0"
LC6:
	.ascii "\12Sorry to say \"wrong\"!\12\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB17:
	.file 1 "O:/BUPT-SCSS/Courses_and_research/ASM_and_Reverse_Engineering/Programs/C_C++/5_cipher_reverse/md5/main.c"
	.loc 1 3 11
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	push	edi
	and	esp, -16
	sub	esp, 1088
	.cfi_offset 7, -12
	.loc 1 3 11
	call	___main
LVL0:
	.loc 1 5 10
	lea	edx, [esp+1047]
	mov	ecx, 33
	mov	al, 0
	mov	edi, edx
	rep stosb
	.loc 1 6 7
	lea	edx, [esp+23]
	mov	ecx, 256
	mov	eax, 0
	mov	edi, edx
	rep stosd
	.loc 1 7 7
	mov	DWORD PTR [esp+18], 0
	mov	BYTE PTR [esp+22], 0
	.loc 1 10 2
	mov	DWORD PTR [esp], OFFSET FLAT:LC0
	call	_puts
	.loc 1 11 5
	lea	eax, [esp+23]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC1
	call	_scanf
	.loc 1 13 21
	lea	eax, [esp+23]
	mov	DWORD PTR [esp], eax
	call	_strlen
	mov	DWORD PTR [esp+1080], eax
	.loc 1 15 4
	cmp	DWORD PTR [esp+1080], 4
	jbe	L2
	.loc 1 16 8
	mov	DWORD PTR [esp+1084], 0
	.loc 1 16 3
	jmp	L3
L8:
	.loc 1 17 13
	lea	edx, [esp+23]
	mov	eax, DWORD PTR [esp+1084]
	add	eax, edx
	mov	al, BYTE PTR [eax]
	.loc 1 17 7
	cmp	al, 96
	jle	L4
	.loc 1 17 30 discriminator 2
	lea	edx, [esp+23]
	mov	eax, DWORD PTR [esp+1084]
	add	eax, edx
	mov	al, BYTE PTR [eax]
	.loc 1 17 23 discriminator 2
	cmp	al, 122
	jle	L5
L4:
	.loc 1 17 49 discriminator 3
	lea	edx, [esp+23]
	mov	eax, DWORD PTR [esp+1084]
	add	eax, edx
	mov	al, BYTE PTR [eax]
	.loc 1 17 41 discriminator 3
	cmp	al, 64
	jle	L6
	.loc 1 17 66 discriminator 4
	lea	edx, [esp+23]
	mov	eax, DWORD PTR [esp+1084]
	add	eax, edx
	mov	al, BYTE PTR [eax]
	.loc 1 17 59 discriminator 4
	cmp	al, 90
	jle	L5
L6:
	.loc 1 18 5
	mov	DWORD PTR [esp], OFFSET FLAT:LC2
	call	_puts
	.loc 1 20 5
	mov	DWORD PTR [esp], OFFSET FLAT:LC3
	call	_system
	.loc 1 21 12
	mov	eax, 0
	jmp	L10
L5:
	.loc 1 16 29 discriminator 2
	inc	DWORD PTR [esp+1084]
L3:
	.loc 1 16 14 discriminator 1
	lea	eax, [esp+23]
	mov	DWORD PTR [esp], eax
	call	_strlen
	mov	edx, eax
	.loc 1 16 13 discriminator 1
	mov	eax, DWORD PTR [esp+1084]
	.loc 1 16 3 discriminator 1
	cmp	edx, eax
	ja	L8
	.loc 1 25 3
	mov	DWORD PTR [esp+8], 4
	lea	eax, [esp+23]
	mov	DWORD PTR [esp+4], eax
	lea	eax, [esp+18]
	mov	DWORD PTR [esp], eax
	call	_strncpy
	.loc 1 28 3
	mov	DWORD PTR [esp+8], 4
	lea	eax, [esp+18]
	mov	DWORD PTR [esp+4], eax
	lea	eax, [esp+1047]
	mov	DWORD PTR [esp], eax
	call	_md5_calc
	.loc 1 31 7
	mov	DWORD PTR [esp+8], 32
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC4
	lea	eax, [esp+1047]
	mov	DWORD PTR [esp], eax
	call	_strncmp
	.loc 1 31 5
	test	eax, eax
	jne	L9
	.loc 1 32 4
	mov	DWORD PTR [esp], OFFSET FLAT:LC5
	call	_puts
	jmp	L2
L9:
	.loc 1 34 4
	mov	DWORD PTR [esp], OFFSET FLAT:LC6
	call	_puts
L2:
	.loc 1 37 2
	mov	DWORD PTR [esp], OFFSET FLAT:LC3
	call	_system
	.loc 1 38 9
	mov	eax, 0
L10:
	.loc 1 39 1 discriminator 1
	mov	edi, DWORD PTR [ebp-4]
	leave
	.cfi_restore 5
	.cfi_restore 7
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
Letext0:
	.file 2 "C:/Program Files (x86)/CodeBlocks/MinGW/i686-w64-mingw32/include/stdio.h"
	.file 3 "C:/Program Files (x86)/CodeBlocks/MinGW/i686-w64-mingw32/include/crtdefs.h"
	.file 4 "C:/Program Files (x86)/CodeBlocks/MinGW/i686-w64-mingw32/include/stdlib.h"
	.file 5 "C:/Program Files (x86)/CodeBlocks/MinGW/i686-w64-mingw32/include/malloc.h"
	.file 6 "O:/BUPT-SCSS/Courses_and_research/ASM_and_Reverse_Engineering/Programs/C_C++/5_cipher_reverse/md5/md5.h"
	.section	.debug_info,"dr"
Ldebug_info0:
	.long	0x564
	.word	0x4
	.secrel32	Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.ascii "GNU C17 8.1.0 -march=i386 -m32 -masm=intel -g -fPIC -finput-charset=UTF-8 -fexec-charset=UTF-8 -fno-stack-protector\0"
	.byte	0xc
	.ascii "O:\\BUPT-SCSS\\Courses_and_research\\ASM_and_Reverse_Engineering\\Programs\\C_C++\\5_cipher_reverse\\md5\\main.c\0"
	.ascii "O:\\\\BUPT-SCSS\\\\Courses_and_research\\\\ASM_and_Reverse_Engineering\\\\Programs\\\\C_C++\\\\5_cipher_reverse\\\\md5\0"
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
	.uleb128 0x3
	.long	0x167
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.ascii "int\0"
	.uleb128 0x4
	.ascii "wchar_t\0"
	.byte	0x3
	.byte	0x62
	.byte	0x18
	.long	0x193
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
	.long	0x15f
	.uleb128 0x5
	.byte	0x4
	.long	0x183
	.uleb128 0x5
	.byte	0x4
	.long	0x17c
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
	.byte	0x2
	.byte	0x1a
	.byte	0xa
	.long	0x28e
	.uleb128 0x7
	.ascii "_ptr\0"
	.byte	0x2
	.byte	0x1b
	.byte	0xb
	.long	0x1c6
	.byte	0
	.uleb128 0x7
	.ascii "_cnt\0"
	.byte	0x2
	.byte	0x1c
	.byte	0x9
	.long	0x17c
	.byte	0x4
	.uleb128 0x7
	.ascii "_base\0"
	.byte	0x2
	.byte	0x1d
	.byte	0xb
	.long	0x1c6
	.byte	0x8
	.uleb128 0x7
	.ascii "_flag\0"
	.byte	0x2
	.byte	0x1e
	.byte	0x9
	.long	0x17c
	.byte	0xc
	.uleb128 0x7
	.ascii "_file\0"
	.byte	0x2
	.byte	0x1f
	.byte	0x9
	.long	0x17c
	.byte	0x10
	.uleb128 0x7
	.ascii "_charbuf\0"
	.byte	0x2
	.byte	0x20
	.byte	0x9
	.long	0x17c
	.byte	0x14
	.uleb128 0x7
	.ascii "_bufsiz\0"
	.byte	0x2
	.byte	0x21
	.byte	0x9
	.long	0x17c
	.byte	0x18
	.uleb128 0x7
	.ascii "_tmpfname\0"
	.byte	0x2
	.byte	0x22
	.byte	0xb
	.long	0x1c6
	.byte	0x1c
	.byte	0
	.uleb128 0x4
	.ascii "FILE\0"
	.byte	0x2
	.byte	0x24
	.byte	0x19
	.long	0x1fe
	.uleb128 0x8
	.long	0x28e
	.long	0x2a6
	.uleb128 0x9
	.byte	0
	.uleb128 0xa
	.ascii "_imp___iob\0"
	.byte	0x2
	.byte	0x5c
	.byte	0x10
	.long	0x2b9
	.uleb128 0x5
	.byte	0x4
	.long	0x29b
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
	.long	0x1d2
	.uleb128 0x8
	.long	0x1c6
	.long	0x30c
	.uleb128 0xb
	.long	0x167
	.byte	0
	.byte	0
	.uleb128 0xa
	.ascii "_sys_errlist\0"
	.byte	0x4
	.byte	0xac
	.byte	0x2b
	.long	0x2fc
	.uleb128 0xa
	.ascii "_sys_nerr\0"
	.byte	0x4
	.byte	0xad
	.byte	0x29
	.long	0x17c
	.uleb128 0xc
	.ascii "_imp____argc\0"
	.byte	0x4
	.word	0x119
	.byte	0x10
	.long	0x1d2
	.uleb128 0xc
	.ascii "_imp____argv\0"
	.byte	0x4
	.word	0x11d
	.byte	0x13
	.long	0x35f
	.uleb128 0x5
	.byte	0x4
	.long	0x365
	.uleb128 0x5
	.byte	0x4
	.long	0x1c6
	.uleb128 0xc
	.ascii "_imp____wargv\0"
	.byte	0x4
	.word	0x121
	.byte	0x16
	.long	0x382
	.uleb128 0x5
	.byte	0x4
	.long	0x388
	.uleb128 0x5
	.byte	0x4
	.long	0x1cc
	.uleb128 0xc
	.ascii "_imp___environ\0"
	.byte	0x4
	.word	0x127
	.byte	0x13
	.long	0x35f
	.uleb128 0xc
	.ascii "_imp___wenviron\0"
	.byte	0x4
	.word	0x12c
	.byte	0x16
	.long	0x382
	.uleb128 0xc
	.ascii "_imp___pgmptr\0"
	.byte	0x4
	.word	0x132
	.byte	0x12
	.long	0x365
	.uleb128 0xc
	.ascii "_imp___wpgmptr\0"
	.byte	0x4
	.word	0x137
	.byte	0x15
	.long	0x388
	.uleb128 0xc
	.ascii "_imp___osplatform\0"
	.byte	0x4
	.word	0x13c
	.byte	0x19
	.long	0x409
	.uleb128 0x5
	.byte	0x4
	.long	0x167
	.uleb128 0xc
	.ascii "_imp___osver\0"
	.byte	0x4
	.word	0x141
	.byte	0x19
	.long	0x409
	.uleb128 0xc
	.ascii "_imp___winver\0"
	.byte	0x4
	.word	0x146
	.byte	0x19
	.long	0x409
	.uleb128 0xc
	.ascii "_imp___winmajor\0"
	.byte	0x4
	.word	0x14b
	.byte	0x19
	.long	0x409
	.uleb128 0xc
	.ascii "_imp___winminor\0"
	.byte	0x4
	.word	0x150
	.byte	0x19
	.long	0x409
	.uleb128 0xa
	.ascii "_amblksiz\0"
	.byte	0x5
	.byte	0x35
	.byte	0x17
	.long	0x167
	.uleb128 0x8
	.long	0x177
	.long	0x490
	.uleb128 0xb
	.long	0x167
	.byte	0xf
	.byte	0
	.uleb128 0x3
	.long	0x480
	.uleb128 0xd
	.ascii "S\0"
	.byte	0x6
	.byte	0xc
	.byte	0x14
	.long	0x490
	.uleb128 0x5
	.byte	0x3
	.long	_S
	.uleb128 0x8
	.long	0x177
	.long	0x4b5
	.uleb128 0xb
	.long	0x167
	.byte	0x3f
	.byte	0
	.uleb128 0x3
	.long	0x4a5
	.uleb128 0xd
	.ascii "T\0"
	.byte	0x6
	.byte	0xd
	.byte	0x14
	.long	0x4b5
	.uleb128 0x5
	.byte	0x3
	.long	_T
	.uleb128 0xe
	.ascii "main\0"
	.byte	0x1
	.byte	0x3
	.byte	0x5
	.long	0x17c
	.long	LFB17
	.long	LFE17-LFB17
	.uleb128 0x1
	.byte	0x9c
	.long	0x53a
	.uleb128 0xf
	.ascii "resultBuf\0"
	.byte	0x1
	.byte	0x5
	.byte	0xa
	.long	0x53a
	.uleb128 0x3
	.byte	0x74
	.sleb128 1047
	.uleb128 0xf
	.ascii "flag\0"
	.byte	0x1
	.byte	0x6
	.byte	0x7
	.long	0x54a
	.uleb128 0x2
	.byte	0x74
	.sleb128 23
	.uleb128 0xf
	.ascii "tbuf\0"
	.byte	0x1
	.byte	0x7
	.byte	0x7
	.long	0x55b
	.uleb128 0x2
	.byte	0x74
	.sleb128 18
	.uleb128 0xf
	.ascii "i\0"
	.byte	0x1
	.byte	0x8
	.byte	0x6
	.long	0x17c
	.uleb128 0x3
	.byte	0x74
	.sleb128 1084
	.uleb128 0xf
	.ascii "len\0"
	.byte	0x1
	.byte	0xd
	.byte	0xf
	.long	0x167
	.uleb128 0x3
	.byte	0x74
	.sleb128 1080
	.byte	0
	.uleb128 0x8
	.long	0x15f
	.long	0x54a
	.uleb128 0xb
	.long	0x167
	.byte	0x20
	.byte	0
	.uleb128 0x8
	.long	0x15f
	.long	0x55b
	.uleb128 0x10
	.long	0x167
	.word	0x3ff
	.byte	0
	.uleb128 0x11
	.long	0x15f
	.uleb128 0xb
	.long	0x167
	.byte	0x4
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
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_system;	.scl	2;	.type	32;	.endef
	.def	_strncpy;	.scl	2;	.type	32;	.endef
	.def	_md5_calc;	.scl	2;	.type	32;	.endef
	.def	_strncmp;	.scl	2;	.type	32;	.endef
