# 导入所需库
import wave
import cv2
import numpy as np
import matplotlib.pyplot as plt

# 读取载体音频
wav = wave.open('carrier.wav', 'rb')
nchannels, sampwidth, framerate, nframes, comptype, compname = wav.getparams()
time = nframes / framerate

# 以字节方式读取载体音频的数据
frames = wav.readframes(nframes)

# 以灰度图模式读取水印图像
wm = cv2.imread('bupt64.bmp', cv2.IMREAD_GRAYSCALE)

# 将水印图像从二维矩阵转换为一维并二值化
wm = wm.flatten() > 128

# 设置伪随机数种子（即密钥）
seed = 42  # 此处设置密钥，接收方需使用相同的密钥
rng = np.random.RandomState(seed)

# 生成与水印大小相同的伪随机位置序列
positions = rng.choice(len(frames), size=len(wm), replace=False)

# 打开要写入的嵌入音频文件
wav_embedded = wave.open('embedded.wav', 'wb')
wav_embedded.setparams(wav.getparams())

# 将字节数据转换为numpy数组
data = np.frombuffer(frames, dtype=np.uint8)

# LSB嵌入水印
data_embedded = data.copy()
for i, pos in enumerate(positions):
    data_embedded[pos] -= data_embedded[pos] % 2  # 清除最低位
    data_embedded[pos] += wm[i]  # 将水印位嵌入最低位

# 写入嵌入水印后的音频数据
wav_embedded.writeframes(data_embedded.tobytes())
wav_embedded.close()
wav.close()

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
