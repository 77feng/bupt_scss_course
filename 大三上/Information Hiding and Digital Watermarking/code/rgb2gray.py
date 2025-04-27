from PIL import Image
bupt = Image.open("bupt.bmp")
bupt_gray = bupt.convert('L')
bupt_gray.show()
bupt_gray.save("buptgray.bmp")
