# PIL图像处理库
from PIL import Image
# 表格绘制库
import matplotlib.pyplot as plt
# 数学库
import numpy as np


# 将字符串转换为bit
def str2bit_(s):
    result = ''
    for i in range(len(s)):
        temp = bin(ord(s[i])).replace('0b', '')

        # 长度不满8bit的时候补足8bit
        for j in range(8 - len(temp)):
            temp = '0' + temp
        result = result + temp
    return result


print('\033[47m\033[30m', end='')
msg = 'BP'
print('本人学号为2022211570，本人姓名为项枫，秘密信息的ASCII是：', end='')
print([ord(i) for i in msg])
print('转成的二进制是：')
print(str2bit_(msg[0]))
print(str2bit_(msg[1]))

img = np.array([61, 64, 69, 72,
                78, 61, 69, 72,
                64, 64, 61, 69,
                64, 64, 72, 61])

# 解决中文显示问题
plt.rcParams['font.sans-serif'] = ['SimHei']
plt.rcParams['axes.unicode_minus'] = False
plt.title("这是学号为2022211570，姓名为项枫，绘制的原始图像灰度值直方图。")
plt.hist(img.flatten(), bins=np.arange(60, 75), rwidth=0.1, align='left')
plt.show()

# LSB嵌入水印
img = img.flatten()
img_embedded = img.copy()
wm = str2bit_(msg)
for i in range(len(wm)):
    img_embedded[i] -= img_embedded[i] % 2
    img_embedded[i] += wm[i]
