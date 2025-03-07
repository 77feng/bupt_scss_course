	.file	"main.c"
	.intel_syntax noprefix
	.text
Ltext0:
	.globl	_target
	.data
	.align 32
_target:
	.byte	62
	.byte	-84
	.byte	77
	.byte	-55
	.byte	29
	.byte	-8
	.byte	-44
	.byte	-78
	.byte	-62
	.byte	8
	.byte	-56
	.byte	-39
	.byte	-15
	.byte	33
	.byte	58
	.byte	72
	.byte	-121
	.byte	86
	.byte	-99
	.byte	78
	.byte	22
	.byte	73
	.byte	-58
	.byte	-93
	.byte	-92
	.byte	-101
	.byte	69
	.byte	-89
	.byte	110
	.byte	48
	.byte	-8
	.byte	111
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "Your flag? \0"
LC1:
	.ascii "%40s\0"
LC2:
	.ascii "Wrong!\12\0"
LC3:
	.ascii "Correct!\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB17:
	.file 1 "O:/BUPT-SCSS/Courses and research/ASM_and_Reverse_Engineering/Programs/C_C++/5_cipher_reverse/mba/main.c"
	.loc 1 16 12
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	and	esp, -16
	sub	esp, 80
	.loc 1 16 12
	call	___main
LVL0:
	.loc 1 18 5
	mov	DWORD PTR [esp], OFFSET FLAT:LC0
	call	_puts
	.loc 1 19 5
	lea	eax, [esp+22]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC1
	call	_scanf
	.loc 1 20 9
	lea	eax, [esp+22]
	mov	DWORD PTR [esp], eax
	call	_strlen
	.loc 1 20 8
	cmp	eax, 38
	je	L2
	.loc 1 21 9
	mov	DWORD PTR [esp], OFFSET FLAT:LC2
	call	_printf
	.loc 1 22 9
	mov	DWORD PTR [esp], 0
	call	_exit
L2:
	.loc 1 24 17
	mov	al, BYTE PTR [esp+22]
	.loc 1 24 8
	cmp	al, 102
	jne	L3
	.loc 1 25 17 discriminator 1
	mov	al, BYTE PTR [esp+23]
	.loc 1 24 28 discriminator 1
	cmp	al, 108
	jne	L3
	.loc 1 26 17
	mov	al, BYTE PTR [esp+24]
	.loc 1 25 28
	cmp	al, 97
	jne	L3
	.loc 1 27 17
	mov	al, BYTE PTR [esp+25]
	.loc 1 26 28
	cmp	al, 103
	jne	L3
	.loc 1 28 17
	mov	al, BYTE PTR [esp+26]
	.loc 1 27 28
	cmp	al, 123
	jne	L3
	.loc 1 29 17
	mov	al, BYTE PTR [esp+59]
	.loc 1 28 28
	cmp	al, 125
	je	L4
L3:
	.loc 1 30 9
	mov	DWORD PTR [esp], OFFSET FLAT:LC2
	call	_printf
	.loc 1 31 9
	mov	DWORD PTR [esp], 0
	call	_exit
L4:
LBB2:
	.loc 1 34 14
	mov	DWORD PTR [esp+76], 0
	.loc 1 34 5
	jmp	L5
L6:
LBB3:
	.loc 1 35 29 discriminator 3
	mov	eax, DWORD PTR [esp+76]
	sal	eax, 3
	.loc 1 35 27 discriminator 3
	lea	edx, [eax+5]
	.loc 1 35 9 discriminator 3
	lea	eax, [esp+22]
	add	eax, edx
	mov	DWORD PTR [esp], eax
	call	_encrypt
LBE3:
	.loc 1 34 25 discriminator 3
	inc	DWORD PTR [esp+76]
L5:
	.loc 1 34 5 discriminator 1
	cmp	DWORD PTR [esp+76], 3
	jle	L6
LBE2:
LBB4:
	.loc 1 41 14
	mov	DWORD PTR [esp+72], 0
	.loc 1 41 5
	jmp	L7
L9:
	.loc 1 42 23
	mov	eax, DWORD PTR [esp+72]
	add	eax, 5
	.loc 1 42 21
	mov	dl, BYTE PTR [esp+22+eax]
	.loc 1 42 36
	mov	eax, DWORD PTR [esp+72]
	add	eax, OFFSET FLAT:_target
	mov	al, BYTE PTR [eax]
	.loc 1 42 12
	cmp	dl, al
	je	L8
	.loc 1 43 13
	mov	DWORD PTR [esp], OFFSET FLAT:LC2
	call	_printf
	.loc 1 44 13
	mov	DWORD PTR [esp], 0
	call	_exit
L8:
	.loc 1 41 26 discriminator 2
	inc	DWORD PTR [esp+72]
L7:
	.loc 1 41 5 discriminator 1
	cmp	DWORD PTR [esp+72], 31
	jle	L9
LBE4:
	.loc 1 48 5
	mov	DWORD PTR [esp], OFFSET FLAT:LC3
	call	_puts
	mov	eax, 0
	.loc 1 50 1
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
Letext0:
	.file 2 "C:/Program Files (x86)/codeblocks-20.03-32bit-mingw-32bit-nosetup/MinGW/i686-w64-mingw32/include/stdio.h"
	.file 3 "C:/Program Files (x86)/codeblocks-20.03-32bit-mingw-32bit-nosetup/MinGW/i686-w64-mingw32/include/crtdefs.h"
	.file 4 "C:/Program Files (x86)/codeblocks-20.03-32bit-mingw-32bit-nosetup/MinGW/i686-w64-mingw32/include/stdlib.h"
	.file 5 "C:/Program Files (x86)/codeblocks-20.03-32bit-mingw-32bit-nosetup/MinGW/i686-w64-mingw32/include/malloc.h"
	.section	.debug_info,"dr"
Ldebug_info0:
	.long	0x562
	.word	0x4
	.secrel32	Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.ascii "GNU C17 8.1.0 -march=i386 -m32 -masm=intel -g -finput-charset=UTF-8 -fexec-charset=GBK -fPIE -fno-builtin\0"
	.byte	0xc
	.ascii "O:\\BUPT-SCSS\\Courses and research\\ASM_and_Reverse_Engineering\\Programs\\C_C++\\5_cipher_reverse\\mba\\main.c\0"
	.ascii "O:\\\\BUPT-SCSS\\\\Courses and research\\\\ASM_and_Reverse_Engineering\\\\Programs\\\\C_C++\\\\5_cipher_reverse\\\\mba\0"
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
	.uleb128 0x3
	.ascii "wchar_t\0"
	.byte	0x3
	.byte	0x62
	.byte	0x18
	.long	0x184
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
	.long	0x155
	.uleb128 0x4
	.byte	0x4
	.long	0x174
	.uleb128 0x4
	.byte	0x4
	.long	0x16d
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.ascii "long unsigned int\0"
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.ascii "unsigned char\0"
	.uleb128 0x5
	.ascii "_iobuf\0"
	.byte	0x20
	.byte	0x2
	.byte	0x1a
	.byte	0xa
	.long	0x27f
	.uleb128 0x6
	.ascii "_ptr\0"
	.byte	0x2
	.byte	0x1b
	.byte	0xb
	.long	0x1b7
	.byte	0
	.uleb128 0x6
	.ascii "_cnt\0"
	.byte	0x2
	.byte	0x1c
	.byte	0x9
	.long	0x16d
	.byte	0x4
	.uleb128 0x6
	.ascii "_base\0"
	.byte	0x2
	.byte	0x1d
	.byte	0xb
	.long	0x1b7
	.byte	0x8
	.uleb128 0x6
	.ascii "_flag\0"
	.byte	0x2
	.byte	0x1e
	.byte	0x9
	.long	0x16d
	.byte	0xc
	.uleb128 0x6
	.ascii "_file\0"
	.byte	0x2
	.byte	0x1f
	.byte	0x9
	.long	0x16d
	.byte	0x10
	.uleb128 0x6
	.ascii "_charbuf\0"
	.byte	0x2
	.byte	0x20
	.byte	0x9
	.long	0x16d
	.byte	0x14
	.uleb128 0x6
	.ascii "_bufsiz\0"
	.byte	0x2
	.byte	0x21
	.byte	0x9
	.long	0x16d
	.byte	0x18
	.uleb128 0x6
	.ascii "_tmpfname\0"
	.byte	0x2
	.byte	0x22
	.byte	0xb
	.long	0x1b7
	.byte	0x1c
	.byte	0
	.uleb128 0x3
	.ascii "FILE\0"
	.byte	0x2
	.byte	0x24
	.byte	0x19
	.long	0x1ef
	.uleb128 0x7
	.long	0x27f
	.long	0x297
	.uleb128 0x8
	.byte	0
	.uleb128 0x9
	.ascii "_imp___iob\0"
	.byte	0x2
	.byte	0x5c
	.byte	0x10
	.long	0x2aa
	.uleb128 0x4
	.byte	0x4
	.long	0x28c
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
	.uleb128 0x9
	.ascii "_imp____mb_cur_max\0"
	.byte	0x4
	.byte	0x73
	.byte	0x10
	.long	0x1c3
	.uleb128 0x7
	.long	0x1b7
	.long	0x2fd
	.uleb128 0xa
	.long	0x15d
	.byte	0
	.byte	0
	.uleb128 0x9
	.ascii "_sys_errlist\0"
	.byte	0x4
	.byte	0xac
	.byte	0x2b
	.long	0x2ed
	.uleb128 0x9
	.ascii "_sys_nerr\0"
	.byte	0x4
	.byte	0xad
	.byte	0x29
	.long	0x16d
	.uleb128 0xb
	.ascii "_imp____argc\0"
	.byte	0x4
	.word	0x119
	.byte	0x10
	.long	0x1c3
	.uleb128 0xb
	.ascii "_imp____argv\0"
	.byte	0x4
	.word	0x11d
	.byte	0x13
	.long	0x350
	.uleb128 0x4
	.byte	0x4
	.long	0x356
	.uleb128 0x4
	.byte	0x4
	.long	0x1b7
	.uleb128 0xb
	.ascii "_imp____wargv\0"
	.byte	0x4
	.word	0x121
	.byte	0x16
	.long	0x373
	.uleb128 0x4
	.byte	0x4
	.long	0x379
	.uleb128 0x4
	.byte	0x4
	.long	0x1bd
	.uleb128 0xb
	.ascii "_imp___environ\0"
	.byte	0x4
	.word	0x127
	.byte	0x13
	.long	0x350
	.uleb128 0xb
	.ascii "_imp___wenviron\0"
	.byte	0x4
	.word	0x12c
	.byte	0x16
	.long	0x373
	.uleb128 0xb
	.ascii "_imp___pgmptr\0"
	.byte	0x4
	.word	0x132
	.byte	0x12
	.long	0x356
	.uleb128 0xb
	.ascii "_imp___wpgmptr\0"
	.byte	0x4
	.word	0x137
	.byte	0x15
	.long	0x379
	.uleb128 0xb
	.ascii "_imp___osplatform\0"
	.byte	0x4
	.word	0x13c
	.byte	0x19
	.long	0x3fa
	.uleb128 0x4
	.byte	0x4
	.long	0x15d
	.uleb128 0xb
	.ascii "_imp___osver\0"
	.byte	0x4
	.word	0x141
	.byte	0x19
	.long	0x3fa
	.uleb128 0xb
	.ascii "_imp___winver\0"
	.byte	0x4
	.word	0x146
	.byte	0x19
	.long	0x3fa
	.uleb128 0xb
	.ascii "_imp___winmajor\0"
	.byte	0x4
	.word	0x14b
	.byte	0x19
	.long	0x3fa
	.uleb128 0xb
	.ascii "_imp___winminor\0"
	.byte	0x4
	.word	0x150
	.byte	0x19
	.long	0x3fa
	.uleb128 0x9
	.ascii "_amblksiz\0"
	.byte	0x5
	.byte	0x35
	.byte	0x17
	.long	0x15d
	.uleb128 0x2
	.byte	0x10
	.byte	0x4
	.ascii "_Float128\0"
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.ascii "signed char\0"
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.ascii "short int\0"
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.ascii "long long unsigned int\0"
	.uleb128 0x7
	.long	0x1de
	.long	0x4c4
	.uleb128 0xa
	.long	0x15d
	.byte	0x1f
	.byte	0
	.uleb128 0xc
	.ascii "target\0"
	.byte	0x1
	.byte	0x9
	.byte	0xf
	.long	0x4b4
	.uleb128 0x5
	.byte	0x3
	.long	_target
	.uleb128 0xd
	.ascii "main\0"
	.byte	0x1
	.byte	0x10
	.byte	0x5
	.long	0x16d
	.long	LFB17
	.long	LFE17-LFB17
	.uleb128 0x1
	.byte	0x9c
	.long	0x559
	.uleb128 0xe
	.ascii "inputstr\0"
	.byte	0x1
	.byte	0x11
	.byte	0x13
	.long	0x559
	.uleb128 0x2
	.byte	0x74
	.sleb128 22
	.uleb128 0xf
	.long	LBB2
	.long	LBE2-LBB2
	.long	0x540
	.uleb128 0xe
	.ascii "i\0"
	.byte	0x1
	.byte	0x22
	.byte	0xe
	.long	0x16d
	.uleb128 0x3
	.byte	0x74
	.sleb128 76
	.uleb128 0x10
	.long	LBB3
	.long	LBE3-LBB3
	.uleb128 0x11
	.ascii "encrypt\0"
	.byte	0x1
	.byte	0x23
	.byte	0x9
	.long	0x16d
	.uleb128 0x12
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x10
	.long	LBB4
	.long	LBE4-LBB4
	.uleb128 0xe
	.ascii "i\0"
	.byte	0x1
	.byte	0x29
	.byte	0xe
	.long	0x16d
	.uleb128 0x3
	.byte	0x74
	.sleb128 72
	.byte	0
	.byte	0
	.uleb128 0x13
	.long	0x1de
	.uleb128 0xa
	.long	0x15d
	.byte	0x31
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
	.uleb128 0x6
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
	.uleb128 0x3f
	.uleb128 0x19
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
	.uleb128 0xe
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
	.uleb128 0xf
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x12
	.uleb128 0x18
	.byte	0
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
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_strlen;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_exit;	.scl	2;	.type	32;	.endef
	.def	_encrypt;	.scl	2;	.type	32;	.endef
