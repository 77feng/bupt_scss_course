from Crypto.Util.number import *
c = 0x72666D616C7441666C625F697F6142
d = 0x0102030405060708090A0B0C0D0E0F
print(long_to_bytes(c^d))
