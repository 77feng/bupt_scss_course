def exgcd(a: int, b: int):   # 求解最大公约数
    if b == 0:
        return 1, 0, a
    else:
        x, y, q = exgcd(b, a % b)
        x, y = y, (x - (a // b) * y)
        return x, y, q


def ModReverse(a: int, p=26): # 求解逆元
    x, _, q = exgcd(a, p)
    if q != 1:
        raise Exception("No solution.")
    else:
        return (x + p) % p #防止负数

if __name__ == '__main__':
    a, b = 19, 22          # 注意需要满足的条件：a mod 26 = 1; b -> [0, 25]
    
    inv_a = ModReverse(a)  # 求解逆元
    print('\na =',a, '的逆元是', 'a^(-1) =', inv_a)
    