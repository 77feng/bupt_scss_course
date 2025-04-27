# 导入所需库
import wave
import cv2
import numpy as np
import matplotlib.pyplot as plt
import random

# 计算NC值的函数
def NC(template, img):
    template = template.astype(np.uint8)
    img = img.astype(np.uint8)
    return cv2.matchTemplate(img, template, cv2.TM_CCORR_NORMED)[0][0]

# 设置水印图像的宽高
wm_height = 64
wm_width = 64

# 读取携密音频
wav = wave.open('embedded.wav', 'rb')
nchannels, sampwidth, framerate, nframes, comptype, compname = wav.getparams()
time = nframes / framerate

# 以字节方式读取携密音频的数据
frames = wav.readframes(nframes)

# 将字节数据转换为numpy数组
data = np.frombuffer(frames, dtype=np.uint8)

# 密钥设置
key = 'bupt'  # 密钥
random.seed(key)  # 使用密钥初始化伪随机生成器
embed_size = 4096  # 假设水印大小为4096

# 生成伪随机序列，控制水印提取的位置
positions = random.sample(range(len(data)), embed_size)

# LSB提取水印
wm = np.zeros(wm_height * wm_width, dtype=np.uint8)
for i, pos in enumerate(positions):
    wm[i] = data[pos] % 2 * 255  # 从最低位提取水印

# 从一维转为二维矩阵
wm = np.reshape(wm, (wm_height, wm_width))

# 以灰度图模式读取原始水印图像
wm_original = cv2.imread('bupt64.bmp', cv2.IMREAD_GRAYSCALE)

# 计算NC值
nc = NC(wm_original, wm)
print(f'NC = {nc * 100:.2f} %')

# 保存提取出的水印图像
cv2.imwrite('wm_extracted.bmp', wm)

# 解决中文显示问题
plt.rcParams['font.sans-serif'] = ['SimHei']
plt.rcParams['axes.unicode_minus'] = False

# 展示嵌入图像、水印原图像和提取出的水印图像
plt.figure(figsize=(15, 6))

plt.subplot(131)
plt.plot(data)
plt.title('嵌入音频（项枫2022211570）')
plt.xticks([]), plt.yticks([])

plt.subplot(132)
plt.imshow(wm_original, 'gray')
plt.title('原始水印（项枫2022211570）')
plt.xticks([]), plt.yticks([])

plt.subplot(133)
plt.imshow(wm, 'gray')
plt.title('提取水印（项枫2022211570）')
plt.xticks([]), plt.yticks([])

plt.show()
