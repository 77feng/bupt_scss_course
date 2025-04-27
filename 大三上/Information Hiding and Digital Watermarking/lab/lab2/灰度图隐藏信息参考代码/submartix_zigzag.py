from PIL import Image

#一个已经给出顺序的 8*8 zigzag表
zigzagMartix = [ 0, 1, 8, 16, 9, 2, 3, 10,
        17, 24, 32, 25, 18, 11, 4, 5,
        12, 19, 26, 33, 40, 48, 41, 34,
        27, 20, 13, 6, 7, 14, 21, 28,
        35, 42, 49, 56, 57, 50, 43, 36,
        29, 22, 15, 23, 30, 37, 44, 51,
        58, 59, 52, 45, 38, 31, 39, 46,
        53, 60, 61, 54, 47, 55, 62, 63]
#打开准备好的灰度图像
lena_gray = Image.open("lena_gray.bmp")

#提取子矩阵
def submartix(img):
    height = 8
    width = 8
    martix = []
    for y in range(height):
        temp = []
        for x in range(width):
            color = img.getpixel((x,y))
            temp.append(color)
        martix.append(temp)
    return martix

#将子矩阵转化为一维向量并应用zigzag变换
def zigzag(martix):
    temp = []#一维列表，用于存放转化后的矩阵
    result = []
    for y in range(len(martix)):
        for x in range(len(martix[0])):
            temp.append(martix[y][x])
    for item in zigzagMartix:
        result.append(temp[item])
    return result

print("子矩阵：")
for i in submartix(lena_gray):
    print(i)
print("一维向量化并zigzag后的矩阵：")
print(zigzag(submartix(lena_gray)))
'''
子矩阵：
[162, 162, 162, 161, 162, 157, 163, 161]
[162, 162, 162, 161, 162, 157, 163, 161]
[162, 162, 162, 161, 162, 157, 163, 161]
[162, 162, 162, 161, 162, 157, 163, 161]
[162, 162, 162, 161, 162, 157, 163, 161]
[164, 164, 158, 155, 161, 159, 159, 160]
[160, 160, 163, 158, 160, 162, 159, 156]
[159, 159, 155, 157, 158, 159, 156, 157]
一维向量化并zigzag后的矩阵：
[162, 162, 162, 162, 162, 162, 161, 162, 162, 162, 162, 162, 162, 161, 162, 157, 162, 161, 162, 162, 164, 160, 164, 162, 161, 162, 157, 163, 161, 163, 157, 162, 161, 158, 160, 159, 159, 163, 155, 162, 157, 163, 161, 161, 163, 157, 161, 158, 155, 157, 160, 159, 163, 161, 161, 159, 162, 158, 159, 159, 160, 156, 156, 157]
'''
