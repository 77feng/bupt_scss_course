import matplotlib.pyplot as plt
import cv2
import numpy as np

from blind_watermark import WaterMark

bwm1 = WaterMark(password_wm=1, password_img=1)
# 读取原始图像
bwm1.read_img('bupt.bmp')
# 读取水印
bwm1.read_wm('watermark.bmp')
# 隐藏
bwm1.embed('buptstegoR.bmp')

img = cv2.imread('bupt.bmp')
img_embedded = cv2.imread('buptstegoR.bmp')

# 解决中文显示问题
plt.rcParams['font.sans-serif'] = ['SimHei']
plt.rcParams['axes.unicode_minus'] = False

# 展示原图像和嵌入图像
plt.figure(figsize=(10, 6))

plt.subplot(121)
plt.imshow(cv2.cvtColor(img, cv2.COLOR_BGR2RGB))
plt.title('2022211570+项枫+原始图像')
plt.xticks([]), plt.yticks([])

plt.subplot(122)
plt.imshow(cv2.cvtColor(img_embedded, cv2.COLOR_BGR2RGB))
plt.title('2022211570+项枫+嵌入图像')
plt.xticks([]), plt.yticks([])

plt.show()

# 计算峰值信噪比的函数
def PSNR(template, img):
    mse = np.mean((template / 255. - img / 255.)**2)
    if mse < 1.0e-10:
        return 100
    PIXEL_MAX = 1
    return 20 * np.log10(PIXEL_MAX / np.sqrt(mse))

psnr = PSNR(img, img_embedded)
print('嵌入水印信息后图像峰值信噪比%s %.3f %s' % ('PSNR = ', psnr, 'dB'))