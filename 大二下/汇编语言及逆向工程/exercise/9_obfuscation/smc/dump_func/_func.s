	.file	"_func.cpp"
	.intel_syntax noprefix
	.text
Ltext0:
	.globl	__Z9temp_funcPc
	.def	__Z9temp_funcPc;	.scl	2;	.type	32;	.endef
__Z9temp_funcPc:
LFB46:
	.file 1 "O:/BUPT-SCSS/Courses_and_research/ASM_and_Reverse_Engineering/Programs/C_C++/9_obfuscation/smc/dump_func/_func.cpp"
	.loc 1 4 26
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	.loc 1 5 14
	mov	eax, DWORD PTR [ebp+8]
	mov	al, BYTE PTR [eax]
	.loc 1 5 5
	cmp	al, 115
	je	L2
	.loc 1 6 16
	mov	eax, 1
	jmp	L3
L2:
	.loc 1 7 20
	mov	eax, DWORD PTR [ebp+8]
	inc	eax
	mov	al, BYTE PTR [eax]
	.loc 1 7 10
	cmp	al, 109
	je	L4
	.loc 1 8 16
	mov	eax, 1
	jmp	L3
L4:
	.loc 1 9 20
	mov	eax, DWORD PTR [ebp+8]
	add	eax, 2
	mov	al, BYTE PTR [eax]
	.loc 1 9 10
	cmp	al, 105
	je	L5
	.loc 1 10 16
	mov	eax, 1
	jmp	L3
L5:
	.loc 1 11 20
	mov	eax, DWORD PTR [ebp+8]
	add	eax, 3
	mov	al, BYTE PTR [eax]
	.loc 1 11 10
	cmp	al, 108
	je	L6
	.loc 1 12 16
	mov	eax, 1
	jmp	L3
L6:
	.loc 1 13 20
	mov	eax, DWORD PTR [ebp+8]
	add	eax, 4
	mov	al, BYTE PTR [eax]
	.loc 1 13 10
	cmp	al, 101
	je	L7
	.loc 1 14 16
	mov	eax, 1
	jmp	L3
L7:
	.loc 1 16 16
	mov	eax, 0
L3:
	.loc 1 17 1
	pop	ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE46:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "anchor-1\0"
LC1:
	.ascii "anchor-2\0"
LC2:
	.ascii "Please try again...\12\0"
LC3:
	.ascii "Congratulations!\12\0"
LC4:
	.ascii "pause\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB47:
	.loc 1 19 12
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	and	esp, -16
	sub	esp, 32
	.loc 1 19 12
	call	___main
LVL0:
	.loc 1 21 10
	mov	DWORD PTR [esp+22], 1818848627
	mov	WORD PTR [esp+26], 101
	.loc 1 23 11
	mov	DWORD PTR [esp], OFFSET FLAT:LC0
	call	_puts
	.loc 1 24 23
	lea	eax, [esp+22]
	mov	DWORD PTR [esp], eax
	call	__Z9temp_funcPc
	mov	DWORD PTR [esp+28], eax
	.loc 1 25 11
	mov	DWORD PTR [esp], OFFSET FLAT:LC1
	call	_puts
	.loc 1 28 5
	cmp	DWORD PTR [esp+28], 0
	je	L9
	.loc 1 29 13
	mov	DWORD PTR [esp], OFFSET FLAT:LC2
	call	_puts
	jmp	L10
L9:
	.loc 1 31 13
	mov	DWORD PTR [esp], OFFSET FLAT:LC3
	call	_puts
L10:
	.loc 1 33 11
	mov	DWORD PTR [esp], OFFSET FLAT:LC4
	call	_system
	.loc 1 34 12
	mov	eax, 0
	.loc 1 35 1
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE47:
Letext0:
	.file 2 "C:/Program Files (x86)/CodeBlocks/MinGW/i686-w64-mingw32/include/stdio.h"
	.file 3 "C:/Program Files (x86)/CodeBlocks/MinGW/i686-w64-mingw32/include/crtdefs.h"
	.file 4 "C:/Program Files (x86)/CodeBlocks/MinGW/lib/gcc/i686-w64-mingw32/8.1.0/include/c++/cstdlib"
	.file 5 "C:/Program Files (x86)/CodeBlocks/MinGW/lib/gcc/i686-w64-mingw32/8.1.0/include/c++/bits/std_abs.h"
	.file 6 "C:/Program Files (x86)/CodeBlocks/MinGW/lib/gcc/i686-w64-mingw32/8.1.0/include/c++/i686-w64-mingw32/bits/c++config.h"
	.file 7 "C:/Program Files (x86)/CodeBlocks/MinGW/i686-w64-mingw32/include/stdlib.h"
	.file 8 "C:/Program Files (x86)/CodeBlocks/MinGW/i686-w64-mingw32/include/malloc.h"
	.file 9 "C:/Program Files (x86)/CodeBlocks/MinGW/lib/gcc/i686-w64-mingw32/8.1.0/include/c++/stdlib.h"
	.file 10 "<built-in>"
	.section	.debug_info,"dr"
Ldebug_info0:
	.long	0xce4
	.word	0x4
	.secrel32	Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.ascii "GNU C++14 8.1.0 -march=i386 -m32 -masm=intel -g -finput-charset=UTF-8 -fexec-charset=GBK -fno-stack-protector\0"
	.byte	0x4
	.ascii "O:\\BUPT-SCSS\\Courses_and_research\\ASM_and_Reverse_Engineering\\Programs\\C_C++\\9_obfuscation\\smc\\dump_func\\_func.cpp\0"
	.ascii "O:\\\\BUPT-SCSS\\\\Courses_and_research\\\\ASM_and_Reverse_Engineering\\\\Programs\\\\C_C++\\\\9_obfuscation\\\\smc\\\\dump_func\0"
	.long	Ltext0
	.long	Letext0-Ltext0
	.secrel32	Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.ascii "char\0"
	.uleb128 0x3
	.long	0x16b
	.uleb128 0x4
	.ascii "size_t\0"
	.byte	0x3
	.byte	0x25
	.byte	0x16
	.long	0x187
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
	.uleb128 0x5
	.byte	0x4
	.long	0x16b
	.uleb128 0x5
	.byte	0x4
	.long	0x1dd
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.ascii "wchar_t\0"
	.uleb128 0x3
	.long	0x1dd
	.uleb128 0x5
	.byte	0x4
	.long	0x197
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
	.long	0x2a9
	.uleb128 0x7
	.ascii "_ptr\0"
	.byte	0x2
	.byte	0x1b
	.byte	0xb
	.long	0x1d1
	.byte	0
	.uleb128 0x7
	.ascii "_cnt\0"
	.byte	0x2
	.byte	0x1c
	.byte	0x9
	.long	0x197
	.byte	0x4
	.uleb128 0x7
	.ascii "_base\0"
	.byte	0x2
	.byte	0x1d
	.byte	0xb
	.long	0x1d1
	.byte	0x8
	.uleb128 0x7
	.ascii "_flag\0"
	.byte	0x2
	.byte	0x1e
	.byte	0x9
	.long	0x197
	.byte	0xc
	.uleb128 0x7
	.ascii "_file\0"
	.byte	0x2
	.byte	0x1f
	.byte	0x9
	.long	0x197
	.byte	0x10
	.uleb128 0x7
	.ascii "_charbuf\0"
	.byte	0x2
	.byte	0x20
	.byte	0x9
	.long	0x197
	.byte	0x14
	.uleb128 0x7
	.ascii "_bufsiz\0"
	.byte	0x2
	.byte	0x21
	.byte	0x9
	.long	0x197
	.byte	0x18
	.uleb128 0x7
	.ascii "_tmpfname\0"
	.byte	0x2
	.byte	0x22
	.byte	0xb
	.long	0x1d1
	.byte	0x1c
	.byte	0
	.uleb128 0x4
	.ascii "FILE\0"
	.byte	0x2
	.byte	0x24
	.byte	0x19
	.long	0x219
	.uleb128 0x8
	.long	0x2a9
	.long	0x2c1
	.uleb128 0x9
	.byte	0
	.uleb128 0xa
	.ascii "_imp___iob\0"
	.byte	0x2
	.byte	0x5c
	.byte	0x10
	.long	0x2d4
	.uleb128 0x5
	.byte	0x4
	.long	0x2b6
	.uleb128 0xb
	.ascii "std\0"
	.byte	0xa
	.byte	0
	.long	0x4ce
	.uleb128 0xc
	.ascii "__cxx11\0"
	.byte	0x6
	.word	0x104
	.byte	0x41
	.uleb128 0xd
	.byte	0x6
	.word	0x104
	.byte	0x41
	.long	0x2e5
	.uleb128 0xe
	.byte	0x4
	.byte	0x7f
	.byte	0xb
	.long	0x588
	.uleb128 0xe
	.byte	0x4
	.byte	0x80
	.byte	0xb
	.long	0x5c3
	.uleb128 0xe
	.byte	0x4
	.byte	0x86
	.byte	0xb
	.long	0x7e2
	.uleb128 0xe
	.byte	0x4
	.byte	0x8c
	.byte	0xb
	.long	0x7fc
	.uleb128 0xe
	.byte	0x4
	.byte	0x8d
	.byte	0xb
	.long	0x81a
	.uleb128 0xe
	.byte	0x4
	.byte	0x8e
	.byte	0xb
	.long	0x832
	.uleb128 0xe
	.byte	0x4
	.byte	0x8f
	.byte	0xb
	.long	0x84a
	.uleb128 0xe
	.byte	0x4
	.byte	0x91
	.byte	0xb
	.long	0x89c
	.uleb128 0xe
	.byte	0x4
	.byte	0x94
	.byte	0xb
	.long	0x8b8
	.uleb128 0xe
	.byte	0x4
	.byte	0x96
	.byte	0xb
	.long	0x8d2
	.uleb128 0xe
	.byte	0x4
	.byte	0x99
	.byte	0xb
	.long	0x8ef
	.uleb128 0xe
	.byte	0x4
	.byte	0x9a
	.byte	0xb
	.long	0x90d
	.uleb128 0xe
	.byte	0x4
	.byte	0x9b
	.byte	0xb
	.long	0x933
	.uleb128 0xe
	.byte	0x4
	.byte	0x9d
	.byte	0xb
	.long	0x957
	.uleb128 0xe
	.byte	0x4
	.byte	0xa3
	.byte	0xb
	.long	0x97b
	.uleb128 0xe
	.byte	0x4
	.byte	0xa5
	.byte	0xb
	.long	0x989
	.uleb128 0xe
	.byte	0x4
	.byte	0xa6
	.byte	0xb
	.long	0x99e
	.uleb128 0xe
	.byte	0x4
	.byte	0xa7
	.byte	0xb
	.long	0x9bd
	.uleb128 0xe
	.byte	0x4
	.byte	0xa8
	.byte	0xb
	.long	0x9e1
	.uleb128 0xe
	.byte	0x4
	.byte	0xa9
	.byte	0xb
	.long	0xa06
	.uleb128 0xe
	.byte	0x4
	.byte	0xab
	.byte	0xb
	.long	0xa20
	.uleb128 0xe
	.byte	0x4
	.byte	0xac
	.byte	0xb
	.long	0xa46
	.uleb128 0xe
	.byte	0x4
	.byte	0xf0
	.byte	0x16
	.long	0x7bf
	.uleb128 0xe
	.byte	0x4
	.byte	0xf5
	.byte	0x16
	.long	0x52f
	.uleb128 0xe
	.byte	0x4
	.byte	0xf6
	.byte	0x16
	.long	0xa65
	.uleb128 0xe
	.byte	0x4
	.byte	0xf8
	.byte	0x16
	.long	0xa83
	.uleb128 0xe
	.byte	0x4
	.byte	0xf9
	.byte	0x16
	.long	0xb01
	.uleb128 0xe
	.byte	0x4
	.byte	0xfa
	.byte	0x16
	.long	0xa9c
	.uleb128 0xe
	.byte	0x4
	.byte	0xfb
	.byte	0x16
	.long	0xac1
	.uleb128 0xe
	.byte	0x4
	.byte	0xfc
	.byte	0x16
	.long	0xb20
	.uleb128 0xf
	.ascii "abs\0"
	.byte	0x5
	.byte	0x66
	.byte	0x3
	.ascii "_ZSt3absg\0"
	.long	0xb77
	.long	0x40b
	.uleb128 0x10
	.long	0xb77
	.byte	0
	.uleb128 0xf
	.ascii "abs\0"
	.byte	0x5
	.byte	0x4e
	.byte	0x3
	.ascii "_ZSt3abse\0"
	.long	0x5e5
	.long	0x42b
	.uleb128 0x10
	.long	0x5e5
	.byte	0
	.uleb128 0xf
	.ascii "abs\0"
	.byte	0x5
	.byte	0x4a
	.byte	0x3
	.ascii "_ZSt3absf\0"
	.long	0x5dc
	.long	0x44b
	.uleb128 0x10
	.long	0x5dc
	.byte	0
	.uleb128 0xf
	.ascii "abs\0"
	.byte	0x5
	.byte	0x46
	.byte	0x3
	.ascii "_ZSt3absd\0"
	.long	0x5d2
	.long	0x46b
	.uleb128 0x10
	.long	0x5d2
	.byte	0
	.uleb128 0xf
	.ascii "abs\0"
	.byte	0x5
	.byte	0x3d
	.byte	0x3
	.ascii "_ZSt3absx\0"
	.long	0x1c0
	.long	0x48b
	.uleb128 0x10
	.long	0x1c0
	.byte	0
	.uleb128 0xf
	.ascii "abs\0"
	.byte	0x5
	.byte	0x38
	.byte	0x3
	.ascii "_ZSt3absl\0"
	.long	0x1b4
	.long	0x4ab
	.uleb128 0x10
	.long	0x1b4
	.byte	0
	.uleb128 0x11
	.ascii "div\0"
	.byte	0x4
	.byte	0xb1
	.byte	0x3
	.ascii "_ZSt3divll\0"
	.long	0x5c3
	.uleb128 0x10
	.long	0x1b4
	.uleb128 0x10
	.long	0x1b4
	.byte	0
	.byte	0
	.uleb128 0x12
	.ascii "__gnu_cxx\0"
	.byte	0x6
	.word	0x106
	.byte	0xb
	.long	0x55c
	.uleb128 0xc
	.ascii "__cxx11\0"
	.byte	0x6
	.word	0x108
	.byte	0x41
	.uleb128 0xd
	.byte	0x6
	.word	0x108
	.byte	0x41
	.long	0x4e1
	.uleb128 0xe
	.byte	0x4
	.byte	0xc8
	.byte	0xb
	.long	0x7bf
	.uleb128 0xe
	.byte	0x4
	.byte	0xd8
	.byte	0xb
	.long	0xa65
	.uleb128 0xe
	.byte	0x4
	.byte	0xe3
	.byte	0xb
	.long	0xa83
	.uleb128 0xe
	.byte	0x4
	.byte	0xe4
	.byte	0xb
	.long	0xa9c
	.uleb128 0xe
	.byte	0x4
	.byte	0xe5
	.byte	0xb
	.long	0xac1
	.uleb128 0xe
	.byte	0x4
	.byte	0xe7
	.byte	0xb
	.long	0xb01
	.uleb128 0xe
	.byte	0x4
	.byte	0xe8
	.byte	0xb
	.long	0xb20
	.uleb128 0x11
	.ascii "div\0"
	.byte	0x4
	.byte	0xd5
	.byte	0x3
	.ascii "_ZN9__gnu_cxx3divExx\0"
	.long	0x7bf
	.uleb128 0x10
	.long	0x1c0
	.uleb128 0x10
	.long	0x1c0
	.byte	0
	.byte	0
	.uleb128 0x6
	.ascii "_div_t\0"
	.byte	0x8
	.byte	0x7
	.byte	0x3b
	.byte	0x12
	.long	0x588
	.uleb128 0x7
	.ascii "quot\0"
	.byte	0x7
	.byte	0x3c
	.byte	0x9
	.long	0x197
	.byte	0
	.uleb128 0x7
	.ascii "rem\0"
	.byte	0x7
	.byte	0x3d
	.byte	0x9
	.long	0x197
	.byte	0x4
	.byte	0
	.uleb128 0x4
	.ascii "div_t\0"
	.byte	0x7
	.byte	0x3e
	.byte	0x5
	.long	0x55c
	.uleb128 0x6
	.ascii "_ldiv_t\0"
	.byte	0x8
	.byte	0x7
	.byte	0x40
	.byte	0x12
	.long	0x5c3
	.uleb128 0x7
	.ascii "quot\0"
	.byte	0x7
	.byte	0x41
	.byte	0xa
	.long	0x1b4
	.byte	0
	.uleb128 0x7
	.ascii "rem\0"
	.byte	0x7
	.byte	0x42
	.byte	0xa
	.long	0x1b4
	.byte	0x4
	.byte	0
	.uleb128 0x4
	.ascii "ldiv_t\0"
	.byte	0x7
	.byte	0x43
	.byte	0x5
	.long	0x596
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
	.byte	0x7
	.byte	0x73
	.byte	0x10
	.long	0x1ed
	.uleb128 0x5
	.byte	0x4
	.long	0x615
	.uleb128 0x13
	.uleb128 0x5
	.byte	0x4
	.long	0x1e8
	.uleb128 0x8
	.long	0x1d1
	.long	0x62c
	.uleb128 0x14
	.long	0x187
	.byte	0
	.byte	0
	.uleb128 0xa
	.ascii "_sys_errlist\0"
	.byte	0x7
	.byte	0xac
	.byte	0x2b
	.long	0x61c
	.uleb128 0xa
	.ascii "_sys_nerr\0"
	.byte	0x7
	.byte	0xad
	.byte	0x29
	.long	0x197
	.uleb128 0x15
	.ascii "_imp____argc\0"
	.byte	0x7
	.word	0x119
	.byte	0x10
	.long	0x1ed
	.uleb128 0x15
	.ascii "_imp____argv\0"
	.byte	0x7
	.word	0x11d
	.byte	0x13
	.long	0x67f
	.uleb128 0x5
	.byte	0x4
	.long	0x685
	.uleb128 0x5
	.byte	0x4
	.long	0x1d1
	.uleb128 0x15
	.ascii "_imp____wargv\0"
	.byte	0x7
	.word	0x121
	.byte	0x16
	.long	0x6a2
	.uleb128 0x5
	.byte	0x4
	.long	0x6a8
	.uleb128 0x5
	.byte	0x4
	.long	0x1d7
	.uleb128 0x15
	.ascii "_imp___environ\0"
	.byte	0x7
	.word	0x127
	.byte	0x13
	.long	0x67f
	.uleb128 0x15
	.ascii "_imp___wenviron\0"
	.byte	0x7
	.word	0x12c
	.byte	0x16
	.long	0x6a2
	.uleb128 0x15
	.ascii "_imp___pgmptr\0"
	.byte	0x7
	.word	0x132
	.byte	0x12
	.long	0x685
	.uleb128 0x15
	.ascii "_imp___wpgmptr\0"
	.byte	0x7
	.word	0x137
	.byte	0x15
	.long	0x6a8
	.uleb128 0x15
	.ascii "_imp___osplatform\0"
	.byte	0x7
	.word	0x13c
	.byte	0x19
	.long	0x729
	.uleb128 0x5
	.byte	0x4
	.long	0x187
	.uleb128 0x15
	.ascii "_imp___osver\0"
	.byte	0x7
	.word	0x141
	.byte	0x19
	.long	0x729
	.uleb128 0x15
	.ascii "_imp___winver\0"
	.byte	0x7
	.word	0x146
	.byte	0x19
	.long	0x729
	.uleb128 0x15
	.ascii "_imp___winmajor\0"
	.byte	0x7
	.word	0x14b
	.byte	0x19
	.long	0x729
	.uleb128 0x15
	.ascii "_imp___winminor\0"
	.byte	0x7
	.word	0x150
	.byte	0x19
	.long	0x729
	.uleb128 0x16
	.byte	0x10
	.byte	0x7
	.word	0x2bb
	.byte	0x12
	.ascii "7lldiv_t\0"
	.long	0x7bf
	.uleb128 0x17
	.ascii "quot\0"
	.byte	0x7
	.word	0x2bb
	.byte	0x2c
	.long	0x1c0
	.byte	0
	.uleb128 0x17
	.ascii "rem\0"
	.byte	0x7
	.word	0x2bb
	.byte	0x32
	.long	0x1c0
	.byte	0x8
	.byte	0
	.uleb128 0x18
	.ascii "lldiv_t\0"
	.byte	0x7
	.word	0x2bb
	.byte	0x39
	.long	0x78e
	.uleb128 0xa
	.ascii "_amblksiz\0"
	.byte	0x8
	.byte	0x35
	.byte	0x17
	.long	0x187
	.uleb128 0x19
	.ascii "atexit\0"
	.byte	0x7
	.word	0x18a
	.byte	0x22
	.long	0x197
	.long	0x7fc
	.uleb128 0x10
	.long	0x60f
	.byte	0
	.uleb128 0x19
	.ascii "atof\0"
	.byte	0x7
	.word	0x18d
	.byte	0x25
	.long	0x5d2
	.long	0x814
	.uleb128 0x10
	.long	0x814
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.long	0x173
	.uleb128 0x19
	.ascii "atoi\0"
	.byte	0x7
	.word	0x190
	.byte	0x22
	.long	0x197
	.long	0x832
	.uleb128 0x10
	.long	0x814
	.byte	0
	.uleb128 0x19
	.ascii "atol\0"
	.byte	0x7
	.word	0x192
	.byte	0x23
	.long	0x1b4
	.long	0x84a
	.uleb128 0x10
	.long	0x814
	.byte	0
	.uleb128 0x19
	.ascii "bsearch\0"
	.byte	0x7
	.word	0x196
	.byte	0x24
	.long	0x879
	.long	0x879
	.uleb128 0x10
	.long	0x87b
	.uleb128 0x10
	.long	0x87b
	.uleb128 0x10
	.long	0x178
	.uleb128 0x10
	.long	0x178
	.uleb128 0x10
	.long	0x882
	.byte	0
	.uleb128 0x1a
	.byte	0x4
	.uleb128 0x5
	.byte	0x4
	.long	0x881
	.uleb128 0x1b
	.uleb128 0x5
	.byte	0x4
	.long	0x888
	.uleb128 0x1c
	.long	0x197
	.long	0x89c
	.uleb128 0x10
	.long	0x87b
	.uleb128 0x10
	.long	0x87b
	.byte	0
	.uleb128 0x19
	.ascii "div\0"
	.byte	0x7
	.word	0x19c
	.byte	0x24
	.long	0x588
	.long	0x8b8
	.uleb128 0x10
	.long	0x197
	.uleb128 0x10
	.long	0x197
	.byte	0
	.uleb128 0x19
	.ascii "getenv\0"
	.byte	0x7
	.word	0x19d
	.byte	0x24
	.long	0x1d1
	.long	0x8d2
	.uleb128 0x10
	.long	0x814
	.byte	0
	.uleb128 0x19
	.ascii "ldiv\0"
	.byte	0x7
	.word	0x1a7
	.byte	0x25
	.long	0x5c3
	.long	0x8ef
	.uleb128 0x10
	.long	0x1b4
	.uleb128 0x10
	.long	0x1b4
	.byte	0
	.uleb128 0x19
	.ascii "mblen\0"
	.byte	0x7
	.word	0x1a9
	.byte	0x22
	.long	0x197
	.long	0x90d
	.uleb128 0x10
	.long	0x814
	.uleb128 0x10
	.long	0x178
	.byte	0
	.uleb128 0x19
	.ascii "mbstowcs\0"
	.byte	0x7
	.word	0x1b1
	.byte	0x25
	.long	0x178
	.long	0x933
	.uleb128 0x10
	.long	0x1d7
	.uleb128 0x10
	.long	0x814
	.uleb128 0x10
	.long	0x178
	.byte	0
	.uleb128 0x19
	.ascii "mbtowc\0"
	.byte	0x7
	.word	0x1af
	.byte	0x22
	.long	0x197
	.long	0x957
	.uleb128 0x10
	.long	0x1d7
	.uleb128 0x10
	.long	0x814
	.uleb128 0x10
	.long	0x178
	.byte	0
	.uleb128 0x1d
	.ascii "qsort\0"
	.byte	0x7
	.word	0x197
	.byte	0x23
	.long	0x97b
	.uleb128 0x10
	.long	0x879
	.uleb128 0x10
	.long	0x178
	.uleb128 0x10
	.long	0x178
	.uleb128 0x10
	.long	0x882
	.byte	0
	.uleb128 0x1e
	.ascii "rand\0"
	.byte	0x7
	.word	0x1b4
	.byte	0x22
	.long	0x197
	.uleb128 0x1d
	.ascii "srand\0"
	.byte	0x7
	.word	0x1b6
	.byte	0x23
	.long	0x99e
	.uleb128 0x10
	.long	0x187
	.byte	0
	.uleb128 0x1f
	.ascii "strtod\0"
	.byte	0x7
	.word	0x1c2
	.byte	0x41
	.long	0x5d2
	.long	0x9bd
	.uleb128 0x10
	.long	0x814
	.uleb128 0x10
	.long	0x685
	.byte	0
	.uleb128 0x19
	.ascii "strtol\0"
	.byte	0x7
	.word	0x1e5
	.byte	0x23
	.long	0x1b4
	.long	0x9e1
	.uleb128 0x10
	.long	0x814
	.uleb128 0x10
	.long	0x685
	.uleb128 0x10
	.long	0x197
	.byte	0
	.uleb128 0x19
	.ascii "strtoul\0"
	.byte	0x7
	.word	0x1e7
	.byte	0x2c
	.long	0x1f3
	.long	0xa06
	.uleb128 0x10
	.long	0x814
	.uleb128 0x10
	.long	0x685
	.uleb128 0x10
	.long	0x197
	.byte	0
	.uleb128 0x19
	.ascii "system\0"
	.byte	0x7
	.word	0x1eb
	.byte	0x22
	.long	0x197
	.long	0xa20
	.uleb128 0x10
	.long	0x814
	.byte	0
	.uleb128 0x19
	.ascii "wcstombs\0"
	.byte	0x7
	.word	0x1f0
	.byte	0x25
	.long	0x178
	.long	0xa46
	.uleb128 0x10
	.long	0x1d1
	.uleb128 0x10
	.long	0x616
	.uleb128 0x10
	.long	0x178
	.byte	0
	.uleb128 0x19
	.ascii "wctomb\0"
	.byte	0x7
	.word	0x1ee
	.byte	0x22
	.long	0x197
	.long	0xa65
	.uleb128 0x10
	.long	0x1d1
	.uleb128 0x10
	.long	0x1dd
	.byte	0
	.uleb128 0x19
	.ascii "lldiv\0"
	.byte	0x7
	.word	0x2bd
	.byte	0x34
	.long	0x7bf
	.long	0xa83
	.uleb128 0x10
	.long	0x1c0
	.uleb128 0x10
	.long	0x1c0
	.byte	0
	.uleb128 0x19
	.ascii "atoll\0"
	.byte	0x7
	.word	0x2c8
	.byte	0x36
	.long	0x1c0
	.long	0xa9c
	.uleb128 0x10
	.long	0x814
	.byte	0
	.uleb128 0x19
	.ascii "strtoll\0"
	.byte	0x7
	.word	0x2c4
	.byte	0x36
	.long	0x1c0
	.long	0xac1
	.uleb128 0x10
	.long	0x814
	.uleb128 0x10
	.long	0x685
	.uleb128 0x10
	.long	0x197
	.byte	0
	.uleb128 0x19
	.ascii "strtoull\0"
	.byte	0x7
	.word	0x2c5
	.byte	0x3f
	.long	0xae7
	.long	0xae7
	.uleb128 0x10
	.long	0x814
	.uleb128 0x10
	.long	0x685
	.uleb128 0x10
	.long	0x197
	.byte	0
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.ascii "long long unsigned int\0"
	.uleb128 0x1f
	.ascii "strtof\0"
	.byte	0x7
	.word	0x1c9
	.byte	0x40
	.long	0x5dc
	.long	0xb20
	.uleb128 0x10
	.long	0x814
	.uleb128 0x10
	.long	0x685
	.byte	0
	.uleb128 0x19
	.ascii "strtold\0"
	.byte	0x7
	.word	0x1d4
	.byte	0x48
	.long	0x5e5
	.long	0xb40
	.uleb128 0x10
	.long	0x814
	.uleb128 0x10
	.long	0x685
	.byte	0
	.uleb128 0xe
	.byte	0x9
	.byte	0x27
	.byte	0xc
	.long	0x7e2
	.uleb128 0xe
	.byte	0x9
	.byte	0x33
	.byte	0xc
	.long	0x588
	.uleb128 0xe
	.byte	0x9
	.byte	0x34
	.byte	0xc
	.long	0x5c3
	.uleb128 0x19
	.ascii "abs\0"
	.byte	0x7
	.word	0x17f
	.byte	0x22
	.long	0x197
	.long	0xb6f
	.uleb128 0x10
	.long	0x197
	.byte	0
	.uleb128 0xe
	.byte	0x9
	.byte	0x36
	.byte	0xc
	.long	0xb58
	.uleb128 0x2
	.byte	0x10
	.byte	0x4
	.ascii "__float128\0"
	.uleb128 0xe
	.byte	0x9
	.byte	0x36
	.byte	0xc
	.long	0x3eb
	.uleb128 0xe
	.byte	0x9
	.byte	0x36
	.byte	0xc
	.long	0x40b
	.uleb128 0xe
	.byte	0x9
	.byte	0x36
	.byte	0xc
	.long	0x42b
	.uleb128 0xe
	.byte	0x9
	.byte	0x36
	.byte	0xc
	.long	0x44b
	.uleb128 0xe
	.byte	0x9
	.byte	0x36
	.byte	0xc
	.long	0x46b
	.uleb128 0xe
	.byte	0x9
	.byte	0x36
	.byte	0xc
	.long	0x48b
	.uleb128 0xe
	.byte	0x9
	.byte	0x37
	.byte	0xc
	.long	0x7fc
	.uleb128 0xe
	.byte	0x9
	.byte	0x38
	.byte	0xc
	.long	0x81a
	.uleb128 0xe
	.byte	0x9
	.byte	0x39
	.byte	0xc
	.long	0x832
	.uleb128 0xe
	.byte	0x9
	.byte	0x3a
	.byte	0xc
	.long	0x84a
	.uleb128 0xe
	.byte	0x9
	.byte	0x3c
	.byte	0xc
	.long	0x52f
	.uleb128 0xe
	.byte	0x9
	.byte	0x3c
	.byte	0xc
	.long	0x89c
	.uleb128 0xe
	.byte	0x9
	.byte	0x3c
	.byte	0xc
	.long	0x4ab
	.uleb128 0xe
	.byte	0x9
	.byte	0x3e
	.byte	0xc
	.long	0x8b8
	.uleb128 0xe
	.byte	0x9
	.byte	0x40
	.byte	0xc
	.long	0x8d2
	.uleb128 0xe
	.byte	0x9
	.byte	0x43
	.byte	0xc
	.long	0x8ef
	.uleb128 0xe
	.byte	0x9
	.byte	0x44
	.byte	0xc
	.long	0x90d
	.uleb128 0xe
	.byte	0x9
	.byte	0x45
	.byte	0xc
	.long	0x933
	.uleb128 0xe
	.byte	0x9
	.byte	0x47
	.byte	0xc
	.long	0x957
	.uleb128 0xe
	.byte	0x9
	.byte	0x48
	.byte	0xc
	.long	0x97b
	.uleb128 0xe
	.byte	0x9
	.byte	0x4a
	.byte	0xc
	.long	0x989
	.uleb128 0xe
	.byte	0x9
	.byte	0x4b
	.byte	0xc
	.long	0x99e
	.uleb128 0xe
	.byte	0x9
	.byte	0x4c
	.byte	0xc
	.long	0x9bd
	.uleb128 0xe
	.byte	0x9
	.byte	0x4d
	.byte	0xc
	.long	0x9e1
	.uleb128 0xe
	.byte	0x9
	.byte	0x4e
	.byte	0xc
	.long	0xa06
	.uleb128 0xe
	.byte	0x9
	.byte	0x50
	.byte	0xc
	.long	0xa20
	.uleb128 0xe
	.byte	0x9
	.byte	0x51
	.byte	0xc
	.long	0xa46
	.uleb128 0x20
	.ascii "main\0"
	.byte	0x1
	.byte	0x13
	.byte	0x5
	.long	0x197
	.long	LFB47
	.long	LFE47-LFB47
	.uleb128 0x1
	.byte	0x9c
	.long	0xc9b
	.uleb128 0x21
	.ascii "result\0"
	.byte	0x1
	.byte	0x14
	.byte	0x9
	.long	0x197
	.uleb128 0x2
	.byte	0x74
	.sleb128 28
	.uleb128 0x21
	.ascii "flag\0"
	.byte	0x1
	.byte	0x15
	.byte	0xa
	.long	0xc9b
	.uleb128 0x2
	.byte	0x74
	.sleb128 22
	.byte	0
	.uleb128 0x8
	.long	0x16b
	.long	0xcab
	.uleb128 0x14
	.long	0x187
	.byte	0x5
	.byte	0
	.uleb128 0x22
	.ascii "temp_func\0"
	.byte	0x1
	.byte	0x4
	.byte	0x5
	.ascii "_Z9temp_funcPc\0"
	.long	0x197
	.long	LFB46
	.long	LFE46-LFB46
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x23
	.ascii "flag\0"
	.byte	0x1
	.byte	0x4
	.byte	0x15
	.long	0x1d1
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
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
	.uleb128 0x39
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x39
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x89
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x3a
	.byte	0
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x18
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x8
	.byte	0
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x18
	.uleb128 0x13
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
	.uleb128 0x6e
	.uleb128 0x8
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x6e
	.uleb128 0x8
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x39
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x15
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x16
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0x8
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0xd
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
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x16
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
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
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
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
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
	.uleb128 0x21
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
	.uleb128 0x22
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
	.uleb128 0x6e
	.uleb128 0x8
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
	.uleb128 0x23
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
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_system;	.scl	2;	.type	32;	.endef
