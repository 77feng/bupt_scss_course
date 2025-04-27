import math
from PIL import Image
import numpy as np
import cv2
import matplotlib.pyplot as plt

# 设置matplotlib支持中文
plt.rcParams['font.sans-serif'] = ['SimHei']  # 设置字体为黑体
plt.rcParams['axes.unicode_minus'] = False  # 解决负号显示问题


def step1():
    img = Image.open("lena.bmp")
    # 设置显示属性
    plt.figure(f"{student_id}+{name}")

    # 彩色图像
    plt.subplot(221)
    plt.imshow(img)
    plt.title("彩色图像")
    plt.axis('off')

    # 红色通道
    plt.subplot(222)
    plt.imshow(img.getchannel("R"), cmap='Reds')
    plt.title(f"{student_id}+{name}+红色通道")
    plt.axis('off')

    # 绿色通道
    plt.subplot(223)
    plt.imshow(img.getchannel("G"), cmap='Greens')
    plt.title(f"{student_id}+{name}+绿色通道")
    plt.axis('off')

    # 蓝色通道
    plt.subplot(224)
    plt.imshow(img.getchannel("B"), cmap='Blues')
    plt.title(f"{student_id}+{name}+蓝色通道")
    plt.axis('off')

    plt.tight_layout()
    plt.savefig(f"{student_id}+{name}.png", dpi=300)
    plt.show()


def step2():
    text = "BUPTshahexiaoqu"
    ascii_values = [ord(char) for char in text]
    binary_values = [format(ascii_val, '08b') for ascii_val in ascii_values]
    print(f'本人学号为{student_id}，本人的姓名为{name}，BUPTshahexiaoqu的ASCII码转化为二进制的比特矩阵如下：')
    for binary_val in binary_values:
        print(binary_val)


def step3():
    # 读取图像
    img = cv2.imread("lena.bmp")

    # OpenCV使用BGR模式，因此红色通道是第2个通道
    r_channel = img[:, :, 2]

    # 获取第一列的64个像素点
    first_row_64 = r_channel[1, 0:120]  # 第1行的前120个像素点
    print(
        f"本人学号为{student_id}，本人姓名为{name}，红色通道第一列从第1个像素点开始的120个像素点的十进制像素值矩阵如下：")
    # 打印8x15的区域，第1到第8个像素值输出在第一行，第9至16个像素值输出在第二行，17至24个像素值输出在第三行。依次类推
    for i in range(0, 120, 8):  # 这个range的意思是，从0开始，到120结束，步长为8
        # 打印第i到第i+7个像素值
        print(' '.join(map(str, first_row_64[i:i + 8])))

    # # 输出成二进制，可以用来debug
    # for i in range(0, 64, 8):
    #     print(' '.join(map(lambda x: format(x, '08b'), first_row_64[i:i+8])))


def step4(message="BUPTshahexiaoqu"):
    def get_msg(msg):
        return msg.zfill(8)

    def generate(msg):  # 将信息转置为2进制。
        result = ''
        for i in msg:
            result += get_msg(bin(ord(i)).replace('0b', ''))
        return result

    # 使用cv2读取图像并提取红色通道
    img = cv2.imread("lena.bmp")
    red_channel = img[:, :, 2]
    hide_msg = generate(message)

    # 将信息隐藏到红色通道最左面一列的120个像素点
    for i in range(120):
        pixel_value = red_channel[1, i]
        pixel_value = pixel_value - pixel_value % 2 + int(hide_msg[i])
        red_channel[1, i] = pixel_value

    # # 次低
    # # 清除次低有效位
    # pixel_value = pixel_value & ~0b10  # 使用按位与清除次低有效位
    # # 设置次低有效位为要隐藏的信息
    # pixel_value = pixel_value | (int(hide_msg[i]) << 1)  # 将隐藏信息左移到次低有效位

    # 输出嵌入后的红色通道最上面一列的120个像素点
    print(
        f"本人学号为{student_id}，本人姓名为{name}，红色通道隐藏秘密信息后第一列从第1个像素点开始的120个像素点十进制像素值矩阵如下：")
    for i in range(0, 120, 8):
        print(' '.join(map(str, red_channel[0, i:i + 8])))

    # # 二进制版，可以用来debug
    # for i in range(0, 64, 8):
    #     print(' '.join(map(lambda x: format(x, '08b'), blue_channel[0, i:i+8])))

    # 保存修改后的图像
    cv2.imwrite('encode_lena.bmp', img)


def step4_2(message="BUPTSCSS"):
    def get_msg(msg):
        return msg.zfill(8)

    def generate(msg):  # 将信息转置为2进制。
        result = ''
        for i in msg:
            result += get_msg(bin(ord(i)).replace('0b', ''))
        return result

    img = Image.open("lena.bmp")
    hide_msg = generate(message)

    for x in range(64):
        # 注意这里,getpixel传入的第一个参数是列，第二个参数是行，与cv2相反。因此这里的x对应的是列，0对应的是行
        r, g, b = img.getpixel((x, 0))
        b = b - b % 2 + int(hide_msg[x])
        img.putpixel((x, 0), (r, g, b))

    # 输出嵌入后的蓝色通道最上面一行的64个像素点
    print(
        f"本人学号为{student_id}，本人姓名为{name}，蓝色通道隐藏秘密信息后第一行从第1个像素点开始的64个像素点十进制像素值矩阵如下：")
    for i in range(0, 64, 8):  # 这里的range的意思是，从0开始，到64结束，步长为8，因此i会为0,8,16,24,32,40,48,56
        # 这里的[2]就是蓝色通道，因为RGB是012，所以蓝色通道是2，这与cv2的BGR不一样不要搞混了
        print(' '.join(str(img.getpixel((j, 0))[2]) for j in range(i, i + 8)))

    # # 二进制版，可以用来debug
    # for i in range(0, 64, 8):
    #     print(' '.join(map(lambda x: format(x, '08b'), (img.getpixel((j, 0))[2] for j in range(i, i+8)))))
    # 保存修改后的图像
    img.save('encode_lena.bmp')


def step5():
    # 读取原始图像和携密图像
    original_img = cv2.imread("lena.bmp")
    encoded_img = cv2.imread("encode_lena.bmp")

    # 因为OpenCV默认是BGR，所以我们转换它为RGB以使用matplotlib来显示
    original_img_rgb = cv2.cvtColor(original_img, cv2.COLOR_BGR2RGB)
    encoded_img_rgb = cv2.cvtColor(encoded_img, cv2.COLOR_BGR2RGB)

    # 设置显示属性
    plt.figure("原始图和携密图像对比")

    # 原始图像
    plt.subplot(1, 2, 1)  # 1行2列的第1个位置
    plt.imshow(original_img_rgb)
    plt.title(f"{student_id}+{name}+原始图像")
    plt.axis('off')

    # 携密图像
    plt.subplot(1, 2, 2)  # 1行2列的第2个位置
    plt.imshow(encoded_img_rgb)
    plt.title(f"{student_id}+{name}+携密图像")
    plt.axis('off')
    plt.suptitle(f"原始图和携密图像对比")

    plt.tight_layout()
    plt.savefig("原始图和携密图像.png", dpi=300)
    plt.show()


def psnr(img1, img2):
    img1 = np.float64(img1)
    img2 = np.float64(img2)
    mse = np.mean((img1 / 1.0 - img2 / 1.0) ** 2)
    if mse < 1.0e-10:
        return 100
    PIXEL_MAX = 255.0
    return 20 * math.log10(PIXEL_MAX / math.sqrt(mse))


def step6():
    # 读取原始图像和携密图像
    original = cv2.imread("lena.bmp")
    contrast = cv2.imread("encode_lena.bmp")
    res = psnr(original, contrast)
    print(f"本人学号为{student_id}，本人的姓名为{name}，本人计算出来的PSNR的值为{res:.2f}")  # 输出小数位为2的浮点数


def step7():
    # 读取携密图像
    img = cv2.imread("encode_lena.bmp")

    # 获取红色通道
    r_channel = img[:, :, 2]

    # 将所有像素点的红色通道的最后一位置为1
    rows, cols = r_channel.shape
    for i in range(rows):
        for j in range(cols):
            if r_channel[i, j] % 2 == 0:
                r_channel[i, j] += 1  # 如果是偶数那就意味着最后一位是0，就给他加1变成1

    # # 将所有像素点的红色通道的次低位置为1
    # rows, cols = r_channel.shape
    # for i in range(rows):
    #     for j in range(cols):
    #         # 将次低有效位清零，然后设置为1
    #         r_channel[i, j] = (r_channel[i, j] & ~2) | 2

    # 替换原始图像的红色通道为新的红色通道
    img[:, :, 2] = r_channel

    # 保存攻击后的图像
    cv2.imwrite("RedStgeo1.bmp", img)

    # 读取攻击后的图像
    attacked_img = cv2.imread("RedStgeo1.bmp")
    # cv2默认是BGR,因此这里的2对应红色通道
    attacked_img_red = attacked_img[:, :, 2]
    # 读取未攻击的图像
    original_img = cv2.imread("encode_lena.bmp")
    original_img_red = original_img[:, :, 2]

    # 比较第一列120个像素点的红色通道的最低位
    changed_positions = []
    for i in range(120):
        original_pixel = original_img_red[0, i] % 2
        attacked_pixel = attacked_img_red[0, i] % 2
        if original_pixel != attacked_pixel:
            changed_positions.append(i)

    # 输出发生变化的像素位置
    print(f"本人学号为{student_id},本人姓名为{name}，攻击图像最第一列的120个点变化的位置如下：")
    for integer in changed_positions:
        print(integer, end=' ')


student_id = "2022211570"
name = "项枫"
step1()
step2()
step3()
# choose step4() or step4_2()，他们效果一致，只是实现方式不同，一个是用cv2，一个是用PIL
step4()
# step4_2()
step5()
step6()
step7()
