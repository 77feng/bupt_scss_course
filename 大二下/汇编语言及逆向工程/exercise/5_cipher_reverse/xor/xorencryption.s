	.file	"xorencryption.c"
	.intel_syntax noprefix
	.text
Ltext0:
	.globl	_token
	.data
	.align 4
_token:
	.ascii "abcdefg123\0"
	.globl	_answer
	.align 4
_answer:
	.byte	40
	.byte	61
	.byte	36
	.byte	84
	.byte	10
	.byte	18
	.byte	56
	.byte	122
	.byte	87
	.byte	74
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "xor encryption program!\0"
LC1:
	.ascii "please input a string:\0"
LC2:
	.ascii "%s\0"
LC3:
	.ascii "wrong!\0"
LC4:
	.ascii "pause\0"
LC5:
	.ascii "wrong answer!!!!\0"
LC6:
	.ascii "good job!!!\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB14:
	.file 1 "O:/BUPT-SCSS/Courses/ASM_and_Reverse_Engineering/Programs/C_C++/5_cipher_reverse/xor/xorencryption.c"
	.loc 1 10 1
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	and	esp, -16
	sub	esp, 32
	.loc 1 10 1
	call	___main
LVL0:
	.loc 1 15 2
	mov	DWORD PTR [esp], OFFSET FLAT:LC0
	call	_puts
	.loc 1 16 2
	mov	DWORD PTR [esp], OFFSET FLAT:LC1
	call	_puts
	.loc 1 17 2
	lea	eax, [esp+17]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC2
	call	_scanf
	.loc 1 18 5
	lea	eax, [esp+17]
	mov	DWORD PTR [esp], eax
	call	_strlen
	.loc 1 18 4
	cmp	eax, 10
	je	L2
LBB2:
	.loc 1 19 3
	mov	DWORD PTR [esp], OFFSET FLAT:LC3
	call	_puts
	.loc 1 20 3
	call	_getchar
	.loc 1 21 6
	mov	DWORD PTR [esp], OFFSET FLAT:LC4
	call	_system
	.loc 1 22 10
	mov	eax, -1
	jmp	L11
L2:
LBE2:
	.loc 1 24 7
	mov	DWORD PTR [esp+28], 0
	.loc 1 24 2
	jmp	L4
L5:
	.loc 1 26 21 discriminator 3
	mov	eax, DWORD PTR [esp+28]
	add	eax, OFFSET FLAT:_token
	mov	al, BYTE PTR [eax]
	mov	cl, al
	.loc 1 26 33 discriminator 3
	lea	edx, [esp+17]
	mov	eax, DWORD PTR [esp+28]
	add	eax, edx
	mov	al, BYTE PTR [eax]
	.loc 1 26 24 discriminator 3
	xor	ecx, eax
	mov	dl, cl
	.loc 1 26 14 discriminator 3
	lea	ecx, [esp+17]
	mov	eax, DWORD PTR [esp+28]
	add	eax, ecx
	mov	BYTE PTR [eax], dl
	.loc 1 24 15 discriminator 3
	inc	DWORD PTR [esp+28]
L4:
	.loc 1 24 2 discriminator 1
	cmp	DWORD PTR [esp+28], 9
	jle	L5
	.loc 1 28 7
	mov	DWORD PTR [esp+28], 0
	.loc 1 28 2
	jmp	L6
L9:
	.loc 1 29 14
	lea	edx, [esp+17]
	mov	eax, DWORD PTR [esp+28]
	add	eax, edx
	mov	al, BYTE PTR [eax]
	movsx	edx, al
	.loc 1 29 25
	mov	eax, DWORD PTR [esp+28]
	add	eax, OFFSET FLAT:_answer
	mov	al, BYTE PTR [eax]
	movzx	eax, al
	.loc 1 29 5
	cmp	edx, eax
	je	L7
	.loc 1 31 4
	mov	DWORD PTR [esp], OFFSET FLAT:LC5
	call	_puts
	.loc 1 32 4
	jmp	L8
L7:
	.loc 1 28 15 discriminator 2
	inc	DWORD PTR [esp+28]
L6:
	.loc 1 28 2 discriminator 1
	cmp	DWORD PTR [esp+28], 9
	jle	L9
L8:
	.loc 1 35 4
	cmp	DWORD PTR [esp+28], 10
	jne	L10
	.loc 1 36 3
	mov	DWORD PTR [esp], OFFSET FLAT:LC6
	call	_puts
L10:
	.loc 1 37 2
	mov	DWORD PTR [esp], OFFSET FLAT:LC4
	call	_system
	.loc 1 38 9
	mov	eax, 0
L11:
	.loc 1 39 1 discriminator 1
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE14:
Letext0:
	.file 2 "C:/Program Files (x86)/codeblocks-20.03-32bit-mingw-32bit-nosetup/MinGW/i686-w64-mingw32/include/stdio.h"
	.section	.debug_info,"dr"
Ldebug_info0:
	.long	0x342
	.word	0x4
	.secrel32	Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.ascii "GNU C17 8.1.0 -march=i386 -m32 -masm=intel -g -finput-charset=UTF-8 -fexec-charset=GBK -fPIE -fno-builtin\0"
	.byte	0xc
	.ascii "O:\\BUPT-SCSS\\Courses\\ASM_and_Reverse_Engineering\\Programs\\C_C++\\5_cipher_reverse\\xor\\xorencryption.c\0"
	.ascii "O:\\\\BUPT-SCSS\\\\Courses\\\\ASM_and_Reverse_Engineering\\\\Programs\\\\C_C++\\\\5_cipher_reverse\\\\xor\0"
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
	.long	0x144
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
	.long	0x252
	.uleb128 0x5
	.ascii "_ptr\0"
	.byte	0x2
	.byte	0x1b
	.byte	0xb
	.long	0x196
	.byte	0
	.uleb128 0x5
	.ascii "_cnt\0"
	.byte	0x2
	.byte	0x1c
	.byte	0x9
	.long	0x15c
	.byte	0x4
	.uleb128 0x5
	.ascii "_base\0"
	.byte	0x2
	.byte	0x1d
	.byte	0xb
	.long	0x196
	.byte	0x8
	.uleb128 0x5
	.ascii "_flag\0"
	.byte	0x2
	.byte	0x1e
	.byte	0x9
	.long	0x15c
	.byte	0xc
	.uleb128 0x5
	.ascii "_file\0"
	.byte	0x2
	.byte	0x1f
	.byte	0x9
	.long	0x15c
	.byte	0x10
	.uleb128 0x5
	.ascii "_charbuf\0"
	.byte	0x2
	.byte	0x20
	.byte	0x9
	.long	0x15c
	.byte	0x14
	.uleb128 0x5
	.ascii "_bufsiz\0"
	.byte	0x2
	.byte	0x21
	.byte	0x9
	.long	0x15c
	.byte	0x18
	.uleb128 0x5
	.ascii "_tmpfname\0"
	.byte	0x2
	.byte	0x22
	.byte	0xb
	.long	0x196
	.byte	0x1c
	.byte	0
	.uleb128 0x6
	.ascii "FILE\0"
	.byte	0x2
	.byte	0x24
	.byte	0x19
	.long	0x1c2
	.uleb128 0x7
	.long	0x252
	.long	0x26a
	.uleb128 0x8
	.byte	0
	.uleb128 0x9
	.ascii "_imp___iob\0"
	.byte	0x2
	.byte	0x5c
	.byte	0x10
	.long	0x27d
	.uleb128 0x3
	.byte	0x4
	.long	0x25f
	.uleb128 0x7
	.long	0x1b1
	.long	0x293
	.uleb128 0xa
	.long	0x14c
	.byte	0xa
	.byte	0
	.uleb128 0xb
	.ascii "token\0"
	.byte	0x1
	.byte	0x6
	.byte	0xf
	.long	0x283
	.uleb128 0x5
	.byte	0x3
	.long	_token
	.uleb128 0x7
	.long	0x1b1
	.long	0x2b7
	.uleb128 0xa
	.long	0x14c
	.byte	0x9
	.byte	0
	.uleb128 0xb
	.ascii "answer\0"
	.byte	0x1
	.byte	0x7
	.byte	0xf
	.long	0x2a7
	.uleb128 0x5
	.byte	0x3
	.long	_answer
	.uleb128 0xc
	.ascii "main\0"
	.byte	0x1
	.byte	0x9
	.byte	0x5
	.long	0x15c
	.long	LFB14
	.long	LFE14-LFB14
	.uleb128 0x1
	.byte	0x9c
	.long	0x339
	.uleb128 0xd
	.ascii "key_temp\0"
	.byte	0x1
	.byte	0xc
	.byte	0x7
	.long	0x339
	.uleb128 0x2
	.byte	0x74
	.sleb128 17
	.uleb128 0xd
	.ascii "i\0"
	.byte	0x1
	.byte	0xd
	.byte	0x6
	.long	0x15c
	.uleb128 0x2
	.byte	0x74
	.sleb128 28
	.uleb128 0xe
	.ascii "system\0"
	.byte	0x1
	.byte	0x15
	.byte	0x6
	.long	0x15c
	.long	0x31d
	.uleb128 0xf
	.byte	0
	.uleb128 0x10
	.long	LBB2
	.long	LBE2-LBB2
	.uleb128 0x11
	.ascii "system\0"
	.byte	0x1
	.byte	0x15
	.byte	0x6
	.long	0x15c
	.uleb128 0xf
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x12
	.long	0x144
	.uleb128 0xa
	.long	0x14c
	.byte	0xa
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
	.def	_getchar;	.scl	2;	.type	32;	.endef
	.def	_system;	.scl	2;	.type	32;	.endef
