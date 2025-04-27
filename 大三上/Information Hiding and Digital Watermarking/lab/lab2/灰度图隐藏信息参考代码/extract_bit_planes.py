import cv2 as cv
import numpy as np
import matplotlib.pyplot as plt


# 输入图片的路径，获得图片的8个位图
def get_bitmaps(image):
    bit_extraction = []
    bit_images = []
    for i in range(8):
        bit_extraction.append(np.ones(image.shape, dtype=np.uint8) * pow(2, i))
    for i in range(8):
        bit_images.append(cv.bitwise_and(image, bit_extraction[i]))
    return bit_images


bupt_gray = cv.imread('buptgray.bmp', cv.IMREAD_GRAYSCALE)
gray_bit_images = get_bitmaps(bupt_gray)

plt.figure(figsize=(12, 12))
plt.suptitle('gray image bitmap', fontsize=16)

for i in range(8):
    plt.subplot(1, 8, i + 1), plt.axis('off'), plt.title('bit_img_' + str(i + 1)), plt.imshow(gray_bit_images[i], cmap='gray')
plt.show()
