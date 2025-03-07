# -*- coding: utf-8 -*-
import sys
import time
from hashlib import sha256
from itertools import permutations, product, combinations
from string import digits, ascii_lowercase, ascii_uppercase, punctuation, whitespace

import numpy as np
from tqdm import trange
# from tqdm.gui import trange, tqdm

flag_found = False

def decipher_sha256(sha256_value: str, plaintext_len: int = 4,
                    plaintext_letter_dict: str = ascii_lowercase + punctuation, dup: bool = False,
                    gui_cprint: bool = False):
    sha256_value = sha256_value.lower()
    if len(sha256_value) != 64:
        if not gui_cprint:
            print('\n不是有效的sha256散列!')
        else:
            sg.cprint('\n不是有效的sha256散列!')
        return None

    try:
        if dup:  # 全排列，可重复
            plaintext_set = [''.join(p) for p in product(plaintext_letter_dict, repeat=plaintext_len)]
        else:  # 全排列，不可重复
            plaintext_set = [''.join(p) for p in permutations(plaintext_letter_dict, plaintext_len)]

        for i in trange(len(plaintext_set)):
            item = plaintext_set[i]
            # if not gui_cprint:
            #     print(item, sha256(item.encode()).hexdigest())
            # else:
            #     sg.cprint(item, sha256(item.encode()).hexdigest())


            if sha256(item.encode()).hexdigest() == sha256_value:
                if not gui_cprint:
                    print('\n=*=*=*= 已成功解出明文: ' + sha256_value + ' ==> ' + item)
                else:
                    sg.cprint('\n=*=*=*= 已成功解出明文: ' + sha256_value + ' ==> ' + item)
                return item

    finally:
        if sha256(plaintext_set[i].encode()).hexdigest() != sha256_value:
            if not gui_cprint:
                print('\n[使用的密码字典集合为: {}, 指定的明文长度为: {}]'.format(plaintext_letter_dict, plaintext_len) +
                      '\n该次解析尝试失败: 可以尝试修改上述密码字典集合，并检查是否正确设定了明文长度!!!')
            else:
                sg.cprint(
                        '\n[使用的密码字典集合为: {}, 指定的明文长度为: {}]'.format(plaintext_letter_dict, plaintext_len) +
                        '\n该次解析尝试失败: 可以尝试修改上述密码字典集合，并检查是否正确设定了明文长度!!!')
            return 'n-' + 'o' * plaintext_len

def parallel_decipher_sha256(sha256_value: str, dict_num: int =2, plaintext_len: int = 5, dup: bool = False,
                             gui_cprint: bool = False):  # 并行处理
    st = time.time()   # 开始时间

    from multiprocessing import Pool
    pool = Pool()  # use all available cores, otherwise specify the number you want as an argument

    def is_result_ok(result):  # 定义回调函数，帮助在解密成功时，终止其它未尽进程
        global flag_found
        if result != 'n-' + 'o' * plaintext_len:
            flag_found = True
            if not gui_cprint:
                print('\n=*=*=*= 已成功解出明文: ' + sha256_value + ' ==> ' + result)
            else:
                sg.cprint('\n=*=*=*= 已成功解出明文: ' + sha256_value + ' ==> ' + result)

            pool.terminate()

    def combine(dict_list, n):
        num_meta_dict = len(dict_list)
        temp_dict_list = []
        for c in combinations(np.arange(num_meta_dict), n):
            temp_dict = ''
            for i in c:
                temp_dict += dict_list[i]
            temp_dict_list.append(temp_dict)
        return temp_dict_list

    meta_dicts = [digits, ascii_lowercase, ascii_uppercase, punctuation, whitespace]

    for letter_dict in combine(meta_dicts, dict_num):
        pool.apply_async(decipher_sha256, args=(sha256_value, plaintext_len, letter_dict, dup), callback=is_result_ok)

    pool.close()
    pool.join()

    if not flag_found:
        if not gui_cprint:
            print('\n[解析失败, 请检查密文\'{}\'以及所指定的明文长度\'{}\'是否都正确?!]'.format(sha256_value, plaintext_len))
        else:
            sg.cprint('\n[解析失败, 请检查密文\'{}\'以及所指定的明文长度\'{}\'是否都正确?!]'.format(sha256_value,
                                                                                                plaintext_len))
    if not gui_cprint:
        print('\n总计耗时: {}秒\n'.format(time.time() - st))
    else:
        sg.cprint('\n总计耗时: {}秒\n'.format(time.time() - st))

if __name__ == '__main__':
    # decipher_sha256(sha256_value='aa2948a013b0291090bc9b124125e9829634496bb409b8eb1ec4e28738d764d0',
    #                 plaintext_letter_dict=punctuation, dup=True)

    decipher_sha256(sha256_value='382e766581df7c496ef87244f943dedcd74d6b6aab8af8789df88a6a22d170eb',
                    plaintext_letter_dict=ascii_uppercase + ascii_lowercase, dup=True)

    # parallel_decipher_sha256(sha256_value='0e1d17538b3f91497aa913b2c2dfe5fef11cee90cac805ce02128402f10d3552',
    #                          dict_num=2, plaintext_len=4, dup=True, gui_cprint=False)
