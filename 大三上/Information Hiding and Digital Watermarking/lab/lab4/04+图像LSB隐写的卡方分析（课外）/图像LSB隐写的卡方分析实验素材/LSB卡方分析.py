#LSB卡方分析.py
from PIL import Image
from function import stgPrb
import numpy as np


#图像的基本信息
img = Image.open("sea.bmp")
width = img.size[0]
height = img.size[1]
#rgb彩色图像转灰度图
def rgb2gray(img):
    img = img.convert("L")
    return img
#生成随机信息
def randomMsg(percent):
    if percent>0 and percent<=1:
        row = round(width * percent)
        col = round(height * percent)
        return np.random.randint(0,2,(col,row))
    else:
        raise Exception("传入的值必须属于(0,1]")


#将信息写入
def lsbWritein(img,msg):

    for y in range(len(msg)):
        for x in range(len(msg[0])):
            color = img.getpixel((x,y))
            temp = bin(color).replace('0b','')

            #不满足8bit长度的在高位补0
            for j in range(8-len(temp)):
                temp = '0' + temp

            temp = temp[0:7]+str(msg[y][x])
            img.putpixel((x,y),int(temp,2))
    return img
#主函数
def main():
    p = np.zeros((3,91))
    for k in range(3):
        img_gray = rgb2gray(img)
        #根据隐写率大小生成秘密信息，隐写率为0.3,0.5,0.7三种
        rt = 0.3 + 0.2 * k
        msg = randomMsg(rt)
        #lsb隐写
        img_lsb = lsbWritein(img_gray,msg)
        img_lsb.save("sea_{}%.bmp".format(rt*100))
        martix = np.array(img_lsb)
        #循环，确定一个隐写率区间对图片进行分析
        i = 0
        for rto in range(10,101):
            row = round(width * (rto/100))
            col = round(height * (rto/100))
            p[k][i] = stgPrb(martix[0:row,0:col])
            i+=1
    #输出
    for i in range(3):
        for j in range(91):
            print(p[i][j],end=',')
        print()

main()