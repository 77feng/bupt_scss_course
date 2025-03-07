# -*- coding: utf-8 -*-
# 仿射加解密示例程序

key_a = 3
key_b = 7

inv_key_a = 9

ciphertext = 'qxbxpluxvwhuzjct'
print('\nThe given ciphertext is: \'{}\''.format(ciphertext))

len_ciphertest = len(ciphertext)

plaintext = ''
for i in range(len_ciphertest):
    temp=ord(ciphertext[i]) - ord('a')
    # temp=((temp - key_b + 26) * inv_key_a) % 26
    temp=(temp * inv_key_a + (26- key_b) * inv_key_a) % 26
    plaintext  += chr(temp + ord('a'))

print('The plaintext is: \'{}\''.format(plaintext))
