#include <idc.idc>

static xor_setp1(){
    auto addr = 0x00414C3C;   //这里填入要解密字节串的起始地址
    auto i = 0;
    for(i=0; i<0x43; i++)   //循环结束的条件为字节串的结束地址
    {
        PatchByte(addr+i, Byte(addr+i)^0x7D);   //异或的数字根据情况修改
    }
}

static xor_setp2(){
    auto addr = 0x00414BE0;   //这里填入要解密字节串的起始地址
    auto i = 0;
    for(i=0; i<0x5A; i++)   //循环结束的条件为字节串的结束地址
    {
        PatchByte(addr+i, Byte(addr+i)^0x43);   //异或的数字根据情况修改
    }
}

static xor_setp3(){
    auto addr = 0x00414A84;   //这里填入要解密字节串的起始地址
    auto i = 0;
    for(i=0; i<0x15B; i++)   //循环结束的条件为字节串的结束地址
    {
        PatchByte(addr+i, Byte(addr+i)^0x55);   //异或的数字根据情况修改
    }
}

static xor_setp4(){
    auto addr = 0x00414A30;   //这里填入要解密字节串的起始地址
    auto i = 0;
    for(i=0; i<0x53; i++)   //循环结束的条件为字节串的结束地址
    {
        PatchByte(addr+i, Byte(addr+i)^0x4D);   //异或的数字根据情况修改
    }
}

static main()
{
    xor_setp4();
}
