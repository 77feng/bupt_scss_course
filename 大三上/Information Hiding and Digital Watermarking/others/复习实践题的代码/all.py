import math
from scipy.stats import chi2
from PIL import Image
import matplotlib.pyplot as plt
import numpy as np

plt.rcParams['font.sans-serif'] = ['SimHei']  # 用来正常显示中文标签
plt.rcParams['axes.unicode_minus'] = False  # 用来正常显示负号

img = Image.open("lena.bmp")
width = img.size[0]
height = img.size[1]
imgc = img.copy()

def generateMatrix(strs):
    ascii = ""
    for i in strs:
        ascii += str(ord(i))
    Matrix = [[]]

    for i in range(8):
        temp = bin(ord(strs[i])).replace('0b', '').zfill(8)
        Matrix.append([])
        for j in range(8):
            Matrix[i].append(int(temp[j]))
    return Matrix

def psnr(img1, img2):
    img1 = np.float64(img1)
    img2 = np.float64(img2)
    mse = np.mean((img1 / 1.0 - img2 / 1.0) ** 2)
    if mse < 1.0e-10:
        return 100
    PIXEL_MAX = 255.0
    return 20 * math.log10(PIXEL_MAX / math.sqrt(mse))

def printMatrix(m):
    result = ''
    for i in range(8):
        for j in range(8):
            result += str(m[i][j]) + ' '
        result += '\n'
    print(result)

def getImgMatrix(imgcc):
    m = [[]]
    for i in range(8):
        m.append([])
        for j in range(8):
            p = imgcc.getpixel((i, j))
            m[i].append(p[0])
    return m

def attack(imgcc):
    for i in range(height):
        for j in range(width):
            p = imgcc.getpixel((i, j))
            p = list(p)
            p[0] = p[0] >> 1 << 1
            p[0] += 1
            p = tuple(p)
            imgcc.putpixel((i, j), p)
    return imgcc

def question1():
    plt.figure("2019212392+梁晓欣")
    plt.subplot(221)
    plt.imshow(img)
    plt.title("彩色图像")
    plt.subplot(222)
    plt.imshow(img.getchannel("R"), 'Reds')
    plt.title("红色图像")
    plt.subplot(223)
    plt.imshow(img.getchannel("G"), "Greens")
    plt.title("绿色图像")
    plt.subplot(224)
    plt.imshow(img.getchannel("B"), "Blues")
    plt.title("蓝色图像")
    plt.show()
    return plt

def question2():
    strs = "BUPTSOCS"

    def generateMatrix():

        ascii = ""
        for i in strs:
            ascii += str(ord(i))

        print(strs + "的ASCII是" + ascii)

        Matrix = [[]]

        for i in range(8):
            temp = bin(ord(strs[i])).replace('0b', '').zfill(8)
            Matrix.append([])
            for j in range(8):
                Matrix[i].append(int(temp[j]))
        return Matrix

    if __name__ == '__main__':
        m = generateMatrix()
        ms = ''
        for i in range(8):
            for j in range(8):
                ms += str(m[i][j])
            ms += '\n'
        print(ms)

def question3():
    m = [[]]

    for i in range(8):
        m.append([])
        for j in range(8):
            p = img.getpixel((i, j))
            m[i].append(p[0])

    result = ''
    for i in range(8):
        for j in range(8):
            result += str(m[i][j]) + ' '
        result += '\n'
    print("本人学号为2019212392，红色通道最左上角64个像素点值如下")
    print(result)

def question4():
    def generateMatrix(strs):

        ascii = ""
        for i in strs:
            ascii += str(ord(i))

        print(strs + "的ASCII是" + ascii)

        Matrix = [[]]

        for i in range(8):
            temp = bin(ord(strs[i])).replace('0b', '').zfill(8)
            Matrix.append([])
            for j in range(8):
                Matrix[i].append(int(temp[j]))
        return Matrix

    if __name__ == '__main__':
        msg = generateMatrix("BUPT2023")
        m = [[]]
        for i in range(8):
            m.append([])
            for j in range(8):
                p = img.getpixel((i, j))
                p = list(p)
                p[0] = p[0] >> 1 << 1
                p[0] += msg[i][j]
                p = tuple(p)
                img.putpixel((i, j), p)
                m[i].append(p[0])

        result = ''
        for i in range(8):
            for j in range(8):
                result += str(m[i][j]) + ' '
            result += '\n'
        print("本人学号为2019212392，隐写图像红色通道最左上角64个像素点值如下")
        print(result)

def question5():
    if __name__ == '__main__':
        msg = generateMatrix("BUPT2023")
        for i in range(8):
            for j in range(8):
                p = img.getpixel((i, j))
                p = list(p)
                p[0] = p[0] >> 1 << 1
                p[0] += msg[i][j]
                p = tuple(p)
                img.putpixel((i, j), p)

        plt.figure("2019212392+梁晓欣+原始图和携密图像对比")
        plt.subplot(121)
        plt.imshow(imgc)
        plt.title("原始图像")

        plt.subplot(122)
        plt.imshow(img)
        plt.title("携密图像")
        plt.show()

def question6():
    if __name__ == '__main__':
        msg = generateMatrix("BUPT2023")
        for i in range(8):
            for j in range(8):
                p = img.getpixel((i, j))
                p = list(p)
                p[0] = p[0] >> 1 << 1
                p[0] += msg[i][j]
                p = tuple(p)
                img.putpixel((i, j), p)

        print("本人学号为2019212392，本人计算出来的PSNR值为%.2f" % psnr(img, imgc))

def question7():
    if __name__ == '__main__':
        msg = generateMatrix("BUPT2023")
        for i in range(8):
            for j in range(8):
                p = img.getpixel((i, j))
                p = list(p)
                p[0] = p[0] >> 1 << 1
                p[0] += msg[i][j]
                p = tuple(p)
                img.putpixel((i, j), p)

        imga = attack(img.copy())
        imga.save("RedStgeo1.bmp")

        m = getImgMatrix(imga)

        print("本人学号为2019212392，攻击图像红色通道最左上角64个像素点值如下")
        printMatrix(m)

def question8():
    def hideMsg(msg, image):
        for i in range(8):
            for j in range(8):
                p = image.getpixel((i, j))
                p = list(p)
                p[0] = p[0] >> 1 << 1
                p[0] += msg[i][j]
                p = tuple(p)
                image.putpixel((i, j), p)

    if __name__ == '__main__':
        msg = generateMatrix("BUPT2023")
        hideMsg(msg, img)
        imga = attack(img.copy())
        m1 = getImgMatrix(img)
        m2 = getImgMatrix(imga)
        result = ''
        for i in range(8):
            for j in range(8):
                if m1[i][j] != m2[i][j]:
                    result += str(8 * i + j + 1) + ','
        result = result[:-1]
        print("本人学号为2019212392,以下位置的值有变化：" + result)

question1()
question2()
question3()
question4()
question5()
question6()
question7()
question8()
