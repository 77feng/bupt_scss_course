# PIL图像处理库
from PIL import Image
# 表格绘制库
import matplotlib.pyplot as plt
# 数学库
import numpy as np

def rgb2gray(img):
    img = img.convert("L")
    return img

# 图像的基本信息
img = Image.open("bupt.bmp")
width = img.size[0]
height = img.size[1]

img_gray = rgb2gray(img)
martix_gray = np.array(img_gray)

print('\033[47m\033[30m')
print('1')
x = range(30, 51, 5)
y = range(0, 1101, 100)
plt.hist(martix_gray.flatten(), bins=np.arange(30, 51, 1), rwidth=0.1, align='left')
plt.xticks(x)
plt.yticks(y)
plt.show()