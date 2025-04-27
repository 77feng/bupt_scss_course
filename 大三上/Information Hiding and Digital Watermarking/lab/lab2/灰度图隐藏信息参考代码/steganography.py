#steganography.py
from PIL import Image

zigzagMartix = [ 0, 1, 8, 16, 9, 2, 3, 10,
        17, 24, 32, 25, 18, 11, 4, 5,
        12, 19, 26, 33, 40, 48, 41, 34,
        27, 20, 13, 6, 7, 14, 21, 28,
        35, 42, 49, 56, 57, 50, 43, 36,
        29, 22, 15, 23, 30, 37, 44, 51,
        58, 59, 52, 45, 38, 31, 39, 46,
        53, 60, 61, 54, 47, 55, 62, 63]

lena_gray = Image.open('buptgray.bmp')

def str2bit_(s):
    result = ''
    for i in range(len(s)):
        temp = bin(ord(s[i])).replace('0b','')
        #长度不满8bit的时候补足8bit
        for j in range(8-len(temp)):
            temp = '0' + temp
        result = result + temp
    return result

#提取子矩阵
def submartix(img):
    height = 8
    width = 8
    martix = []
    for y in range(height):
        temp = []
        for x in range(width):
            color = img.getpixel((x,y))
            temp.append(color)
        martix.append(temp)
    return martix

#将子矩阵转化为一维向量并应用zigzag变换
def zigzag(martix):
    temp = []#一维列表，用于存放转化后的矩阵
    result = []
    for y in range(len(martix)):
        for x in range(len(martix[0])):
            temp.append(martix[y][x])
    for item in zigzagMartix:
        result.append(temp[item])
    return result

def writein(img,bit):
    for i in range(len(bit)):
        color = img.getpixel((zigzagMartix[i]%8,zigzagMartix[i]//8))
        temp = bin(color).replace('0b','')
        temp = temp[0:7]+bit[i]
        img.putpixel((zigzagMartix[i]%8,zigzagMartix[i]//8),int(temp,2))
    return img


msg = 'BUPTshahexiaoqu'
msg_bit = str2bit_(msg)
result = writein(lena_gray,msg_bit)
result.save('buptgraystego.bmp')
result.show()
print("处理完毕！")

