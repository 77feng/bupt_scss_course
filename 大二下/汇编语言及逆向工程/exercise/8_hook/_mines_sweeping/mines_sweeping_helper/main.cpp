#include "winmine_helper_by_debug.h"

int main()
{
    SetConsoleOutputCP(65001); // 中文支持：cmd默认的是gbk编码，修改为utf-8编码

	StartHelper(); // 开始自动扫雷

	return 0;
}
