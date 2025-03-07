# -*- coding: utf-8 -*-

token = b'\x2B'            #'abcdefg123'
ciphertext = b'\x33\x19\x11\x32\x0D\x27\x21\x11\x22\x10\x11\x27\x28\x3D\x36'

#result = ''.join(chr(ord(token[i]) ^ ciphertext[i]) for i in range(10))
result = ''.join( chr(token ^ ciphertext[i]) for i in range(16))

print("result is: %s\n" %(result))
