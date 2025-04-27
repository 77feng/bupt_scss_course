# import cv2
# import numpy as np
# import matplotlib.pyplot as plt
# from PIL import Image, ImageDraw, ImageFont

# # 设置matplotlib支持中文
# plt.rcParams['font.sans-serif'] = ['SimHei']  # 设置字体为黑体
# plt.rcParams['axes.unicode_minus'] = False  # 解决负号显示问题

# # 读取图像
# image = cv2.imread('bupt.bmp')

# # 提取颜色通道
# B, G, R = cv2.split(image)

# # 创建一个空白图像用于显示单个颜色通道
# zeros = np.zeros(image.shape[:2], dtype="uint8")

# # 合并颜色通道
# red_channel = cv2.merge([zeros, zeros, R])
# green_channel = cv2.merge([zeros, G, zeros])
# blue_channel = cv2.merge([B, zeros, zeros])

# # 在图像上添加学号和姓名
# def put_chinese_text(img, text, position, font_size=20, color=(255, 255, 255)):
#     pil_img = Image.fromarray(cv2.cvtColor(img, cv2.COLOR_BGR2RGB))
#     draw = ImageDraw.Draw(pil_img)
#     font = ImageFont.truetype("simsun.ttc", font_size, encoding="utf-8")
#     draw.text(position, text, font=font, fill=color)
#     return cv2.cvtColor(np.array(pil_img), cv2.COLOR_RGB2BGR)

# image = put_chinese_text(image, '学号: 2022211633 姓名: 赵璐文', (10, 30))
# red_channel = put_chinese_text(red_channel, '学号: 2022211633 姓名: 赵璐文', (10, 30))
# green_channel = put_chinese_text(green_channel, '学号: 2022211633 姓名: 赵璐文', (10, 30))
# blue_channel = put_chinese_text(blue_channel, '学号: 2022211633 姓名: 赵璐文', (10, 30))

# # 显示图像
# plt.figure(figsize=(10, 5))

# plt.subplot(1, 4, 1)
# plt.imshow(cv2.cvtColor(image, cv2.COLOR_BGR2RGB))
# plt.title('原始图像')
# plt.axis('off')

# plt.subplot(1, 4, 2)
# plt.imshow(cv2.cvtColor(red_channel, cv2.COLOR_BGR2RGB))
# plt.title('红色通道')
# plt.axis('off')

# plt.subplot(1, 4, 3)
# plt.imshow(cv2.cvtColor(green_channel, cv2.COLOR_BGR2RGB))
# plt.title('绿色通道')
# plt.axis('off')

# plt.subplot(1, 4, 4)
# plt.imshow(cv2.cvtColor(blue_channel, cv2.COLOR_BGR2RGB))
# plt.title('蓝色通道')
# plt.axis('off')

# plt.show()





# import cv2
# import numpy as np
# import matplotlib.pyplot as plt

# # 设置matplotlib支持中文
# plt.rcParams['font.sans-serif'] = ['SimHei']  # 设置字体为黑体
# plt.rcParams['axes.unicode_minus'] = False  # 解决负号显示问题

# # 读取图像
# image = cv2.imread('bupt.bmp')

# # 提取红色通道
# red_channel = image[:, :, 2]

# # 创建一个空白图像来存储位平面
# bit_planes = []

# # 提取每个位平面
# for i in range(3, 9):
#     bit_plane = (red_channel & (1 << i)) >> i
#     bit_planes.append(bit_plane * 255)

# # 设置图像显示
# fig, axes = plt.subplots(2, 3, figsize=(10, 7))
# axes = axes.ravel()

# # 显示每个位平面
# for i in range(6):
#     axes[i].imshow(bit_planes[i], cmap='gray')
#     axes[i].set_title(f'Bit Plane {8-i} 赵璐文 2022211633')
#     axes[i].axis('off')

# plt.tight_layout()
# plt.show()

# def text_to_bits(text):
#     return ''.join(format(ord(c), '08b') for c in text)

# def embed_bits_in_channel(channel, bits):
#     flat_channel = channel.flatten()
#     for i in range(len(bits)):
#         flat_channel[i] = (flat_channel[i] & ~2) | (int(bits[i]) << 1)
#     return flat_channel.reshape(channel.shape)

# def embed_message(image_path, message, output_path):
#     image = cv2.imread(image_path)
#     b, g, r = cv2.split(image)
    
#     bits = text_to_bits(message)
    
#     r = embed_bits_in_channel(r, bits)
#     g = embed_bits_in_channel(g, bits)
#     b = embed_bits_in_channel(b, bits)
    
#     stego_image_r = cv2.merge((b, g, r))
#     stego_image_g = cv2.merge((b, g, r))
#     stego_image_b = cv2.merge((b, g, r))
    
#     cv2.imwrite(output_path[0], cv2.cvtColor(stego_image_r, cv2.COLOR_BGR2GRAY))
#     cv2.imwrite(output_path[1], cv2.cvtColor(stego_image_g, cv2.COLOR_BGR2GRAY))
#     cv2.imwrite(output_path[2], cv2.cvtColor(stego_image_b, cv2.COLOR_BGR2GRAY))

# message = "BUPTshahexiaoqu"
# embed_message('bupt.bmp', message, ['buptgraystegoR.bmp', 'buptgraystegoG.bmp', 'buptgraystegoB.bmp'])






import cv2
import numpy as np

def calculate_psnr(original, stego):
    mse = np.mean((original - stego) ** 2)
    if mse == 0:
        return float('inf')
    max_pixel = 255.0
    psnr = 20 * np.log10(max_pixel / np.sqrt(mse))
    return round(psnr, 2)

def text_to_bits(text):
    return ''.join(format(ord(c), '08b') for c in text)

def embed_bits_in_channel(channel, bits):
    flat_channel = channel.flatten()
    for i in range(len(bits)):
        flat_channel[i] = (flat_channel[i] & ~2) | (int(bits[i]) << 1)
    return flat_channel.reshape(channel.shape)

def embed_message(image_path, message, output_paths):
    image = cv2.imread(image_path)
    b, g, r = cv2.split(image)
    
    bits = text_to_bits(message)
    
    r_stego = embed_bits_in_channel(r, bits)
    g_stego = embed_bits_in_channel(g, bits)
    b_stego = embed_bits_in_channel(b, bits)
    
    stego_image_r = cv2.merge((b, g, r_stego))
    stego_image_g = cv2.merge((b, g_stego, r))
    stego_image_b = cv2.merge((b_stego, g, r))
    
    cv2.imwrite(output_paths[0], stego_image_r)
    cv2.imwrite(output_paths[1], stego_image_g)
    cv2.imwrite(output_paths[2], stego_image_b)
    
    psnr_r = calculate_psnr(r, r_stego)
    psnr_g = calculate_psnr(g, g_stego)
    psnr_b = calculate_psnr(b, b_stego)
    
    print(f"红色通道嵌入秘密信息携密隐写图像的峰值信噪比是 {psnr_r}，")
    print(f"绿色通道嵌入秘密信息携密隐写图像的峰值信噪比是 {psnr_g}，")
    print(f"蓝色通道嵌入秘密信息携密隐写图像的峰值信噪比是 {psnr_b}，")

message = "BUPTshahexiaoqu"
embed_message('bupt.bmp', message, ['buptgraystegoR.bmp', 'buptgraystegoG.bmp', 'buptgraystegoB.bmp'])

import math
import numpy as np
import cv2

def psnr(img1, img2):
    img1 = np.float64(img1)
    img2 = np.float64(img2)
    mse = np.mean((img1 / 1.0 - img2 / 1.0) ** 2)
    if mse < 1.0e-10:
        return 100
    PIXEL_MAX = 255.0
    return 20 * math.log10(PIXEL_MAX / math.sqrt(mse))

original = cv2.imread('bupt.bmp')
contrast = cv2.imread('buptgraystegoR.bmp')
res = psnr(original, contrast)
print(res)