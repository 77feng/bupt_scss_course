import matplotlib.pyplot as plt
import cv2
import numpy as np

from blind_watermark import WaterMark

bwm1 = WaterMark(password_wm=1, password_img=1)
bwm1.extract(filename='buptstegoR1.bmp', wm_shape=(10, 10), out_wm_name='watermark2.bmp', )

# 读取图像
wm_original = cv2.imread('watermark.bmp')
wm = cv2.imread('watermark2.bmp')

# 解决中文显示问题
plt.rcParams['font.sans-serif'] = ['SimHei']
plt.rcParams['axes.unicode_minus'] = False

# 展示嵌入图像、水印原图像和提取出的水印图像
plt.figure(figsize=(10, 6))

plt.subplot(121)
plt.imshow(wm_original, 'gray')
plt.title('2022211570+项枫+原始水印')
plt.xticks([]), plt.yticks([])

plt.subplot(122)
plt.imshow(wm, 'gray')
plt.title('2022211570+项枫+攻击后水印')
plt.xticks([]), plt.yticks([])

plt.show()

# 计算NC值的函数
def NC(template, img):
    template = template.astype(np.uint8)
    img = img.astype(np.uint8)
    return cv2.matchTemplate(img, template, cv2.TM_CCORR_NORMED)[0][0]

nc = NC(wm_original, wm)
print(f'遭受添加高斯噪声攻击后NC = %.3f' % (nc))