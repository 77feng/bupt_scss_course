# 导入图像处理库
import cv2
# 导入数学计算库
import numpy as np
# 导入绘图库
import matplotlib.pyplot as plt
# 从block.py导入图像分块的函数
from block import img_to_blocks

# 计算NC值的函数
def NC(template, img):
    template = template.astype(np.uint8)
    img = img.astype(np.uint8)
    return cv2.matchTemplate(img, template, cv2.TM_CCORR_NORMED)[0][0]


# 每个分块的大小为(8,8)
block_shape = (8, 8)

# 设置水印图像的宽高
wm_height = 10
wm_width = 10

# 读取携密图像
img = cv2.imread('buptstegoR.bmp')
height, width = img.shape[:2]

# 取图像的一层来提取
img_b, img_g, img_r = cv2.split(img)

# 对图像进行分块
img_r_blocks = img_to_blocks(img_r, block_shape)

# 信息提取
wm = np.zeros(wm_height * wm_width, dtype=np.uint8)
for i in range(len(wm)):
    block = img_r_blocks[i]

    # 对图像分块进行DCT变换
    dct_block = cv2.dct(block)

    if dct_block[4][1] <= dct_block[3][2]:
        wm[i] = 255
    else:
        wm[i] = 0

# 从一维转为二维矩阵
wm = np.reshape(wm, (wm_height, wm_width))

# 以灰度图模式读取水印图像
wm_original = cv2.imread('watermark.bmp', cv2.IMREAD_GRAYSCALE)

# 计算NC值
nc = NC(wm_original, wm)
print(f'NC = {nc * 100} %')

# 保存提取出的水印图像
cv2.imwrite('watermark1.bmp', wm)

# 解决中文显示问题
plt.rcParams['font.sans-serif'] = ['SimHei']
plt.rcParams['axes.unicode_minus'] = False


# 展示嵌入图像、水印原图像和提取出的水印图像
plt.figure(figsize=(10, 6))

# plt.subplot(131)
# plt.imshow(cv2.cvtColor(img, cv2.COLOR_BGR2RGB))
# plt.title('嵌入图像')
# plt.xticks([]), plt.yticks([])

plt.subplot(121)
plt.imshow(wm_original, 'gray')
plt.title('2022211570+项枫+原始水印图像')
plt.xticks([]), plt.yticks([])

plt.subplot(122)
plt.imshow(wm, 'gray')
plt.title('2022211570+项枫+未遭受攻击水印')
plt.xticks([]), plt.yticks([])

plt.show()