# -*- coding: utf-8 -*-

to_check = "GMBH|Xfmd1nf`u1`uif`xpsme`pg`Sfwfstf~"
flag = ''

for each_char in to_check:
    flag += chr(ord(each_char) - 1)  # 可参考Python的标准库：https://docs.python.org/zh-cn/3.9/library/index.html
    
print("\nGiven \"%s\", \nwe get the following flag: \"%s\"\n" %(to_check, flag))
