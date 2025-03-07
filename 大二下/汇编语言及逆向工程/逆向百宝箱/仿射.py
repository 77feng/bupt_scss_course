mul=3
add=7
s = 'qxbxpluxvwhuzjct'             #密文
out = ''
result=[]

def ext_gcd(a, b): #扩展欧几里得算法
    if b == 0:
        return 1, 0, a
    else:
        x, y, gcd = ext_gcd(b, a % b) #递归直至余数等于0(需多递归一层用来判断)
        x, y = y, (x - (a // b) * y) #辗转相除法反向推导每层a、b的因子使得gcd(a,b)=ax+by成立
        return x,y,gcd

result=ext_gcd(mul,26)
ni=result[0]
if ni < 0:
    ni += 26
print('逆元为',ni)
print(mul *ni %26)
for i in s:
#    print(ord(i))
    c = ((ord(i) - 65) - add)*ni %26
    c = c+65
    out = out + chr(c)
print(out)
