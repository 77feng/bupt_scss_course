# # 导入图像处理库
# import cv2
# # 导入数学计算库
# import numpy as np
# # 导入绘图库
# import matplotlib.pyplot as plt
#
# # 读取载体图像
# img = cv2.imread('bupt.bmp')
#
# # 取图像的红色分量来隐藏
# img_b, img_g, img_r = cv2.split(img)
#
# # # 解决中文显示问题
# # plt.rcParams['font.sans-serif'] = ['SimHei']
# # plt.rcParams['axes.unicode_minus'] = False
# #
# # # 展示原图像和R、G、B
# # plt.figure(figsize=(10, 6))
# #
# # plt.subplot(141)
# # plt.imshow(cv2.cvtColor(img, cv2.COLOR_BGR2RGB))
# # plt.title('原始彩色图像（项枫+2022211570）')
# # plt.xticks([]), plt.yticks([])
# #
# # plt.subplot(142)
# # plt.imshow(img_r)
# # plt.title('彩色图像的红色通道')
# # plt.xticks([]), plt.yticks([])
# #
# # plt.subplot(143)
# # plt.imshow(img_g)
# # plt.title('彩色图像的绿色通道')
# # plt.xticks([]), plt.yticks([])
# #
# # plt.subplot(144)
# # plt.imshow(img_b)
# # plt.title('彩色图像的蓝色通道')
# # plt.xticks([]), plt.yticks([])
# #
# # plt.show()
# #
# #
# # # 输入图片的路径，获得图片的8个位图
# # def get_bitmaps(image):
# #     bit_extraction = []
# #     bit_images = []
# #     for i in range(8):
# #         bit_extraction.append(np.ones(image.shape, dtype=np.uint8) * pow(2, i))
# #     for i in range(8):
# #         bit_images.append(cv2.bitwise_and(image, bit_extraction[i]))
# #     return bit_images
# #
# #
# # R_bit_images = get_bitmaps(img_r)
# #
# # # 使用subplots来更好地控制布局
# # fig, axes = plt.subplots(2, 3, figsize=(15, 10))
# #
# # # 展示每个位平面的图像
# # axes[0, 0].imshow(R_bit_images[7])
# # axes[0, 0].axis('off')
# # axes[0, 0].set_title('第8位平面')
# #
# # axes[0, 1].imshow(R_bit_images[6])
# # axes[0, 1].axis('off')
# # axes[0, 1].set_title('第7位平面')
# #
# # axes[0, 2].imshow(R_bit_images[5])
# # axes[0, 2].axis('off')
# # axes[0, 2].set_title('第6位平面')
# #
# # axes[1, 0].imshow(R_bit_images[4])
# # axes[1, 0].axis('off')
# # axes[1, 0].set_title('第5位平面')
# #
# # axes[1, 1].imshow(R_bit_images[3])
# # axes[1, 1].axis('off')
# # axes[1, 1].set_title('第4位平面')
# #
# # axes[1, 2].imshow(R_bit_images[2])
# # axes[1, 2].axis('off')
# # axes[1, 2].set_title('第3位平面')
# #
# #
# # # 调整布局，避免子图之间的重叠
# # plt.tight_layout()
# # plt.show()
#
# def get_msg(msg):
#     return msg.zfill(8)
# def generate(msg):  # 将信息转置为2进制。
#     result = ''
#     for i in msg:
#         if isinstance(i, int):
#             result += get_msg(bin(i)).replace('0b', '')
#         else:
#             result += get_msg(bin(ord(i)).replace('0b', ''))
#     return result
#
#
# from PIL import Image
# import numpy as np
# import cv2
# import math
#
# # 读取彩色图像
# img = Image.open('bupt.bmp')
# img_array = np.array(img)
#
# # 提取R通道
# R_channel = img_array[0, :, :]
#
# # 将秘密信息转换为二进制
# secret_message = "BUPTshahexiaoqu"
# binary_message = ''.join(format(ord(char), '08b') for char in secret_message)
#
# # 嵌入信息的索引
# message_index = 0
#
# # 获取图像的形状
# height, width = R_channel.shape
#
# # 遍历每个像素点，嵌入信息到次低有效位
# for i in range(height):
#     for j in range(width):
#         if message_index < len(binary_message):
#             # 获取当前像素值的次低有效位
#             current_pixel = R_channel[i, j]
#             # 替换次低有效位，使用二进制消息
#             current_pixel = (current_pixel & 0xFD) | (int(binary_message[message_index]) << 1)
#             # 更新 R 通道的值
#             R_channel[i, j] = current_pixel
#             # 更新消息索引
#             message_index += 1
#
# # 将修改后的 R 通道替换回原图
# img_array[0, :, :] = R_channel
#
# # 将修改后的图像转换为 Pillow 图像并保存
# stego_img = Image.fromarray(img_array)
# stego_img.save('buptgraystegoB.bmp')
#
# def psnr(img1, img2):
#     img1 = np.float64(img1)
#     img2 = np.float64(img2)
#     mse = np.mean((img1 / 1.0 - img2 / 1.0) ** 2)
#     if mse < 1.0e-10:
#         return 100
#     PIXEL_MAX = 255.0
#     return 20 * math.log10(PIXEL_MAX / math.sqrt(mse))
#
# original = cv2.imread('bupt.bmp', cv2.IMREAD_GRAYSCALE)
# contrastr = cv2.imread('buptgraystegoR.bmp', cv2.IMREAD_GRAYSCALE)
# contrastg = cv2.imread('buptgraystegoG.bmp', cv2.IMREAD_GRAYSCALE)
# contrastb = cv2.imread('buptgraystegoB.bmp', cv2.IMREAD_GRAYSCALE)
# resr = psnr(original, contrastr)
# resg = psnr(original, contrastg)
# resb = psnr(original, contrastb)
# print('\033[47m\033[30m')
# print("红色通道嵌入秘密信息携密隐写图像的峰值信噪比是 " + '%.2f'% resr)
# print("绿色通道嵌入秘密信息携密隐写图像的峰值信噪比是 " + '%.2f'% resg)
# print("蓝色通道嵌入秘密信息携密隐写图像的峰值信噪比是 " + '%.2f'% resb)
# import cv2
# import matplotlib.pyplot as plt
# import numpy as np
# from matplotlib import rcParams
#
# # 中文显示支持
# rcParams['font.sans-serif'] = ['SimHei']  # 用于正常显示中文标签
# rcParams['axes.unicode_minus'] = False  # 用于正常显示负号
#
#
# # 读取图像
# image_path = "bupt.bmp"  # 替换为实际路径
# image = cv2.imread(image_path)
#
# if image is None:
#     print("无法找到图像，请检查路径。")
#     exit()
#
# # 转换为RGB格式
# image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
#
# # 提取颜色通道
# R_channel = image[:, :, 0]
# G_channel = image[:, :, 1]
# B_channel = image[:, :, 2]
#
# # 创建一个画布显示原始图像和颜色通道
# fig1, axes1 = plt.subplots(1, 4, figsize=(16, 4))
#
# # 原始图像
# axes1[0].imshow(image)
# axes1[0].set_title("原始彩色图像")
# axes1[0].axis("off")
# axes1[0].text(10, 10, "牛清莹 2022211614", color='white', fontsize=12, backgroundcolor='black')
#
# # 红色通道
# axes1[1].imshow(R_channel, cmap="Reds")
# axes1[1].set_title("红色通道")
# axes1[1].axis("off")
# axes1[1].text(10, 10, "牛清莹 2022211614", color='white', fontsize=12, backgroundcolor='black')
#
# # 绿色通道
# axes1[2].imshow(G_channel, cmap="Greens")
# axes1[2].set_title("绿色通道")
# axes1[2].axis("off")
# axes1[2].text(10, 10, "牛清莹 2022211614", color='white', fontsize=12, backgroundcolor='black')
#
# # 蓝色通道
# axes1[3].imshow(B_channel, cmap="Blues")
# axes1[3].set_title("蓝色通道")
# axes1[3].axis("off")
# axes1[3].text(10, 10, "牛清莹 2022211614", color='white', fontsize=12, backgroundcolor='black')
#
# # 调整布局并显示
# plt.tight_layout()
# plt.show()
#
# # 隐写信息
# secret_message = "BUPTshahexiaoqu"
# message_bits = ''.join([bin(ord(c))[2:].zfill(8) for c in secret_message])
#
# # 隐写函数
# def embed_message(channel, message_bits):
#     flat_channel = channel.flatten()
#     for i, bit in enumerate(message_bits):
#         flat_channel[i] = (flat_channel[i] & ~2) | (int(bit) << 1)  # 修改次低位
#     return flat_channel.reshape(channel.shape)
#
# # 在各通道中嵌入秘密信息
# R_stego = embed_message(R_channel, message_bits)
# G_stego = embed_message(G_channel, message_bits)
# B_stego = embed_message(B_channel, message_bits)
#
# # 合成隐写后的彩色图像
# stego_image_R = image.copy()
# stego_image_R[:, :, 0] = R_stego
# cv2.imwrite("buptgraystegoR.bmp", cv2.cvtColor(stego_image_R, cv2.COLOR_RGB2BGR))
#
# stego_image_G = image.copy()
# stego_image_G[:, :, 1] = G_stego
# cv2.imwrite("buptgraystegoG.bmp", cv2.cvtColor(stego_image_G, cv2.COLOR_RGB2BGR))
#
# stego_image_B = image.copy()
# stego_image_B[:, :, 2] = B_stego
# cv2.imwrite("buptgraystegoB.bmp", cv2.cvtColor(stego_image_B, cv2.COLOR_RGB2BGR))
#
# print("隐写完成，生成的图像已保存为 buptgraystegoR.bmp, buptgraystegoG.bmp, buptgraystegoB.bmp。")
#
# # 计算峰值信噪比（PSNR）
# def psnr(img1, img2):
#     img1 = np.float64(img1)
#     img2 = np.float64(img2)
#     mse = np.mean((img1 / 1.0 - img2 / 1.0) ** 2)
#     if mse < 1.0e-10:
#         return 100
#     PIXEL_MAX = 255.0
#     return 20 * math.log10(PIXEL_MAX / math.sqrt(mse))
#
# # 计算各通道的PSNR
# psnr_R = calculate_psnr(image[:, :, 0], stego_image_R[:, :, 0])
# psnr_G = calculate_psnr(image[:, :, 1], stego_image_G[:, :, 1])
# psnr_B = calculate_psnr(image[:, :, 2], stego_image_B[:, :, 2])
#
# # 输出结果
# print(f"红色通道嵌入秘密信息携密隐写图像的峰值信噪比是 {psnr_R}。")
# print(f"绿色通道嵌入秘密信息携密隐写图像的峰值信噪比是 {psnr_G}。")
# print(f"蓝色通道嵌入秘密信息携密隐写图像的峰值信噪比是 {psnr_B}。")
#
# # 比较透明性
# if psnr_R >= psnr_G and psnr_R >= psnr_B:
#     best_channel = "红色通道"
# elif psnr_G >= psnr_R and psnr_G >= psnr_B:
#     best_channel = "绿色通道"
# else:
#     best_channel = "蓝色通道"
#
# print(f"通过峰值信噪比比较，{best_channel}隐藏秘密信息的透明性更好。")

import cv2
import numpy as np
import math

# 读取图像
image_path = "bupt.bmp"  # 替换为实际路径
image = cv2.imread(image_path)

if image is None:
    print("无法找到图像，请检查路径。")
    exit()

# 转换为RGB格式
image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)

# 提取颜色通道
R_channel = image[:, :, 0]

# 隐写信息
secret_message = "BUPTshahexiaoqu"
message_bits = ''.join([bin(ord(c))[2:].zfill(8) for c in secret_message])


# 隐写函数
def embed_message(channel, message_bits):
    flat_channel = channel.flatten()
    for i, bit in enumerate(message_bits):
        flat_channel[i] = (flat_channel[i] & ~2) | (int(bit) << 1)  # 修改次低位
    return flat_channel.reshape(channel.shape)


# 在R通道中嵌入秘密信息
R_stego = embed_message(R_channel, message_bits)

# 合成隐写后的彩色图像
stego_image_R = image.copy()
stego_image_R[:, :, 0] = R_stego
cv2.imwrite("buptgraystegoR.bmp", cv2.cvtColor(stego_image_R, cv2.COLOR_RGB2BGR))


def psnr(img1, img2):
    img1 = np.float64(img1)
    img2 = np.float64(img2)
    mse = np.mean((img1 / 1.0 - img2 / 1.0) ** 2)
    if mse < 1.0e-10:
        return 100
    PIXEL_MAX = 255.0
    return 20 * math.log10(PIXEL_MAX / math.sqrt(mse))


original = cv2.imread('bupt.bmp', cv2.IMREAD_GRAYSCALE)
contrast = cv2.imread('buptgraystegoR.bmp', cv2.IMREAD_GRAYSCALE)
res = psnr(original, contrast)
print('\033[47m\033[30m', end='')
print("红色通道嵌入秘密信息携密隐写图像的峰值信噪比是" + '%.2f' % res)

