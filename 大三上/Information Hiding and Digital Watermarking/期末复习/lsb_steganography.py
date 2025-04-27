import numpy as np
import matplotlib.pyplot as plt
import os

student_id = "2022211713"
name = "王骋"

# 设置终端颜色为白底黑字
print('\033[47m\033[30m')  # 47:白色背景, 30:黑色文字

def get_binary_message(secret_message="BP"):
    """获取秘密信息的ASCII和二进制表示"""
    binary_message = []
    ascii_values = []
    
    for char in secret_message:
        ascii_val = ord(char)
        ascii_values.append(ascii_val)
        binary = format(ascii_val, '08b')
        binary_message.append(binary)
        
    print(f"本人学号为{student_id}，本人姓名为{name}，秘密信息的ASCII是：{ascii_values}")
    print("转成的二进制是：")
    for binary in binary_message:
        print(binary)
        
    return ''.join(binary_message)

def plot_histogram(image, title_prefix="原始"):
    """绘制灰度值直方图"""
    plt.rcParams['font.sans-serif'] = ['SimHei']
    plt.rcParams['axes.unicode_minus'] = False
    plt.figure(figsize=(10, 6))
    
    # 获取最小和最大灰度值
    min_val = int(min(image.flatten()))
    max_val = int(max(image.flatten()))
    
    # 创建整数刻度
    bins = range(min_val, max_val + 2)
    
    plt.hist(image.flatten(), bins=bins, edgecolor='black')
    plt.title(f"这是学号为{student_id}，姓名为{name}，\n绘制的{title_prefix}图像灰度值直方图")
    plt.xlabel('灰度值')
    plt.ylabel('频率')
    
    # 设置x轴刻度为整数
    plt.gca().xaxis.set_major_locator(plt.MultipleLocator(1))
    
    plt.grid(True)
    plt.show()

def embed_message(original_image, binary_message):
    """LSB嵌入秘密信息"""
    stego_image = original_image.copy()
    
    for i in range(len(binary_message)):
        row = i // 4
        col = i % 4
        # 将最低位替换为秘密信息位
        if binary_message[i] == '0':
            stego_image[row, col] = stego_image[row, col] & 0xFE
        else:
            stego_image[row, col] = stego_image[row, col] | 0x01
            
    print(f"\n本人学号为{student_id}，本人姓名为{name}，隐写后16个点的像素值的矩阵如下：")
    for row in stego_image:
        for col in row:
            print(col, end=" ")
        print()
    return stego_image

def attack_image(stego_image):
    """将所有最低位置为1"""
    attacked_image = stego_image.copy()
    attacked_image = attacked_image | 0x01  # 将最低位全部置为1
    
    print(f"\n本人学号为{student_id}，本人姓名为{name}，隐写图像遭受攻击后图像的灰度值矩阵如下：")
    for row in attacked_image:
        for col in row:
            print(col, end=" ")
        print()
    return attacked_image

def extract_lsb(image):
    """提取最低位"""
    bits = []
    for row in range(4):
        for col in range(4):
            lsb = image[row, col] & 0x01
            bits.append(str(lsb))
    
    result = ''.join(bits)
    print(f"\n本人学号为{student_id}，本人姓名为{name}，隐写图像遭受攻击后图像16个灰度值的最低位为：{result}")
    return result

def main():
    try:
        # 原始4x4图像灰度值
        original_image = np.array([
            [61, 64, 69, 72],
            [78, 61, 69, 72],
            [64, 64, 61, 69],
            [64, 64, 72, 61]
        ])
        
        # 第一步：输出ASCII和二进制
        binary_message = get_binary_message("BP")
        
        # 第二步：绘制原始直方图
        plot_histogram(original_image)
        
        # 第三步：嵌入秘密信息
        stego_image = embed_message(original_image, binary_message)
        
        # 第四步：绘制隐写后的直方图
        plot_histogram(stego_image, "隐写后的")
        
        # 第五步：攻击图像
        attacked_image = attack_image(stego_image)
        
        # 第六步：提取最低位
        extract_lsb(attacked_image)
        
    finally:
        # 恢复终端默认颜色
        print('\033[0m')

if __name__ == "__main__":
    main() 