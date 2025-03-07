	.file	"_firstRe.c"
	.intel_syntax noprefix
	.text
Ltext0:
	.globl	_check
	.data
	.align 32
_check:
	.ascii "GMBH.?|H11eH11eTuvez-EbzEbzVq\"~\0"
	.text
	.globl	_readInput
	.def	_readInput;	.scl	2;	.type	32;	.endef
_readInput:
LFB17:
	.file 1 "O:/BUPT-SCSS/Courses_and_research/ASM_and_Reverse_Engineering/Programs/C_C++/4_hello_reverse/_firstRe/_firstRe.c"
	.loc 1 8 35
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 24
	.loc 1 11 9
	mov	DWORD PTR [ebp-12], 0
	.loc 1 11 2
	jmp	L2
L5:
	.loc 1 12 8
	call	_getchar
	.loc 1 12 6
	mov	BYTE PTR [ebp-13], al
	.loc 1 13 6
	cmp	BYTE PTR [ebp-13], 10
	je	L7
	.loc 1 15 6 discriminator 2
	mov	edx, DWORD PTR [ebp-12]
	mov	eax, DWORD PTR [ebp+8]
	add	edx, eax
	.loc 1 15 10 discriminator 2
	mov	al, BYTE PTR [ebp-13]
	mov	BYTE PTR [edx], al
	.loc 1 11 22 discriminator 2
	inc	DWORD PTR [ebp-12]
L2:
	.loc 1 11 2 discriminator 1
	mov	eax, DWORD PTR [ebp-12]
	cmp	eax, DWORD PTR [ebp+12]
	jl	L5
	jmp	L4
L7:
	.loc 1 14 4
	nop
L4:
	.loc 1 17 5
	mov	edx, DWORD PTR [ebp-12]
	mov	eax, DWORD PTR [ebp+8]
	add	eax, edx
	.loc 1 17 9
	mov	BYTE PTR [eax], 0
	.loc 1 18 9
	mov	eax, DWORD PTR [ebp-12]
	.loc 1 19 1
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.globl	_checkflag
	.def	_checkflag;	.scl	2;	.type	32;	.endef
_checkflag:
LFB18:
	.loc 1 21 26
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 40
	.loc 1 22 11
	mov	DWORD PTR [esp], OFFSET FLAT:_check
	call	_strlen
	.loc 1 22 9
	mov	DWORD PTR [ebp-16], eax
	.loc 1 23 6
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [esp], eax
	call	_strlen
	mov	edx, eax
	.loc 1 23 18
	mov	eax, DWORD PTR [ebp-16]
	.loc 1 23 5
	cmp	edx, eax
	je	L9
	.loc 1 24 10
	mov	eax, 0
	jmp	L8
L9:
	.loc 1 25 9
	mov	DWORD PTR [ebp-12], 0
	.loc 1 25 2
	jmp	L11
L13:
	.loc 1 26 10
	mov	edx, DWORD PTR [ebp-12]
	mov	eax, DWORD PTR [ebp+8]
	add	eax, edx
	mov	al, BYTE PTR [eax]
	movsx	eax, al
	.loc 1 26 14
	lea	edx, [eax+1]
	.loc 1 26 26
	mov	eax, DWORD PTR [ebp-12]
	add	eax, OFFSET FLAT:_check
	mov	al, BYTE PTR [eax]
	movsx	eax, al
	.loc 1 26 6
	cmp	edx, eax
	je	L12
	.loc 1 27 11
	mov	eax, 0
	jmp	L8
L12:
	.loc 1 25 20 discriminator 2
	inc	DWORD PTR [ebp-12]
L11:
	.loc 1 25 2 discriminator 1
	mov	eax, DWORD PTR [ebp-12]
	cmp	eax, DWORD PTR [ebp-16]
	jl	L13
	.loc 1 29 5
	mov	eax, DWORD PTR [ebp-12]
	cmp	eax, DWORD PTR [ebp-16]
	jne	L14
	.loc 1 30 10
	mov	eax, 1
	jmp	L8
L14:
L8:
	.loc 1 31 1
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "Please give me your input:  \0"
	.align 4
LC1:
	.ascii "\12Good job! You have successfully captured the FLAG!!!\12\0"
	.align 4
LC2:
	.ascii "\12Sorry! You might need to try it again!!!\12\0"
LC3:
	.ascii "pause\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB19:
	.loc 1 47 12
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	and	esp, -16
	sub	esp, 80
	.loc 1 47 12
	call	___main
LVL0:
	.loc 1 51 2
	mov	DWORD PTR [esp], OFFSET FLAT:LC0
	call	_printf
	.loc 1 52 2
	mov	DWORD PTR [esp+4], 50
	lea	eax, [esp+30]
	mov	DWORD PTR [esp], eax
	call	_readInput
	.loc 1 53 6
	lea	eax, [esp+30]
	mov	DWORD PTR [esp], eax
	call	_checkflag
	.loc 1 53 5
	test	eax, eax
	je	L16
	.loc 1 54 3
	mov	DWORD PTR [esp], OFFSET FLAT:LC1
	call	_puts
	jmp	L17
L16:
	.loc 1 57 3
	mov	DWORD PTR [esp], OFFSET FLAT:LC2
	call	_puts
L17:
	.loc 1 59 2
	mov	DWORD PTR [esp], OFFSET FLAT:LC3
	call	_system
	.loc 1 60 9
	mov	eax, 0
	.loc 1 61 1
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
Letext0:
	.file 2 "C:/Program Files (x86)/CodeBlocks/MinGW/i686-w64-mingw32/include/stdio.h"
	.file 3 "C:/Program Files (x86)/CodeBlocks/MinGW/i686-w64-mingw32/include/crtdefs.h"
	.file 4 "C:/Program Files (x86)/CodeBlocks/MinGW/i686-w64-mingw32/include/stdlib.h"
	.file 5 "C:/Program Files (x86)/CodeBlocks/MinGW/i686-w64-mingw32/include/malloc.h"
	.section	.debug_info,"dr"
Ldebug_info0:
	.long	0x585
	.word	0x4
	.secrel32	Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.ascii "GNU C17 8.1.0 -march=i386 -m32 -masm=intel -g -fPIC -finput-charset=UTF-8 -fexec-charset=UTF-8 -fno-stack-protector\0"
	.byte	0xc
	.ascii "O:\\BUPT-SCSS\\Courses_and_research\\ASM_and_Reverse_Engineering\\Programs\\C_C++\\4_hello_reverse\\_firstRe\\_firstRe.c\0"
	.ascii "O:\\\\BUPT-SCSS\\\\Courses_and_research\\\\ASM_and_Reverse_Engineering\\\\Programs\\\\C_C++\\\\4_hello_reverse\\\\_firstRe\0"
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
	.long	0x19a
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
	.long	0x16b
	.uleb128 0x4
	.byte	0x4
	.long	0x18a
	.uleb128 0x4
	.byte	0x4
	.long	0x183
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
	.long	0x295
	.uleb128 0x6
	.ascii "_ptr\0"
	.byte	0x2
	.byte	0x1b
	.byte	0xb
	.long	0x1cd
	.byte	0
	.uleb128 0x6
	.ascii "_cnt\0"
	.byte	0x2
	.byte	0x1c
	.byte	0x9
	.long	0x183
	.byte	0x4
	.uleb128 0x6
	.ascii "_base\0"
	.byte	0x2
	.byte	0x1d
	.byte	0xb
	.long	0x1cd
	.byte	0x8
	.uleb128 0x6
	.ascii "_flag\0"
	.byte	0x2
	.byte	0x1e
	.byte	0x9
	.long	0x183
	.byte	0xc
	.uleb128 0x6
	.ascii "_file\0"
	.byte	0x2
	.byte	0x1f
	.byte	0x9
	.long	0x183
	.byte	0x10
	.uleb128 0x6
	.ascii "_charbuf\0"
	.byte	0x2
	.byte	0x20
	.byte	0x9
	.long	0x183
	.byte	0x14
	.uleb128 0x6
	.ascii "_bufsiz\0"
	.byte	0x2
	.byte	0x21
	.byte	0x9
	.long	0x183
	.byte	0x18
	.uleb128 0x6
	.ascii "_tmpfname\0"
	.byte	0x2
	.byte	0x22
	.byte	0xb
	.long	0x1cd
	.byte	0x1c
	.byte	0
	.uleb128 0x3
	.ascii "FILE\0"
	.byte	0x2
	.byte	0x24
	.byte	0x19
	.long	0x205
	.uleb128 0x7
	.long	0x295
	.long	0x2ad
	.uleb128 0x8
	.byte	0
	.uleb128 0x9
	.ascii "_imp___iob\0"
	.byte	0x2
	.byte	0x5c
	.byte	0x10
	.long	0x2c0
	.uleb128 0x4
	.byte	0x4
	.long	0x2a2
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
	.long	0x1d9
	.uleb128 0x7
	.long	0x1cd
	.long	0x313
	.uleb128 0xa
	.long	0x173
	.byte	0
	.byte	0
	.uleb128 0x9
	.ascii "_sys_errlist\0"
	.byte	0x4
	.byte	0xac
	.byte	0x2b
	.long	0x303
	.uleb128 0x9
	.ascii "_sys_nerr\0"
	.byte	0x4
	.byte	0xad
	.byte	0x29
	.long	0x183
	.uleb128 0xb
	.ascii "_imp____argc\0"
	.byte	0x4
	.word	0x119
	.byte	0x10
	.long	0x1d9
	.uleb128 0xb
	.ascii "_imp____argv\0"
	.byte	0x4
	.word	0x11d
	.byte	0x13
	.long	0x366
	.uleb128 0x4
	.byte	0x4
	.long	0x36c
	.uleb128 0x4
	.byte	0x4
	.long	0x1cd
	.uleb128 0xb
	.ascii "_imp____wargv\0"
	.byte	0x4
	.word	0x121
	.byte	0x16
	.long	0x389
	.uleb128 0x4
	.byte	0x4
	.long	0x38f
	.uleb128 0x4
	.byte	0x4
	.long	0x1d3
	.uleb128 0xb
	.ascii "_imp___environ\0"
	.byte	0x4
	.word	0x127
	.byte	0x13
	.long	0x366
	.uleb128 0xb
	.ascii "_imp___wenviron\0"
	.byte	0x4
	.word	0x12c
	.byte	0x16
	.long	0x389
	.uleb128 0xb
	.ascii "_imp___pgmptr\0"
	.byte	0x4
	.word	0x132
	.byte	0x12
	.long	0x36c
	.uleb128 0xb
	.ascii "_imp___wpgmptr\0"
	.byte	0x4
	.word	0x137
	.byte	0x15
	.long	0x38f
	.uleb128 0xb
	.ascii "_imp___osplatform\0"
	.byte	0x4
	.word	0x13c
	.byte	0x19
	.long	0x410
	.uleb128 0x4
	.byte	0x4
	.long	0x173
	.uleb128 0xb
	.ascii "_imp___osver\0"
	.byte	0x4
	.word	0x141
	.byte	0x19
	.long	0x410
	.uleb128 0xb
	.ascii "_imp___winver\0"
	.byte	0x4
	.word	0x146
	.byte	0x19
	.long	0x410
	.uleb128 0xb
	.ascii "_imp___winmajor\0"
	.byte	0x4
	.word	0x14b
	.byte	0x19
	.long	0x410
	.uleb128 0xb
	.ascii "_imp___winminor\0"
	.byte	0x4
	.word	0x150
	.byte	0x19
	.long	0x410
	.uleb128 0x9
	.ascii "_amblksiz\0"
	.byte	0x5
	.byte	0x35
	.byte	0x17
	.long	0x173
	.uleb128 0x7
	.long	0x16b
	.long	0x497
	.uleb128 0xa
	.long	0x173
	.byte	0x1f
	.byte	0
	.uleb128 0xc
	.ascii "check\0"
	.byte	0x1
	.byte	0x6
	.byte	0x6
	.long	0x487
	.uleb128 0x5
	.byte	0x3
	.long	_check
	.uleb128 0xd
	.ascii "main\0"
	.byte	0x1
	.byte	0x2f
	.byte	0x5
	.long	0x183
	.long	LFB19
	.long	LFE19-LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0x4d8
	.uleb128 0xe
	.ascii "input\0"
	.byte	0x1
	.byte	0x32
	.byte	0x7
	.long	0x4d8
	.uleb128 0x2
	.byte	0x74
	.sleb128 30
	.byte	0
	.uleb128 0x7
	.long	0x16b
	.long	0x4e8
	.uleb128 0xa
	.long	0x173
	.byte	0x31
	.byte	0
	.uleb128 0xf
	.ascii "checkflag\0"
	.byte	0x1
	.byte	0x15
	.byte	0x5
	.long	0x183
	.long	LFB18
	.long	LFE18-LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0x532
	.uleb128 0x10
	.ascii "buf\0"
	.byte	0x1
	.byte	0x15
	.byte	0x15
	.long	0x1cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xe
	.ascii "i\0"
	.byte	0x1
	.byte	0x16
	.byte	0x6
	.long	0x183
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xe
	.ascii "j\0"
	.byte	0x1
	.byte	0x16
	.byte	0x9
	.long	0x183
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x11
	.ascii "readInput\0"
	.byte	0x1
	.byte	0x8
	.byte	0x5
	.long	0x183
	.long	LFB17
	.long	LFE17-LFB17
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x10
	.ascii "buf\0"
	.byte	0x1
	.byte	0x8
	.byte	0x15
	.long	0x1cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x10
	.ascii "len\0"
	.byte	0x1
	.byte	0x8
	.byte	0x1e
	.long	0x183
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0xe
	.ascii "ch\0"
	.byte	0x1
	.byte	0x9
	.byte	0x7
	.long	0x16b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0xe
	.ascii "i\0"
	.byte	0x1
	.byte	0xa
	.byte	0x6
	.long	0x183
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
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
	.uleb128 0x10
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
	.def	_getchar;	.scl	2;	.type	32;	.endef
	.def	_strlen;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_system;	.scl	2;	.type	32;	.endef
