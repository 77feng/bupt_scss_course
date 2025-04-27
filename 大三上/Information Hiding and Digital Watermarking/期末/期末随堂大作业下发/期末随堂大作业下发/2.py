import math
from PIL import Image
import numpy as np
import cv2
import matplotlib.pyplot as plt

# 设置matplotlib支持中文
plt.rcParams['font.sans-serif'] = ['SimHei']  # 设置字体为黑体
plt.rcParams['axes.unicode_minus'] = False  # 解决负号显示问题


def step1():
    img = Image.open("buptfinal.bmp")
    # 设置显示属性
    plt.figure(f"{student_id}+{name}")

    # 彩色图像
    plt.subplot(141)
    plt.imshow(img)
    plt.title(f"{student_id}+{name}+原始彩色图")
    plt.axis('off')

    # 红色通道
    plt.subplot(142)
    plt.imshow(img.getchannel("R"), cmap='Reds')
    plt.title(f"{student_id}+{name}+彩色图的红色通道")
    plt.axis('off')

    # 绿色通道
    plt.subplot(143)
    plt.imshow(img.getchannel("G"), cmap='Greens')
    plt.title(f"{student_id}+{name}+彩色图的绿色通道")
    plt.axis('off')

    # 蓝色通道
    plt.subplot(144)
    plt.imshow(img.getchannel("B"), cmap='Blues')
    plt.title(f"{student_id}+{name}+彩色图的蓝色通道")
    plt.axis('off')

    plt.tight_layout()
    plt.savefig(f"{student_id}+{name}.png", dpi=300)
    plt.show()







def step2():
    # 读取携密图像
    img = cv2.imread("buptfinal.bmp")

    # 获取蓝色通道
    b_channel = img[:, :, 0]

    # 将所有像素点的蓝色通道的最后一位置为1
    rows, cols = b_channel.shape
    for i in range(rows):
        for j in range(cols):
            if b_channel[i, j] % 2 == 0:
                b_channel[i, j] += 1  # 如果是偶数那就意味着最后一位是0，就给他加1变成1
    # 替换原始图像的蓝色通道为新的蓝色通道
    img[:, :, 0] = b_channel

    # 保存攻击后的图像
    cv2.imwrite("buptfinalB.bmp", img)

    img = Image.open("buptfinal.bmp")

    img_encode = Image.open("buptfinalB.bmp")

    # # 读取攻击后的图像
    # attacked_img = cv2.imread("BlueStgeo1.bmp")
    # # cv2默认是BGR,因此这里的0对应蓝色通道
    # attacked_img_blue = attacked_img[:, :, 0]
    # # 读取未攻击的图像
    # original_img = cv2.imread("encode_lena.bmp")
    # original_img_blue = original_img[:, :, 0]
    #
    # # 比较第一行的64个像素点的蓝色通道的最低位
    # changed_positions = []
    # for i in range(64):
    #     original_pixel = original_img_blue[0, i] % 2
    #     attacked_pixel = attacked_img_blue[0, i] % 2
    #     if original_pixel != attacked_pixel:
    #         changed_positions.append(i)
    #
    # # 输出发生变化的像素位置
    # print(f"本人学号为{student_id},本人姓名为{name}，攻击图像最第一行的64个点变化的位置如下：")
    # for integer in changed_positions:
    #     print(integer, end=' ')

    # 原始彩色图
    plt.subplot(121)
    plt.imshow(img)
    plt.title(f"{student_id}+{name}+原始彩色图")
    plt.axis('off')

    # 在蓝色通道嵌入秘密信息后的彩色图
    plt.subplot(122)
    plt.imshow(img_encode)
    plt.title(f"{student_id}+{name}+在蓝色通道嵌入秘密信息后的彩色图")
    plt.axis('off')

    plt.subplots_adjust(wspace=0.5)  # 调整子图之间的水平间距

    plt.show()


student_id = "2022211570"
name = "项枫"
step1()
step2()

def psnr(img1, img2):
    img1 = np.float64(img1)
    img2 = np.float64(img2)
    mse = np.mean((img1 / 1.0 - img2 / 1.0) ** 2)
    if mse < 1.0e-10:
        return 100
    PIXEL_MAX = 255.0
    return 20 * math.log10(PIXEL_MAX / math.sqrt(mse))

original = cv2.imread('buptfinal.bmp')
contrast = cv2.imread('buptfinalB.bmp')
res = psnr(original, contrast)
# 设置终端颜色为白底黑字
print('\033[47m\033[30m', end='')  # 47:白色背景, 30:黑色文字
print(f"本人学号为2022211570，姓名为项枫，在蓝色通道嵌入秘密信息后携密隐写图的峰值信噪比是{res:.2f}")
