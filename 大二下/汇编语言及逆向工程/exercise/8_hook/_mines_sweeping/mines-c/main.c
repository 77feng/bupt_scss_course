/**
 * ----------------------------------------------------------------------------
 * [源文件] 主程序
 * ----------------------------------------------------------------------------
 *
 * 定义主函数
 *
 */


#include <stdio.h>
#include "mines.h"


/**
 * 主函数
 *
 * @param argc              参数个数
 * @param argv              参数列表
 * @return                  程序运行状态码
 */
int main(int argc, char *argv[]) {
    // 游戏指针
    Game *game = NULL;

    // 创建一个游戏
    game = CreateGame();
    // 游戏开始界面
    GameStartScreen(game);
    // 散布地雷
    RandomDistributeMines(game->map);
    // 游戏进行界面
    GameProcessScreen(game);
    // 游戏结束界面
    GameEndScreen(game);
    // 销毁地图
    DestroyMap(&game->map);
    // 销毁游戏
    DestroyGame(&game);

    return 0;
}

