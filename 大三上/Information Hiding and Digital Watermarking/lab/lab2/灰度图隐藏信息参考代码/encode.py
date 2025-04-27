from PIL import Image
import matplotlib.pyplot as plt
import matplotlib.image as mpimg

def get_msg(msg):
    return msg.zfill(8)

def generate(msg):  # 将信息转置为2进制。
    result = ''
    for i in msg:
        if isinstance(i, int):
            result += get_msg(bin(i)).replace('0b', '')
        else:
            result += get_msg(bin(ord(i)).replace('0b', ''))
    return result

# 确保图像是RGB格式
img = Image.open('buptgray.bmp').convert('RGB')
tmp_msg = 'BUPTshahexiaoqu'
hide_msg = generate(tmp_msg)
width, height = img.size
length = len(hide_msg)
tmp = ''
tmp2 = ''
count = 0  # 将信息隐藏到其最低位。
for i in range(0, width):
    if count == length:
        break
    for j in range(0, height):
        pixels = img.getpixel((i, j))
        a, b, c = pixels
        if count == length:
            break
        tmp += str(a % 2)
        a -= a % 2 + int(hide_msg[count])
        tmp2 += str(a % 2)
        count += 1
        if count == length:
            img.putpixel((i, j), (a, b, c))
            break
        tmp += str(b % 2)
        b -= b % 2 + int(hide_msg[count])
        tmp2 += str(b % 2)
        count += 1
        if count == length:
            img.putpixel((i, j), (a, b, c))
            break
        tmp += str(c % 2)
        c -= c % 2 + int(hide_msg[count])
        tmp2 += str(c % 2)
        count += 1
        if count == length:
            img.putpixel((i, j), (a, b, c))
            break
        if count % 3 == 0:
            img.putpixel((i, j), (a, b, c))
img.save('buptgraystego.bmp')

# 解决中文显示
plt.rcParams['font.sans-serif'] = ['SimHei']
plt.rcParams['axes.unicode_minus'] = False

# 显示原始灰度图像
plt.subplot(121)
plt.imshow(mpimg.imread('buptgray.bmp'), cmap='gray'), plt.title('原始图像（2022211570项枫）'), plt.axis('off')

# 显示携密图像
plt.subplot(122)
plt.imshow(mpimg.imread('buptgraystego.bmp')), plt.title('携密图像（2022211570项枫）'), plt.axis('off')
plt.show()