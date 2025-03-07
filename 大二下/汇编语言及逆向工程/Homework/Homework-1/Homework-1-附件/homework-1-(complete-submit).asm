.arch i386
.intel_syntax noprefix

.data
str_hint_input:
	.asciz "Enter a string (up to 10 letters) in the input dialog window. \n\n"
str_format_input:
	.asciz "%s"
str_hint_output:
	.asciz "Transformed string:\n\n%s"

str_hint_error_letter:
	.asciz "The string contains invalid characters.\n"
str_hint_error_length:
	.asciz "The string is too long. \n"

.text
	.globl	_main

_main:
    mov %ebp, %esp #for correct debugging
	push	ebp    # 开辟函数栈空间 （栈帧）
	mov	ebp, esp    # 将栈顶位置对齐到栈底
	and	esp, -16
	sub	esp, 48

	mov	DWORD PTR [esp], OFFSET str_hint_input #{*1}
	call	_printf   # 打印输入字符串提示语

	lea	eax, [esp+25]
	mov	DWORD PTR [esp+4], eax #{*2}
	mov	DWORD PTR [esp], OFFSET str_format_input
	call	_scanf    # 输入字符串: 需提前在"输入"窗口填入要测试的字符串, 非运行时填入

	lea	eax, [esp+25]
	mov	DWORD PTR [esp], eax
	call	_strlen   # 进行字符串长度计算

	cmp	eax,  10   # {*3} 检查字符串是否超过 10 
	ja	hit_error_length        # ja 为无符号大于跳转汇编指令

	mov	DWORD PTR [esp+44], 1      # 该变量用于记录是否遇到非法字符，初始值置1
	mov	DWORD PTR [esp+40], 0      # 该变量用于记录当前处理的字符在字符串中的位置，初始值置0
	jmp	label_test_whether_end_of_string

label_test_char:     # 检测当前字符是否为英文字母
	lea	edx, [esp+25]  # 字符串的起始地址
	mov	eax, DWORD PTR [esp+40]  # 当前字符相对字符串起始地址的偏移量
	add	eax, edx
	mov	al, BYTE PTR [eax]  # 取出当前字符

	movsx	eax, al
	mov	DWORD PTR [esp], eax
	mov	eax, DWORD PTR __imp__isalpha   
	call	eax    # 以当前字符为参数，调用isalpha函数判断是否为英文字母

	test	eax, eax
	jne	label_test_nxt_char     # 是合法字符，跳转至label_test_nxt_char

	mov	DWORD PTR [esp+44], 0

	jmp	label_test_end_or_invalid     # 是非法字符，[esp+44]置0，跳转至label_test_end_or_invalid

label_test_nxt_char:
	inc	DWORD PTR [esp+40]     # {*4} 指针向后移动一位，指向下一个要检测的字符

label_test_whether_end_of_string:     # 当前字符的下一个位置是不是\0
	lea	edx, [esp+25]
	mov	eax, DWORD PTR [esp+40]
	add	eax, edx
	mov	al, BYTE PTR [eax]

       test	al, al   # {*5}
	jne	label_test_char     # 下一个字符不是\0，跳转至label_test_char

label_test_end_or_invalid:
	cmp	DWORD PTR [esp+44], 0  # 检查一下[esp+44]的值判断是否含有非法字符
	je	label_print_error_message  # 存在非法字符，跳转至label_print_error_message输出错误信息

	mov	DWORD PTR [esp+36], 0  # 新的变量指示当前字符在字符串中的位置，初始值置0，准备重新遍历字符串

	jmp	label_modify_char  # 输入的字符串合法，跳转至label_modify_char

label_modify_lower_or_upper:    # label_modify_lower_or_upper
	lea	edx, [esp+25]
	mov	eax, DWORD PTR [esp+36]
	add	eax, edx
	mov	al, BYTE PTR [eax]

	movsx	eax, al
	mov	DWORD PTR [esp], eax
	mov	eax, DWORD PTR __imp__islower
	call	eax  # 以当前字符为参数，调用islower函数判断是否为小写字母

	test	eax, eax
	je	label_modify_upper_to_lower  # 是大写字母，跳转至label_modify_upper_to_lower

        # 小写字母转大写
	lea	edx, [esp+25]
	mov	eax, DWORD PTR [esp+36]
	add	eax, edx
	mov	al, BYTE PTR [eax]

	movsx	eax, al
	mov	DWORD PTR [esp], eax
	mov	eax, DWORD PTR __imp__toupper
	call	eax  # 以当前字符为参数，调用toupper函数转换为大写字母

	mov	dl, al
	lea	ecx, [esp+25]
	mov	eax, DWORD PTR [esp+36]
	add	eax, ecx
	mov	BYTE PTR [eax], dl  # 将转换后的大写字母放入新构建的字符串的对应位置
	jmp	label_modify_nxt_char

label_modify_upper_to_lower:  # 大写字母转小写 (*** 请完成这段功能代码)
	# 提示: 可如下调用 __imp__tolower 函数
	# mov	eax, DWORD PTR __imp__tolower
	# call	eax  # 以当前字符为参数，调用tolower函数转换为小写字母

	lea	edx, [esp+25]
	mov	eax, DWORD PTR [esp+36]
	add	eax, edx
	mov	al, BYTE PTR [eax]

	movsx	eax, al
	mov	DWORD PTR [esp], eax
	mov	eax, DWORD PTR __imp__tolower
	call	eax  # 以当前字符为参数，调用tolower函数转换为小写字母

	mov	dl, al
	lea	ecx, [esp+25]
	mov	eax, DWORD PTR [esp+36]
	add	eax, ecx
	mov	BYTE PTR [eax], dl  # 将转换后的小写字母放入新构建的字符串的对应位置
	jmp	label_modify_nxt_char

label_modify_nxt_char:
	inc	DWORD PTR [esp+36]  # 指针向后移动一位，指向下一个要转换的字符

label_modify_char:
	lea	edx, [esp+25]  # 构建的新字符串的起始地址
	mov	eax, DWORD PTR [esp+36]  # 当前处理的字符相对起始地址的偏移量
	add	eax, edx
	mov	al, BYTE PTR [eax]

	test	al, al  # 下一个字符不是\0，跳转至label_modify_lower_or_upper
	jne	label_modify_lower_or_upper

        # 将构建的新字符串（起始地址[esp+25]）和输出提示信息作为参数调用printf函数进行打印
	lea	eax, [esp+25]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET str_hint_output
	call	_printf
	jmp	label_end_of_program

label_print_error_message:
	mov	DWORD PTR [esp], OFFSET str_hint_error_letter
	call	_puts
	jmp	label_end_of_program

hit_error_length:
	mov	DWORD PTR [esp], OFFSET str_hint_error_length
	call	_puts

label_end_of_program:
	mov	eax, 0

	leave
	ret
