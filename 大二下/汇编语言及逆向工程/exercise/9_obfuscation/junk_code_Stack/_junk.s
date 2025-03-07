	.file	"_junk.cpp"
	.intel_syntax noprefix
	.text
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
	.align 4
LC0:
	.ascii "------ \312\356\274\331\265\275\301\313\243\254\325\346\277\252\320\304 ^_^ ------\12\0"
	.align 4
LC1:
	.ascii "------ \340\305......\277\274\312\324\322\262\277\354\265\275\301\313 ------\12\0"
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
 # 15 "O:\BUPT-SCSS\Courses_and_research\ASM_and_Reverse_Engineering\Programs\C_C++\9_obfuscation\junk_code_Stack\_junk.cpp" 1
	xor eax, eax;jz __label;add esp, 0x48;
 # 0 "" 2
 # 17 "O:\BUPT-SCSS\Courses_and_research\ASM_and_Reverse_Engineering\Programs\C_C++\9_obfuscation\junk_code_Stack\_junk.cpp" 1
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
