import cv2
import numpy as np
import matplotlib.pyplot as plt
import math

# 设置matplotlib支持中文
plt.rcParams['font.sans-serif'] = ['SimHei']  # 设置字体为黑体
plt.rcParams['axes.unicode_minus'] = False  # 解决负号显示问题


# 读取图像
image = cv2.imread('bupt.bmp')

# 将BGR图像转换为RGB
image_rgb = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)

# 分离RGB通道
r, g, b = cv2.split(image_rgb)

# 创建一个空白的图像以显示每个通道
zeros = np.zeros(image.shape[:2], dtype="uint8")

# 将每个分量与零通道合并
R_channel = cv2.merge([r, zeros, zeros])
G_channel = cv2.merge([zeros, g, zeros])
B_channel = cv2.merge([zeros, zeros, b])

# 显示结果
plt.figure(figsize=(10, 5))
plt.subplot(1, 4, 1)
plt.imshow(image_rgb)
plt.title("Original Image")
plt.axis("off")

plt.subplot(1, 4, 2)
plt.imshow(R_channel)
plt.title("Red Channel")
plt.axis("off")

plt.subplot(1, 4, 3)
plt.imshow(G_channel)
plt.title("Green Channel")
plt.axis("off")

plt.subplot(1, 4, 4)
plt.imshow(B_channel)
plt.title("Blue Channel")
plt.axis("off")

plt.tight_layout()
plt.show()

# 创建一个空白图像来存储位平面
bit_planes = []

# 提取每个位平面
for i in range(3, 9):
    bit_plane = (r & (1 << i)) >> i
    bit_planes.append(bit_plane * 255)

# 设置图像显示
fig, axes = plt.subplots(2, 3, figsize=(10, 7))
axes = axes.ravel()

# 显示每个位平面
for i in range(6):
    axes[i].imshow(bit_planes[i], cmap='gray')
    axes[i].set_title(f'Bit Plane {8 - i} 项枫+2022211570')
    axes[i].axis('off')

plt.tight_layout()
plt.show()


def text_to_bits(text):
    return ''.join(format(ord(c), '08b') for c in text)


def embed_bits_in_channel(channel, bits):
    # 行
    flat_channel = channel.flatten()
    # # 列
    # flat_channel = channel.T.flatten()

    for i in range(len(bits)):
        # 次低
        flat_channel[i] = (flat_channel[i] & ~2) | (int(bits[i]) << 1)

        # # 最低
        # flat_channel[i] = (flat_channel[i] & ~1) | int(bits[i])
    return flat_channel.reshape(channel.shape)


def psnr(img1, img2):
    img1 = np.float64(img1)
    img2 = np.float64(img2)
    mse = np.mean((img1 / 1.0 - img2 / 1.0) ** 2)
    if mse < 1.0e-10:
        return 100
    PIXEL_MAX = 255.0
    return 20 * math.log10(PIXEL_MAX / math.sqrt(mse))


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

    psnr_r = psnr(image, stego_image_r)
    psnr_g = psnr(image, stego_image_g)
    psnr_b = psnr(image, stego_image_b)

    print(f"红色通道嵌入秘密信息携密隐写图像的峰值信噪比是 {psnr_r}，")
    print(f"绿色通道嵌入秘密信息携密隐写图像的峰值信噪比是 {psnr_g}，")
    print(f"蓝色通道嵌入秘密信息携密隐写图像的峰值信噪比是 {psnr_b}，")


message = "BUPTshahexiaoqu"
embed_message('bupt.bmp', message, ['buptgraystegoR.bmp', 'buptgraystegoG.bmp', 'buptgraystegoB.bmp'])
