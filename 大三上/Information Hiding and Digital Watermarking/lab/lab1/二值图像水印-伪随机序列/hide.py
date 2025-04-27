# 导入所需库
import wave
import cv2
import numpy as np
import matplotlib.pyplot as plt
import random

# 读取载体音频
wav = wave.open('carrier.wav', 'rb')
nchannels, sampwidth, framerate, nframes, comptype, compname = wav.getparams()
time = nframes / framerate

# 以字节方式读取载体音频的数据
frames = wav.readframes(nframes)

# 以灰度图模式读取水印图像
wm = cv2.imread('bupt64.bmp', cv2.IMREAD_GRAYSCALE)

# 将水印图像转换为一维并二值化
wm = wm.flatten() > 128

# 限制嵌入的字节数
embed_size = 4096  # 需要嵌入的字节数
wm = wm[:embed_size]

# 生成伪随机序列，控制水印嵌入位置
key = 'bupt'  # 密钥
random.seed(key)  # 使用密钥初始化伪随机生成器
positions = random.sample(range(len(frames)), embed_size)

# 将字节数据转换为numpy数组
data = np.frombuffer(frames, dtype=np.uint8)

# LSB嵌入水印
data_embedded = data.copy()
for i, pos in enumerate(positions):
    data_embedded[pos] -= data_embedded[pos] % 2  # 清除最低位
    data_embedded[pos] += wm[i]  # 将水印信息嵌入最低位

# 创建嵌入后的音频文件
wav_embedded = wave.open('embedded.wav', 'wb')
wav_embedded.setparams(wav.getparams())
wav_embedded.writeframes(data_embedded)

# 解决中文显示问题
plt.rcParams['font.sans-serif'] = ['SimHei']
plt.rcParams['axes.unicode_minus'] = False

# 展示原音频和嵌入音频的波形
plt.figure(figsize=(14, 6))

plt.subplot(121)
plt.plot(data)
plt.title('原始音频（项枫2022211570）')
plt.xticks([]), plt.yticks([])

plt.subplot(122)
plt.plot(data_embedded)
plt.title('嵌入音频（项枫2022211570）')
plt.xticks([]), plt.yticks([])

plt.show()
