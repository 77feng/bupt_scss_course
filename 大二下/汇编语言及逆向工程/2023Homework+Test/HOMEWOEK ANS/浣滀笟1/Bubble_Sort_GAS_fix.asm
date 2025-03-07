.arch i386
.intel_syntax noprefix

.data
.globl	_char_list
.globl	_char_list_len
.globl	_check_flag
.globl	_test_no


.data
_char_list_len:
	.byte	10
	.bss
	.align 4
_char_list:
	.space 11

.data
_check_flag:
	.byte	1
_test_no:
	.byte	1
	.section .rdata,"dr"
	.align 4


.data
hint_test_no:
	.ascii "\12-----------------------------test-%d\12\0"
hint_given_array:
	.ascii "The given array:  %s\12\0"
hint_sorted_array:
	.ascii "The sorted array: %s\12\0"

hint_test_error_bar:
	.ascii "\12--!--!--!--!--!--!--!--!--!--test-%d\12\12\0"
hint_test_error:
	.ascii "Sorry but try it again!\12\0"
	.align 4
hint_test_success_bar:
	.ascii "\12--*--*--*--*--*--*--*--*--*--passed!\12\12\0"
hint_test_success:
	.ascii "Well done!\12\0"

.text
.extern _printf
.extern _puts
.extern _time    # C标准库函数：获取系统时间；可以用于设定随机数种子
.extern _srand   # C标准库函数：用于设定随机数种子
.extern _rand    # C标准库函数：生成随机数

.globl	gen_random_list
.globl	do_swap
.globl	do_bubble_sort
.globl	check_sort
.globl	_main

#Function-1# 根据时间种子，随机生成由大小写英文字母构成的字符数组
gen_random_list:
	push	ebp
	mov	ebp, esp
	sub	esp, 12

	mov	BYTE PTR [ebp-1], 0
in_gen_random_list_loop:
	movzx	eax, BYTE PTR _char_list_len
	cmp	BYTE PTR [ebp-1], al
	jnb	end_gen_random_list

	mov	DWORD PTR [esp], 0
	call	_time
	mov	edx, eax
	movzx	eax, BYTE PTR [ebp-1]
	add	edx, eax
	movzx	eax, BYTE PTR _test_no
	movzx	eax, al
	add	eax, edx
	mov	DWORD PTR [esp], eax
	call	_srand

	call	_rand
	and	eax, 1
	test	eax, eax
	setne	al
	test	al, al
	je	in_gen_lower_letter

	call	_rand
	mov	ecx, eax
	mov	edx, 0x4EC4EC4F
	mov	eax, ecx
	imul	edx
	sar	edx, 3
	mov	eax, ecx
	sar	eax, 31  # 算数右移指令；其中，与逻辑右移shr 补 0 不同，sar 补位时，最高位保持不变
	sub	edx, eax
	mov	eax, edx
	imul	eax, eax, 26  # 有符号乘法指令，eax * 26 --所得乘积放入--> eax
	sub	ecx, eax
	mov	eax, ecx
	mov	edx, eax
	movzx	eax, BYTE PTR [ebp-1]
	add	edx, 65
	mov	BYTE PTR _char_list[eax], dl

	jmp	in_gen_upper_letter

in_gen_lower_letter:
	call	_rand
	mov	ecx, eax
	mov	edx, 0x4EC4EC4F
	mov	eax, ecx
	imul	edx
	sar	edx, 3   # 算数右移指令；其中，与逻辑右移shr 补 0 不同，sar 补位时，最高位保持不变
	mov	eax, ecx
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
	imul	eax, eax, 26
	sub	ecx, eax
	mov	eax, ecx
	mov	edx, eax
	movzx	eax, BYTE PTR [ebp-1]
	add	edx, 97
	mov	BYTE PTR _char_list[eax], dl

in_gen_upper_letter:
	movzx	eax, BYTE PTR [ebp-1]
	add	eax, 1
	mov	BYTE PTR [ebp-1], al
	jmp	in_gen_random_list_loop

end_gen_random_list:
	movzx	eax, BYTE PTR _char_list_len
	movzx	eax, al
	mov	BYTE PTR _char_list[eax], 0  # 字符数组末尾置零，方便按字符串进行一次性整体打印

	movzx	eax, BYTE PTR _test_no
	movzx	eax, al

	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:hint_test_no
	call	_printf

	mov	DWORD PTR [esp+4], OFFSET FLAT:_char_list
	mov	DWORD PTR [esp], OFFSET FLAT:hint_given_array
	call	_printf

	leave
	ret

#Function-2# 实现交换两个指针各自指向的数据内容
do_swap:                          #*# 问题-2：请理解已给定的do_swap汇编函数功能，写出等价的 C 语言函数代码
                                  #          提示需注意数据类型，如长度、有无符号等                      
	push	ebp
	mov	ebp, esp
	sub	esp, 4             #初始化四字节大的栈的空间

	mov	eax, DWORD PTR [ebp+8]         #把ebp+8的四个字节（怀疑为内容地址）内容暂存于eax寄存器
	movzx	eax, BYTE PTR [eax]              #以eax寄存器内容为地址查找8位长度内容（怀疑为一个英文字母），按无符号拓展放入eax
	mov	BYTE PTR [ebp-1], al               #把查找到的8位数据放入ebp-1的位置

	mov	eax, DWORD PTR [ebp+12]    #把ebp+12位置的四个字节（也怀疑为内容地址）暂存于eax寄存器
	movzx	edx, BYTE PTR [eax]          #把eax寄存器内容为地址的8位长度数据按无符号拓展放入edx
	mov	eax, DWORD PTR [ebp+8]         #把位置ebp+8的四个字节内容暂存于eax中
	mov	BYTE PTR [eax], dl             #把edx寄存器中低八位的数据存与位置为eax的内存中

	mov	eax, DWORD PTR [ebp+12]        #把ebp+12位置的四个字节暂存于eax中
	movzx	edx, BYTE PTR [ebp-1]           #把位置为ebp-1位置的8位数据按照无符号拓展放入edx中
	mov	BYTE PTR [eax], dl                 #把edx中低八位数据放入位置为eax的内存中
        
        #mov	DWORD PTR [esp+4], OFFSET FLAT:_char_list
        #mov	DWORD PTR [esp], OFFSET FLAT:hint_sorted_array
        #call	_printf
        
        
	leave
	ret

#Function-3# 对排序结果得正确性进行检查
check_sort:
	push	ebp
	mov	ebp, esp
	sub	esp, 12

	mov	DWORD PTR [esp+4], OFFSET FLAT:_char_list
	mov	DWORD PTR [esp], OFFSET FLAT:hint_sorted_array
	call	_printf

	mov	BYTE PTR [ebp-1], 0

in_check_loop:
	movzx	eax, BYTE PTR [ebp-1]
	movzx	edx, BYTE PTR _char_list_len
	movzx	edx, dl
	sub	edx, 1
	cmp	eax, edx
	jge	end_check_sort

	movzx	eax, BYTE PTR [ebp-1]
	movzx	edx, BYTE PTR _char_list[eax]
	movzx	eax, BYTE PTR [ebp-1]
	add	eax, 1
	movzx	eax, BYTE PTR _char_list[eax]
	cmp	dl, al
	jbe	in_error_check

	movzx	eax, BYTE PTR [ebp-1]
	movzx	eax, BYTE PTR _char_list[eax]
	cmp	al, 96
	jbe	in_error_marked

	movzx	eax, BYTE PTR [ebp-1]
	add	eax, 1
	movzx	eax, BYTE PTR _char_list[eax]
	cmp	al, 90
	jbe	continue_in_check_loop

in_error_marked:
	mov	BYTE PTR _check_flag, 0
	jmp	end_check_sort

in_error_check:
	movzx	eax, BYTE PTR [ebp-1]
	movzx	eax, BYTE PTR _char_list[eax]
	cmp	al, 90
	ja	continue_in_check_loop

	movzx	eax, BYTE PTR [ebp-1]
	add	eax, 1
	movzx	eax, BYTE PTR _char_list[eax]
	cmp	al, 96
	jbe	continue_in_check_loop

	mov	BYTE PTR _check_flag, 0
	jmp	end_check_sort

continue_in_check_loop:
	movzx	eax, BYTE PTR [ebp-1]
	add	eax, 1
	mov	BYTE PTR [ebp-1], al
	jmp	in_check_loop

end_check_sort:
	leave
	ret

#Function-4# 冒泡排序函数
do_bubble_sort:                          #*# 问题-3：请用汇编语言实现冒泡排序函数；
                                         #          提示会调用到已给定的do_swap汇编函数
	push	ebp
	mov	ebp, esp
	sub	esp, 16

### ------------------------------------冒泡排序正文----------------------------------------开始
        #以BYTE PTR [ebp-1]代替 BYTE PTR _bubble_out  BYTE PTR [ebp-2]代替 BYTE PTR _bubble_in BYTE PTR [ebp-3]代替 first_letter BYTE PTR [ebp-4]代替 second_letter
        mov       eax,0                         #初始化外循环
        mov       BYTE PTR [ebp-1],al
#外层循环
bubble_sort:
        
        movzx     eax,BYTE  PTR _char_list_len
        sub       eax,1
        movzx     ebx,BYTE PTR [ebp-1]
        cmp       ebx,eax                     #ebx即i
        ja        end_bubble_sort
        #movzx     eax, BYTE PTR _char_list[ebx]
        #test      al,al
        #jz        end_bubble_sort
        add       ebx,1                         
        mov       BYTE PTR [ebp-1], bl
        #初始化内循环
        mov       ecx,0 
        mov       BYTE PTR [ebp-2], cl                        #ecx为j
        jmp       inner_sort
        
inner_sort:
        #mov	DWORD PTR [esp+4], OFFSET FLAT:_char_list
       # mov	DWORD PTR [esp], OFFSET FLAT:hint_given_array
       # call	_printf
        mov       ebx,0
        mov       BYTE PTR [ebp-3],bl
        mov       BYTE PTR [ebp-4],bl
        movzx     eax,BYTE  PTR _char_list_len
        movzx     ebx,BYTE PTR [ebp-1]
        sub       eax,ebx
        sub       eax,1
        movzx     ecx,BYTE PTR [ebp-2]
        cmp       ecx,eax
        ja        bubble_sort
        add       ecx,1
        mov       BYTE PTR [ebp-2], cl
        sub       ecx,1
                                                #放地址
                                                
        add       esp,8                         #栈顶向下8，方便之后压入地址
        lea       eax,BYTE  PTR _char_list[ecx]
        push      eax
        add       ecx,1
        lea       eax,BYTE  PTR _char_list[ecx]
        push      eax
        sub       ecx,1
                                                #小写放前面
first:        
        movzx     eax,BYTE  PTR _char_list[ecx]
        cmp       eax,97                        #第一个字母要是大于97将是小写字母
        jl        first_letter
        jmp       second
second:
        add       ecx,1
        movzx     edx,BYTE  PTR _char_list[ecx]
        cmp       edx,97
        jl        second_letter
        jmp       compare1
compare1:
        test      dl,dl
        jz        bubble_sort
        cmp       dl,al
        ja        jmp_swap_1                    #后比前大,大写部分前小于后会判断进来
        jmp       compare2
                                                #比较askii码大小
compare2:
        sub       ecx,1
        movzx     eax,BYTE  PTR _char_list[ecx]
        add       ecx,1
        movzx     edx,BYTE  PTR _char_list[ecx]
        test      dl,dl
        jz        bubble_sort
        cmp       al, dl
        jg        jmp_swap                     #前大于后
        jmp       inner_sort
first_letter:
        mov       ebx,1
        mov       BYTE PTR [ebp-3],bl
        jmp       second
second_letter:
        mov      ebx,1
        mov      BYTE PTR [ebp-4],bl
        jmp      compare1
jmp_swap:    
            movzx    ebx,BYTE PTR [ebp-4]          
            movzx    ecx,BYTE PTR [ebp-3]
            cmp    ecx,ebx
            je     jmp_swap_real
            
            jmp    inner_sort 
jmp_swap_1:
#后大于前
#第一个大写，第二个小写就换
            movzx    ebx,BYTE PTR [ebp-4]      #第二个大写直接就去compare2
            cmp    ebx,0
            ja     compare2
            movzx   ebx,BYTE PTR [ebp-3]
            sub    bl,BYTE PTR [ebp-4]
            jnz    jmp_swap_real
            jmp    inner_sort 
jmp_swap_real:
            call     do_swap 
            jmp    inner_sort           
        
        
### ------------------------------------冒泡排序正文----------------------------------------结束

end_bubble_sort:

	leave
	ret

#Function-5# 主函数 main
_main:
    mov %ebp, %esp #for correct debugging
	push	ebp
	mov	ebp, esp
	sub	esp, 8             #开空间大小为8字节的堆栈

test_loop:
	movzx	eax, BYTE PTR _test_no
	cmp	al, 100      # 对排序函数进行测试的总次数；提示：调试时可以将这里改小一点，如改为 2
	ja end_test_loop  # 通过判断两个无符号数之间的大小关系，如果 CF & ZF = 0，说明大于，则转移          #这里即测试次数大于100次就结束循环

	call	gen_random_list
	call	do_bubble_sort                                                                    #分别调用生成随机序列
	call	check_sort                                                                        #、冒泡排序、检查是否排序正确三个函数

	movzx	eax, BYTE PTR _check_flag  #*# 问题-1.1：请结合程序上下文逻辑，分析当所实现的“排序算法”
                                      #            不能正确排序时，_check_flag 为零还是非零？                               
	test	al, al               #逻辑与，把_check_flag 以8位的Byte形式附到al，此处即 _check_flag自己相与
	jne	continue_test         #ZF=0跳转即jump not equal 

	movzx	eax, BYTE PTR _test_no
	movzx	eax, al
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:hint_test_error_bar
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:hint_test_error
	call	_puts
	jmp	end_test_loop

continue_test:
	movzx	eax, BYTE PTR _test_no
	add	eax, 1
	mov	BYTE PTR _test_no, al
	jmp	test_loop

end_test_loop:
	movzx	eax, BYTE PTR _check_flag
	test	al, al                    
	je	_end_main               #如果_check_flag为0就直接跳转

	mov	DWORD PTR [esp], OFFSET FLAT:hint_test_success_bar
	call	_printf

	mov	DWORD PTR [esp], OFFSET FLAT:hint_test_success
	call	_puts

_end_main:                            #*# 问题-1.2： 请分析 main函数的执行流程，画出其伪代码流程图
                                      #             提示可参考 https://zhuanlan.zhihu.com/p/350239377          
	mov	eax, 0

	leave
	ret
