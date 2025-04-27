# 导入图像处理库
import cv2
# 从密码库导入数字转字节的函数
from Crypto.Util.number import long_to_bytes
# 从block.py导入图像分块的函数
from block import img_to_blocks

# 每个分块的大小为(8,8)
block_shape = (8, 8)


# 读取携密图像
img = cv2.imread('embedded.bmp')
height, width = img.shape[:2]

# 取图像的一层来提取
img_b, img_g, img_r = cv2.split(img)

# 对图像进行分块
img_r_blocks = img_to_blocks(img_r, block_shape)

msg_bits = ''

# 信息提取，80为秘密信息的比特数
for i in range(80):
    block = img_r_blocks[i]

    # 对图像分块进行DCT变换
    dct_block = cv2.dct(block)

    if dct_block[4][1] < dct_block[3][2]:
        msg_bits += '1'
    else:
        msg_bits += '0'

# 将秘密信息从二进制转为字节
msg = long_to_bytes(int(msg_bits, 2))

print(msg)

# 保存提取出的秘密信息
f = open('message.txt', 'wb')
f.write(msg)
f.close()