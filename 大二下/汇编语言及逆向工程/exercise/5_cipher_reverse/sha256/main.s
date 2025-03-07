	.file	"main.c"
	.intel_syntax noprefix
	.text
Ltext0:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "please input your flag:\12\0"
LC1:
	.ascii "%s\0"
	.align 4
LC2:
	.ascii "\12Invalid ASCII character detected!\12\0"
LC3:
	.ascii "pause\0"
	.align 4
LC4:
	.ascii "45c6c64ffd31a750bcb2e150519f1963e5424bafd380637cff33075c25d35334\0"
LC5:
	.ascii "\12well done!\12\12\0"
LC6:
	.ascii "\12Sorry to say \"wrong\"!\12\12\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB13:
	.file 1 "O:/BUPT-SCSS/Courses/ASM_and_Reverse_Engineering/Programs/C_C++/5_cipher_reverse/sha256/main.c"
	.loc 1 5 1
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	and	esp, -16
	sub	esp, 1152
	.loc 1 5 1
	call	___main
LVL0:
	.loc 1 13 5
	mov	DWORD PTR [esp+8], 32
	mov	DWORD PTR [esp+4], 0
	lea	eax, [esp+24]
	mov	DWORD PTR [esp], eax
	call	_memset
	.loc 1 16 5
	mov	DWORD PTR [esp], OFFSET FLAT:LC0
	call	_printf
	.loc 1 17 5
	lea	eax, [esp+88]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC1
	call	_scanf
	.loc 1 18 16
	lea	eax, [esp+88]
	mov	DWORD PTR [esp], eax
	call	_strlen
	.loc 1 18 14
	mov	DWORD PTR [esp+1144], eax
	.loc 1 20 8
	cmp	DWORD PTR [esp+1144], 4
	jbe	L2
LBB2:
LBB3:
	.loc 1 21 18
	mov	DWORD PTR [esp+1148], 0
	.loc 1 21 9
	jmp	L3
L8:
	.loc 1 23 22
	lea	edx, [esp+88]
	mov	eax, DWORD PTR [esp+1148]
	add	eax, edx
	mov	al, BYTE PTR [eax]
	.loc 1 23 16
	cmp	al, 96
	jbe	L4
	.loc 1 23 39 discriminator 2
	lea	edx, [esp+88]
	mov	eax, DWORD PTR [esp+1148]
	add	eax, edx
	mov	al, BYTE PTR [eax]
	.loc 1 23 32 discriminator 2
	cmp	al, 122
	jbe	L5
L4:
	.loc 1 23 58 discriminator 3
	lea	edx, [esp+88]
	mov	eax, DWORD PTR [esp+1148]
	add	eax, edx
	mov	al, BYTE PTR [eax]
	.loc 1 23 50 discriminator 3
	cmp	al, 64
	jbe	L6
	.loc 1 23 75 discriminator 4
	lea	edx, [esp+88]
	mov	eax, DWORD PTR [esp+1148]
	add	eax, edx
	mov	al, BYTE PTR [eax]
	.loc 1 23 68 discriminator 4
	cmp	al, 90
	jbe	L5
L6:
LBB4:
	.loc 1 24 17
	mov	DWORD PTR [esp], OFFSET FLAT:LC2
	call	_puts
	.loc 1 26 17
	mov	DWORD PTR [esp], OFFSET FLAT:LC3
	call	_system
	.loc 1 27 24
	mov	eax, 0
	jmp	L10
L5:
LBE4:
	.loc 1 21 39 discriminator 2
	inc	DWORD PTR [esp+1148]
L3:
	.loc 1 21 27 discriminator 1
	mov	eax, DWORD PTR [esp+1148]
	.loc 1 21 9 discriminator 1
	cmp	DWORD PTR [esp+1144], eax
	ja	L8
LBE3:
	.loc 1 31 9
	mov	DWORD PTR [esp+8], 5
	lea	eax, [esp+88]
	mov	DWORD PTR [esp+4], eax
	lea	eax, [esp+1112]
	mov	DWORD PTR [esp], eax
	call	_strncpy
	.loc 1 32 9
	mov	DWORD PTR [esp+8], 4
	lea	eax, [esp+1112]
	mov	DWORD PTR [esp+4], eax
	lea	eax, [esp+24]
	mov	DWORD PTR [esp], eax
	call	_sha256
LBB5:
	.loc 1 34 7
	mov	DWORD PTR [esp+8], 64
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC4
	lea	eax, [esp+24]
	mov	DWORD PTR [esp], eax
	call	_strncmp
	.loc 1 34 5
	test	eax, eax
	jne	L9
	.loc 1 35 4
	mov	DWORD PTR [esp], OFFSET FLAT:LC5
	call	_printf
	jmp	L2
L9:
	.loc 1 37 4
	mov	DWORD PTR [esp], OFFSET FLAT:LC6
	call	_printf
L2:
LBE5:
LBE2:
	.loc 1 40 5
	mov	DWORD PTR [esp], OFFSET FLAT:LC3
	call	_system
	.loc 1 41 12
	mov	eax, 0
L10:
	.loc 1 42 1 discriminator 1
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE13:
Letext0:
	.file 2 "C:/Program Files (x86)/codeblocks-20.03-32bit-mingw-32bit-nosetup/MinGW/i686-w64-mingw32/include/stdio.h"
	.section	.debug_info,"dr"
Ldebug_info0:
	.long	0x43a
	.word	0x4
	.secrel32	Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.ascii "GNU C17 8.1.0 -march=i386 -m32 -masm=intel -g -finput-charset=UTF-8 -fexec-charset=GBK -fPIE -fno-builtin\0"
	.byte	0xc
	.ascii "O:\\BUPT-SCSS\\Courses\\ASM_and_Reverse_Engineering\\Programs\\C_C++\\5_cipher_reverse\\sha256\\main.c\0"
	.ascii "O:\\\\BUPT-SCSS\\\\Courses\\\\ASM_and_Reverse_Engineering\\\\Programs\\\\C_C++\\\\5_cipher_reverse\\\\sha256\0"
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
	.long	0x141
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
	.long	0x24f
	.uleb128 0x5
	.ascii "_ptr\0"
	.byte	0x2
	.byte	0x1b
	.byte	0xb
	.long	0x193
	.byte	0
	.uleb128 0x5
	.ascii "_cnt\0"
	.byte	0x2
	.byte	0x1c
	.byte	0x9
	.long	0x159
	.byte	0x4
	.uleb128 0x5
	.ascii "_base\0"
	.byte	0x2
	.byte	0x1d
	.byte	0xb
	.long	0x193
	.byte	0x8
	.uleb128 0x5
	.ascii "_flag\0"
	.byte	0x2
	.byte	0x1e
	.byte	0x9
	.long	0x159
	.byte	0xc
	.uleb128 0x5
	.ascii "_file\0"
	.byte	0x2
	.byte	0x1f
	.byte	0x9
	.long	0x159
	.byte	0x10
	.uleb128 0x5
	.ascii "_charbuf\0"
	.byte	0x2
	.byte	0x20
	.byte	0x9
	.long	0x159
	.byte	0x14
	.uleb128 0x5
	.ascii "_bufsiz\0"
	.byte	0x2
	.byte	0x21
	.byte	0x9
	.long	0x159
	.byte	0x18
	.uleb128 0x5
	.ascii "_tmpfname\0"
	.byte	0x2
	.byte	0x22
	.byte	0xb
	.long	0x193
	.byte	0x1c
	.byte	0
	.uleb128 0x6
	.ascii "FILE\0"
	.byte	0x2
	.byte	0x24
	.byte	0x19
	.long	0x1bf
	.uleb128 0x7
	.long	0x24f
	.long	0x267
	.uleb128 0x8
	.byte	0
	.uleb128 0x9
	.ascii "_imp___iob\0"
	.byte	0x2
	.byte	0x5c
	.byte	0x10
	.long	0x27a
	.uleb128 0x3
	.byte	0x4
	.long	0x25c
	.uleb128 0x2
	.byte	0xc
	.byte	0x4
	.ascii "long double\0"
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.ascii "long long unsigned int\0"
	.uleb128 0xa
	.ascii "main\0"
	.byte	0x1
	.byte	0x4
	.byte	0x5
	.long	0x159
	.long	LFB13
	.long	LFE13-LFB13
	.uleb128 0x1
	.byte	0x9c
	.long	0x40a
	.uleb128 0xb
	.ascii "argc\0"
	.byte	0x1
	.byte	0x4
	.byte	0xe
	.long	0x159
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xb
	.ascii "argv\0"
	.byte	0x1
	.byte	0x4
	.byte	0x18
	.long	0x40a
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0xc
	.ascii "flag_temp\0"
	.byte	0x1
	.byte	0x6
	.byte	0x13
	.long	0x410
	.uleb128 0x3
	.byte	0x74
	.sleb128 1112
	.uleb128 0xc
	.ascii "flag\0"
	.byte	0x1
	.byte	0x7
	.byte	0x13
	.long	0x420
	.uleb128 0x3
	.byte	0x74
	.sleb128 88
	.uleb128 0xc
	.ascii "flag_sha256\0"
	.byte	0x1
	.byte	0x8
	.byte	0x13
	.long	0x431
	.uleb128 0x2
	.byte	0x74
	.sleb128 24
	.uleb128 0xc
	.ascii "flag_len\0"
	.byte	0x1
	.byte	0xb
	.byte	0x12
	.long	0x149
	.uleb128 0x3
	.byte	0x74
	.sleb128 1144
	.uleb128 0xd
	.ascii "flag_temp_len\0"
	.byte	0x1
	.byte	0xb
	.byte	0x1c
	.long	0x149
	.uleb128 0xd
	.ascii "i\0"
	.byte	0x1
	.byte	0xb
	.byte	0x2a
	.long	0x149
	.uleb128 0xe
	.ascii "memset\0"
	.byte	0x1
	.byte	0xd
	.byte	0x5
	.long	0x159
	.long	0x36c
	.uleb128 0xf
	.byte	0
	.uleb128 0xe
	.ascii "strlen\0"
	.byte	0x1
	.byte	0x12
	.byte	0x10
	.long	0x159
	.long	0x381
	.uleb128 0xf
	.byte	0
	.uleb128 0xe
	.ascii "system\0"
	.byte	0x1
	.byte	0x1a
	.byte	0x11
	.long	0x159
	.long	0x396
	.uleb128 0xf
	.byte	0
	.uleb128 0x10
	.long	LBB2
	.long	LBE2-LBB2
	.uleb128 0xe
	.ascii "strncpy\0"
	.byte	0x1
	.byte	0x1f
	.byte	0x9
	.long	0x159
	.long	0x3b5
	.uleb128 0xf
	.byte	0
	.uleb128 0x11
	.long	LBB3
	.long	LBE3-LBB3
	.long	0x3ec
	.uleb128 0xc
	.ascii "i\0"
	.byte	0x1
	.byte	0x15
	.byte	0x12
	.long	0x159
	.uleb128 0x3
	.byte	0x74
	.sleb128 1148
	.uleb128 0x10
	.long	LBB4
	.long	LBE4-LBB4
	.uleb128 0x12
	.ascii "system\0"
	.byte	0x1
	.byte	0x1a
	.byte	0x11
	.long	0x159
	.uleb128 0xf
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x10
	.long	LBB5
	.long	LBE5-LBB5
	.uleb128 0x12
	.ascii "strncmp\0"
	.byte	0x1
	.byte	0x22
	.byte	0x7
	.long	0x159
	.uleb128 0xf
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.long	0x193
	.uleb128 0x7
	.long	0x1ae
	.long	0x420
	.uleb128 0x13
	.long	0x149
	.byte	0x1f
	.byte	0
	.uleb128 0x7
	.long	0x1ae
	.long	0x431
	.uleb128 0x14
	.long	0x149
	.word	0x3ff
	.byte	0
	.uleb128 0x15
	.long	0x1ae
	.uleb128 0x13
	.long	0x149
	.byte	0x3f
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
	.uleb128 0xb
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x18
	.byte	0
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_strlen;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_system;	.scl	2;	.type	32;	.endef
	.def	_strncpy;	.scl	2;	.type	32;	.endef
	.def	_sha256;	.scl	2;	.type	32;	.endef
	.def	_strncmp;	.scl	2;	.type	32;	.endef
