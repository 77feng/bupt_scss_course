import cv2
import numpy as np
import matplotlib.pyplot as plt

# 高斯噪声攻击的函数
def gaussian_attack(img, mean, sigma):
    img = img.astype(np.float32) / 255
    noise = np.random.normal(mean, sigma, img.shape)
    img_gaussian = img + noise
    img_gaussian = np.clip(img_gaussian, 0, 1)
    img_gaussian = np.uint8(img_gaussian * 255)
    return img_gaussian


# 读取携密图像
img = cv2.imread('buptstegoR.bmp')
height, width = img.shape[:2]

# 对携密图像进行高斯噪声攻击，标准差设置为0.1
img_gaussian = gaussian_attack(img, 0, 0.1)

cv2.imwrite('buptstegoR1.bmp', img_gaussian)

# 解决中文显示问题
plt.rcParams['font.sans-serif'] = ['SimHei']
plt.rcParams['axes.unicode_minus'] = False

# 展示原嵌入图像和遭受攻击的嵌入图像
plt.figure(figsize=(10, 6))

plt.subplot(121)
plt.imshow(cv2.cvtColor(img, cv2.COLOR_BGR2RGB))
plt.title('2022211570+项枫+原嵌入图像')
plt.xticks([]), plt.yticks([])

plt.subplot(122)
plt.imshow(cv2.cvtColor(img_gaussian, cv2.COLOR_BGR2RGB))
plt.title('2022211570+项枫+遭受攻击的嵌入图像')
plt.xticks([]), plt.yticks([])

plt.show()

# 计算峰值信噪比的函数
def PSNR(template, img):
    mse = np.mean((template / 255. - img / 255.)**2)
    if mse < 1.0e-10:
        return 100
    PIXEL_MAX = 1
    return 20 * np.log10(PIXEL_MAX / np.sqrt(mse))

psnr = PSNR(img, img_gaussian)
print('遭受添加高斯噪声攻击后峰值信噪比%s %.3f %s' % ('PSNR = ', psnr, 'dB'))