#include <idc.idc>

static xor_dec(){
    auto addr = 0x00403020;   //这里填入要解密字节串的起始地址
    auto i = 0;
    for(i=0; i<0x64; i++)   //循环结束的条件为字节串的结束地址
    {
        PatchByte(addr+i, Byte(addr+i)^0x67);   //异或的数字根据情况修改
    }
}

static main()
{
    xor_dec();
}
