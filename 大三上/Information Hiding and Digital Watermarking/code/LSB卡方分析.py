# lsb.py
# PIL图像处理库
from PIL import Image
# 表格绘制库
import matplotlib.pyplot as plt
# 数学库
import numpy as np

# 图像的基本信息
img = Image.open("bupt.bmp")
width = img.size[0]
height = img.size[1]


# rgb彩色图像转灰度图
def rgb2gray(img_):
    img_ = img_.convert("L")
    return img_


# 生成随机信息
def randomMsg(percent):
    if percent > 0 and percent <= 1:
        row = round(width * percent)
        col = round(height * percent)
        return np.random.randint(0, 2, (col, row))
    else:
        raise Exception("传入的值必须属于(0,1]")


# 将信息写入
def lsbWritein(img, msg):
    for y in range(len(msg)):
        for x in range(len(msg[0])):
            color = img.getpixel((x, y))
            temp = bin(color).replace('0b', '')

            # 不满足8bit长度的在高位补0
            temp = temp.zfill(8)

            temp = temp[0:7] + str(msg[y][x])
            img.putpixel((x, y), int(temp, 2))
    return img


# 主函数
def main():
    plt.figure("pixel")

    rt = 1

    img_gray = rgb2gray(img)
    martix_gray = np.array(img_gray)

    msg = np.array(randomMsg(rt))
    print("Original message:\n", msg)

    bupt_binary = ''.join(format(ord(c), '08b') for c in 'bupt')
    bupt_binary_array = np.array([int(bit) for bit in bupt_binary])

    # 替换 msg 的开头部分
    msg_flat = msg.flatten()
    print("msg_flat:\n", msg_flat)
    msg_flat[:len(bupt_binary_array)] = bupt_binary_array

    '''
    替换 msg_flat 的后面部分为 bupt_binary_array
    start_index = len(msg_flat) - len(bupt_binary_array) # 计算需要替换的起始位置
    msg_flat[start_index:] = bupt_binary_array
    '''

    msg = msg_flat.reshape(msg.shape)
    print("Modified message:\n", msg)

    img_lsb = lsbWritein(img_gray, msg)
    martix_lsb = np.array(img_lsb)

    # 解决中文显示问题
    plt.rcParams['font.sans-serif'] = ['SimHei']
    plt.rcParams['axes.unicode_minus'] = False

    # 表格绘制，范围为30-50
    x = range(30, 51, 1)
    y = range(0, 1400, 200)
    plt.subplots_adjust(hspace=0.3)  # 调整子图间距

    # 绘制第一个子图
    plt.subplot(211)
    plt.title("2022211570+项枫+原始图直方图")
    hist_gray = plt.hist(martix_gray.flatten(), bins=np.arange(30, 51, 1), rwidth=0.1, align='left')
    plt.xticks(x)
    plt.yticks(y)

    # 在每个柱形上面显示 y 坐标
    for rect in hist_gray[2]:
        height = rect.get_height()
        plt.text(rect.get_x() + rect.get_width() / 2.0, height, '%d' % int(height), ha='center', va='bottom')

    # 绘制第二个子图
    plt.subplot(212)
    plt.title("2022211570+项枫+LSB嵌入后直方图")
    hist_lsb = plt.hist(martix_lsb.flatten(), bins=np.arange(30, 51, 1), rwidth=0.1, align='left')
    plt.xticks(x)
    plt.yticks(y)

    # 在每个柱形上面显示 y 坐标
    for rect in hist_lsb[2]:
        height = rect.get_height()
        plt.text(rect.get_x() + rect.get_width() / 2.0, height, '%d' % int(height), ha='center', va='bottom')

    plt.show()


main()