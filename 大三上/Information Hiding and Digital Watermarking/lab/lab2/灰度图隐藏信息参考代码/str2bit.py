#将字符串转换为bit
def str2bit_(s):
    result = ''
    for i in range(len(s)):
        temp = bin(ord(s[i])).replace('0b','')

        #长度不满8bit的时候补足8bit
        for j in range(8-len(temp)):
            temp = '0' + temp
        result = result + temp
    return result
msg = 'BUPTshahexiaoqu'
print(msg)
print('ASCII码:',end='')
print([ord(i) for i in msg])
print('二进制数据:',end='')
print(str2bit_(msg))

'''
buptbupt
ASCII码:[98, 117, 112, 116, 98, 117, 112, 116]
二进制数据:0110001001110101011100000111010001100010011101010111000001110100
'''
