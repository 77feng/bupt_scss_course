	.file	"_junk.cpp"
	.intel_syntax noprefix
	.text
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
	.align 4
LC0:
	.ascii "------ \346\232\221\345\201\207\345\210\260\344\272\206\357\274\214\347\234\237\345\274\200\345\277\203 ^_^ ------\12\0"
	.align 4
LC1:
	.ascii "------ \345\227\257......\350\200\203\350\257\225\344\271\237\345\277\253\345\210\260\344\272\206 ------\12\0"
LC2:
	.ascii "pause\0"
	.section	.text.startup,"x"
	.p2align 2,,3
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB56:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	and	esp, -16
	sub	esp, 16
	call	___main
	mov	DWORD PTR [esp], OFFSET FLAT:LC0
	call	_puts
/APP
 # 15 "O:\BUPT-SCSS\Courses_and_research\ASM_and_Reverse_Engineering\Programs\C_C++\9_obfuscation\junk_code_CALL\_junk.cpp" 1
	xor eax, eax;jz __label;.byte 0xE8;
 # 0 "" 2
 # 17 "O:\BUPT-SCSS\Courses_and_research\ASM_and_Reverse_Engineering\Programs\C_C++\9_obfuscation\junk_code_CALL\_junk.cpp" 1
	__label:
 # 0 "" 2
/NO_APP
	mov	DWORD PTR [esp], OFFSET FLAT:LC1
	call	_puts
	mov	DWORD PTR [esp], OFFSET FLAT:LC2
	call	_system
	xor	eax, eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE56:
	.ident	"GCC: (i686-posix-dwarf-rev0, Built by MinGW-W64 project) 8.1.0"
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_system;	.scl	2;	.type	32;	.endef
