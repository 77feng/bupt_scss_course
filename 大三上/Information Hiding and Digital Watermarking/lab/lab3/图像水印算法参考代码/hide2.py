# 导入图像处理库
import cv2
# 导入数学计算库
import numpy as np
# 导入绘图库
import matplotlib.pyplot as plt
# 从block.py导入图像分块的函数、分块合并的函数
from block import img_to_blocks, blocks_to_img


# 计算峰值信噪比的函数
def PSNR(template, img):
    mse = np.mean((template / 255. - img / 255.)**2)
    if mse < 1.0e-10:
        return 100
    PIXEL_MAX = 1
    return 20 * np.log10(PIXEL_MAX / np.sqrt(mse))

# 每个分块的大小为(8,8)
block_shape = (8, 8)

alpha = 2

# 以灰度图模式读取水印图像
wm = cv2.imread('watermark.bmp', cv2.IMREAD_GRAYSCALE)

# 从二维矩阵转为一维并二值化
wm = wm.flatten() > 128

# 读取载体图像
img = cv2.imread('bupt.bmp')
height, width = img.shape[:2]

# 检查水印数据是否大于载体图像的最大可容纳量
assert (height * width) // (block_shape[0] * block_shape[1]) >= len(wm)

# 取图像的红色分量来隐藏
img_b, img_g, img_r = cv2.split(img)

# 对图像进行分块
img_r_blocks = img_to_blocks(img_r, block_shape)

# 信息嵌入
img_r_blocks_embedded = img_r_blocks.copy()
for i in range(len(wm)):
    block = img_r_blocks[i]

    # 对图像分块进行DCT变换
    block_dct = cv2.dct(block)
    block_dct_embedded = block_dct.copy()

    # 选择(4,1)和(3,2)这一对系数
    if wm[i] == 0 and block_dct_embedded[4][1] <= block_dct_embedded[3][2]:
        block_dct_embedded[4][1], block_dct_embedded[3][2] = block_dct_embedded[3][2], block_dct_embedded[4][1]
        # 将原本小的系数调整更小，使得系数差别变大
        block_dct_embedded[3][2] -= alpha

    elif wm[i] == 1 and block_dct_embedded[4][1] >= block_dct_embedded[3][2]:
        block_dct_embedded[4][1], block_dct_embedded[3][2] = block_dct_embedded[3][2], block_dct_embedded[4][1]
        # 将原本小的系数调整更小，使得系数差别变大
        block_dct_embedded[4][1] -= alpha

    # 对图像分块进行DCT逆变换
    block_embedded = cv2.idct(block_dct_embedded)
    img_r_blocks_embedded[i] = block_embedded

# 将分块合并为完整的图像红色分量
img_r_embedded = blocks_to_img(img_r_blocks_embedded, img.shape[:2])

# 与图像的绿色、蓝色分量合并
img_embedded = cv2.merge([img_b, img_g, img_r_embedded.astype(np.uint8)])

# 计算峰值信噪比
psnr = PSNR(img, img_embedded)
print('%s %.3f %s' % ('PSNR = ', psnr, 'dB'))

# 保存嵌入水印的载体图像
cv2.imwrite('buptstegoR.bmp', img_embedded)

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