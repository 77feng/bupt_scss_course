# -*- coding: utf-8 -*-
from Crypto.Cipher import ARC4

def encrypt(message, key):    # 加密
    des = ARC4.new(key)
    cipher_text = des.encrypt(message)
    
    return cipher_text

def decrypt(cipher_text, key): # 解密
    des3 = ARC4.new(key)
    message = des3.decrypt(cipher_text)
    
    return message

if __name__ == "__main__":
    # key = 'HereIsFlagggg'.encode("utf8")
    key = b'\xFC\xFB\x3B\x0D\x73\x6E'
    
    # message = 'Is_Th13_Simple_Rc4?'.encode("utf8")    
    # cipher_text = encrypt(message, key)
    # print('密文:', cipher_text.hex().upper())

    cipher_text = b'\x6E\x65\x11\xCF\x1D\x80\x3B\x4E\x20\x2A\xE0\xB6'

    message = decrypt(cipher_text, key)
    print('得到的\'FLAG\':', message.decode("utf8"))
    