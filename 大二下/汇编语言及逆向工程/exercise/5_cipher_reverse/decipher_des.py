# -*- coding: utf-8 -*-
# DES 加解密示例程序

from Crypto.Cipher import DES

key = b'TakeEasy'
# IDA_ciphertext = b'\x42\xAC\x43\xD3\xF1\x44\xB1\x36'
IDA_ciphertext = b'\x28\x70\x77\x48\x7B\x4F\xFF\x3D'

des = DES.new(key, DES.MODE_ECB)

print('Decrypted: ', des.decrypt(IDA_ciphertext))
